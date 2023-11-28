;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2019, 2020 Timothy Sample <samplet@ngyro.com>
;;; Copyright © 2020, 2023 Jelle Licht <jlicht@fsfe.org>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (nezzar import npm-binary)
  #:use-module (guix import json)
  #:use-module (guix import utils)
  #:use-module (guix memoization)
  #:use-module ((gnu services configuration) #:select (alist?))
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (ice-9 match)
  #:use-module (ice-9 regex)
  #:use-module (ice-9 receive)
  #:use-module (json)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-9)
  #:use-module (srfi srfi-26)
  #:use-module (srfi srfi-41)
  #:use-module (srfi srfi-71)
  #:use-module (web client)
  #:use-module (web response)
  #:use-module (web uri)
  #:export (npm-binary-recursive-import
            npm-binary->guix-package
            package-json->guix-package
            make-versioned-package
            name+version->symbol))

;; Autoload Guile-Semver so we only have a soft dependency.
(module-autoload! (current-module)
		  '(semver) '(string->semver semver? semver->string semver=? semver>?))
(module-autoload! (current-module)
		  '(semver ranges) '(*semver-range-any* string->semver-range semver-range-contains?))

;; Dist-tags
(define-json-mapping <dist-tags> make-dist-tags dist-tags?
  json->dist-tags
  (latest dist-tags-latest "latest" string->semver))

(define-record-type <versioned-package>
  (make-versioned-package name version)
  versioned-package?
  (name  versioned-package-name)       ;string
  (version versioned-package-version)) ;string

