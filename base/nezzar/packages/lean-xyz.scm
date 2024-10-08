(define-module (nezzar packages lean-xyz)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)

  #:use-module (guix build-system emacs)
  #:use-module (nezzar build-system lake)

  #:use-module (gnu packages gcc)
  #:use-module (gnu packages node)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (nezzar packages lean)

  #:export (lake-cloudrelease-origin))


;;; ================================================================
;;; | Lake Cloud Release Helpers
;;; ================================================================

(define (lake-cloudrelease-filename name version build-archive)
  (string-append
   name "-" version "-" "cloudrelease" "-" build-archive))

(define (lake-cloudrelease-url scope name version build-archive)
  (string-append
   "https://github.com/" scope "/" name "/releases/download/" version "/" build-archive))

(define* (lake-cloudrelease-origin #:key scope name version build-archive hash)
  (origin
    (method url-fetch)
    (uri       (lake-cloudrelease-url scope name version build-archive))
    (file-name (lake-cloudrelease-filename name version build-archive))
    (sha256
     (base32 hash))))


;;; ================================================================
;;; | Lean IDE Integration Packages
;;; ================================================================

(define-public emacs-lean4-mode
  (let ((version "0")
	(revision "0")
	(commit "da7b63d854d010d621e2c82a53d6ae2d94dd53b0"))
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
	   "1va1ini3cbsmdrbab17kiwbn2h6b0jc8lb3vabmmazsrq0hhk8sk"))))
      (build-system emacs-build-system)
      (arguments
       `(#:include (cons "^data/" %default-include)))
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


;;; ================================================================
;;; | Lean Lake Packages
;;; ================================================================

(define-public lean-cli
  (let ((version "2.2.0")
	(revision "lv4.9.0")
	(commit "2cf1030dc2ae6b3632c84a09350b675ef3e347d0"))
    (package
      (name "lean-cli")
      (version (git-version version revision commit))
      (home-page "https://github.com/leanprover/lean4-cli")
      (source
       (origin
	 (method git-fetch)
	 (uri (git-reference
	       (url "https://github.com/leanprover/lean4-cli.git")
	       (commit commit)))
	 (file-name (git-file-name name version))
	 (sha256
	  (base32
	   "07j9rr6w1q82cmwd48fjkylg40rjz5i0d6fpfng54dhiffa5afn9"))))
      (build-system lake-build-system)
      (arguments
       '(#:build-targets '("Cli:leanArts"
			   "Cli:static"
			   "Cli:shared")))
      (synopsis "A Lean 4 library for configuring Command Line Interfaces and parsing command line arguments.")
      (description #f)
      (license license:expat))))

(define-public lean-md4lean
  (let ((version "0")
	(revision "0")
	(commit "5e95f4776be5e048364f325c7e9d619bb56fb005"))
    (package
      (name "lean-md4lean")
      (version (git-version version revision commit))
      (home-page "https://reservoir.lean-lang.org/@acmepjz/MD4Lean")
      (source
       (origin
	 (method git-fetch)
	 (uri (git-reference
	       (url "https://github.com/acmepjz/md4lean.git")
	       (commit commit)))
	 (file-name (git-file-name name version))
	 (sha256
	  (base32 "0f3pf68ffrfr7l4my3raf4vhqwj86vyrfcj6sgkgb5fcwh9aypll"))))
      (build-system lake-build-system)
      (arguments
       (list
	#:build-targets
	#~'("MD4Lean:leanArts"
	    "MD4Lean:static"
	    "MD4Lean:shared"
	    "MD4Lean/md4c")
	 #:phases
	 #~(modify-phases %standard-phases
	     (add-before 'build 'set-cc
	       ;; 
	       ;; FIXME: we should be able to directly set this var to
	       ;;        gcc's path by setting the `LEAN_CC' env-var,
	       ;;        but it doesn't seem to be respected?
	       ;;
	       ;;        Would be something like this:
	       ;;          (setenv "LEAN_CC" #$(file-append gcc-12 "/bin/gcc"))
	       ;; 
               (lambda _
		 ;; 
		 ;; NOTE: add a tmpdir to path containing a symlink
		 ;;       from `tmpbin/cc' --> (#$gcc ++ "/bin/gcc"), as
		 ;;       `getLeanCc' expects to find it via path
		 ;; 
		 (let ((tmpbin  (tmpnam))
                       (curpath (getenv "PATH")))
		   (mkdir-p tmpbin)
		   (symlink #$(file-append gcc-12 "/bin/gcc") (string-append tmpbin "/cc"))
		   (setenv "PATH" (string-append tmpbin ":" curpath))))))))
      (synopsis "Lean wrapper for the MD4C Markdown parser")
      (description "A Lean wrapper for the MD4C Markdown parser, to be used in doc-gen4,
replacing CMark.lean.")
      (license license:expat))))

