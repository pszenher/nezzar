(define-module (nezzar import lake)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-9)
  #:use-module (srfi srfi-26)
  #:use-module (srfi srfi-71)

  #:use-module (ice-9 format)
  #:use-module (ice-9 ftw)
  #:use-module (ice-9 receive)
  #:use-module (ice-9 match)
  
  #:use-module (json)

  #:use-module (guix git)
  #:use-module (guix hash)
  #:use-module (guix base32)

  #:use-module (guix import utils)
  #:use-module (guix import json))


;;; ================================================================
;;; | STATIC DEFINITIONS
;;; ================================================================

;; << There's nothing here... >>

;;; ================================================================
;;; | HELPER FUNCTIONS
;;; ================================================================

(define* (optional #:optional (func identity) #:key (default *unspecified*))
  (lambda (val) (if (unspecified? val) default (func val))))

(define* (nullable #:optional (func identity) #:key (default 'null))
  "Return a function that takes a single argument VAL, which returns the
result of applying FUNC to VAL, or 'null if VAL is 'null"
  (lambda (val) (if (eq? 'null val) default (func val))))

(define (assert-member lst)
  (when (not (list? lst))
    (error (format #f "Error: cannot bind assert-member on non-list object '~a'" lst)))
  (lambda (val)
    (if (member val lst) val
	(error
	 (format
	  #f "Assertion Error: passed value '~a' is not member of allowlist '~a'"
	  val lst)))))

(define* (assert-string #:optional str-val)
  "Return a function of a single string argument STR, which returns STR
if it is a string, and equivalent (by string=?) to STR-VAL (if
passed), and throws an error otherwise."
  (cond ((not str-val) string?)
	((not (string? str-val))
	 (error (format
		 #f "Error: cannot bind assert-string on non-string object '~a'"
		 str-val)))
	(else
	 (lambda (str)
	   (if (and (string? str) (string=? str str-val)) str
	       (error
		(format
		 #f "Assertion Error: passed string '~a' does not match expected '~a'"
		 str str-val)))))))

(define (assert-bool) (cut (and=> boolean? identity)))

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

(define (make-map func)
  "Return a function that takes a single argument LST, and applies FUNC
to each element in the list, returning the mapped result."
  (cut map func <>))

(define (make-tail-map func)
  "Return a function that takes single argument LST, and applies FUNC to
the tail of each element in the list, returning a reconstructed list
with updated tails."
  (make-map (make-tail-func func)))

;;; ================================================================
;;; | DATA STRUCTURES
;;; ================================================================

(define-json-mapping <lake-manifest> make-lake-manifest lake-manifest?
  json->lake-manifest
  (version       lake-manifest-version       "version"     (assert-member '(1 2 3 4 5 6 7)))
  (name          lake-manifest-name          "name"        (nullable (assert-string)))
  (packages-dir  lake-manifest-packages-dir  "packagesDir" (assert-string))
  (packages      lake-manifest-packages      "packages"
		 (make-map
		  (match-lambda
		    (("git" entry)  (json->lake-package-entry-git  entry))
		    (("path" entry) (json->lake-package-entry-path entry))))))

(define-json-mapping <lake-package-entry-path> make-lake-package-entry-path lake-package-entry-path?
  json->lake-package-entry-path
  (name lake-package-entry-path-name "name" (assert-string))
  (opts lake-package-entry-path-opts "opts")
  (inherited lake-package-entry-path-inherited "inherited" (assert-bool))
  (dir  lake-package-entry-path-dir  "dir" (assert-string)))

(define-json-mapping <lake-package-entry-git> make-lake-package-entry-git lake-package-entry-git?
  json->lake-package-entry-git
  (name lake-package-entry-git-name "name" (assert-string))
  (opts lake-package-entry-git-opts "opts")
  (inherited lake-package-entry-git-inherited "inherited" (assert-bool))
  (url       lake-package-entry-git-url "url" (assert-string))
  (rev lake-package-entry-git-rev "rev" (assert-string))

  (input-rev lake-package-entry-git-input-rev "inputRev?" (nullable (assert-string)))
  (subdir    lake-package-entry-git-subdir    "subDir?"   (nullable (assert-string))))



;;; ================================================================
;;; | DATA FETCHING
;;; ================================================================

(define lake-package->guix-package
  (lambda* (package-name #:key version repo-url (repo-ref "master") (repo-subdir ".") #:allow-other-keys)
    "Fetch the metadata for PACKAGE-NAME from REPOSITORY, and return the
`package` s-expression corresponding to that package, or #f on failure"
    (let* ((repository (lake-fetch-repo #:url repo-url #:ref repo-ref))
	   (lake-manifest (call-with-input-file
			      (string-append repository "/" repo-subdir "lake-manifest.json")
			    (json->lake-manifest))))
      (if repository
	  (make-lake-package-sexp
	   #:name package-name
	   #:url repo-url
	   #:ref version
	   #:manifest lake-manifest) #f))))

(define (lake->package-name name)
  "Return a Guix-compliant package name from lake package NAME."
  (string-append "lean4-" (snake-case name)))

;; (define (lake-package->upstream-source pkg #:optional version)
;;   "Return the upstream source for the given VERSION of the
;; <package> record PKG.  If VERSION is omitted or #f, use the
;; latest version (`master' branch)."
;;   (upstream-source
;;    (urls (list (origin-uri (package-source pkg))))))

(define* (make-lake-package-sexp #:key name url ref hash manifest)
  (let ((name (lake-manifest-name manifest)))
    `(package
      (name ,(lake->package-name name))
      (version ,version)
      (source
       (origin
	(method git-fetch)
	(uri (git-reference
	      (url ,url)
	      (commit ,ref)))
	(file-name (git-file-name name version))
	(sha256
	 (base32
	  ,(bytevector->nix-base32-string hash)))))
      (build-system lake-build-system)
      ,@(maybe-inputs)
      (home-page ,url)
      (synopsis ,(format #f "Lean4 Theorem Prover package: ~a" name))
      (description synopsis)
      (license 'unknown-license))))

(define* (lake-fetch-repo #:key url ref)
  (update-cached-checkout
   url
   #:ref ref
   #:recursive? #f
   #:check-out? #t
   #:starting-commit #f
   #:log-port (current-error-port)))

;;; ================================================================
;;; = TODO
;;; ================================================================
;;;
;;; - lakefile.lean is difficult to parse, as it seems that all (or at
;;;   least most) lean statements are valid expressions in there,n
;;;   meaning that the `requires' field may themselves be subject to
;;;   control flow
;;; 
;;;     - see mathlib4's lakefile.lean file (specifically the doc4
;;;       requires line), which is behind an if-then-else conditional
;;;
;;; - neither lakefile.lean nor lake-manifest.json contain sufficient
;;;   information to craft a package definition (lack license,
;;;   synopsis, homepage in json, and everything in lakefile.lean
;;; 
;;;     - would need to grab these from GitHub, but that would require
;;;       an additional implementation building upon the (guix import
;;;       github) module...
;;; 
