(define-module (nezzar packages meta)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system guile)
  #:use-module ((guix licenses) #:prefix license:)

  #:use-module ((gnu packages package-management) #:select (channel-source->package))

  #:use-module ((guix describe) #:select (current-channels)))

;; (define-public nezzar
;;   (channel-source->package
;;    (origin
;;      (method git-fetch)
;;      (uri (git-reference
;; 	   (url "https://github.com/pszenher/nezzar.git")
;; 	   (commit "")))
;;      (hash #f)))
  
;; ;;   (package
;; ;;     (name "nezzar")
;; ;;     (version "rolling")
;; ;;     (home-page "https://github.com/pszenher/nezzar")
;; ;;     (source
;; ;;      (origin
;; ;;        (method url-fetch)
;; ;;        (uri "./..")
;; ;;        (sha256 #f)))
;; ;;     (build-system guile-build-system)
;; ;;     (synopsis "Metapackage for adding nezzar libs to profile's Guile %load-path")
;; ;;     (description "The %load-path for native Guix/GNU packages are always available, due
;; ;; to the installation of the `guix' executable in the user profile.  For
;; ;; channels which lack this, we need a shim.")
;; ;;     (license license:gpl3+))
;;   )

;; (channel (name "nezzar") (url "https://github.com/pszenher/nezzar") (branch "master"))

;; nezzar