(define-public lean-unicode-basic
  (package
    (name "lean-unicode-basic")
    (version "1.0.0")
    (home-page "https://reservoir.lean-lang.org/@fgdorais/UnicodeBasic")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/fgdorais/lean4-unicode-basic.git")
	     (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
	(base32 "01sfdz7y1vd5f0dx7h51647z1ahp5qdgbn2shf9gqk743qxfwwz7"))))
    (build-system lake-build-system)
    (synopsis "Basic Unicode support for Lean 4")
    (description "Unicode support for Lean 4")
    (license
     (list license:asl2.0
	   license:unicode))))

(define-public lean-bibtex-query
  (let ((version "0")
	(revision "0")
	;; NOTE: this is one commit after the version requested in
	;;       doc-gen4's `v4.10.0' tag, which adapts to
	;;       UnicodeBasic's `v1.0.0' release API.
	(commit "cdaba5f463ac6cd8617802c4feec509a9e79573d"))
    (package
      (name "lean-bibtex-query")
      (version (git-version version revision commit))
      (home-page "https://reservoir.lean-lang.org/@dupuisf/BibtexQuery")
      (source
       (origin
	 (method git-fetch)
	 (uri (git-reference
	       (url "https://github.com/dupuisf/BibtexQuery.git")
	       (commit commit)))
	 (file-name (git-file-name name version))
	 (sha256
	  (base32 "0fqfzd5lx3jqdrkx75ygd1p9214jyaml23jlh5zcyzyg4vqnk5gw"))))
      (build-system lake-build-system)
      (inputs
       (list `("lean-/UnicodeBasic" ,lean-unicode-basic)))
      (synopsis "A simple command-line bibtex query utility written in Lean 4")
      (description "BibtexQuery is a command-line utility that reads in a bibtex file and
performs simple queries.  BibtexQuery reads in a bibtex file, and
returns the entries that match all the queries given as command-line
parameters.")
      (license license:asl2.0))))

(define-public lean-doc-gen4
  (package
    (name "lean-doc-gen4")
    (version "4.10.0")
    (home-page
     "https://reservoir.lean-lang.org/@leanprover/doc-gen4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/leanprover/doc-gen4.git")
	     (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "1j8nkm4m0mw90gdza8h4nlr7mcwn8ccwl012hvrpv96hnga36f6h"))))
    (build-system lake-build-system)
    (inputs
     `(("lean-/MD4Lean"      ,lean-md4lean)
       ("lean-/UnicodeBasic" ,lean-unicode-basic)
       ("lean-/BibtexQuery"  ,lean-bibtex-query)
       ("lean-/Cli"          ,lean-cli)))
    (arguments
     (list
      #:build-targets
      #~'("doc-gen4"
	  "DocGen4:leanArts"
	  "DocGen4:static"
	  "DocGen4:shared"

	  ;; Documentation targets
	  "DocGen4:docs"
	  "DocGen4:docsHeader"

	  ;; Documentation for dependency packages
	  "Cli:docs"
	  "MD4Lean:docs"
	  "UnicodeBasic:docs"
	  "BibtexQuery:docs")
      #:phases
      #~(modify-phases %standard-phases
	  (add-before 'build 'disable-core-docs-build
	    (lambda _
	      (let ((repstr "let coreJob : BuildJob FilePath := default"))
		(substitute* "lakefile.lean"
		  (("let coreJob ← coreDocs.fetch" str)
		   (format #t "Replacing `~a' ==> `~a'~%" str repstr)
		   repstr)))))
	  (add-before 'build 'set-DOCGEN_SRC
            (lambda _
	      ;; 
	      ;; NOTE: cannot use default here ("github"), as it
	      ;;       expects to be working within a git checkout
	      ;;       with a readable `.git' directory at its root
	      ;; 
	      (setenv "DOCGEN_SRC" "file"))))))
    (synopsis "Document Generator for Lean 4")
    (description "Document Generator for Lean 4.")
    (license license:asl2.0)))

(define-public lean-qq
  (let ((version "0")
	(revision "0")
	(commit "01ad33937acd996ee99eb74eefb39845e4e4b9f5"))
    (package
      (name "lean-qq")
      (version (git-version version revision commit))
      (home-page "https://reservoir.lean-lang.org/@leanprover-community/Qq")
      (source
       (origin
	 (method git-fetch)
	 (uri (git-reference
	       (url "https://github.com/leanprover-community/quote4.git")
	       (commit commit)))
	 (file-name (git-file-name name version))
	 (sha256
	  (base32
	   "1iq2kkd91gzigvc7xapmc1sks4wdn4h7f77z1gj5bsxb1qb81n9p"))))
      (build-system lake-build-system)
      (arguments
       (list
	#:build-targets #~'("Qq:leanArts"
			    "Qq:static"
			    "Qq:shared")))
      (synopsis "Intuitive, type-safe expression quotations for Lean 4.")
      (description "Qq implements type-safe expression quotations, which are a
particularly convenient way of constructing object-level
expressions (Expr) in meta-level code.

It combines the intuitiveness of modal sequent calculus with the power
and speed of Lean 4's metaprogramming facilities.")
      (license license:asl2.0))))


(define-public lean-batteries
  (package
    (name "lean-batteries")
    (version "4.10.0")
    (home-page
     "https://reservoir.lean-lang.org/@leanprover-community/batteries")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/leanprover-community/batteries.git")
	     (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "0q7wcbx3wl318k8x0hh846bdnh960kiqv9bvs83yzwlnqsvgiiga"))))
    (build-system lake-build-system)
    (arguments
     '(#:build-targets '("Batteries:leanArts"
			 "Batteries:static"
			 "Batteries:shared")))
    (synopsis "The 'batteries included' extended library for the Lean programming language and theorem prover")
    (description "batteries is a collection of data structures and tactics intended for
use by both computer-science applications and mathematics applications
of Lean 4.")
    (license license:asl2.0)))

(define-public lean-aesop
  (package
    (name "lean-aesop")
    (version "4.10.0")
    (home-page
     "https://reservoir.lean-lang.org/@leanprover-community/aesop")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/leanprover-community/aesop.git")
	     (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "039rdy7lldkvbl8gvln4v912b9pyx0952mqad49g755yvhgq7zw0"))))
    (build-system lake-build-system)
    (inputs (list
	     `("lean-/batteries" ,lean-batteries)))
    (synopsis "White-box automation for Lean 4")
    (description "Aesop (Automated Extensible Search for Obvious Proofs) is a proof
search tactic for Lean 4. It is broadly similar to Isabelle's @code{auto}.")
    (license license:asl2.0)))

(define-public lean-import-graph
  (package
    (name "lean-import-graph")
    (version "4.10.0")
    (home-page
     "https://reservoir.lean-lang.org/@leanprover-community/importGraph")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url
	      "https://github.com/leanprover-community/import-graph.git")
	     (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "0h6cz65r51q0l1ss9rizzn0lsmkb8dyf62kj1w4ln6a24yx94kgb"))))
    (build-system lake-build-system)
    (inputs (list
	     `("lean-/batteries" ,lean-batteries)
	     `("lean-/Cli"       ,lean-cli)))
    (synopsis "Tool to analyse the import structure of lean projects.")
    (description "A simple tool to create import graphs of lake packages.")
    (license license:asl2.0)))

(define-public lean-proofwidgets
  (package
    (name "lean-proofwidgets")
    (version "0.0.40")
    (home-page
     "https://reservoir.lean-lang.org/@leanprover-community/ProofWidgets4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url
	      "https://github.com/leanprover-community/ProofWidgets4.git")
	     (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "166hk2av9qw7zawyx80k4j3h6cb0jx3nsza8vzk7n0vi3k5i47hb"))))
    (build-system lake-build-system)
    (inputs
     (list `("lean-/batteries" ,lean-batteries)))
    (arguments
     (list

      ;; NOTE: To allow for the output-path splicing in
      ;;       `patch-lakefile-__dir__-tokens', we need to perform the
      ;;       build itself in the output path, as build functions
      ;;       expect the `__dir__' token we replaced to point to the
      ;;       root of the source tree
      #:build-in-output? #t
      
      #:phases
      #~(modify-phases %standard-phases
	  (add-before 'build 'disable-preferReleaseBuild
	    (lambda _
	      ;; HACK: hard-patch `lakefile.lean' for ProofWidgets
	      ;;       to set `_package.preferReleaseBuild' to
	      ;;       `false'.  This is necessary to prevent
	      ;;       failures during builds of dependencies of
	      ;;       this package (i.e., `lean-mathlib')
	      
	      ;; TODO: There should be a better way to set this w/o
	      ;;       patching
	      (substitute* "lakefile.lean"
		(("^(  preferReleaseBuild := )true" _ var=)
		 (string-append var= "false")))))

	  (add-before 'build 'set-npmCmd-absolute-path
	    (lambda _
	      ;; 
	      ;; NOTE: Prevent the need to propagate nodejs as a
	      ;;       package dependency by keeping an absolute path
	      ;;       reference to the `npm' executable in the
	      ;;       ProofWidgets lakefile
	      ;; 
	      (let ((npm #$(file-append node-lts "/bin/npm")))
		(substitute* "lakefile.lean"
		  (("^(  if Platform.isWindows then \"npm.cmd\" else )\"npm\"" _ ite)
		   (string-append ite "\"" npm "\""))))))
	  
	  (add-before 'build 'patch-lakefile-__dir__-tokens
	    (lambda* (#:key lean-version  #:allow-other-keys)
	      
	      ;; NOTE: looks like the `__dir__' syntax token in Lake
	      ;;       elaborates to the current build environment's
	      ;;       working dir, even if it's read in the context
	      ;;       of a subpackage.  It's hard to say what
	      ;;       introspection tools are available that suit
	      ;;       our need here, so instead we just patch in
	      ;;       the literal output path of this package
	      
	      (substitute* "lakefile.lean"
		(("__dir__")
		 (string-append
		  "("
		  "System.FilePath.mk "
		  "\""
		  (lake-srcdir->installdir
		   "."
		   #:outdir #$output
		   #:lean-version lean-version)
		  "\""
		  ")")))))
	  
	  (add-before 'build 'inject-cloudrelease-js
	    (lambda _
	      ;; Extract the "js" top-level directory from the
	      ;; cloudrelease .tar.gz file, which allows us to skip
	      ;; node's network requests during build (as long as
	      ;; the relevant js/json hashes match)

	      ;; TODO: `lake-builddir' should be a build param, or
	      ;;       determined dynamically via lake...
	      
	      (let ((lake-builddir ".lake/build"))
		(mkdir-p lake-builddir)
		(invoke "tar" "-C" lake-builddir "-xzf"
			#$(lake-cloudrelease-origin
			   #:scope   "leanprover-community"
			   #:name    "ProofWidgets4"
			   #:version "v0.0.40"
			   #:build-archive "ProofWidgets4.tar.gz"
			   #:hash "06m9sdgd45iy63k06mcsfdjvs7p236mcjc4phnx9i7icc44vap22")
			"./js")))))
      #:build-targets
      #~(list "ProofWidgets:leanArts"
	      "ProofWidgets:static"
	      "ProofWidgets:shared"
	      "widgetJsAll")))
    (synopsis "Helper toolkit for creating your own Lean 4 UserWidgets")
    (description "ProofWidgets is a library of user interface components for Lean 4.")
    (license license:asl2.0)))

