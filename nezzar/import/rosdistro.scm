(define-module (nezzar import rosdistro)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-9)
  #:use-module (srfi srfi-26)
  #:use-module (srfi srfi-71)

  #:use-module (ice-9 format)
  #:use-module (ice-9 ftw)
  #:use-module (ice-9 receive)
  
  #:use-module (yaml)
  #:use-module (json)

  #:use-module (guix git)
  #:use-module (guix hash)
  #:use-module (guix base32)

  #:use-module (guix import utils)
  #:use-module (guix import json)

  #:use-module ((gnu packages guile-xyz) #:select (guile-libyaml)))


;;; ================================================================
;;; | STATIC DEFINITIONS
;;; ================================================================

;; (define %rosdistro-index.yaml-url
;;   ;; Base URL of the OSRF rosdistro repo
;;   "https://raw.githubusercontent.com/ros/rosdistro/master/index-v4.yaml")

(define %rosdistro-repo-url "https://github.com/ros/rosdistro.git")
(define %rosdistro-repo-ref '(branch . "master"))

;; (define %rosdistro-repo
;;   (origin
;;     (method git-fetch)
;;     (uri (git-reference
;; 	  (url "https://github.com/ros/rosdistro.git")
;; 	  (commit "master")))
;;     (file-name "rosdistro-master-checkout")
;;     (hash #f)))


;;; ================================================================
;;; | HELPER FUNCTIONS
;;; ================================================================

(define* (optional #:optional (func identity) #:key (default *unspecified*))
  (lambda (val) (if (unspecified? val) default (func val))))

(define (assert-member lst)
  (when (not (list? lst))
    (error (format #f "Error: cannot bind assert-member on non-list object '~a'" lst)))
  (lambda (val)
    (if (member val lst) val
	(error
	 (format
	  #f "Assertion Error: passed value '~a' is not member of allowlist '~a'"
	  val lst)))))

(define (assert-string str-val)
  "Return a function of a single string argument STR, which returns STR
if it is equivalent (by string=?) to STR-VAL, and throws an error
otherwise."
  (when (not (string? str-val))
    (error (format #f "Error: cannot bind assert-string on non-string object '~a'" str-val)))
  (lambda (str)
    (if (and (string? str) (string=? str str-val)) str
	(error
	 (format
	  #f "Assertion Error: passed string '~a' does not match expected '~a'"
	  str str-val)))))

(define (alist-xpath path alist)
  (fold (lambda (key lst)
	  (or (assoc-ref lst key)
	      (error (string-append "error: alist has no key '" key "'"))))
	alist path))

(define (make-tail-func func)
  "Return a function that accepts a single argument PAIR, applies function
FUNC to the tail of PAIR, and returns a reconstructed pair with head
unchanged, and the output of FUNC as the new tail."
  (lambda (pair)
    (let ((head tail (car+cdr pair)))
      (cons head (func tail)))))

(define (make-tail-map func)
  "Return a function that takes single argument LST, and applies FUNC to
the tail of each element in the list, returning a reconstructed list
with updated tails."
  (cut map (make-tail-func func) <>))


;;; ================================================================
;;; | DATA STRUCTURES
;;; ================================================================

(define-json-mapping <rosdistro-index> make-rosdistro-index rosdistro-index?
  yaml->rosdistro-index
  (distributions rosdistro-index-distributions "distributions" (make-tail-map yaml->rosdistro-index-dist))
  (type          rosdistro-index-type          "type"          (assert-string "index"))
  (version       rosdistro-index-version       "version"       (assert-member '(1 2 3 4))))

(define-json-mapping <rosdistro-index-dist> make-rosdistro-index-dist rosdistro-index-dist?
  yaml->rosdistro-index-dist

  ;; string: list of reference to the distribution files (typically length 1 can be more)
  ;; 
  (distribution        rosdistro-index-dist-distribution "distribution" vector->list) 
  
  ;; string: not documented, assuming same rules as release_cache
  ;; 
  ;; REP 141: 'reference to a release cache. Whether this field is a
  ;;           dictionary, a list or a scalar is left as an
  ;;           implementation detail.'
  ;;          'assume url format'
  ;; 
  (distribution-cache  rosdistro-index-dist-distribution-cache "distribution_cache"
		       (optional #:default #f))
  (distribution-status rosdistro-index-dist-distribution-status "distribution_status"
		       (assert-member '("prerelease" "active" "end-of-life" "rolling")))
  (distribution-type   rosdistro-index-dist-distribution-type "distribution_type"
		       (assert-member '("ros1" "ros2")))
  (python-version      rosdistro-index-dist-python-version    "python_version"
		       (assert-member '(2 3))))

(define-json-mapping <rosdistro-distribution> make-rosdistro-distribution rosdistro-distribution?
  yaml->rosdistro-distribution
  (release-platforms rosdistro-distribution-release-platforms "release_platforms" ;; (make-tail-map
										  ;;  yaml->release-platform)
		     )
  (repositories      rosdistro-distribution-repositories      "repositories"      (make-tail-map yaml->ros-repository))
  (type              rosdistro-distribution-type              "type"   (assert-string "distribution"))
  (version           rosdistro-distribution-version           "version" (assert-member '(1 2)))) ; integer: {1,2}


(define-json-mapping <ros-repository> make-ros-repository ros-repository?
  yaml->ros-repository
  (release            ros-repository-release            "release" (optional yaml->repo-release #:default #f))
  (source             ros-repository-source             "source"  (optional yaml->repo-source  #:default #f))
  (doc                ros-repository-doc                "doc"     (optional yaml->repo-doc     #:default #f))

  ;; string:
  ;;   {"developed","maintained","unmaintained","end-of-life"}
  ;; 
  (status             ros-repository-status             "status")

  ;; string:
  ;;   an optional field describing in a short sentence the current
  ;;   status of the repository. For example detailing the reason for
  ;;   EOL and the recommended upgrade path.
  ;; 
  (status-description ros-repository-status-description "status_description")
  (status-per-package ros-repository-status-per-package "status_per_package"
		      ;; (make-tail-map
		      ;;  yaml->repo-status-per-package)
		      ))

(define-json-mapping <repo-release> make-repo-release repo-release?
  yaml->repo-release

  ;; FIXME: we're gonna need the name field here...
  
  ;; string:
  ;;   url of release git repository
  ;; 
  (url       repo-release-url       "url")

  ;; string:
  ;;   version number for which package is released (tag, branch, or hash)
  ;; 
  (version   repo-release-version   "version")

  ;; list:
  ;;   optional list of subpackages, else one package with name of repo is assumed
  ;; 
  (packages  repo-release-packages  "packages")

  ;; dict:
  ;;   dict of ros tag names to git repo tag format strings to be used
  ;;   by bloom and the like
  ;; 
  ;; example:
  ;;   - (release -> 'release/groovy/{package}/{version}')
  ;; 
  ;; possible-tags:
  ;;   - package
  ;;   - version
  ;;   - upstream_version
  ;;   - debian_distro
  ;;   - debian_package_name
  ;; 
  (tags      repo-release-tags      "tags"))

(define-json-mapping <repo-source> make-repo-source repo-source?
  yaml->repo-source
  
  ;; string:  [REP141]
  ;;   SCM type identifier (i.e. 'git','svn',etc.)
  ;; 
  (type      repo-source-type      "type")

  ;; string:  [REP141]
  ;;   url of source repo (must be anon. readable)
  ;; 
  (url       repo-source-url       "url")
  
  ;; string: [REP141]
  ;;   for git/hg: tag, branch, or hash
  ;;   for svn:    don't set (version encoded in url)
  ;;   NOTE: must specify a branch if 'test_commits' is set to true (PEP 143)
  ;; 
  (version   repo-source-version   "version")

  ;; bool: [REP143]
  ;;   boolean flag to enable CI jobs for each commit on branch spec. under 'versions'
  ;;
  (test-commits repo-source-test-commits "test_commits")

  ;; bool: [REP143]
  ;;   boolean flag to enable CI jobs for each PR on branch spec. under 'versions'
  ;;
  (test-pull-requests repo-source-test-pull-requests "test_pull_requests")

  ;; bool: [REP153]
  ;;   boolean flag to enable API/ABI analysis of code against latest released packages
  ;;
  (test-abi repo-source-test-abi "test_abi"))

(define-json-mapping <repo-doc> make-repo-doc repo-doc?
  yaml->repo-doc
  
  ;; string: same as 'source'
  ;; 
  (type repo-doc-type "type")

  ;; string: same as 'source'
  ;;
  (url  repo-doc-url  "url")

  ;; string: same as 'source'
  ;;
  (version repo-doc-version "version")

  ;; list:
  ;;   optional list of repository names to not include in
  ;;   documentation
  ;;
  (blacklist-packages repo-doc-blacklist-packages "blacklist_packages")

  ;; list:
  ;;   list of repository names to perform xref on in documentation
  ;;
  (depends repo-doc-depends "depends"))


(define-record-type <rosdep-yaml>
  (make-rosdep-yaml packages)
  rosdep-yaml?
  (packages rosdep-yaml-packages))

(define (yaml->rosdep-yaml yaml)
  (make-rosdep-yaml
   (map yaml->rosdep-package yaml)))


(define-record-type <rosdep-package>
  (make-rosdep-package name operating-systems)
  rosdep-package?
  (name rosdep-package-name)
  (operating-systems rosdep-package-operating-system))

(define (yaml->rosdep-package yaml)
  (let ((name os-yaml (car+cdr yaml)))
    (make-rosdep-package
     name
     (append-map yaml->rosdep-operating-system os-yaml))))


(define-record-type <rosdep-operating-system>
  (make-rosdep-operating-system name versions )
  rosdep-operating-system?
  
  ;; string:
  ;;   valid set not formally defined but exhaustive list of those
  ;;   used in 'base.yaml' should get pretty close
  ;; 
  (name rosdep-operating-system-name)
  (versions rosdep-operating-system-versions))

(define (yaml->rosdep-operating-system yaml)
  (let* ((name vers-yaml (car+cdr yaml)))
    (make-rosdep-operating-system
     name (map yaml->rosdep-os-version vers-yaml))))


(define-record-type <rosdep-os-version>
  (make-rosdep-os-version version package-manager package-keys)
  rosdep-os-version?

  ;; string (optional):
  ;;   string version ID applied to operating system name above
  ;;
  (version rosdep-os-version-version)

  ;; string (optional):
  ;;   string name of package manager to use when looking up keys
  ;;
  (package-manager rosdep-os-version-package-manager)

  ;; list-of-strings:
  ;;   list of string keys to be passed to 'pkg-mngr' for installation
  ;;   on os 'name'
  ;;
  (package-keys rosdep-os-version-package-keys))

(define (yaml->rosdep-os-version yaml)
;;; FIXME: this whole thing should be a match-let...
  (let* ((vers-or-pkgmngr sub-yaml (car+cdr yaml))
	 (version pkg-mngr
		  (cond
		   ((vector? sub-yaml) (values #f #f))
		   ((string=? (caar sub-yaml)) (values #f vers-or-pkgmngr))
		   (else (values vers-or-pkgmngr (caar sub-yaml))))))
    (make-rosdep-os-version
     version
     pkg-mngr
     (cdar sub-yaml))))

;;; ================================================================
;;; | DATA FETCHING
;;; ================================================================

;; (define* (yaml-fetch url
;; 		     #:key
;; 		     (http-fetch http-fetch)
;; 		     (timeout 10)
;; 		     (headers `((user-agent . "GNU Guile")
;; 				;; TODO: will github serve this?
;; 				(Accept . "application/x-yaml"))))
;;   "Return a representation of the JSON resource URL (a list or hash table), or
;; #f if URL returns 403 or 404.  HEADERS is a list of HTTP headers to pass in
;; the query.  HTTP-FETCH is called to perform the request: for example, to
;; enable caching, supply 'http-fetch/cached'."
;;   (guard (c ((and (http-get-error? c)
;; 		  (let ((error (http-get-error-code c)))
;; 		    (or (= 403 error)
;; 			(= 404 error))))
;; 	     #f))
;;     (let* ((port (http-fetch url #:timeout timeout #:headers headers))
;; 	   (yaml-file (tmpfile))
;; 	   (subresult (with-output-to-port yaml-file
;; 			(cut get-string-all port)))
;; 	   (result (read-yaml-file yaml-file)))
;;       (close-port port)
;;       (close-port yaml-file)
;;       result)))

(define* (rosdistro-fetch-repo #:key
			       (url %rosdistro-repo-url)
			       (ref %rosdistro-repo-ref))
  (update-cached-checkout
   url
   #:ref ref
   #:recursive? #f
   #:check-out? #t
   #:starting-commit #f
   #:log-port (current-error-port)))

(define* (rosdistro-fetch-distro name #:key (rosdistro-index-file #f))
  (let* ((index-file    (or rosdistro-index-file
			    (string-append
			     (rosdistro-fetch-repo) "/index-v4.yaml")))
	 (index.yaml    ((compose yaml->rosdistro-index read-yaml-file) index-file))
	 (distro-files  ((compose rosdistro-index-dist-distribution
				  (cut alist-xpath `(,name) <>)
				  rosdistro-index-distributions)
			 index.yaml)))
    (case (length distro-files)
      ((0) (error (format #f "No distro files found for distro '~a' in index file '~a'~%"
			  name index-file)))
      ;; TODO: is is possible for this to be something besides a relative file path?
      ;; FIXME: this is vulnerable to path injection, pls sanitize me...
      ((1) (yaml->rosdistro-distribution
	    (read-yaml-file
	     (string-append
	      (dirname index-file) "/" (car distro-files)))))
      ;; FIXME: this should be a match statement, right now else is
      ;;        broken (should fall-through to (1) case
      (else (begin (format
		    (current-error-port)
		    "Warning: Multiple (~d) distro files were found for ROS distro '~a' in index file '~a'~%"
		    (length distro-files) name index-file)
		   (format
		    (current-error-port)
		    "Warning: Using first file (~a), ignoring rest...~%"
		    ;; FIXME:  use datastructure-agnostic method for elt ref
		    (car distro-files)))))))

(define* (rosdistro-fetch-rosdep #:key (yaml-files #f))
  (let* ((yaml-files  (or yaml-files
			  (let ((rosdep-dir (string-append
					     (rosdistro-fetch-repo) "/rosdep")))
			    (map (cut string-append rosdep-dir "/" <>)
				 (scandir rosdep-dir (cut string-suffix? ".yaml" <>))))))
	 (rosdep-yamls (map (compose yaml->rosdep-yaml read-yaml-file) yaml-files)))
    rosdep-yamls))

(define* (repo-release-tag-formatted release #:key (package #f) (tag "release"))
  ;; TODO: use match-record here to preserve sanity...
  (let ((tag-fmt-string (assoc-ref (repo-release-tags release) tag))
	(package-name   (or package (repo-release-name release)))
	(version        (repo-release-version release)))
    ;; TODO: regex extract fields from between curly braces
    ;;         - error on non-existent curly-brace keys
    ;;         - handle multiple packages in repo
    (error "Not Implemented.")))

(define (rosdistro-release-fetch release package-name)
  (receive (checkout commit _)
      (update-cached-checkout
       (repo-release-url release)
       #:ref `(tag . ,(repo-release-tag-formatted
		       release
		       #:package package-name))
       #:recursive? #f
       #:check-out? #t
       #:starting-commit #f
       #:log-port (current-error-port))
    checkout))

(define (rosdistro-release->origin release package-name)
  `(origin
     (method git-fetch)
     (uri
      (git-reference
       (url
	,(repo-release-url release))
       (commit
	,(repo-release-tag-formatted release #:package package-name))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       ,(bytevector->nix-base32-string
	 (file-hash* (rosdistro-release-fetch release package-name)
		     #:recursive? #t))))))

(define (ros-name->guix-name name distro)
  (string-join
   (cons* "ros" distro (string-split name "_"))
   "-"))

(define* (rosdistro->guix-package package-name #:key rosdistro)
  (let* ((distro-name (ros-distribution-name rosdistro))
	 (release (ros-repository-release
		   (ros-distribution->package-repo
		    rosdistro package-name)))
	 (package-manifest (rosdistro-release->package-manifest release package-name)))
   `(package
      (name ,(ros-name->guix-name package-name (ros-distribution-name rosdistro)))
      (version ,(repo-release-version release))
      (source ,(rosdistro-release->origin release package-name))
      (build-system ,(ros-distribution->build-system rosdistro))

      ,@(maybe-native-inputs
	 (map (lambda (pkg-name)
		(ros-name->guix-name pkg-name distro-name))
	      (package-manifest->build-deps package-manifest)))
      ,@(maybe-propagated-inputs
	 (map (lambda (pkg-name)
		(ros-name->guix-name pkg-name distro-name))
	      (package-manifest->runtime-deps)))

      ;; FIXME: what keys are these in package.xml?
      (home-page ,(package-manifest-homepage package-manifest))
      (synopsis #f)
      (description #f)
      (license #f))))

(format #t "~y~%"
	(rosdistro-distribution-repositories
	 (rosdistro-fetch-distro "humble")))
