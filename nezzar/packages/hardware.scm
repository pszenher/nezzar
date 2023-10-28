(define-module (nezzar packages hardware)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix gexp)

  #:use-module (gnu packages autotools)
  #:use-module (gnu packages check)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)

  ;; tmp2-tss
  #:use-module (gnu packages curl)
  #:use-module (gnu packages web)
  #:use-module (gnu packages admin)

  ;; swtpm
  #:use-module (gnu packages linux)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages gnome)

  ;; libtpms
  #:use-module (gnu packages perl)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  
  #:use-module (gnu packages hardware))


(use-modules (guix download)
	     ((guix build-system python) #:select (pypi-uri))
	     ((guix build-system pyproject) #:select (pyproject-build-system))
	     ((gnu packages libffi) #:select (python-cffi))
	     ((gnu packages sphinx) #:select (python-myst-parser python-sphinx python-sphinx-rtd-theme))
	     ((gnu packages python-build) #:select (python-wheel python-setuptools-scm python-poetry-core))
	     ((gnu packages python-xyz) #:select (python-pkgconfig)))

;;; TODO: move to python-xyz.scm, upstream
(define-public python-pkgconfig-1.5
  (package
    (name "python-pkgconfig")
    (version "1.5.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pkgconfig" version))
       (sha256
	(base32 "16dqm2g7b2c6s09vf6wv62s629s63xf51n92v0hbax8zy4z1dd6y"))))
    (build-system pyproject-build-system)
    (native-inputs
     (list python-poetry-core
	   python-nose))
    (inputs
     (list pkg-config))
    (home-page "https://github.com/matze/pkgconfig")
    (synopsis "Python interface for pkg-config")
    (description "This module provides a Python interface to pkg-config.  It
can be used to find all pkg-config packages, check if a package exists,
check if a package meets certain version requirements, query CFLAGS and
LDFLAGS and parse the output to build extensions with setup.py.")
    (license license:expat)))

;;; TODO: upstream
(define-public tpm2-tss-4.0
  (package
    (inherit tpm2-tss)
    (version "4.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/tpm2-software/tpm2-tss"
                           "/releases/download/" version "/tpm2-tss-" version
                           ".tar.gz"))
       (sha256
	(base32 "0l69hx0af66aji9dc2d01rf21h13jhzmp4c94a2bvdhh749p0ajk"))))
    (inputs
     (list curl json-c openssl `(,util-linux "lib") shadow))))

(define-public libtpms
  (package
    (name "libtpms")
    (version "0.9.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/stefanberger/libtpms.git")
	     (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "0lzm8lm3spjjxrni6pr9vjxv4ggfi1ss4xpil6x4k07hwawdhr13"))))
    (native-inputs
     (list
      autoconf
      automake
      libtool
      pkg-config
      perl				; pod2man
      openssl
      gmp))
    (build-system gnu-build-system)
    (arguments
     '(#:configure-flags '("--with-openssl" "--with-tpm2")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-check-local
           (lambda _
	     (substitute* "src/Makefile.am"
	       (("check-local:") "NO-check-local:")))))))
    (home-page "https://github.com/stefanberger/libtpms")
    (synopsis "The libtpms library provides software emulation of a Trusted Platform Module (TPM 1.2 and TPM 2.0)")
    (description
     "Libtpms is a library that targets the integration of TPM functionality
into hypervisors, primarily into Qemu.  Libtpms provides a very narrow
public API for this purpose so that integration is possible.  Only the
minimum of necessary APIs are made publicly available.")
    (license license:bsd-3)))

(define-public swtpm
  (package
    (name "swtpm")
    (version "0.8.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/stefanberger/swtpm.git")
	     (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "09cnxh5pj71583vlfhp96b5ic4wbd8bwjsg5wgq50c35n55pk920"))))
    (native-inputs
     (list
      autoconf
      automake
      libtool
      pkg-config
      openssl

      libtpms

      iproute
      python
      libseccomp
      perl 				; pod2man

      libtasn1
      expect
      socat
      python-twisted
      fuse
      glib
      gnutls
      json-glib

      tpm2-tss-4.0))
    (build-system gnu-build-system)
    (arguments
     '(#:tests? #f
       ;; disable tests due to breakage
       ;; FIXME: why do they hang infinitely?
       ))
    (home-page "https://github.com/stefanberger/swtpm/wiki")
    (synopsis "Libtpms-based TPM emulator with socket, character device, and Linux CUSE interface.")
    (description
     "The SWTPM package provides TPM emulators with different front-end
interfaces to libtpms.  TPM emulators provide socket
interfaces (TCP/IP and Unix) and the Linux CUSE interface for the
creation of multiple native /dev/vtpm* devices.")
    (license license:bsd-3)))

(define-public tpm2-abrmd
  (package
    (name "tmp2-abrmd")
    (version "3.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/tpm2-software/tpm2-abrmd.git")
	     (commit version)))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "0v7iz40f007c3l7aqqy6wj4g4p0pg8dxqm14022sgd8jrc4dqjcp"))))
    (native-inputs
     (list
      ;; Required dependencies
      autoconf
      autoconf-archive
      automake
      libtool
      glib
      `(,glib "bin")
      pkg-config
      tpm2-tss-4.0
      dbus
      
      ;; Test dependencies
      cmocka))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
	 (add-before 'bootstrap 'set-version-string
	   (lambda _
	     (substitute* "bootstrap"
	       (("git describe --tags --always --dirty") ,(format #f "echo ~a" version))))))))
    (home-page "https://tpm2-software.github.io/")
    (synopsis "TPM2 Access Broker & Resource Management Daemon implementing the TCG spec.")
    (description
     "This is a system daemon implementing the TPM2 access broker (TAB) &
Resource Manager (RM) spec from the TCG. The daemon (tpm2-abrmd) is
implemented using Glib and the GObject system.")
    (license license:bsd-2)))

(define-public python-tpm2-pytss
  (package
    (name "python-tpm2-pytss")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tpm2-pytss" version))
       (sha256
	(base32 "15y8jlpml37npilpmja84rzqz307maz70f9c7ppsxhgxaqa4nnsv"))
       (patches
	'(;; Apply patch from 2.2.0-rc0 to fix test w/ newer versions of python-cryptography
	  "patches/0001-test-add-check-for-renamed-cryptography-types.patch"))))
    (build-system pyproject-build-system)
    (arguments
     `(#:phases
       ,#~(modify-phases %standard-phases
            (add-after 'unpack 'patch-test-libname
              (lambda _
		(substitute* "test/TSS2_BaseTest.py"
		  (("libtss2-tcti-swtpm.so") #$(file-append tpm2-tss-4.0 "/lib/libtss2-tcti-swtpm.so"))))))))
    (propagated-inputs (list python-asn1crypto
			     python-cffi
			     python-cryptography
                             python-packaging python-pyyaml))
    (native-inputs (list
		    ;; added
		    pkg-config
		    python-pkgconfig-1.5

		    python-black
                    ;; python-build
                    python-codecov
                    python-coverage
                    python-docutils
                    ;; python-installer
                    python-myst-parser
                    python-pytest
                    python-pytest-cov
                    python-pytest-xdist
                    python-setuptools-scm
                    python-sphinx
                    python-sphinx-rtd-theme
                    python-twine

		    tpm2-tss-4.0

		    ;; Test dependencies
		    swtpm))
    (home-page "https://github.com/tpm2-software/tpm2-pytss")
    (synopsis "TPM 2.0 TSS Bindings for Python")
    (description "TPM 2.0 TSS Bindings for Python")
    (license license:bsd-3)))

(use-modules ((gnu packages) #:select (search-auxiliary-file)))
(define-public tpm2-pkcs11
  (package
    (name "tpm2-pkcs11")
    (version "1.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/tpm2-software/tpm2-pkcs11.git")
	     (commit version)))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "0af0lwg0ljp48c7facrbd7m3c0v43j530dgwwdhd4q28jj0yv0aa"))))
    (native-inputs
     (list
      autoconf
      autoconf-archive
      automake
      libtool
      libyaml
      ;; openssl-1.1   ;FIXME:  tpm2-tss must be >= 3.2 to use openssl-3.0
      openssl
      pkg-config
      sqlite
      tpm2-abrmd
      tpm2-tss-4.0

      ;; Optional dependencies for tpm2_ptool
      tpm2-tools

      python-wrapper
      python-bcrypt
      python-cryptography
      python-pyyaml
      python-pyasn1
      python-pyasn1-modules
      python-tpm2-pytss

      ;; Test dependencies
      cmocka
      swtpm))
    (build-system gnu-build-system)
    (outputs '("out" "python"))
    (arguments
     (list
      #:imported-modules %python-build-system-modules
      #:modules '((srfi srfi-26)
		  (guix build utils)
		  (guix build gnu-build-system)
		  ((guix build python-build-system) #:prefix python:))
      #:phases
      (with-imported-modules '((guix build python-build-system))
	#~(let ((python-phase (lambda (phase)
				(let ((phase-func (assq-ref python:%standard-phases phase)))
				  (cut phase-func #:use-setuptools? #t <...> )))))
	    (modify-phases %standard-phases
	      (add-before 'bootstrap 'set-version-string
		(lambda* (#:key version #:allow-other-keys)
		  (substitute* "bootstrap"
		    (("git describe --tags --always --dirty") #$(format #f "echo ~a" (package-version this-package))))))
	      (add-after
		  'unpack
		  'ensure-no-mtimes-pre-1980
		(python-phase 'ensure-no-mtimes-pre-1980))
	      (add-after
		  'ensure-no-mtimes-pre-1980
		  'enable-bytecode-determinism
		(python-phase 'enable-bytecode-determinism))
	      (add-after
		  'enable-bytecode-determinism
		  'ensure-no-cythonized-files
		(python-phase 'ensure-no-cythonized-files))
	      
	      (add-after
		  'build
		  'python:build
		(python-phase 'build))
	      (add-after
		  'python:build
		  'python:install
		(python-phase 'install))

	      (add-after
		  'python:install
		  'python:add-install-to-pythonpath
		(python-phase 'add-install-to-pythonpath))
	      (add-after
		  'python:add-install-to-pythonpath
		  'python:add-install-to-path
		(python-phase 'add-install-to-path))
	      (add-after
		  'python:add-install-to-path
		  'python:wrap
		(python-phase 'wrap))
	      (add-after
		  'python:wrap
		  'python:check
		(python-phase 'check))

	      ;; Directory excursion for python build/install steps
	      (add-before 'python:build 'python:chdir-down
		(lambda _ (chdir "tools")))
	      (add-after 'python:check 'python:chdir-up
		(lambda _ (chdir ".."))))))))
    (home-page "https://tpm2-software.github.io/")
    (synopsis "A PKCS#11 interface for TPM2 hardware")
    (description
     "PKCS #11 is a Public-Key Cryptography Standard that defines a standard
method to access cryptographic services from tokens/ devices such as
hardware security modules (HSM), smart cards, etc.  In this project we
intend to use a TPM2 device as the cryptographic token.")
    (license license:bsd-2)))

tpm2-pkcs11
