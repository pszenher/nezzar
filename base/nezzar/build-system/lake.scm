(define-module (nezzar build-system lake)
  #:use-module (guix build-system)
  #:use-module ((guix build-system gnu) #:prefix gnu:)
  #:use-module (guix gexp)
  #:use-module (guix monads)
  #:use-module (guix packages)
  #:use-module (guix search-paths)
  #:use-module (guix store)
  #:use-module (guix utils)

  #:export (lake-build-system))

(define (default-lean)
  "Return the default Lean package."
  (let ((lean (resolve-interface '(nezzar packages lean))))
    (module-ref lean 'lean-4)))

(define %lake-build-system-modules
  ;; Build-side modules imported by default.
  (cons*
   '(nezzar build lake-build-system)
   '(json parser)
   '(json builder)
   '(json record)
   '(json)
   gnu:%gnu-build-system-modules))

(define %lake-default-modules
  '((nezzar build lake-build-system)
    (guix build utils)))

(define* (lake-build
	  name inputs
	  #:key
	  guile
	  source
	  (outputs '("out"))
	  (configure-flags ''())
          (search-paths '())
          (build-flags ''())
          (build-type "RelWithDebInfo")
	  (build-targets ''())
          (tests? #t)
          (test-target "test")
          (parallel-build? #t)
	  (parallel-tests? #t)
          (validate-runpath? #t)
          (patch-shebangs? #t)
          (strip-binaries? #t)
          (strip-flags gnu:%strip-flags)
          (strip-directories gnu:%strip-directories)
          (phases '%standard-phases)
          (system (%current-system))
          (substitutable? #t)
          (imported-modules %lake-build-system-modules)
          (modules %lake-default-modules)
          disallowed-references

	  lean-version
	  (build-in-output? #f))

  (mlet %store-monad ((guile (package->derivation (or guile (default-guile)) system
						  #:graft? #f)))
    (gexp->derivation
     name
     (with-imported-modules imported-modules
       #~(begin (use-modules #$@(sexp->gexp modules))
		#$(with-build-variables inputs outputs
		    #~(lake-build
		       #:source #+source
		       #:system #$system
		       #:outputs %outputs
		       #:inputs %build-inputs
		       #:search-paths '#$(sexp->gexp (map search-path-specification->sexp search-paths))
		       #:phases #$(if (pair? phases)
				      (sexp->gexp phases)
				      phases)
		       #:configure-flags #$(if (pair? configure-flags)
					       (sexp->gexp configure-flags)
					       configure-flags)
		       #:build-flags   #$build-flags
		       #:build-type    #$build-type
		       #:build-targets #$build-targets
		       #:tests? #$tests?
		       #:test-target #$test-target
		       #:parallel-build? #$parallel-build?
		       #:parallel-tests? #$parallel-tests?
		       #:validate-runpath? #$validate-runpath?
		       #:patch-shebangs? #$patch-shebangs?
		       #:strip-binaries? #$strip-binaries?
		       #:strip-flags #$strip-flags
		       #:strip-directories #$strip-directories

		       #:lean-version #$lean-version
		       #:build-in-output? #$build-in-output?))))
     #:system system
     #:target #f
     #:graft? #f
     #:substitutable? substitutable?
     #:disallowed-references disallowed-references
     #:guile-for-build guile)))

(define* (lower name
		#:key
		source
		inputs native-inputs
		outputs
		system
		(lean (default-lean))
		#:allow-other-keys
		#:rest arguments)
  "Return a bag for lake package NAME compiled with LEAN."
  (define private-keywords `(#:lean #:inputs #:native-inputs #:target))
  (bag
    (name name)
    (system system)
    ;; NOTE: no `target' accepted, Lean4 only runs on amd64
    (target #f)
    (build-inputs
     `(,@(if source
	     `(("source" ,source))
	     '())
       ("lean" ,lean)
       ,@native-inputs
       ,@inputs
       ,@(gnu:standard-packages)))
    (host-inputs   '())
    (target-inputs '())
    (outputs outputs)
    (build lake-build)
    (arguments
     (default-keyword-arguments
       (strip-keyword-arguments
	private-keywords arguments)
       (list
	#:lean-version (package-version lean))))))

(define lake-build-system
  (build-system
    (name 'lake)
    (description "The standard lake build system for Lean4")
    (lower lower)))