(define-public lean-mathlib
  (package
    (name "lean-mathlib")
    (version "4.10.0")
    (home-page
     "https://reservoir.lean-lang.org/@leanprover-community/mathlib")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url
	      "https://github.com/leanprover-community/mathlib4.git")
	     (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "0qxif7ldrcbd8mrmy6rsxig41jbvffhs6vab3bix15pbil5z4x6q"))))
    (build-system lake-build-system)
    (inputs `(;; Lake dependencies
	      ("lean-leanprover-community/batteries"    ,lean-batteries)
	      ("lean-leanprover-community/Qq"           ,lean-qq)
	      ("lean-leanprover-community/aesop"        ,lean-aesop)
	      ("lean-leanprover-community/proofwidgets" ,lean-proofwidgets)
	      ("lean-leanprover-community/importGraph"  ,lean-import-graph)

	      ;; inherited Lake dep (from lean-import-graph)
	      ("lean-/Cli"                              ,lean-cli)))
    (arguments
     (list
      #:build-flags   #~'("--wfail")
      #:build-targets #~'("Mathlib:leanArts"
			  "Mathlib:static"
			  "Mathlib:shared"
			  ;; 
			  ;; FIXME: add a builder (phase or separate
			  ;;        package) to handle doc-gen4 facet
			  ;;        builds for arbitrary lake packages
			  ;; 
			  ;; "Mathlib:docs"
			  )))
    (synopsis "The math library of Lean 4")
    (description "Mathlib is a user maintained library for the Lean theorem prover. It
contains both programming infrastructure and mathematics, as well as
tactics that use the former and allow to develop the latter.")
    (license license:asl2.0)))
