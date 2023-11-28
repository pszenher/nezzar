(define-module (guix extensions nezzar)
  #:use-module (guix ui)
  #:use-module (guix scripts)
  #:use-module (guix read-print)
  #:use-module (guix utils)

  #:use-module (ice-9 format)
  #:use-module (ice-9 match)
  #:use-module ((ice-9 ftw) #:select (scandir))

  #:export (guix-nezzar))

(define (subcommand-files)
  (let ((path (getenv "GUIX_EXTENSIONS_PATH")))
    (scandir path
	     (lambda (file)
	       (and (string-suffix? ".scm" file)
		    (not (string-suffix? "nezzar.scm" file))
		    ))))) 
 
(define (subcommands) (map file-sans-extension (subcommand-files)))

(define (show-help)
  (display (G_ "Usage: guix nezzar SUBCOMMAND ARGS ...
Run SUBCOMMAND with ARGS.\n"))
  (newline)
  (display (G_ "SUBCOMMAND must be one of the subcommands listed below:\n"))
  (newline)
  (format #t "~{   ~a~%~}" (subcommands))
  (display (G_ "
  -h, --help             display this help and exit"))
  (display (G_ "
  -V, --version          display version information and exit"))
  (newline)
  (show-bug-report-information))

(define-command (guix-nezzar . args)
  (category extension)
  (synopsis "Custom guix command extensions from nezzar channel")
  (match args
    (()
     (format (current-error-port)
             (G_ "guix nezzar: missing subcommand name~%~%"))
     (leave-on-EPIPE (show-help))
     (exit 0))
    ((or ("-h") ("--help"))
     (leave-on-EPIPE (show-help))
     (exit 0))
    ((or ("-V") ("--version"))
     (show-version-and-exit "guix nezzar"))
    ((subcommand args ...)
     (if (member subcommand (subcommands))
	 (begin (format (current-error-port) "~a :: ~a~%" subcommand args)
		(newline)
		(add-to-load-path (string-append (getenv "GUIX_EXTENSIONS_PATH") "/../.."))
		(load (string-append subcommand ".scm"))
		(apply (module-ref (resolve-interface `(guix extensions ,(string->symbol subcommand)))
				   (string->symbol (string-append "nezzar-" subcommand))) args))
	 (begin (format (current-error-port) "ERROR: not a nezzar subcommand...~%~%")
		(leave-on-EPIPE (show-help))
		(exit 1))
         ;; (let ((print (lambda (expr)
         ;;                (leave-on-EPIPE
         ;;                 (pretty-print-with-comments (current-output-port) expr)))))
         ;;   (match (apply (resolve-importer importer) args)
         ;;     ((and expr (or ('package _ ...)
         ;;                    ('let _ ...)
         ;;                    ('define-public _ ...)))
         ;;      (print expr))
         ;;     ((? list? expressions)
         ;;      (for-each (lambda (expr)
         ;;                  (print expr)
         ;;                  ;; Two newlines: one after the closing paren, and
         ;;                  ;; one to leave a blank line.
         ;;                  (newline) (newline))
         ;;                expressions))
         ;;     (x
         ;;      (leave (G_ "'~a' import failed~%") importer))))
         ;; (let ((hint (string-closest importer importers #:threshold 3)))
         ;;   (report-error (G_ "~a: invalid importer~%") importer)
         ;;   (when hint
         ;;     (display-hint (G_ "Did you mean @code{~a}?~%") hint))
         ;;   (exit 1))
	 ))))

;;; ================================================================
;;; = NOTES
;;; ================================================================
;;;
;;; - Working shell command for extension invocation [2023-11-27]:
;;; 
;;;   -   GUILE_LOAD_PATH=${HOME}/nezzar:${GUILE_LOAD_PATH}   \ # (for loading subcommand modules)
;;;       GUIX_EXTENSIONS_PATH=${HOME}/nezzar/guix/extensions \ # (for guix/ui.scm)
;;;       guix nezzar import-npm-binary "typescript"  # (actual command invocation)
;;; 
;;; - Newly working shell command [2023-11-28]:
;;; 
;;;   - GUIX_EXTENSIONS_PATH=~/src/nezzar/guix/extensions \
;;;     guix nezzar import-npm-binary "typescript" "5"
;;; 
;;;   - no longer need guile_load_path, hack the extensions directory
;;;     handle into nezzar.scm using GUIX_EXTENSIONS_DIR env var,
;;;     which will always be set when that file is run (hopefully...)
