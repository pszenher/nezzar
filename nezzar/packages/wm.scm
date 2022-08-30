(define-module (nezzar packages wm)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages man)
  #:use-module (gnu packages datastructures)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages image))

(define-public fuzzel
  (package
    (name "fuzzel")
    (version "1.7.0")
    (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://codeberg.org/dnkl/fuzzel.git")
		    (commit version)))
	      (file-name (git-file-name name version))
	      (sha256
	       (base32
		"1261gwxiky37pvzmmbrpml1psa22kkglb141ybj1fbnwg6j7jvlf"))
	      (modules '((guix build utils)))
	      ;; Delete 3rd-party directory containing nanosvg headers
	      (snippet '(delete-file-recursively "3rd-party"))))
    (build-system meson-build-system)
    (arguments
     '(#:build-type "release"
       #:configure-flags '("-Denable-cairo=enabled"
			   "-Dpng-backend=libpng"
			   "-Dsvg-backend=librsvg")))
    (inputs
     (list pixman wayland libxkbcommon fcft cairo libpng librsvg))
    (native-inputs
     (list pkg-config wayland-protocols scdoc tllist))
    (home-page "https://codeberg.org/dnkl/fuzzel")
    (synopsis "Application launcher for wlroots based Wayland compositors")
    (description
     "Fuzzel s a Wayland-native applcation launcher, similar to rofi's 'drun' mode.")
    (license license:expat)))

