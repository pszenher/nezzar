(define-module (nezzar import lake)

  #:use-module (ice-9 match)
  #:use-module (srfi srfi-26)

  #:use-module (guix base32)
  #:use-module (guix git)
  #:use-module (guix monads)
  #:use-module (guix store)

  #:use-module (guix import json)
  #:use-module (guix import utils)

  #:use-module (json)
  
  #:use-module ((nezzar build lake-build-system) #:prefix lake:))


;;; ================================================================
;;; | Example Reservoir API Request [Lake version 5.0.0-src (Lean version 4.6.1)]
;;; ================================================================

;;; Command:

;; curl -H "X-Reservoir-Api-Version:1.0.0"
;;      -H "X-Lake-Registry-Api-Version:0.1.0"
;;      'https://reservoir.lean-lang.org/api/v1/packages/leanprover-community/mathlib'
;;   | jq

;;; Response (json):

;; {
;;   "name": "mathlib",
;;   "owner": "leanprover-community",
;;   "fullName": "leanprover-community/mathlib",
;;   "description": "The math library of Lean 4",
;;   "homepage": "https://leanprover-community.github.io/mathlib4_docs",
;;   "license": "Apache-2.0",
;;   "createdAt": "2021-05-09T07:52:01Z",
;;   "updatedAt": "2024-08-18T14:03:37Z",
;;   "stars": 1298,
;;   "sources": [
;;     {
;;       "type": "git",
;;       "host": "github",
;;       "id": "R_kgDOFcwZ1Q",
;;       "fullName": "leanprover-community/mathlib4",
;;       "repoUrl": "https://github.com/leanprover-community/mathlib4",
;;       "gitUrl": "https://github.com/leanprover-community/mathlib4",
;;       "defaultBranch": "master"
;;     }
;;   ]
;; }


(define %reservoir-root-url
  "https://reservoir.lean-lang.org")
(define %reservoir-api-base-url
  (string-append %reservoir-root-url "/api"))
(define %reservoir-api-url
  (string-append %reservoir-api-base-url "/v1"))

(define %reservoir-api-headers
  ;; XXX: should be made configurable
  '((X-Reservoir-Api-Version     . "1.0.0")
    (X-Lake-Registry-Api-Version . "0.1.0")))

