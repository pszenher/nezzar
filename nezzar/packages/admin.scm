(define-module (nezzar packages admin)
  #:use-module (guix packages)
  #:use-module (nezzar packages)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((gnu packages) #:hide (search-patches))
  #:use-module (gnu packages linux)
  #:use-module (gnu packages perl))

(define-public pam-rundir
  (package
    (name "pam-rundir")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://jjacky.com/pam_rundir/"
			   "pam_rundir-" version ".tar.gz"))
       (patches
	(search-patches "pam-rundir-use-prctl-to-bypass-perms-check-on-mkdir.patch"
			"pam-rundir-fix-equal-bug-pr5.patch"
			"pam-rundir-fix-group-of-user-dir.patch"
			"pam-rundir-configure-default-to-run-user.patch"))
       (sha256
	(base32
	 "0860phkpmy25xvx3hqf9ydbyjprrxmkpyyx8vcxplxr3xncvcyf7"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f				; no check target
       #:phases
       (modify-phases %standard-phases
	 (replace 'configure
	   (lambda* (#:key outputs #:allow-other-keys)
	     (let ((out (assoc-ref outputs "out")))
               (setenv "CC" ,(cc-for-target))
	       (setenv "DESTDIR" out)
	       (invoke "./configure")))))))
    (inputs `(,linux-pam))
    (native-inputs `(,perl))		;for pod2man
    (home-page "https://jjacky.com/pam_rundir/")
    (synopsis "Create/destroy user runtime directory on login")
    (description "pam_rundir is a PAM module that can be used to provide user runtime directory, as described in the XDG Base Directory Specification.

The directory will be created on login (open session) and removed on
logout (close session), and its full path made available in an
environment variable, usually $XDG_RUNTIME_DIR.")
    (license license:gpl2+)))
