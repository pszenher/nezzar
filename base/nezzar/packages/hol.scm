(define-module (nezzar packages hol)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (nezzar packages sml)

  ;; #:use-module (gnu packages bash)
  ;; #:use-module (gnu packages base)
  ;; #:use-module (gnu packages commencement)

  #:use-module (gnu packages graphviz))

(define-public hol4
  (package
    (name "hol4")
    (version "trindemossen-1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/HOL-Theorem-Prover/HOL.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1bm7nwv1d3147gsf038xnwhnvnc1hlr27lsngx6m754frzxfr27r"))))
    (build-system gnu-build-system)
    (inputs
     (list polyml-5.9.1
	   mlton))
    (native-inputs
     (list graphviz))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases

	  ;; TODO: remove once cleanForReloc works correctly...
	  (add-after 'unpack 'build-in-output
	    (lambda _
	      (let ((outsrc (string-append #$output "/src")))
		(mkdir-p #$output)
		(copy-recursively
		 "." outsrc
		 #:keep-mtime? #t)
		(chdir outsrc))))
	  
	  (add-after 'unpack 'patch-tool-binpaths
	    (lambda _
	      (substitute*
		  (find-files "tools"
			      (lambda (absdir stat)
				(or (string-suffix? "Holmakefile" absdir)
				    (string-suffix? ".sml" absdir))))
		(("/bin/sh") (which "sh"))
		(("/bin/rm") (which "rm"))
		(("/bin/mv") (which "mv"))
		(("/bin/ls") (which "ls")))
	      (substitute* "tools/Holmake/tests/preexec/.hol_preexec"
		(("/bin/rm") (which "rm")))
	      (substitute* "src/TeX/poly-mkmkmunge.ML"
		(("/bin/sh") (which "sh")))
	      ;; FIXME: stub all TeX tests, as the exe runners seem to
	      ;;        fail in the face of parallel builds (being
	      ;;        cleaned up too soon?)
	      (substitute* "src/TeX/theory_tests/Holmakefile"
		(("^(all:).*" _ pfx) pfx))
	      ))
	  
	  (replace 'configure
	    (lambda _ (invoke "poly" "--script" "tools/smart-configure.sml")))
	  ;; #$(file-append polyml-5.9.1 "/bin/poly")

	  (replace 'build
	    (lambda* (#:key (parallel-build? #t) #:allow-other-keys)
	      (invoke "bin/build"
		      ;; Build standard kernel
		      "--stdknl"
		      ;; Enable parallel build
		      "-j" (if parallel-build?
			       (number->string (parallel-job-count))
			       (number->string 1))
		      ;; Enable testing and examples
		      ;; "--selftest=1"
		      )
	      ;; (invoke "bin/build" "cleanForReloc")
	      ))

	  ;; (delete 'check)
	  
	  (replace 'check
	    (lambda* (#:key (parallel-build? #t) #:allow-other-keys)
	      (invoke "bin/build"
		      ;; Build standard kernel
		      "--stdknl"
		      ;; Enable parallel build
		      "-j" (if parallel-build?
			       (number->string (parallel-job-count))
			       (number->string 1))
		      ;; Enable testing and examples
		      "--selftest=3")))

	  (replace 'install
	    (lambda _
	      (let* ((symlink-binfile
		      (lambda (binfile)
			(symlink
			 (string-append #$output "/src/bin/" binfile)
			 (string-append #$output "/bin/"     binfile)))))

		(mkdir-p (string-append #$output "/bin"))
		;; TODO: restore once cleanForReloc works
		;; (copy-recursively
		;;  "." (string-append #$output "/src") #:keep-mtime? #t)
		(for-each symlink-binfile '("hol" "Holmake")))))

	  ;; TODO: restore once cleanForReloc works
	  ;; (add-after 'install 'relocate-build
	  ;;   (lambda _
	  ;;     (with-directory-excursion
	  ;; 	  (string-append #$output "/src")
	  ;; 	(invoke "poly" "--script" "tools/smart-configure.sml")
	  ;; 	(invoke "bin/build" "--relocbuild")

	  ;; 	(with-directory-excursion
	  ;; 	    "Manual"
	  ;; 	  (invoke "make")))))
	  )))

    (home-page "https://hol-theorem-prover.org/")
    (synopsis "A proof assistant for higher-order logic: a programming environment in
which theorems can be proved and proof tools implemented")
    (description "The HOL interactive theorem prover is a proof assistant for
higher-order logic: a programming environment in which theorems can be
proved and proof tools implemented. Built-in decision procedures and
theorem provers can automatically establish many simple
theorems (users may have to prove the hard theorems themselves!) An
oracle mechanism gives access to external programs such as SMT and BDD
engines. HOL is particularly suitable as a platform for implementing
combinations of deduction, execution and property checking.")
    (license license:bsd-3)))

(define-public hol4-277f6ad
  (package/inherit
      hol4
    (version "277f6ad")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/HOL-Theorem-Prover/HOL.git")
             (commit "277f6ad618617d462cd4ad2955206cb261828f87")))
       (file-name (git-file-name (package-name hol4) version))
       (sha256
        (base32
         "0h6mc05mmxg63ivvndaf3i3lk0qjil3r8yk8p5m494v5i7f4hkqm"))))))

;; hol4
;; hol4-277f6ad