(define (name+version->versioned-package name version)
  (let* ((version-prefix version-rest (split-at (string-split version #\:) 1))
	 (name+version-real (apply string-append version-rest)))
    (case (string->symbol (car version-prefix))
      ((npm)
       (format (current-error-port) "guix import: package alias encountered (~a@~a), remapping...~%" name version)
       (match (string-split name+version-real #\@)
	 (("" @name vers . ()) (make-versioned-package (string-append "@" @name) vers))
	 ((name vers . ())     (make-versioned-package name vers))
	 ((name vers-split)    (make-versioned-package name (apply string-append vers-split)))))
      ((git)  (begin (format #f "FIXME: 'git:' prefix encountered (~a@~a), ignoring!~%" name version)
		     '()))
      ((file) (begin (format #f "FIXME: 'file:' prefix encountered (~a@~a), ignoring~%" name version)
		     '()))
      (else
       (begin
	 ;; (display ".")
	 (format (current-error-port) "    dep: ~a@~a~%" name version)
	 (make-versioned-package name version))))))

(define (dependencies->versioned-packages entries)
  (match entries
    (((names . versions) ...)
     (map name+version->versioned-package names versions))
    (_ '())))

(define (extract-license license-string)
  (if (unspecified? license-string)
      'unspecified!
      (spdx-string->license license-string)))

(define-json-mapping <dist> make-dist dist?
  json->dist
  (tarball dist-tarball))

(define (empty-or-string s)
  (if (string? s) s ""))

(define-json-mapping <package-revision> make-package-revision package-revision?
  json->package-revision
  (name package-revision-name)
  (version package-revision-version "version" string->semver) ;semver
  (home-page package-revision-home-page "homepage")           ;string
  (dependencies package-revision-dependencies "dependencies"  ;list of versioned-package
                dependencies->versioned-packages)
  (dev-dependencies package-revision-dev-dependencies         ;list of versioned-package
                    "devDependencies" dependencies->versioned-packages)
  (peer-dependencies package-revision-peer-dependencies       ;list of versioned-package
                    "peerDependencies" dependencies->versioned-packages)
  (license package-revision-license "license"                 ;license | #f
           (match-lambda
             ((? unspecified?) #f)
             ((? string? str) (spdx-string->license str))
             ((? alist? alist)
              (match (assoc "type" alist)
                ((_ . (? string? type))
                 (spdx-string->license type))
                (_ #f)))))
  (description package-revision-description                   ; string
               "description" empty-or-string)
  (dist package-revision-dist "dist" json->dist))             ;dist

(define (versions->package-revisions versions)
  (match versions
    (((version . package-spec) ...)
     (begin
       (map (compose json->package-revision
		     (lambda (v ps)
		       (begin
			 (format (current-error-port) "  version: ~a~%" v)
			 ps)))
	    version package-spec)))
    (_ '())))

(define (versions->package-versions versions)
  (match versions
    (((version . package-spec) ...)
     (map string->semver versions))
    (_ '())))

(define-json-mapping <meta-package> make-meta-package meta-package?
  json->meta-package
  (name meta-package-name)                                       ;string
  (description meta-package-description)                         ;string
  (dist-tags meta-package-dist-tags "dist-tags" json->dist-tags) ;dist-tags
  (revisions meta-package-revisions "versions" versions->package-revisions))

;; TODO: Support other registries
(define *registry* "https://registry.npmjs.org")
(define *default-page* "https://www.npmjs.com/package")

(define (lookup-meta-package name)
  (let ((registry/pkg (string-append *registry* "/" (uri-encode name))))
    (and=> (json-fetch registry/pkg)
	   json->meta-package)))

(define lookup-meta-package* (memoize lookup-meta-package))

(define (http-error-code arglist)
  (match arglist
    (('http-error _ _ _ (code)) code)
    (_ #f)))

(define (meta-package-versions meta)
  (map package-revision-version
       (meta-package-revisions meta)))

(define (meta-package-latest meta)
  (and=> (meta-package-dist-tags meta) dist-tags-latest))

(define* (meta-package-package meta #:optional
                               (version (meta-package-latest meta)))
  (match version
    ((? semver?) (begin
		   (if (not (meta-package-revisions meta))
		       (error "wat.")
		       (find (lambda (revision)
			       (semver=? version (package-revision-version revision)))
			     (meta-package-revisions meta)))))
    ((? string?) (meta-package-package meta (string->semver version)))
    (_ #f)))

(define* (semver-latest svs #:optional (svr *semver-range-any*))
  (find (cut semver-range-contains? svr <>)
        (sort svs semver>?)))

(define* (resolve-package name #:optional (semver-range *semver-range-any*))
  (begin
    (format (current-error-port) "guix import: NET: lookup npm pkg: ~a~%" name)
    (let ((meta (lookup-meta-package* name)))
      (if meta
          (let* ((version (semver-latest (or (meta-package-versions meta) '())
					 semver-range)))
	    (format (current-error-port) "guix import: found npm pkg: ~a@~a~%" name version)
	    (meta-package-package meta version))
	  (begin
	    (format (current-error-port) "guix import: failed to resolve pkg: ~a~%" name)
	    (error "ERROR: package resolution failure."))))))


;;;
;;; Converting packages
;;;

(define (hash-url url)
  "Downloads the resource at URL and computes the base32 hash for it."
  (call-with-temporary-output-file
   (lambda (temp port)
     (begin ((@ (guix import utils) url-fetch) url temp)
            (guix-hash-url temp)))))

(define (npm-name->name npm-name)
  "Return a Guix package name for the npm package with name NPM-NAME."
  (define (clean name)
    (string-map (lambda (chr) (if (char=? chr #\/) #\- chr))
                (string-filter (negate (cut char=? <> #\@)) name)))
  (guix-name "node-" (clean npm-name)))

(define (name+version->symbol name version)
  (string->symbol (string-append name "-" version)))

(define (package-revision->symbol package)
;; ((npm-name (package-revision-name package))
  ;;  (version (semver->string (package-revision-version package)))
  ;;  (name (npm-name->name npm-name)))
  (match package
    (($ <package-revision> name version ...)
     (name+version->symbol (npm-name->name name) (semver->string version)))
    (_
     (error (format #f "Cannot create symbol for non-package-revision object: ~s" package)))))

(define (package-revision->input package)
  "Return the `inputs' entry for PACKAGE."
  (let* ((npm-name (package-revision-name package))
         (name (npm-name->name npm-name)))
    (begin
      (format (current-error-port)
	      "guix import: creating input { ~a : npm } --> { ~a : guix }~%"
	      npm-name name)
      `(,name
	(,'unquote ,(package-revision->symbol package))))))

(define (npm-package->package-sexp npm-package)
  "Return the `package' s-expression for an NPM-PACKAGE."
  (define (new-or-existing-inputs resolved-deps)
    (map package-revision->input resolved-deps))

  (match npm-package
    (($ <package-revision> name version home-page dependencies dev-dependencies peer-dependencies license description dist)
     (let* ((name (npm-name->name name))
            (url (dist-tarball dist))
            (home-page (if (string? home-page)
                           home-page
                           (string-append *default-page* "/" (uri-encode name))))
            (synopsis description)
            (resolved-deps
	     (map (match-lambda
		    (($ <versioned-package> name version)
		     (if (any identity
			      (map (cut string-prefix? <> version)
				   '("npm:" "file:" "git:")))
			 (begin
			   (format (current-error-port)
				   "guix import: package ~a has non-normal dep: ~a - Not implemented." name version)
			   (error))
			 (begin
			   (format (current-error-port) "guix import: resolving dep ~a@~a...~%" name version)
			   (resolve-package name (string->semver-range version)))))
		    (other (error (format #f "ERROR: non-package encountered in dependency list: ~a~%" other))))
		  (append dependencies peer-dependencies)))
	    ;; (resolved-dev-deps
	    ;;  (map (match-lambda
	    ;; 	    (($ <versioned-package> name version)
	    ;; 	     (case (string->symbol
	    ;; 		    (first (string-split version #\:)))
	    ;; 	       ((npm)  (error "npm: encount"))
	    ;; 	       ((git)  (error "git: encount"))
	    ;; 	       ((file) (error "file: encount"))
	    ;; 	       (else
	    ;; 		;; (begin
	    ;; 		;;   (format (current-error-port)
	    ;; 		;; 	  "guix import: package ~a has non-normal dev dep: ~a - Not implemented.~%" name version)
	    ;; 		;;   (error))
			
	    ;; 		(begin
	    ;; 		  (format (current-error-port) "guix import: resolving dev dep ~a@~a...~%" name version)
	    ;; 		  (resolve-package name (string->semver-range version))))))
	    ;; 	    (other (error (format #f "ERROR: non-package encountered in dev dependency list: ~a~%" other))))
	    ;; 	  (append dev-dependencies)))
            (peer-names (map versioned-package-name peer-dependencies))
            ;; lset-difference for treating peer-dependencies as dependencies, which leads to dependency cycles.
            ;; lset-union for treating them as (ignored) dev-dependencies, which leads to broken packages.
            (dev-names (lset-union string= (map versioned-package-name dev-dependencies) peer-names))
	    ;; FIXME: temporarily disable dev dependency removal
	    ;; (extra-phases '())
            (extra-phases (match dev-names
                            (() '())
                            ((dev-names ...)
                             `((add-after 'patch-dependencies 'delete-dev-dependencies
					  (lambda _
					    (delete-dependencies '(,@(reverse dev-names)))))))))
	    )
       (values
        `(package
           (name ,name)
           (version ,(semver->string (package-revision-version npm-package)))
           (source (origin
                     (method url-fetch)
                     (uri ,url)
                     (sha256 (base32 ,(hash-url url)))))
           (build-system node-build-system)
           (arguments
            '(#:tests? #f
              #:phases (modify-phases %standard-phases
                         (delete 'build)
                         ,@extra-phases)))
           ,@(match dependencies
               (() '())
               ((dependencies ...)
                `((inputs
                   (,'quasiquote ,(map package-revision->input resolved-deps))))))
	   ;; ,@(match dev-dependencies
           ;;     (() '())
           ;;     ((dev-dependencies ...)
           ;;      `((native-inputs
           ;;         (,'quasiquote ,(map package-revision->input resolved-dev-deps))))))
           (home-page ,home-page)
           (synopsis ,synopsis)
           (description ,description)
           (license ,license))
        (map (match-lambda (($ <package-revision> name version)
                            (list name (semver->string version))))
             resolved-deps))))
    (_ #f)))


;;;
;;; Interface
;;;

(define npm-binary->guix-package
  (lambda* (name #:key (version *semver-range-any*) #:allow-other-keys)
    (let* ((svr (match version
                  ((? string?) (string->semver-range version))
                  (_ version)))
           (pkg (resolve-package name svr)))
      (and=> pkg npm-package->package-sexp))))

(define* (npm-binary-recursive-import package-name #:key version)
  (recursive-import package-name
                    #:repo->guix-package (memoize npm-binary->guix-package)
                    #:version version
                    #:guix-name npm-name->name))
