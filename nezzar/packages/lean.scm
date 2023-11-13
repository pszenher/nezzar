(define-module (nezzar packages lean)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix utils)

  #:use-module (guix build-system cmake)

  #:use-module (gnu packages base)

  #:use-module (gnu packages bash)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python)

  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages version-control))

(define-public lean4
  (package
    (name "lean4")
    (version "4.2.0")
    (home-page "https://lean-lang.org/")
    (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url"https://github.com/leanprover/lean4.git")
		    (commit (string-append "v" version))))
	      (file-name (git-file-name name version))
	      (sha256
	       (base32
		"144dxqljq6myg85xcyihlb9jqk4p0j4llpc74rgzwc4d50f2v9p7"))))
    (build-system cmake-build-system)
    (inputs
     (list bash-minimal gmp gcc))
    (native-inputs
     (list coreutils
	   ;; for tests:
	   git python perl))
    (arguments
     (list
      #:build-type "Release"
      #:make-flags #~(list (string-append
			    "LEAN_CC=" #$(file-append (assoc-ref inputs "gcc") "/bin/gcc" )))
      #:phases
      '(modify-phases %standard-phases
	 ;; FIXME:  somehow LEAN_CC is getting set to just "cc", breaking tests 1584, 1722
	 ;;         - 1584:leancomptest_foreign - actual cc issue... set LEAN_CC?
	 ;;         - 1722:leanlaketest_reverse-ffi  jk, src/lake/examples/reverse-ffi/Makefile hardcodes "cc"..., patch?
	 ;; FIXME:  "git" command is hardcoded in tests, add git native input?
	 ;;         - 1727:leanlaketest_clone   - src/lake/tests/clone
	 ;;         - 1728:leanlaketest_depTree - src/lake/tests/depTree
	 (add-after 'patch-source-shebangs 'patch-bash-paths
	   (lambda* (#:key inputs #:allow-other-keys)
	     (let ((bash (string-append (assoc-ref inputs "bash-minimal") "/bin/bash")))
	       (substitute* (find-files "." "\\.in$")
		 (("(= )/usr/bin/env bash" _ prefix) (string-append prefix bash)))))))))
    (synopsis "Lean 4 programming language and theorem prover")
    (description "Lean is a functional programming language that makes
it easy to write correct and maintainable code. You can also use Lean
as an interactive theorem prover. Lean programming primarily involves
defining types and functions. This allows your focus to remain on the
problem domain and manipulating its data, rather than the details of
programming.")
    (license license:asl2.0)))

lean4
