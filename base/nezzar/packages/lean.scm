(define-module (nezzar packages lean)
  #:use-module (ice-9 format)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-71)

  #:use-module (guix packages)
  #:use-module (guix git)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix utils)

  #:use-module (guix build-system cmake)
  #:use-module (nezzar build-system lake)

  #:use-module (gnu packages base)
  #:use-module (gnu packages commencement) ; for `gcc-toolchain`
  #:use-module (gnu packages bash)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages version-control)

  #:export (make-lean4
	    make-lean4*))


;;; ================================================================
;;; | Constants
;;; ================================================================

(define %lean4-git-url
  "https://github.com/leanprover/lean4.git")

(define %lean4-versions
  ;;|----vers----|----------------guix sha256 hash----------------------|-----------git sha1 hash------------------|
  '(("4.11.0-rc2" "1gc109740sfhm98ggwys7vk7v12ic5pbhh6bm3n5jlxcq1qxbkaj" "0edf1bac392f7e2fe0266b28b51c498306363a84")
    ("4.10.0"     "1q0xfg0apzb0dwj71k46w5218hwm2k890cgslwzr4mlyhvrspmcl" "c375e19f6b656fcd594cdca3a38b8578634df8cd")
    ("4.9.1"      "02rfvj6ap55sc38njnl0ax97caa2309d8lwgsxgywkz6zplpjwqb" "1b78cb4836cf626007bd38872956a6fab8910993")
    ("4.9.0"      "0nmalg77p4gfi8x9m936xh4bm8h0hv2fr6cfnss3x9yav6xfhbn2" "8f9843a4a5fe1b0c2f24c74097f296e2818771ee")
    ("4.8.0"      "1f1j3vc4pj7qfbl5kvym1rl90llp9gbzvwnbni9x9zhv0jn53gj7" "df668f00e6c08cb63661aacc43d0e83388e2c60d")
    ("4.7.0"      "18nk1ikxan1yp0532x1px1m842kbc9gcw5rd66fg3dg82033qxlc" "6fce8f7d5cd18a4419bca7fd51780c71c9b1cc5a")
    ("4.6.1"      "110fdd0swlwswhzx18knn8jaz7xa7lc0p71cf8vci88j7h08cjn1" "dac66e47e32ffedf083d4508c0bfe599dfb65a9b")
    ("4.6.0"      "0c5wfvlsrsw4l6g7fv3ipqwb5f762dwfrnyyw0yzf6y5ljwzlxq2" "a5bc9013ab13f7b186cf154d396036b1d7c23370")
    ("4.5.0"      "0wv91cy1k8hydd335pw1gglc5sdx81xx6a652sxnjvk9h69r6c19" "1a3021f98e55a274217b3bbf92b2d449bae843c3")
    ("4.4.0"      "1ynz30l99apzrwdi4w4c38kgxa96df61vrfymzv97j3s771bnklm" "ca7d6dadb9e11831cb47959fbb0bab2dd427edfe")
    ("4.3.0"      "05716djini05xasbjrr9aci1f29fdrljinig0wwma6wcn64sqpnq" "8e5cf6466061e7660353d7c3d9b69f744ac29edd")
    ("4.2.0"      "144dxqljq6myg85xcyihlb9jqk4p0j4llpc74rgzwc4d50f2v9p7" "0d7051497ea09b2b4a4ef608e371b8f317487c3c")
    ("4.1.0"      "18din7m3hpjpgqblacqcq47cb0spl6z80xhbqm5bwv5ly5lw59pa" "a832f398b80a5ebb820d27b9e55ec949759043ff")
    ("4.0.0"      "1y5qxdrkrad0qbhy4z2qjd6v987rbn84ccp5mq72p2gl40vbxn6w" "ec941735c80dc54c53948e30c428905b6600f95a")))


;;; ================================================================
;;; | Util Procedures (XXX: move to designated file)
;;; ================================================================

