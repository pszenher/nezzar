(define-module (nezzar packages pipewire)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-gtk)
  #:use-module (gnu packages qt))

(define-public wireplumber/no-elogind
  (package
    (inherit wireplumber)
    (name "wireplumber-no-elogind")
    (arguments
     (substitute-keyword-arguments
	 (package-arguments wireplumber)
       ((#:configure-flags flags)
	`(append '("-Delogind=disabled")
		 ,flags))))
    (synopsis (string-append
	       (package-synopsis wireplumber) " (elogind disabled)"))))

;; TODO: figure out build process for meson->cargo package
;; (define-public helvum
;;   (package
;;     (name "helvum")
;;     (version "0.3.2")
;;     (source (origin
;; 	      (method git-fetch)
;; 	      (uri (git-reference
;; 		    (url "https://gitlab.freedesktop.org/pipewire/helvum.git")
;; 		    (commit version)))
;; 	      (sha256
;; 	       (base32
;; 		"0hyfw4rc6qdjap6k6rvnbv7a3hcmfaln9i08ikm5afakqjfa1pia"))))
;;     (build-system meson-build-system)
;;     (native-inputs
;;      (list gtk
;; 	   pipewire-0.3
;; 	   rust
;; 	   `(,rust "cargo")
;; 	   rust-once-cell-1
;; 	   rust-log-0.4
;; 	   pkg-config))
;;     (home-page "https://gitlab.freedesktop.org/pipewire/helvum")
;;     (synopsis "A GTK patchbay for pipewire.")
;;     (description "Helvum is a GTK-based patchbay for pipewire, inspired by the JACK
;; tool catia.")
;;     (license license:gpl3)))

