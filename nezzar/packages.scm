(define-module (nezzar packages)
  #:use-module ((gnu packages) #:prefix gnu:)
  #:export (search-patches))

(define-syntax-rule (search-patches file-name ...)
  (parameterize
      ((%patch-path
	(map (lambda (dir)
	       (string-append dir "/nezzar/packages/patches"))
	     %load-path)))
    (gnu:search-patches file-name ...)))
