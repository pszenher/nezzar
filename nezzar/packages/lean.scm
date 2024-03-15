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
    (version "4.6.1")
    (home-page "https://lean-lang.org/")
    (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url"https://github.com/leanprover/lean4.git")
		    (commit (string-append "v" version))))
	      (file-name (git-file-name name version))
	      (sha256
	       (base32
		"110fdd0swlwswhzx18knn8jaz7xa7lc0p71cf8vci88j7h08cjn1"))))
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
	   ;; heavy usage of "/usr/bin/env bash" as command in
	   ;; templated files, replace with absolute path to
	   ;; bash-minimal...
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
         (add-after 'patch-source-shebangs 'patch-test-1800-leanlaketest_init
	   ;; test 1800 attempts to `curl` lean-toolchain file from mathlib master branch...
           ;; stub out the test (it is only testing the `math` template for `lake init`
	   (lambda* _
	     (substitute* "src/lake/tests/init/test.sh"
	       (("^.LAKE new qed math"         str)            (string-append "###STUB### " str))
               (("^sed_i .* qed/lakefile.lean" str)            (string-append "###STUB### " str))
               (("^.LAKE -d qed build Qed"     str)            (string-append "###STUB### " str))
               (("^test -f qed/.lake/build/lib/Qed.olean" str) (string-append "###STUB### " str)))));
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
	(commit "f1f24c15134dee3754b82c9d9924866fe6bc6b9f"))
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
	   "0gd7hd22b85z5lhd3qza531fc8cf9dngvlngym5a4d0bd4vljgxr"))))
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

emacs-lean4-mode
