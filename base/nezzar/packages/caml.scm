(define-module (nezzar packages caml)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)

  #:use-module (gnu packages perl))

(define-public caml-light
  (package
    (name "caml-light")
    (version "7.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/camllight/camllight.git")
	     (commit "release76")))
       (modules '((guix build utils)))
       (snippet
	'(delete-file-recursively "windows"))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "1lhn71pvzq85wdazjmgqd62clq6vc32v8kkh92z04qs29vd9fjas"))))
    (build-system gnu-build-system)
    (native-inputs (list perl))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
	  (add-after 'unpack 'patch-makefile-paths
	    (lambda _
	      (substitute* "sources/src/Makefile"
		(("^(BINDIR=).*" _ pfx) (string-append pfx #$output "/bin"))
		(("^(LIBDIR=).*" _ pfx) (string-append pfx #$output "/lib"))
		(("^(MANDIR=).*" _ pfx) (string-append pfx #$output "/share/doc/man"))
		(("SHELL=/bin/sh") "")
		(("mkdir") "mkdir -p")
		(("(OPTS=)-fno-defer-pop -D__FAVOR_BSD" _ opts=)
		 (string-append
		  opts=
		  (string-join
		   '("-ansi"
		     "-Werror"
		     "-Wno-free-nonheap-object"
		     "-D_DEFAULT_SOURCE"
		     "-include" "stdlib.h"
		     "-include" "string.h"
		     "-include" "stdio.h"
		     "-include" "limits.h")
		   " "))))
	      (substitute* "sources/src/runtime/sys.c"
		;; Patch out usage of sys_nerr
		;; FIXME: this should be a real patchdiff...
		(("extern int sys_nerr;") "")
		(("extern char \\* sys_errlist \\[\\];") "")
		(("sys_nerr") "INT_MAX")
		(("sys_errlist\\[([a-z]*)\\];" _ errno)
		 (string-append "strerror(" errno ");")))

	      (substitute* (find-files "sources/src" "Makefile")
		(("CPP=/lib/cpp") "CPP=cpp"))))
	  (replace 'configure
	    (lambda* (#:key (make-flags '()) (parallel-build? #t) #:allow-other-keys)
	      (apply invoke "make"
		     `(,@(if parallel-build?
			     `("-j" ,(number->string (parallel-job-count)))
			     '())
		       ,@make-flags
		       "configure"))))
	  (replace 'build
	    (lambda* (#:key (make-flags '()) (parallel-build? #t) #:allow-other-keys)
	      (apply invoke "make"
		     `(,@(if parallel-build?
			     `("-j" ,(number->string (parallel-job-count)))
			     '())
		       ,@make-flags
		       "world"))))
	  (add-before 'install 'create-manual-dir
	    (lambda _
	      (mkdir-p (string-append #$output "/share/doc/man/man1")))))
      #:make-flags
      #~(list "-C" "sources/src")))
    (home-page "https://caml.inria.fr/caml-light/index.en.html")
    (synopsis "A lightweight, portable implementation of the core Caml language")
    (description " Caml Light is a lightweight, portable implementation of the core Caml
language that was developed in the early 1990's, as a precursor to
OCaml. It used to run on most Unix machines, as well as PC under
Microsoft Windows. The implementation is obsolete, no longer actively
maintained, and will be removed eventually. We recommend switching
immediately to its successor, OCaml.

Caml Light is implemented as a bytecode compiler, and fully
bootstrapped. The runtime system and bytecode interpreter is written
in standard C, hence Caml Light is easy to port to almost any 32 or 64
bit platform. The whole system is quite small: about 100K for the
runtime system, and another 100K of bytecode for the compiler. Two
megabytes of memory is enough to recompile the whole system.")
    (license
     (list
      license:qpl
      license:gpl2))))
