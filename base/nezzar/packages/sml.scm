(define-module (nezzar packages sml)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages sml)

  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages perl))

(define-public polyml-5.9.1
  (package/inherit
      polyml
    (version "5.9.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/polyml/polyml.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name (package-name polyml) version))
              (sha256
               (base32
                "1s7lpnxg826r2lm2c81j9a61zwljy2ybkqwadjiwrfi0hmbczn89"))))
    (inputs (cons `("bash-minimal" ,bash-minimal) (package-inputs polyml)))
    (native-inputs (list autoconf-2.71 automake libtool))
    (arguments
     (substitute-keyword-arguments (package-arguments polyml)
       ((#:phases phases)
	`(modify-phases ,phases
	   ;; NOTE: remove prebuilt configure file, force rebootstrap
	   ;;       using autotools/automake
	   (add-after 'unpack 'remove-prebuilt-configure
      	     (lambda _ (delete-file "configure")))
	   ;; NOTE: Replace hardpath "/bin/sh" as hard-coded shell
	   ;;       binary path for `OS.Process.system` invocation
	   (add-before 'configure 'patch-Process.system-/bin/sh
	     (lambda* (#:key inputs #:allow-other-keys)
	       (substitute* "libpolyml/process_env.cpp"
		 (("\"/bin/sh\"")
		  (string-append "\"" (assoc-ref inputs "bash-minimal") "/bin/sh" "\"")))))))))))

(define-public mlton
  (package
    (name "mlton")
    (version "20240809")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/MLton/mlton.git")
	     (commit "680bfcc6d6d8df3e51220fd88d297830316b89b4")))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "066r2v4frq5460y17k1hgyl0g37xkzsn0m6vjsdiwncx1iyrmqg7"))))
    (build-system gnu-build-system)
    (inputs
     (list gmp))
    (native-inputs
     (list polyml-5.9.1))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
	  (delete 'configure)
	  (delete 'bootstrap)
	  (add-before 'build 'bootstrap-mlton
	    (lambda* (#:key make-flags parallel-build?
                      #:allow-other-keys)
	      (apply invoke "make"
		     `(,@(if parallel-build?
			     `("-j" ,(number->string (parallel-job-count)))
			     '())
		       ,@make-flags
		       "polyml-mlton"))))
	  (replace 'build
	    (lambda* (#:key (make-flags '()) (parallel-build? #t)
                      #:allow-other-keys)
	      (let ((gnu:build (assoc-ref %standard-phases 'build))
		    (mlton.old (string-append
				(getcwd) "/build/bin/mlton.polyml")))
		(gnu:build
		 #:parallel-build? parallel-build?
		 #:make-flags
		 (append
		  make-flags
		  (list (string-append "OLD_MLTON=" mlton.old))))))))
      #:make-flags
      #~(list
	 (string-append "MLTON_VERSION=" #$version)
	 "BOOTSTRAP_STYLE=3"
	 "CC=gcc"
	 (string-append "WITH_GMP_DIR=" #$gmp)
	 (string-append "PREFIX=" #$output)
	 "CHECK_ARGS=-short")))
    (home-page "http://mlton.org/")
    (synopsis "A whole-program optimizing compiler for the Standard ML programming language")
    (description "MLton is a whole-program optimizing compiler for the Standard ML
programming language. MLton generates small executables with excellent
runtime performance, utilizing untagged and unboxed native integers,
reals, and words, unboxed native arrays, fast arbitrary-precision
arithmetic based on GMP, and multiple code generation and garbage
collection strategies. In addition, MLton provides a feature rich
Standard ML programming environment, with full support for SML97 as
given in The Definition of Standard ML (Revised), a number of useful
language extensions, a complete implementation of the Standard ML
Basis Library, various useful libraries, a simple and fast C foreign
function interface, the ML Basis system for programming with source
libraries, and tools such as a lexer generator, a parser generator,
and a profiler.")
    (license license:hpnd)))

(define-public mosml
  (package
    (name "mosml")
    (version "2.10.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/kfl/mosml.git")
	     (commit (string-append "ver-" version))))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "1jiyvdm8bxbfz6l6m1svwi7md5gzp0y5mx4p1dldhd1vyddgvb8q"))))
    (build-system gnu-build-system)
    (inputs (list gmp))
    (native-inputs (list perl))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
	  (delete 'configure)
	  (add-after 'unpack 'patch-makefile-prefix
	    (lambda _
	      (substitute* "src/Makefile.inc"
		(("^(PREFIX=)/usr/local" _ pfx)
		 (string-append pfx #$output))
		(("SHELL=/bin/sh") "")))))
      #:make-flags
      #~(list "-C" "src")))
    (home-page "http://mosml.org/")
    (synopsis "A light-weight implementation of Standard ML (SML), a strict
functional language widely used in teaching and research.")
    (description "Moscow ML is a light-weight implementation of Standard ML (SML), a
strict functional language widely used in teaching and research.")
    (license
     (list
      license:gpl2+
      license:gpl2
      license:qpl
      (license:fsf-free
       "https://www.smlnj.org/license.html"
       "https://www.gnu.org/licenses/license-list#StandardMLofNJ")))))

