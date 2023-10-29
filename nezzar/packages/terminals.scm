(define-module (nezzar packages terminals)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)

  #:use-module ((gnu packages pkg-config) #:select (pkg-config))
  #:use-module ((gnu packages fontutils)  #:select (freetype fontconfig))
  #:use-module ((gnu packages linux)      #:select (gpm))
  #:use-module ((gnu packages ncurses)    #:select (ncurses)))

(define-public fbterm
  (package
    (name "fbterm")
    (version "1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://salsa.debian.org/debian/fbterm.git")
	     (commit (string-append "upstream/" version))))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "1nl9z169a59akgb8b5j2pw5fp3bbkmv553rryffkfz45d1cxskvq"))))
    (inputs (list ncurses))
    (native-inputs (list pkg-config freetype fontconfig gpm))
    (build-system gnu-build-system)
    (arguments
     `(#:make-flags '("CXXFLAGS=-Wno-error=narrowing")
       #:phases
       (modify-phases %standard-phases
	 (add-before 'install 'set-terminfo-env-var
	   (lambda _ (setenv "HOME" (getcwd)))))))
    (home-page "https://code.google.com/archive/p/fbterm/")
    (synopsis "A fast FrameBuffer based TERMinal emulator for linux")
    (description "FbTerm is a fast terminal emulator for linux with frame buffer device
or VESA video card.")
    (license license:gpl2)))
