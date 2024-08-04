(define-module (nezzar packages spin)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)

  #:use-module (gnu packages bison)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages tcl))

(define-public spin
  (package
    (name "spin")
    (version "6.5.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/nimble-code/Spin.git")
	     (commit (string-append "version-" version))))
       (file-name (git-file-name name version))
       (modules '((guix build utils)))
       (snippet '(delete-file-recursively "Bin"))
       (sha256
	(base32
	 "0mf8bisl27dysnfhy9nmhnrk6bw3cx9zsv8nf1r982fry1fx1fvn"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "CC=" #$(cc-for-target))
              (string-append "DESTDIR=" #$output)
	      (string-append "INSTALL=" "install -D")
	      ;; Use "PICKY" flags from Src/makefile for C compiler
	      (string-append
	       "CFLAGS=" (string-join
			  '("-std=c99"
			    "-pedantic"
			    "-fno-strength-reduce"
			    "-fno-builtin"
			    "-W"
			    "-Wstrict-prototypes"
			    "-Wshadow"
			    "-Wpointer-arith"
			    "-Wcast-qual"
			    "-Winline"
			    "-Wall"))))
      #:phases
      #~(modify-phases %standard-phases
	  (delete 'configure)
	  (add-after 'install 'install-ispin-gui
	    (lambda* (#:key inputs #:allow-other-keys)
	      (let ((ispin-src "optional_gui/ispin.tcl")
		    (ispin-bin (string-append #$output "/bin/ispin"))
		    (wish-bin  (string-append (assoc-ref inputs "tk") "/bin/wish")))
		(begin
		  (substitute* ispin-src
		    (("(exec) wish \"\\$0\"" _ exec)
		     (string-join
		      (list exec wish-bin ispin-bin))))
		  (copy-file ispin-src ispin-bin))))))))
    (native-inputs (list bison))
    (inputs (list tk gcc graphviz))
    (home-page "https://spinroot.com/spin/whatispin.html")
    (synopsis "Explicit state logic model checking tool")
    (description "Spin is an open-source software verification tool that was originally
developed (starting in 1980) in the Computing Science Research Center
of Bell Labs (the Unix group). It is often considered the most widely
used formal verification tool.")
    (license license:bsd-3)))
