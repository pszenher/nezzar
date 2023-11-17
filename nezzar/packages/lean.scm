(define-module (nezzar packages lean)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix utils)

  #:use-module (guix build-system cmake)
  #:use-module (guix build-system emacs)

  #:use-module (gnu packages base)

  #:use-module (gnu packages bash)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python)

  #:use-module (gnu packages emacs-xyz)
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
      #:configure-flags
      #~(list
	 (string-append
	  "-D" "LEANC_CC=" #$(file-append (this-package-input "gcc") "/bin/gcc")))
      #:phases
      '(modify-phases %standard-phases
	 (add-after 'patch-source-shebangs 'patch-bash-paths
	   ;; heavy usage of /usr/bin/env bash in templated files,
	   ;; replace with absolute path to bash-minimal...
	   (lambda* (#:key inputs #:allow-other-keys)
	     (let ((bash (string-append (assoc-ref inputs "bash-minimal") "/bin/bash")))
	       (substitute* (find-files "." "\\.in$")
		 (("(= )/usr/bin/env bash" _ prefix) (string-append prefix bash))))))
	 (add-after 'patch-source-shebangs 'patch-test-1722-cc
	   ;; test 1722 hard-codes "cc" relative binary, replace with
	   ;; absolute path gcc...
	   (lambda* (#:key inputs #:allow-other-keys)
	     (let ((gcc (string-append (assoc-ref inputs "gcc") "/bin/gcc")))
	       (substitute* "src/lake/examples/reverse-ffi/Makefile"
		 (("^(\t)cc" _ prefix) (string-append prefix gcc))))))
	 (add-before 'check 'allow-parallel-tests
	   ;; Test job count doesn't respect -j flag passed to make
	   ;; directly, needs to be placed in ARGS env-var/argument...
	   (lambda* (#:key (tests? #t) (parallel-tests? #t) #:allow-other-keys)
	     (when (and tests? parallel-tests?)
	       (setenv "ARGS" (string-append 
			       "-j" (number->string
				     (parallel-job-count))))))))))
    (synopsis "Lean 4 programming language and theorem prover")
    (description "Lean is a functional programming language that makes
it easy to write correct and maintainable code. You can also use Lean
as an interactive theorem prover. Lean programming primarily involves
defining types and functions. This allows your focus to remain on the
problem domain and manipulating its data, rather than the details of
programming.")
    (license license:asl2.0)))

(define-public emacs-lean4-mode
  (let ((version "0")
	(revision "0")
	(commit "d1c936409ade7d93e67107243cbc0aa55cda7fd5"))
    (package
      (name "emacs-lean4-mode")
      (version (git-version version revision commit))
      (source
       (origin
	 (method git-fetch)
	 (uri (git-reference
	       (url "https://github.com/leanprover/lean4-mode.git")
	       (commit commit)))
	 (file-name (git-file-name name version))
	 (sha256
	  (base32
	   "1r2574fhay5sdy9biqhy908xk9ld1sfp6i9ax89c4z5qmnqmhgml"))))
      (build-system emacs-build-system)
      (arguments
       `(#:include (cons "^data/" %default-include)))
      (inputs
       (list lean4))
      (propagated-inputs
       (list emacs-f
	     emacs-s
	     emacs-flycheck
	     emacs-dash
	     emacs-magit
	     emacs-lsp-mode))
      (home-page "https://github.com/leanprover/lean4-mode")
      (synopsis "Emacs major mode for Lean 4")
      (description "Emacs major mode for Lean 4 programming language and theorem prover.")
      (license license:asl2.0))))

(list
 lean4
 emacs-lean4-mode)
