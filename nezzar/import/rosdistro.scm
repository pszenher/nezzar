(define-module (nezzar import rosdistro)
  #:use-module (guix git)
  #:use-module (yaml)
  #:use-module (json)
  #:use-module (guix import json)
  #:use-module ((gnu packages guile-xyz) #:select (guile-libyaml))

  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:use-module (srfi srfi-71)
  #:use-module (ice-9 format)

  ;; #:export (rosdistro-fetch-repo
  ;; 	    rosdistro-fetch-distro)
  )


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

(define (specified=> func)
  (lambda (val) (if (unspecified? val) val (func val))))

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
  (version       rosdistro-index-version       "version"))    ; integer: {1,2,3,4}

(define-json-mapping <rosdistro-index-dist> make-rosdistro-index-dist rosdistro-index-dist?
  yaml->rosdistro-index-dist

  ;; string: list of reference to the distribution files (typically length 1 can be more)
  ;; 
  (distribution        rosdistro-index-dist-distribution "distribution" vector->list)
  
  ;; string: not documented, assuming release_cache equivalent
  ;; 
  ;; REP 141: 'reference to a release cache. Whether this field is a
  ;;           dictionary, a list or a scalar is left as an
  ;;           implementation detail.'
  ;;          'assume url format'
  ;; 
  (distribution-cache  rosdistro-index-dist-distribution-cache "distribution_cache")
  
  ;; string: {"prerelase","active","end-of-life","rolling"}
  ;; 
  (distribution-status rosdistro-index-dist-distribution-status "distribution_status")
  
  ;; string: {"ros1","ros2"}
  ;; 
  (distribution-type   rosdistro-index-dist-distribution-type "distribution_type")
  
  ;; integer: python major version {2,3}
  ;; 
  (python-version      rosdistro-index-dist-python-version    "python_version"))

(define-json-mapping <rosdistro-distribution> make-rosdistro-distribution rosdistro-distribution?
  yaml->rosdistro-distribution
  (release-platforms rosdistro-distribution-release-platforms "release_platforms" ;; (make-tail-map
										  ;;  yaml->release-platform)
		     )
  (repositories      rosdistro-distribution-repositories      "repositories"      (make-tail-map yaml->ros-repository))
  (type              rosdistro-distribution-type              "type"   (assert-string "distribution"))
  (version           rosdistro-distribution-version           "version")) ; integer: {1,2}


(define-json-mapping <ros-repository> make-ros-repository ros-repository?
  yaml->ros-repository
  (release            ros-repository-release            "release" (specified=> yaml->repo-release))
  (source             ros-repository-source             "source"  (specified=> yaml->repo-source))
  (doc                ros-repository-doc                "doc"     (specified=> yaml->repo-doc))

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

;; (define* (rosdistro-fetch))

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

;; (define* (rosdistro-fetch-rosdep #:key (fetch-func ())))

(format #t "~y~%"
	(ros-repository-source
	 (cdar
	  (rosdistro-distribution-repositories
	   (rosdistro-fetch-distro "humble")))))
