(define-module (nezzar packages linux)
  #:use-module (ice-9 match)

  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)

  #:use-module (gnu packages admin)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages file)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages sqlite))

(define-public util-linux-2.40
  (package
    (name "util-linux")
    (version "2.40.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kernel.org/linux/utils/"
                                  "util-linux/v" (version-major+minor version) "/"
                                  "util-linux-" version ".tar.xz"))
              (sha256
               (base32
		"1cz8r1kjnaiv40l6dzfaqg9lxlrkdcdb1prvvw7df8jrdyk3g2yp"))
              ;; (patches (search-patches "util-linux-tests.patch"))
              (modules '((guix build utils)))
              (snippet
               ;; We take 'nologin' from Shadow, the 'logger' program from
               ;; GNU Inetutils and 'kill' from GNU Coreutils.
               '(begin
                  (substitute* "configure"
                    (("build_nologin=yes") "build_nologin=no")
                    (("build_logger=yes") "build_logger=no")
                    (("build_kill=yes") "build_kill=no"))
                  #t))))
    (build-system gnu-build-system)
    (outputs '("out"	;6.4 MiB executables and documentation
               "lib"	;8.8 MiB shared libraries, headers and locales
               "static"))		;2.9 MiB static .a libraries
    (arguments
     (list #:configure-flags
           #~(list "--disable-use-tty-group"
                   (string-append
                    "--enable-fs-paths-default="
                    (string-join
                     '("/run/setuid-programs"
                       "/run/current-system/profile/sbin")
                     ":"))

                   ;; Don't try to chown root:root mount and umount
                   "--disable-makeinstall-chown"

                   "--localstatedir=/var"

                   (string-append "--localedir=" #$output:lib "/share/locale")
                   ;; Install completions where our bash-completion package
                   ;; expects them.
                   (string-append
                    "--with-bashcompletiondir=" #$output "/etc/bash_completion.d"))

           #:make-flags
           #~(list
	      ;; Allow tests to run in parallel
	      (let ((dquote-wrap (lambda (str)
				   (string-append "\"" str "\""))))
		(string-append
		 "TS_OPTS=" (dquote-wrap
			     (string-append
                              "--parallel=" (number->string (parallel-job-count))))))

              ;; Flag known-broken tests (need files not in the buildroot)
	      ;;   - These tests will still be run, failure will be
	      ;;     noted in output, but they will not cause the test
	      ;;     suite to return failure
              #$@(map (match-lambda
			((testdir testscript mode)
			 (string-append
			  "TS_OPT_"
			  testdir
			  (if testscript (string-append "_" testscript) "")
			  "_"
			  mode
			  "=yes")))
                      '(("lsblk"  "lsblk"             "known_fail" )
			("misc"   "enosys"            "known_fail")
			("lsns"   "ioctl_ns"          "known_fail")
			;; The setarch tests are unreliable in QEMU's user-mode
			;; emulation, which is our primary method of building
			;; ARMv7 packages.  See
			;; <https://github.com/karelzak/util-linux/issues/601>.
			("misc"   "setarch"           "known_fail")
			("lsfd"   #f                  "known_fail")
			("column" #f                  "known_fail"))))

           ;; FIXME: For now we cannot reliably run tests on GNU/Hurd:
           ;; <https://bugs.gnu.org/47791>.
           #:tests? (and (not (%current-target-system))
                         (not (string-suffix? "-gnu" (%current-system))))

           #:phases
           #~(modify-phases %standard-phases
               (add-before 'configure 'patch-build-scripts
                 (lambda _
                   (substitute* "configure"
                     ;; The build system assumes that we want to install
                     ;; libraries below $exec_prefix when $libdir does not
                     ;; match any of the "usual" locations.  Fix that.
                     (("usrlib_execdir='\\$\\{exec_prefix\\}'\\$libdir")
                      "usrlib_execdir=$libdir"))))
               (add-before 'build 'set-umount-file-name
                 (lambda _
                   ;; Tell 'eject' the right file name of 'umount'.
                   (substitute* "sys-utils/eject.c"
                     (("\"/bin/umount\"")
                      (string-append "\"" #$output "/bin/umount\"")))))
               (add-before 'check 'pre-check
                 (lambda* (#:key native-inputs inputs #:allow-other-keys)
                   (let ((services (search-input-file (or native-inputs inputs)
                                                      "etc/services")))
                     ;; Change the test to refer to the right file.
                     (substitute* "tests/ts/misc/mcookie"
                       (("/etc/services") services)))))
               (add-after 'install 'move-static-libraries
                 (lambda _
                   (let ((lib    #$output:lib)
                         (static #$output:static))

                     ;; Move static libraries to the "static" output.
                     (mkdir-p (string-append static "/lib"))
                     (with-directory-excursion lib
                       (for-each (lambda (file)
                                   (rename-file file
						(string-append static "/"
                                                               file)))
                                 (find-files "lib" "\\.a$"))

                       ;; Remove references to the static library from the '.la'
                       ;; files so that Libtool does the right thing when both
                       ;; the shared and static library is available.
                       (substitute* (find-files "lib" "\\.la$")
                         (("old_library=.*") "old_library=''\n"))))))
               (add-after 'install 'adjust-pkg-config-files
                 (lambda _
                   ;; Drop the unused "prefix=" and "exec_prefix=" variables from
                   ;; the pkg-config files to avoid a cyclic reference on "out".
                   (substitute* (find-files (string-append #$output:lib
                                                           "/lib/pkgconfig")
                                            "\\.pc$")
                     (("^(exec_)?prefix=.*") "")))))))
    (inputs
     (list file				;for libmagic
           ncurses
           sqlite
           zlib))
    (native-inputs
     (list net-base			;for tests
           perl))
    (home-page "https://www.kernel.org/pub/linux/utils/util-linux/")
    (synopsis "Collection of utilities for the Linux kernel")
    (description "Util-linux is a diverse collection of Linux kernel
utilities.  It provides dmesg and includes tools for working with file systems,
block devices, UUIDs, TTYs, and many other tools.")

    (properties '((upstream-name . "util-linux")))
    ;; Note that util-linux doesn't use the same license for all the
    ;; code.  GPLv2+ is the default license for a code without an
    ;; explicitly defined license.
    (license (list license:gpl3+ license:gpl2+ license:gpl2 license:lgpl2.0+
                   license:bsd-4 license:public-domain))))
