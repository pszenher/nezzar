(define-module (nezzar ci)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match)
  #:use-module (ice-9 format)
  
  #:use-module (guix discovery)
  #:use-module (guix monads)
  #:use-module (guix packages)
  #:use-module (guix status)
  #:use-module (guix store)
  #:use-module (guix ui)

  #:use-module (gnu packages)

  #:use-module (nezzar packages))

(define (nezzar-all-packages)
  (parameterize
      ((%package-module-path (list (nezzar-root-directory))))
    (fold-packages cons '())))

(define (nezzar-all-derivations)
  (mapm/accumulate-builds
   (lambda (pkg)
     (format #t "drv: ~a~%" pkg)
     (package->derivation pkg))
   (nezzar-all-packages)))

;; (with-status-verbosity 2
;;   (with-build-handler
;;       (build-notifier #:use-substitutes? #t
;; 		      #:verbosity 3
;; 		      #:dry-run? #f)
;;     (run-with-store (open-connection)
;;       (nezzar-all-derivations))))
