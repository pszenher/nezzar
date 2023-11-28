(define-module (nezzar packages lean)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix utils)

  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system gnu)

  #:use-module (gnu packages base)

  #:use-module (gnu packages bash)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages node)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python)

  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages version-control)

  #:use-module (gnu packages crates-io))

(define %lean4-libs-4.2.0
  ;; alist of '(name . (commit-hash . guix-hash))
  '((quote4
     "a387c0eb611857e2460cf97a8e861c944286e6b2" .
     "1j5s5d5hr19wrjl5ccjdapxz5myp9gawbz6ah4xagajqs3cya9gn")
    (lean-cli
     "39229f3630d734af7d9cfb5937ddc6b41d3aa6aa" .
     "1fwiwha9mz56cdb0n55mfv8wr24aj7sd6611iribmcb9r4nazxxv")
    (ProofWidgets4
     "f1a5c7808b001305ba07d8626f45ee054282f589" .
     "17p0sy495wpc3kqcnvngz25avbpxglhinwpgbsf68x2g2kqy8h27")
    (std4
     "6747f41f28627bed83e6d5891683538211caa2c1" .
     "1f29kqsgkgf4sqj3hj9613jgyh42vr5xjs2gcx2yxphwcjis9rzf")
    (aesop
     "6749fa4e776919514dae85bfc0ad62a511bc42a7" .
     "1h0i88ddcg1ylgrbvg3qd5fssi4392gb6jidb0vn391b9f0b7j4h")))

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
    (list bash-minimal gmp))
   ;; Propagate gcc, as leanc needs it available installed at runtime
   (propagated-inputs
    (list gcc))
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

