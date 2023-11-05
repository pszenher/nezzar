(define-module (guix scripts extensions import-rosdistro)
  #:use-module (guix ui)
  #:use-module (guix utils)
  #:use-module (guix scripts)
  #:use-module (guix scripts import)

  #:use-module (nezzar import rosdistro)

  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-71)
  #:use-module (ice-9 match))


;;;
;;; Command-line options.
;;;

(define %default-options
  '())

(define (show-help)
  (display (G_ "Usage: guix import-rosdistro PACKAGE-NAME
Import and convert the rosdistro package for PACKAGE-NAME.\n"))
  (display (G_ "
  -h, --help             display this help and exit"))
  (display (G_ "
  -r, --recursive        import packages recursively"))
  (display (G_ "
  -V, --version          display version information and exit"))
  (newline)
  (show-bug-report-information))

(define %options
  ;; Specification of the command-line options.
  (cons* (option '(#\h "help") #f #f
                 (lambda args
                   (show-help)
                   (exit 0)))
         (option '(#\V "version") #f #f
                 (lambda args
                   (show-version-and-exit "guix import pypi")))
         (option '(#\r "recursive") #f #f
                 (lambda (opt name arg result)
                   (alist-cons 'recursive #t result)))
         %standard-import-options))


;;;
;;; Entry point.
;;;

(define (guix-import-rosdistro . args)
  (define (parse-options)
    ;; Return the alist of option values.
    (parse-command-line args %options (list %default-options)
                        #:build-options? #f))

  (let* ((opts (parse-options))
         (args (filter-map (match-lambda
                             (('argument . value)
                              value)
                             (_ #f))
                           (reverse opts))))
    (match args
      ((spec)
       (with-error-handling
         (let ((name version (package-name->name+version spec)))
           (if (assoc-ref opts 'recursive)
               ;; Recursive import
               (map (match-lambda
                      ((and ('package ('name name) . rest) pkg)
                       `(define-public ,(string->symbol name)
                          ,pkg))
                      (_ #f))
                    (rosdistro-recursive-import name version))
               ;; Single import
               (let ((sexp (rosdistro->guix-package name #:version version)))
                 (unless sexp
                   (leave (G_ "failed to download meta-data for rosdistro package '~a'~%")
                          name))
                 sexp)))))
      (()
       (leave (G_ "too few arguments~%")))
      ((many ...)
       (leave (G_ "too many arguments~%"))))))

