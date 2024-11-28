(define-module (nezzar packages idris)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)

  #:use-module ((guix licenses) #:prefix license:)

  #:use-module (gnu packages idris)
  #:use-module (gnu packages chez)
  #:use-module (gnu packages multiprecision))

(define idris2-bootstrap
  (package
    (name "idris2-bootstrap")
    ;; FIXME: autoderive from commit handler
    (version "0fb1192")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/edwinb/Idris2-boot.git")
	     (commit "0fb1192cd30ec4747cbc727f26ddbfad515d1363")))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "1f0b2mb7xahc4mrhbw8vp5b6iv3ci1z7yz7h12i8mnmy3nddpsfn"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
	  (delete 'configure)
	  ;; (add-before 'build 'set-prefix
	  ;;   (lambda _ (setenv "PREFIX" #$output)))
	  ;; (add-after 'unpack 'fix-idris2-fromc-target
	  ;;   (lambda _
	  ;;     (substitute* "Makefile"
	  ;; 	;; (("(idris) (--build idris2.ipkg)" _ cmd args)
	  ;; 	;;  (string-append
		  
	  ;; 	;;   "\n"
	  ;; 	;;   cmd " --V2 " args))
	  ;; 	;; (("^idris2-fromc:" tgt:)
	  ;; 	;;  (string-append tgt: " dist/idris2.c"))
	  ;; 	;; (("^prelude:" tgt:)
	  ;; 	;;  (string-append tgt: " idris2boot"))
	  ;; 	)))
	  (add-before 'build 'make-idris2.c
	    (lambda* (#:key (make-flags '()) #:allow-other-keys)
	      (apply invoke "make" "dist/idris2.c" make-flags)))
	  (add-before 'build 'bootstrap-from-c
	    (lambda* (#:key (make-flags '()) #:allow-other-keys)
	      (apply invoke "make" "idris2-fromc" make-flags)))
	  (replace 'build
	    (lambda* (#:key (make-flags '()) #:allow-other-keys)
	      (apply invoke "make" "libs" make-flags)))
	  (replace 'install
	    (lambda* (#:key (make-flags '()) #:allow-other-keys)
	      (apply invoke "make" "install-all" make-flags))))
      #:make-flags
      #~(list
	 "CC=gcc"
	 (string-append "PREFIX=" #$output))
      #:test-target "test"
      #:parallel-build? #f))
    (inputs
     (list idris
	   chez-scheme
	   gmp))
    (home-page "https://www.idris-lang.org/index.html")
    (synopsis "Idris is a programming language designed to encourage Type-Driven
Development.")
    (description "In type-driven development, types are tools for constructing
programs. We treat the type as the plan for a program, and use the
compiler and type checker as our assistant, guiding us to a complete
program that satisfies the type. The more expressive the type is that
we give up front, the more confidence we can have that the resulting
program will be correct.")
    (license license:asl2.0)))

idris2-bootstrap
