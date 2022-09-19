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


(define-public qpwgraph
  (package
    (name "qpwgraph")
    (version "0.3.5")
    (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://gitlab.freedesktop.org/rncbc/qpwgraph.git")
		    (commit (string-append "v" version))))
	      (sha256
	       (base32
		"01f4zabn22dp0yl7szxck6gkbayk1p5iqajfgzls7mdkba7515b6"))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f			; no tests defined
       #:configure-flags '("-DCONFIG_ALSA_MIDI=OFF")))
    (native-inputs
     (list pkg-config))
    (inputs
     (list qtbase qtsvg pipewire-0.3))
    (home-page "https://gitlab.freedesktop.org/rncbc/qpwgraph")
    (synopsis "PipeWire Graph Qt GUI Interface")
    (description "qpwgraph is a graph manager dedicated to PipeWire,
using the Qt C++ framework, based and pretty much like the same of
QjackCtl.")
    (license license:gpl2+)))

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