(define* (make-reservoir-api-url #:key name owner)
  (string-append
   %reservoir-api-url "/" "packages" "/" owner "/" name))

(define* (make-reservoir-homepage #:key name owner)
  (string-append
   %reservoir-root-url "/" "@" owner "/" name))

(define default
  (match-lambda*
    (dval
     (match-lambda
       ((? unspecified?) dval)
       (val               val)))))

(define optional
  (match-lambda*
    ((? procedure? proc)
     (match-lambda
       ((? unspecified? val) val)
       ((= proc res)         res)))
    (((? procedure? proc) default)
     (match-lambda
       ((? unspecified? val) default)
       ((= proc res)             res)))))

(define (list-of proc)
  (match-lambda
    ((? unspecified?) '())
    ((or (? list?   val)
	 (? vector? (= vector->list val)))
     (map proc val))))

(define-json-mapping <reservoir-package> %make-reservoir-package reservoir-package?
  json->reservoir-package <=> reservoir-package->json
  <=>
  sexp->reservoir-package <=> reservoir-package->sexp
  (name          reservoir-package-name)
  (owner         reservoir-package-owner)
  (fullname      reservoir-package-fullname     "fullName")
  (description   reservoir-package-description)
  (homepage      reservoir-package-homepage)
  (license       reservoir-package-license)
  (created-at    reservoir-package-created-at   "createdAt")
  (updated-at    reservoir-package-updated-at   "updatedAt")
  (stars         reservoir-package-stars)
  (sources       reservoir-package-sources      "sources"   (list-of json->reservoir-source)))

(define-json-mapping <reservoir-source> %make-reservoir-source reservoir-source?
  json->reservoir-source
  (type                  reservoir-source-type)
  (host                  reservoir-source-host)
  (id                    reservoir-source-id)
  (fullname              reservoir-source-fullname       "fullName")
  (repo-url              reservoir-source-repo-url       "repoUrl")
  (git-url               reservoir-source-git-url        "gitUrl")
  (default-branch        reservoir-source-default-branch "defaultBranch" (default #f))
  (subdir                reservoir-source-subdir         "subDir"        (default #f)))


(define reservoir-package-git-url
  (match-lambda
    ((? reservoir-package?
	(= reservoir-package-sources (src . _)))
     (match src
       ((? reservoir-source?
	   (= reservoir-source-git-url  git-url))
	git-url)))))

(define reservoir-package-repo-url
  (match-lambda
    ((? reservoir-package?
	(= reservoir-package-sources (src . _)))
     (match src
       ((? reservoir-source?
	   (= reservoir-source-repo-url  repo-url))
	repo-url)))))

(define reservoir-package-default-branch
  (match-lambda
    ((? reservoir-package?
	(= reservoir-package-sources (src . _)))
     (match src
       ((? reservoir-source?
	   (= reservoir-source-default-branch branch))
	branch)))))

(define reservoir-package-subdir
  (match-lambda
    ((? reservoir-package?
	(= reservoir-package-sources (src . _)))
     (match src
       ((? reservoir-source?
	   (= reservoir-source-subdir dir))
	dir)))))

(define* (fetch-reservoir-json #:key name owner)
  (json-fetch
   (make-reservoir-api-url #:name  name
			   #:owner owner)
   #:headers (cons*
	      '(user-agent . "GNU Guile")
              '(Accept     . "application/json")
	      %reservoir-api-headers)))

(define fetch-package-entry-reservoir-json
  (match-lambda
    ((? lake:package-entry? entry)
     (match entry
       ((and
	 (= lake:package-entry-name  name)
	 (= lake:package-entry-scope #f))
	(begin
	  (format
	   (current-error-port)
	   "WARN: package entry `~a' is unscoped, insufficent info for Reservoir fetch~%" name)
	  #f))
       ((and
	 (= lake:package-entry-name  (? string? name))
	 (= lake:package-entry-scope (? string? scope)))
	(fetch-reservoir-json
	 #:name name
	 #:owner scope))))))

(define* (fetch-reservoir-checkout #:key name owner (ref '()))
  "Fetch the git repository associated with the source of Reservoir
package OWNER/NAME corresponding to ref REF.  Returns the path to the
cached checkout directory as a string.

REF follows the same semantics as the ref argument to
`update-cached-checkout' from the (guix git) module, wherein (a pair
whose key is [branch | commit | tag | tag-or-commit ] and value the
associated data: [<branch name> | <sha1> | <tag name> | <string>]). 

If REF is the empty list, the defaultBranch key of the reservoir source
entry is tried; if defaultBranch is unspecified, then the remote HEAD 
is used."
  
  (define (warn-if-sources-nonsingleton rec)
    (match rec
      ((? reservoir-package?
	  (= reservoir-package-name    pkgname)
	  (= reservoir-package-sources srcs))
       (match (length srcs)
	 (0 (format (current-error-port)
		    "WARN: No sources found returned for package `~a' (`~a')~%" pkgname name))
	 (1 #t)
	 (n (format (current-error-port)
		    "WARN: More than one source (~a) returned for package `~a' (`~a'): ~a~%"
		    n pkgname name srcs))))))

  (define (warn-if-repo/git-url-mismatch rec)
    (match rec
      ((? reservoir-package?
	  (and (= reservoir-package-name    pkgname)
	       (= reservoir-package-sources (src . _))))
       (match src
	 ((? reservoir-source?
	     (and (= reservoir-source-git-url  git-url)
		  (= reservoir-source-repo-url repo-url)))
	  (when (not (string=? git-url repo-url))
	    (format
	     (current-error-port)
	     "WARN: Source for package `~a' gitUrl does not match repoUrl:~%  gitUrl: `~a'~%  repoUrl: `~a'~%"
	     name git-url repo-url)))))
      (_ #t)))
  
  (let* ((sexp (fetch-reservoir-json
		     #:name name
		     #:owner owner))
	 (pkg.json (sexp->reservoir-package sexp)))
    (begin
      (warn-if-sources-nonsingleton  pkg.json)
      (warn-if-repo/git-url-mismatch pkg.json)

      ;; NOTE: discard additional return values
      (identity
       (update-cached-checkout
	(reservoir-package-git-url pkg.json)
	#:ref (match (cons ref (reservoir-package-default-branch pkg.json))
		(((? pair?) . _) ref)
		(('() . (? string? branch)) `(branch . ,branch))
		(('() . #f) '()))
	#:check-out? #t)))))

(define fetch-package-entry-checkout
  (match-lambda
    ((? lake:package-entry? entry)
     (match entry
       ((and
	 (= lake:package-entry-type "git")
	 (= lake:package-entry-url  (? string? git-url))
	 (= lake:package-entry-rev  (? string? git-commit)))
	(update-cached-checkout
	 git-url
	 #:ref `(commit . ,git-commit)
	 #:check-out? #t))
       ((= lake:package-entry-type "path")
	(error "fetch-lake-package-checkout: entry of type `path' is not supported:" entry))
       (_
	(error "fetch-lake-package-checkout: unexpected entry contents:" entry))))))

(define* (load-lake-manifest.json checkout #:key (subdir #f))
  (let* ((pkgdir (string-append
		 checkout
		 (or (and=> subdir (cut string-append "/" <>)) "")))
	 (manif-file (string-append pkgdir "/lake-manifest.json")))
    (cond
     ((not (file-exists? pkgdir))
      (error "Expected reservoir package checkout dir not found:" pkgdir))
     ((not (file-exists?
	    (string-append pkgdir "/lake-manifest.json")))
      (error "lake-manifest.json not found in package dir:" pkgdir manif-file))
     (else
      (call-with-input-file manif-file
	lake:json->manifest.json)))))

(define* (reservoir->guix-package upstream-name #:key scope version (ref '()))
  "Return the guix <package> S-expression corresponding to the Reservoir
package SCOPE/NAME.  If specified, REF denotes the git reference
specification corresponding to this package version."

  (let ((git-url       'FIXME:STUB)
	(commit-or-tag 'FIXME:STUB)
	(deps          'FIXME:STUB)
	(source-drv    'FIXME:STUB))
    `(package
       (name ,(string-append "lean-" upstream-name))
       (version ,version)
       (home-page
	;; XXX: reservoir has a `homepage' field for packages, use it?
	,(make-reservoir-homepage
	  #:name upstream-name
	  #:owner scope))
       (source
	(origin
	  (method git-fetch)
	  (uri (git-reference
		(url ,git-url)
		(commit ,commit-or-tag)))
	  (file-name (git-file-name name version))
	  (sha256
	   (base32
	    ,(bytevector->nix-base32-string
	      (derivation->output-hash source-drv))))))
       (build-system lake-build-system)

       ,@(if (null? deps) '()
	     `((inputs
		(list . ,'FIXME:TODO))))
       
       (synopsis
	,(beautify-synopsis
	  (reservoir-package-description 'FIXME:STUB)))
       (description #f)
       ;; XXX: reservoir has a `reservoir-package-license' field, use it
       (license 'FIXME:STUB))))

;; (format (current-error-port)
;; 	"WARN: falling-back to package entry git url: `~a'" git-url)

;; (define* (fetch-reservoir-git*
;; 	  #:optional fullname
;; 	  #:key name owner)
;;   (cond
;;    ((not (or fullname (and name owner)))
;;     (error "fetch-reservoir-git: requires either fullname or name+owner to be specified"))
;;    ((and fullname (or name owner))
;;     (error "fetch-reservoir-git: fullname and name+owner are mutually exclusive options"))
;;    (else
;;     (let ((fullname (or fullname
;; 			(string-append owner "/" name))))

;;       ;; (update-cached-checkout )
;;       ))))
