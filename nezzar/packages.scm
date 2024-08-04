(define-module (nezzar packages)
  #:use-module (ice-9 match)
  #:use-module (guix diagnostics)
  #:use-module (guix ui)
  #:use-module ((gnu packages) #:prefix gnu:)
  #:export (nezzar-root-directory
	    search-patches))

(define (nezzar-root-directory)
  (define (parent-dirname filename)
    (dirname
     (dirname filename)))
  (match (search-path %load-path "nezzar/packages.scm")
    (#f (error
	 (format
	  #f "Could not find `nezzar/packages.scm' in `%load-path': `~a'"
	  %load-path)))
    ((= canonicalize-path abspath) (parent-dirname abspath))))

(define-syntax-rule (search-patches file-name ...)
  (parameterize
      ((%patch-path
	(map (lambda (dir)
	       (string-append (nezzar-root-directory) "/nezzar/packages/patches"))
	     %load-path)))
    (gnu:search-patches file-name ...)))