(define* (version-in? v #:key gt lt ge le)
  "Return a boolean value denoting whether the version string V satisfies
the order predictes denoted by version strings GT (greater-than),
LT (less-than), GE (greater-than-or-equal), and
LE (less-than-or-equal).  Returns #t if all conditions are satisfied,
#f otherwise.

Conditions which are not passed version string values are ignored.
Equivalent to (const #t) if no conditions are passed."
  (and (or (not gt) (version>? v gt))
       (or (not lt) (version>? lt v))
       (or (not ge) (version>=? v ge))
       (or (not le) (version>=? le v))))

(define (splice-when cond val)
  "Helper procedure for conditional list splicing.  Returns the empty
list if COND is #f, otherwise returns value to be spliced (list VAL)."
  (if cond (list val) '()))


;;; ================================================================
;;; | Lean4 Package Generators
;;; ================================================================

(define (make-lean4 version hash git-sha1)
  "Return a <package> option corresponding to Lean at semver VERSION,
with guix sha256 hash HASH and git commit sha1 GIT-SHA1."
  (package
    (name "lean")
    (version version)
    (home-page "https://lean-lang.org/")
    (source
     (origin (method git-fetch)
	     (uri (git-reference
		   (url %lean4-git-url)
		   (commit (string-append "v" version))))
	     (file-name (git-file-name name version))
	     (sha256
	      (base32 hash))))
    (build-system cmake-build-system)
    (inputs (list bash-minimal gmp))
    (native-inputs
     (list coreutils
	   ;; for tests
	   git python perl))
    (propagated-inputs
     (list
      ;; for runtime downloads
      curl
      ;; for runtime compilation
      gcc-toolchain-12))
    (arguments
     `(#:build-type "Release"
       #:configure-flags
       ,#~(map string-concatenate
	       ;; Force use of gcc-12 for compilation with `leanc'
	       ;; (needed for libstdc++ version to line-up)
	       '(("-D" "LEANC_CC=" #$(file-append gcc-12 "/bin/gcc"))))
       #:phases
       ,#~(modify-phases %standard-phases

	    ;; FIXME: there has to be a better way to make an abspath
	    ;;        *.so file available to leanc for linking without
	    ;;        triggering gcc's yelling...
	    
	    ;; (add-after 'unpack 'fix-leanc-gmp-linker-flags
	    ;;   (lambda* _
	    ;; 	;; 
	    ;; 	;; NOTE: replace `libgmp.so' file reference added to
	    ;; 	;;       `LEAN_EXTRA_LINKER_FLAGS' from cmake with an
	    ;; 	;;       `-L' flag-prefixed abspath of gmp entire guix
	    ;; 	;;       package lib directory.  This replaces the
	    ;; 	;;       non-flag `libgmp.so' abspath in the `leanc'
	    ;; 	;;       linker args, and is done to prevent every
	    ;; 	;;       non-linking action taken by `leanc' at
	    ;; 	;;       runtime from printing gcc's "linking not
	    ;; 	;;       done" warning.
	    ;; 	;;
	    ;; 	(let ((gmp-libdir #$(file-append gmp "/lib")))
	    ;; 	  (substitute* '("src/CMakeLists.txt"
	    ;; 			 "stage0/src/CMakeLists.txt")
	    ;; 	    (("(string\\(APPEND LEAN_EXTRA_LINKER_FLAGS \" )\\$\\{GMP_LIBRARIES\\}(\"\\))" all prefix suffix)
	    ;; 	     (let ((newstr (string-append prefix "-L" gmp-libdir suffix)))
	    ;; 	       (format (current-error-port)
	    ;; 		       "~a: ~30a ==> ~30a~%"
	    ;; 		       'fix-leanc-gmp-linker-flags
	    ;; 		       (format #f "'~a'" all)
	    ;; 		       (format #f "'~a'" newstr))
	    ;; 	       newstr))))))
	    
	    (add-after 'unpack 'override-git-sha1-hash
	      ;; Manually override the `GIT_SHA1' CMake variable in
	      ;; src/CMakeLists.txt so that `Lean.githash' has the
	      ;; expected value at runtime
	      (lambda* _
		(substitute* "src/CMakeLists.txt"
		  (("(set\\(GIT_SHA1 \")(\"\\))" all prefix suffix)
		   (let ((newstr (string-append prefix #$git-sha1 suffix)))
		     (format (current-error-port)
			     "~a: ~30a ==> ~30a~%"
			     'fix-test-leanlaketest_reverse-ffi
			     (format #f "'~a'" all)
			     (format #f "'~a'" newstr))
		     newstr)))))

	    (add-after 'patch-source-shebangs 'patch-bash-paths
	      ;; NOTE: heavy usage of "/usr/bin/env bash" as string
	      ;;       command (not in shebang-position, so not caught
	      ;;       during default patching) in templated files:
	      ;;       replace with absolute path to #$bash-minimal/bin/bash
	      (lambda* (#:key inputs #:allow-other-keys)
		(define (dquote-wrap str) (string-append "\"" str "\""))
		(let ((bash (string-append (assoc-ref inputs "bash-minimal") "/bin/bash")))
		  (for-each (lambda (file)
			      (substitute* file
				(("(= )/usr/bin/env bash" all prefix)
				 (let ((newstr (string-append prefix bash)))
				   (format (current-error-port) "patch-bash-paths: ~30a ==> ~30a (in ~a)~%"
					   (dquote-wrap all) (dquote-wrap newstr) file)
				   newstr))))
			    (find-files "." "\\.in$")))))
	   
	    (add-before 'check 'allow-parallel-tests
	      ;; 
	      ;; NOTE: Test job count doesn't respect -j flag passed to
	      ;;       make directly, needs to be placed in ARGS
	      ;;       env-var/argument...
	      ;; 
	      ;; FIXME: this should be passed as an argument instead of
	      ;;        added to the build environment, but it's not
	      ;;        clear how to wrap this value as a `make' arg so
	      ;;        that it actually makes it to the test runner...
	      ;; 
	      ;; XXX: Very-wide (i.e. 64-core) parallelism seems to cause
	      ;;      flakiness in some of the test suite.  Limiting test
	      ;;      jobs to a sane maximum for now (8 cores) to ensure
	      ;;      build consistency.
	      ;; 
	      (lambda* (#:key (tests? #t) (parallel-tests? #t) #:allow-other-keys)
		(when (and tests? parallel-tests?)
		  (let ((njobs (min 8 (parallel-job-count))))
		    (setenv "ARGS" (string-append "-j" (number->string njobs)))))))
	   
	    (add-after 'patch-source-shebangs 'fix-test-leanlaketest_reverse-ffi
	      ;; 
	      ;; NOTE: test `leanlaketest_reverse-ffi' hard-codes "cc"
	      ;;       relative binary, replace with gcc absolute-path
	      ;; 
	      (lambda* (#:key inputs #:allow-other-keys)
		(let ((file "src/lake/examples/reverse-ffi/Makefile"))
		  (substitute* file
		    (("^(\t)cc" all prefix)
		     (let ((newstr (string-append prefix #$(file-append gcc-12 "/bin/gcc"))))
		       (format (current-error-port)
			       "~a: ~30a ==> ~30a (in ~a)~%"
			       'fix-test-leanlaketest_reverse-ffi
			       (format #f "'~a'" all)
			       (format #f "'~a'" newstr)
			       file)
		       newstr))))))
	   
	    #$@(splice-when
		(version-in? version #:ge "4.4.0" #:lt "4.10.0")
		'(add-after 'patch-source-shebangs 'fix-test-leanlaketest_init
		   ;; 
		   ;; NOTE: test `leanlaketest_init' attempts to `curl`
		   ;;       lean-toolchain file from mathlib master branch
		   ;;       on Lean4 versions in [4.4.0, 4.10.0).
		   ;; 
		   ;;       Backport change from 1835dd1 (present in 4.10.0
		   ;;       and onwards) to allow network request to fail
		   ;;       silently
		   ;; 
		   (lambda* _
		     (let ((file "src/lake/tests/init/test.sh"))
		       (substitute* file
			 (("^.LAKE new qed math(.toml)?" line)
			  (let ((newstr
				 (string-append
				  line " || true #BACKPORT [1835dd1]: ignore toolchain download errors")))
			    (format (current-error-port)
				    "~a: ~30a ==> ~30a (in ~a)~%"
				    'fix-test-leanlaketest_init
				    (format #f "'~a'" line)
				    (format #f "'~a'" newstr)
				    file)
			    newstr))))))))))
    (synopsis "Lean 4 programming language and theorem prover")
    (description "Lean is a functional programming language that makes
it easy to write correct and maintainable code. You can also use Lean
as an interactive theorem prover. Lean programming primarily involves
defining types and functions. This allows your focus to remain on the
problem domain and manipulating its data, rather than the details of
programming.")
    (license license:asl2.0)))

(define* (make-lean4* version #:key check-git-hash?)
  "Return a <package> object corresponding to Lean4 version VERSION,
where VERSION is a semver string expected to be found in the
`%lean4-versions' alist.

Throws error if VERSION is not a key of %lean4-versions.

If the key is in %lean4-versions, but the git sha1-hash field is #f,
then update a local checkout of the lean4 upstream repo and find the
git hash associated with tag (string-append \"v\" VERSION)."

  (define (fetch-commit-hash)
    (let ((_ git-sha1 __
	     (update-cached-checkout
	      %lean4-git-url
	      #:ref `(tag . ,(string-append "v" version))
	      #:check-out? #f)))
      (format (current-error-port) "got lean commit `~a'~%" git-sha1)
      git-sha1))
  
  (match (assoc version %lean4-versions)
    (#f
     (error "Unknown lean4 version, cannot make package definition:" version))
    ((_ #f _)
     (error "Known lean4 version, but no guix hash set:" version))
    ((_ (? string? hash) #f)
     (format (current-error-port)
	     "WARN: Known lean4 version+hash for `~a', but no git sha1 hash set, fetching repo... ~!"
	     version)
     (let ((git-sha1 (fetch-commit-hash)))
       (make-lean4 version hash git-sha1)))
    ((_ (? string? hash) (? string? git-sha1))
     (if (or (not check-git-hash?)
	     (string=? git-sha1 (fetch-commit-hash)))
	 (make-lean4 version hash git-sha1)
	 (error "Lean4 git sha1 hash mismatch:"
		git-sha1 (fetch-commit-hash))))))


;;; ================================================================
;;; | Lean4 Packages
;;; ================================================================
(define-public lean-4.0  (make-lean4*  "4.0.0"))
(define-public lean-4.1  (make-lean4*  "4.1.0"))
(define-public lean-4.2  (make-lean4*  "4.2.0"))
(define-public lean-4.3  (make-lean4*  "4.3.0"))
(define-public lean-4.4  (make-lean4*  "4.4.0"))
(define-public lean-4.5  (make-lean4*  "4.5.0"))
(define-public lean-4.6  (make-lean4*  "4.6.1"))
(define-public lean-4.7  (make-lean4*  "4.7.0"))
(define-public lean-4.8  (make-lean4*  "4.8.0"))
(define-public lean-4.9  (make-lean4*  "4.9.1"))
(define-public lean-4.10 (make-lean4* "4.10.0"))
(define-public lean-4.11 (make-lean4* "4.11.0-rc2"))

;;; NOTE: default lean package pointer, update to match latest when
;;;       new stable release versions are added
(define-public lean-4 lean-4.10)

;;; NOTE: release-candidate package pointer: update to match latest
;;;       when new stable release versions are added
(define-public lean-4-next lean-4.11)

lean-4