(define-public lean4-std4
  (let* ((version "0")
	 (revision "0")
	 (commit (car (assoc-ref %lean4-libs-4.2.0 'std4)))
	 (hash   (cdr (assoc-ref %lean4-libs-4.2.0 'std4))))
    (package
     (name "lean4-std4")
     (version (git-version version revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/leanprover/std4.git")
	     (commit commit)))
       (file-name (git-file-name name version))
       (sha256
	(base32 hash))))
     (build-system gnu-build-system)
     (arguments
      `(#:test-target "test"
	#:phases
	(modify-phases %standard-phases
          (delete 'configure)
	  (replace 'install
	    (lambda* (#:key outputs #:allow-other-keys)
	      (copy-recursively
	       "build" (string-append
			(assoc-ref outputs "out") "/share/lean4")
	       #:keep-mtime? #t))))))
     (inputs (list lean4))
     (home-page "https://github.com/leanprover/std4")
     (synopsis "Standard Library for Lean 4")
     (description "Work in progress standard library for Lean 4. 
This is a collection of data structures and tactics intended for use
by both computer-science applications and mathematics applications of
Lean 4.")
     (license license:asl2.0))))

(define-public lean4-quote4
  (let* ((version "0")
	 (revision "0")
	 (commit (car (assoc-ref %lean4-libs-4.2.0 'quote4)))
	 (hash   (cdr (assoc-ref %lean4-libs-4.2.0 'quote4))))
    (package
     (name "lean4-quote4")
     (version (git-version version revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/leanprover-community/quote4.git")
	     (commit commit)))
       (file-name (git-file-name name version))
       (sha256
	(base32 hash))))
     (build-system copy-build-system)
     (arguments '(#:install-plan '(("." "share/lean4/quote4"))))
     (home-page "https://github.com/leanprover-community/quote4")
     (synopsis "Intuitive, type-safe expression quotations for Lean 4.")
     (description "Quote4 implements type-safe expression quotations, 
which are a particularly convenient way of constructing object-level
expressions (Expr) in meta-level code.  It combines the intuitiveness
of modal sequent calculus with the power and speed of Lean 4's
metaprogramming facilities.")
     (license license:asl2.0))))

(define-public lean4-cli
  (package
   (name "lean4-cli")
   (version "2.2.0-lv4.0.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
	   (url "https://github.com/leanprover/lean4-cli.git")
	   (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0wkmi7pcplfbmb20831yw7s5asqf7ggc6gvcxljzkm7fdkl2dasz"))))
   (build-system copy-build-system)
   (arguments '(#:install-plan '(("." "share/lean4/cli"))))
   (home-page "https://github.com/leanprover/lean4-cli")
   (synopsis "Command-Line Interface library for Lean 4")
   (description "A Lean 4 library for configuring Command Line Interfaces and parsing
command line arguments.")
   (license license:expat)))

(define-public lean4-proofwidgets4
  (package
   (name "lean4-proofwidgets4")
   (version "0.0.21")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
	   (url "https://github.com/leanprover-community/ProofWidgets4.git")
	   (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "17p0sy495wpc3kqcnvngz25avbpxglhinwpgbsf68x2g2kqy8h27"))))
   ;; (build-system copy-build-system)
   ;; (arguments '(#:install-plan '(("." "share/lean4/proofwidgets4"))))
   (build-system gnu-build-system)
   (arguments
    `(#:phases (modify-phases %standard-phases
	           (delete 'configure)
		   (add-before 'build 'purge-lakefile-requires
		       (lambda _
			 (substitute* "lakefile.lean"
			   (("^require [a-Z]* from git .*$") ""))))
		   (replace 'build (lambda _ (invoke "lake" "build")))
		   (delete 'check)
		   (replace 'install
			    (lambda* (#:key outputs #:allow-other-keys)
			      (copy-recursively
			       "build" (string-append
					(assoc-ref outputs "out") "/share/lean4")
			       #:keep-mtime? #t))))))
   (inputs (list lean4 lean4-std4))
   (native-inputs (list node))
   (home-page "https://github.com/leanprover-community/ProofWidgets4")
   (synopsis "Helper toolkit for creating your own Lean 4 UserWidgets")
   (description "ProofWidgets is a library of user interface components
 for Lean 4.  It supports symbolic visualizations of mathematical
objects and data structures, data visualization, interfaces for
tactics and tactic modes, alternative and domain-specific goal state
displays, and user interfaces for entering expressions and editing
proofs.")
   (license license:asl2.0)))

(define-public lean4-aesop
  (package
   (name "lean4-aesop")
   (version "4.2.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
	   (url "https://github.com/leanprover-community/aesop.git")
	   (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "17hq7953zfbngkqw84g795hm2309y0vbcvk1scr493lz92dpks24"))))
   (build-system copy-build-system)
   (arguments '(#:install-plan '(("." "share/lean4/aesop"))))
   (home-page "https://github.com/leanprover-community/aesop")
   (synopsis "White-box automation for Lean 4")
   (description "Aesop (Automated Extensible Search for Obvious Proofs) is a proof
search tactic for Lean 4. It is broadly similar to Isabelle's @code{auto}.")
   (license license:asl2.0)))

(define-public lean4-mathlib4
  (package
   (name "lean4-mathlib4")
   (version (package-version lean4))
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
	   (url "https://github.com/leanprover-community/mathlib4.git")
	   (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "13k0l9rfv5ijx8s6cs2cg84709x0fbfsm4r6q2g710zn5hdhvkia"))))
   ;; FIXME: some kind of 'lake-build-system' would go very nicely here...
   (build-system gnu-build-system)
   (native-inputs
    (list lean4
	  lean4-std4
	  lean4-quote4
	  lean4-cli
	  lean4-proofwidgets4
	  lean4-aesop))
   (arguments
    `(#:phases
      (modify-phases
       %standard-phases
       (delete 'configure)
       (add-after 'unpack 'patch-lake-dependencies
		  (lambda* (#:key inputs #:allow-other-keys)
		    (define (quote-wrap . str) (string-append "\"" (string-join str "/") "\""))
		    (begin
		      (delete-file "lake-manifest.json")
		      (mkdir "lake-packages")
		      (for-each (lambda (l) (copy-recursively (cadr l) (string-append "./lake-packages/" (car l))))
				`(("std"          ,(string-append (assoc-ref inputs "lean4-std4")   "/share/lean4/std4"))
				  ("Qq"        ,(string-append (assoc-ref inputs "lean4-quote4") "/share/lean4/quote4"))
				  ("aesop"         ,(string-append (assoc-ref inputs "lean4-aesop")  "/share/lean4/aesop"))
				  ("Cli"           ,(string-append (assoc-ref inputs "lean4-cli")    "/share/lean4/cli"))
				  ("proofwidgets" ,(string-append (assoc-ref inputs "lean4-proofwidgets4") "/share/lean4/proofwidgets4"))))
		      (substitute* "lakefile.lean"
				   (("^require ([a-Z]*) from git .*$" _ package)
				    (string-join
				     (list "require" package "from"
					   (quote-wrap
					    (string-append
					     "./lake-packages/" package)) "\n")))
				   ;; (("^(require Qq from )git .*$" _ prefix)
				   ;;  (string-append prefix (quote-wrap (assoc-ref inputs "lean4-quote4") "share/lean4/quote4") "\n"))
				   ;; (("^(require aesop from )git .*$" _ prefix)
				   ;;  (string-append prefix (quote-wrap (assoc-ref inputs "lean4-aesop") "share/lean4/aesop") "\n"))
				   ;; (("^(require Cli from )git .*$" _ prefix)
				   ;;  (string-append prefix (quote-wrap (assoc-ref inputs "lean4-cli") "share/lean4/cli") "\n"))
				   ;; (("^(require proofwidgets from )git .*$" _ prefix)
				   ;;  (string-append prefix (quote-wrap (assoc-ref inputs "lean4-proofwidgets4") "share/lean4/proofwidgets4") "\n"))
				   )
		      (invoke "cat" "lakefile.lean")
		      (invoke "lake" "update")))))))
   (home-page "https://leanprover-community.github.io/")
   (synopsis "The math library of Lean 4")
   (description "Mathlib is a user maintained library for the Lean theorem
 prover. It contains both programming infrastructure and mathematics,
as well as tactics that use the former and allow to develop the
latter.")
   (license license:asl2.0)))

;;; FIXME: handle nested cargo deps in "src/{elan-dist, elan-utils, download}"
(define-public elan
  (package
   (name "elan")
   (version "3.0.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
	   (url "https://github.com/leanprover/elan.git")
	   (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0w60cd458224lhckq02h8llfwg3rmdrvym7jm7sicahn1b089c2n"))))
   (build-system cargo-build-system)
   (arguments
    `( ;; The test suite is disabled as the internal 'cargo-test-macro' and
      ;; 'cargo-test-support' crates are not included in the release.
      #:cargo-inputs
      (	;; ("rust-anyhow" ,rust-anyhow-1)
       ;; ("rust-base64" ,rust-base64-0.13)
       ;; ("rust-bytesize" ,rust-bytesize-1)
       ;; ("rust-cargo-platform" ,rust-cargo-platform-0.1)
       ;; ("rust-cargo-util" ,rust-cargo-util-0.2)
       ("rust-clap" ,rust-clap-4)
       ("rust-error-chain" ,rust-error-chain-0.12)
       ("rust-flate2" ,rust-flate2-1)
       ("rust-itertools" ,rust-itertools-0.10)
       ("rust-json" ,rust-json-0.12)
       ("rust-libc" ,rust-libc-0.2)
       ;; ("rust-markdown" ,rust-markdown-0.3)
       ("rust-rand" ,rust-rand-0.8)
       ("rust-regex" ,rust-regex-1)
       ("rust-remove-dir-all" ,rust-remove-dir-all-0.8)
       ("rust-same-file" ,rust-same-file-1)
       ("rust-scopeguard" ,rust-scopeguard-1)
       ("rust-serde" ,rust-serde-1)
       ("rust-serde-derive" ,rust-serde-derive-1)
       ("rust-serde-json" ,rust-serde-json-1)
       ("rust-sha2" ,rust-sha2-0.10)
       ("rust-tar" ,rust-tar-0.4)
       ("rust-tempfile" ,rust-tempfile-3)
       ("rust-term" ,rust-term-0.7)
       ("rust-time" ,rust-time-0.3)
       ("rust-toml" ,rust-toml-0.7)
       ("rust-url" ,rust-url-2)
       ("rust-wait-timeout" ,rust-wait-timeout-0.2)
       ("rust-zip" ,rust-zip-0.6))))
   (home-page "https://github.com/leanprover/elan")
   (synopsis "A Lean version manager")
   (description "elan is a small tool for managing your installations
 of the Lean theorem prover. It places lean and lake binaries in your
PATH that automatically select and, if necessary, download the Lean
version described in your project's lean-toolchain file. You can also
install, select, run, and uninstall Lean versions manually using the
commands of the elan executable.")
   (license (list license:asl2.0 license:expat))))

lean4-mathlib4
