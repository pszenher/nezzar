(define-module (nezzar scripts environment)
  #:use-module (ice-9 match)
  #:use-module (ice-9 vlist)
  #:use-module (ice-9 format)
  
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-9 gnu)
  #:use-module (srfi srfi-11)
  #:use-module (srfi srfi-26)
 
  #:use-module (guix packages)
  #:use-module (guix derivations)
  #:use-module (guix profiles)
  #:use-module (guix memoization)
  #:use-module (guix store)
  #:use-module (guix monads)
  #:use-module (guix ui)
  #:use-module (guix modules)
  #:use-module (guix transformations)
  #:use-module (guix scripts)
  #:use-module (guix diagnostics)
  #:use-module (guix scripts build)
  #:use-module (guix gexp)
  #:use-module (guix search-paths)
  #:use-module (guix utils)

  #:use-module (gnu packages)

  #:use-module ((guix status) #:select (with-status-verbosity))

  #:use-module (gnu packages package-management)
  
  ;; #:use-module (guix scripts environment)
  )

(define-syntax-rule (bind-from-module module symbol ...)
  (define-values (symbol ...)
    (values
     (@@ module symbol) ...)))

;; (eval
;;  (call-with-input-file
;;      (search-path
;;       %load-path
;;       (module-name->file-name '(guix scripts environment)))
;;    read)
;;  (current-module))

(define (hotload module-name)
  (load (search-path
	 %load-path
	 (module-name->file-name module-name))))

;;; HACK: need non-exported symbols that are compiled out in bytecode,
;;;       loading the file here gives us access...
(for-each hotload '((guix scripts environment)
		    (guix scripts shell)))

(bind-from-module
 (guix scripts environment)

 pick-all
 %default-shell
 
 assert-container-features
 
 launch-environment/container
 launch-environment/fork

 validate-child-shell-environment

 register-gc-root
 environment-bash
 show-search-paths
 setup-fhs
 exit/status
 set-build-options-from-command-line
 %bootstrap-guile

 load-manifest
 current-profile
 guix-channel?
 channel-commit
 current-channels)

(bind-from-module (guix scripts shell) parse-args)

(define (print-manifest-entry entry port)
  "Write a concise representation of <manifest-entry> ENTRY to port PORT"
  (match entry
    (($ <manifest-entry> name version output item dependencies paths)
     (format port "#<manifest-entry ~a@~a:~a item:~a deps:~a sp:~a>"
	     name version output
	     (match item
	       ((and (? struct?)
		     (= (compose struct-vtable-name struct-vtable)
			type))
		type)
	       ((? string?) 'string))
	     (match dependencies
	       ((? promise? d) (length (force d)))
	       ((? list? d) (length d)))
	     (length paths)))))

(set-record-type-printer! <manifest-entry> print-manifest-entry)

(define (default-properties package)
  "Return the default properties of a manifest entry for PACKAGE."
  ;; Preserve transformation options by default.
  (match (assq-ref (package-properties package) 'transformations)
    (#f '())
    (transformations `((transformations . ,transformations)))))

(define parent-stub (delay #f))

(define* (vhash-assoc* key vhash)
    (vhash-fold* cons '() key vhash))

(define* (package->manifest-entry/lazy pkg #:optional (out "out"))
  "Return a manifest entry for the output OUT of package PKG."

  (define (make-manifest-entry pkg out dep-entries)
    (manifest-entry
      (name (package-name pkg))
      (version (package-version pkg))
      (output out)
      (item pkg)
      (dependencies dep-entries)
      (search-paths
       (package-transitive-native-search-paths pkg))
      (parent parent-stub)
      (properties (default-properties pkg))))
  
  (define propagated-inputs-map
    (let loop ((deps (package-propagated-inputs pkg))
	       (seen vlist-null))
      (match deps
	(() seen)
	((((? string?  depname)
	   (? package? deppkg)
	   (? string? outs) ...)
	  . rest)
	 (let ((depout (match outs
			 (()   "out")
			 ((out) out))))
	   (match (vhash-assoc* deppkg seen)
	     (() (loop (append (package-propagated-inputs deppkg) rest)
		       (vhash-cons deppkg depout seen)))
	     (seenouts
	      (if (member depout seenouts)
		  (loop rest seen)
		  (loop rest (vhash-cons deppkg depout seen))))))))))
  
  (define (make-entry-generator entry-map)
    (lambda (pkg out)
      (make-manifest-entry
       pkg out
       (delay
	 (map (match-lambda
		((name pkg out) (cdr (vhash-assoc (cons pkg out)   (force entry-map))))
		((name pkg)     (cdr (vhash-assoc (cons pkg "out") (force entry-map)))))
	      (package-propagated-inputs pkg))))))

  (letrec*
      ((pkg+out->entry (make-entry-generator (delay entry-map)))
       (entry-map (vhash-fold
		   (lambda (pkg out res)
		     (vhash-cons
		      (cons pkg out) (pkg+out->entry pkg out) res))
		   vlist-null
		   propagated-inputs-map)))
    (pkg+out->entry pkg out)))

(define* (package->manifest-entry pkg #:optional (out "out"))

  (define (resolve-entry entry)
    (let loop ((deps (list entry))
	       (seen vlist-null))
      (match deps
	(() (cdr
	     (vhash-assoc (cons (manifest-entry-item   entry)
				(manifest-entry-output entry))
			  seen)))
	(((and entry
	       ($ <manifest-entry> name _ output item subdeps _))
	  .
	  rest)
	 (match (vhash-assoc (cons item output) seen)
	   (#f
	    (let ((resolved (filter-map
			     (match-lambda
			       (($ <manifest-entry> _ _ depout depitem )
				(match (vhash-assoc (cons depitem depout) seen)
				  (#f #f)
				  ((_ . e) e))))
			     (force subdeps))))
	      (if (= (length resolved)
		     (length (force subdeps)))
		  (loop rest
			(vhash-cons
			 (cons item output)
			 (manifest-entry
			   (inherit entry)
			   (dependencies resolved))
			 seen))
		  (loop (append (force subdeps) deps) seen))))
	   ((_ . entry) (loop rest seen)))))))
  
  (resolve-entry
   (package->manifest-entry/lazy pkg out)))

;; (define* (package->manifest-entry/lazy pkg #:optional (out "out"))
;;   "Return a manifest entry for the OUTPUT of package PACKAGE."
;;   (manifest-entry
;;     (name (package-name pkg))
;;     (version (package-version pkg))
;;     (output out)
;;     (item pkg)
;;     (dependencies (package->depmap))
;;     (search-paths
;;      (package-transitive-native-search-paths pkg))
;;     (parent #f)
;;     (properties (default-properties pkg))))



;; (define package->manifest-entry+deps/aux
;;   (mlambda (pkg out deps)
;;     "Return a manifest entry for the OUTPUT of package PACKAGE."
;;     (let ((depmap (match deps
;; 		    (#f (package->depmap pkg))
;; 		    ((? promise?) deps))))
;;       (cons (manifest-entry
;; 	      (name (package-name pkg))
;; 	      (version (package-version pkg))
;; 	      (output out)
;; 	      (item pkg)
;; 	      (dependencies depmap)
;; 	      (search-paths
;; 	       (package-transitive-native-search-paths pkg))
;; 	      (parent #f)
;; 	      (properties (default-properties pkg)))
;; 	    depmap))))

;; (define* (package->manifest-entry+deps pkg #:optional (out "out") (deps #f))
;;   (package->manifest-entry+deps/aux pkg out deps))

(define* (vhash-replace key newval vhash
			#:optional (equal? equal?) (hash-proc hash))
  (let ((vhash* (vhash-delete key vhash equal? hash-proc)))
    (vhash-cons key newval vhash* hash-proc)))

(define package->manifest-entry/no-parent
  (memoize
   (lambda* (package #:optional
		     (output "out")
		     #:key
		     (properties
		      (default-properties package)))
     "Return a manifest entry for the OUTPUT of package PACKAGE."
     
     (letrec*
	 ((deps (map
		 (match-lambda
		   ((label pkg)     (package->manifest-entry pkg     #:parent (delay entry)))
		   ((label pkg out) (package->manifest-entry pkg out #:parent (delay entry))))
		 (package-propagated-inputs package)))

	  (entry (manifest-entry
		   (name (package-name package))
		   (version (package-version package))
		   (output output)
		   (item package)
		   (dependencies (delete-duplicates deps))
		   (search-paths
		    (package-transitive-native-search-paths package))
		   (parent (delay #f))
		   (properties properties))))
       entry))))

;; (define* (package->manifest-entry
;; 	  package
;; 	  #:optional (output "out")
;;           #:key
;; 	  (parent (delay #f))
;;           (properties (default-properties package)))
;;   "Return a manifest entry for the OUTPUT of package PACKAGE."  (begin
;;     (format (current-error-port) "Converting package: `~a:~a'~%" package output)
;;     (manifest-entry
;;       (inherit (package->manifest-entry/no-parent
;; 		package output
;; 		#:properties properties))
;;       (parent parent))))

(define (options/resolve-packages store opts)
  "Return OPTS with package specification strings replaced by manifest entries
for the corresponding packages."
  (define system
    (assoc-ref opts 'system))

  (define (manifest-entry=? e1 e2)
    (and (eq? (manifest-entry-item e1) (manifest-entry-item e2))
         (string=? (manifest-entry-output e1)
                   (manifest-entry-output e2))))

  (define transform
    (options->transformation opts))

  (define* (package->manifest-entry* package #:optional (output "out"))
    (let ((e (package->manifest-entry
	      (pk 'tfpkg (transform package))
	      output)))
      (pk 'made-entry (manifest-entry-name e))
      e))

  (define (packages->outputs packages mode)
    (match packages
      ((? package? package)
       (if (eq? mode 'ad-hoc-package)
           (list (package->manifest-entry* package))
           (manifest-entries (package->development-manifest package system))))
      (((? package? package) (? string? output))
       (if (eq? mode 'ad-hoc-package)
           (list (package->manifest-entry* package output))
           (manifest-entries (package->development-manifest package system))))
      ((lst ...)
       (append-map (cut packages->outputs <> mode) lst))))

  (manifest
   (delete-duplicates
    (append-map (match-lambda
                  (('package 'ad-hoc-package (? string? spec))
                   (let-values (((package output)
                                 (specification->package+output spec)))
                     (list (package->manifest-entry* package output))))
                  (('package 'package (? string? spec))
                   (manifest-entries
                    (package->development-manifest
                     (transform (specification->package+output spec))
                     system)))
                  (('expression mode str)
                   ;; Add all the outputs of the package STR evaluates to.
                   (packages->outputs (read/eval str) mode))
                  (('load mode file)
                   ;; Add all the outputs of the package defined in FILE.
                   (let ((module (make-user-module '())))
                     (packages->outputs (load* file module) mode)))
                  (('manifest . file)
                   (manifest-entries (load-manifest file)))
                  (('nesting? . #t)
                   (if (assoc-ref opts 'profile)
                       '()
                       (let ((profile (and=> (current-profile) readlink*)))
                         (if (or (not profile) (not (store-path? profile)))
                             (begin
                               (warning (G_ "\
could not add current Guix to the profile~%"))
                               '())
                             (list (manifest-entry
                                     (name "guix")
                                     (version
                                      (or (any (lambda (channel)
                                                 (and (guix-channel? channel)
                                                      (channel-commit channel)))
                                               (current-channels))
                                          "0"))
                                     (item profile)
                                     (search-paths
                                      (package-native-search-paths guix))))))))
                  (_ '()))
                opts)
    manifest-entry=?)))

;;;
;;; From (guix profiles)
;;; 
(define* (manifest->gexp manifest #:optional
                         (format-version %manifest-format-version))
  "Return a representation in FORMAT-VERSION of MANIFEST as a gexp."
  (define (optional name value)
    (match format-version
      (4
       (if (null? value)
           #~()
           #~((#$name #$value))))
      (3
       (match name
         ('properties #~((#$name #$@value)))
         (_           #~((#$name #$value)))))))

  (define <manifest> (@@ (guix profiles) <manifest>))

  (define (list=? = lst1 lst2)
    "Return true if LST1 and LST2 have the same length and their elements are
pairwise equal per =."

    (define (list=?-aux pred)
      (letrec
	  ((rec
	    (lambda (l1 l2)
	      (match l1
		((hd1 . tl1)
		 (match l2
		   ((hd2 . tl2) 
		    (and (pred hd1 hd2)
			 (rec  tl1 tl2)))))
		(() (null? l2))
		(_  #f)))))
	rec))

    (define (length=? l1 l2)
      (eqv? (length l1) (length l2)))

    (and (length=?   lst1 lst2)
	 (or ((list=?-aux eq?) lst1 lst2)
	     ((list=?-aux =  ) lst1 lst2))))
  
  ;; XXX: override manifest entry equality in entry->gexp to avoid
  ;;      recursing on dependencies, not yet clear what the
  ;;      rammifications of doing this are...
  (define manifest-entry=?
    (match-lambda*
      ((($ <manifest-entry> name1 version1 output1 item1 dependencies1 paths1)
	($ <manifest-entry> name2 version2 output2 item2 dependencies2 paths2))
       (and (string=? name1 name2)
            (string=? version1 version2)
            (string=? output1 output2)
            (equal? item1 item2) ;XXX: could be <package> vs. store item
            (equal? paths1 paths2)
            (list=? manifest-entry=? dependencies1 dependencies2)))))

  (define (entry->gexp entry)
    ;; Maintain in state monad a vhash of visited entries, indexed by their
    ;; item, usually package objects (we cannot use the entry itself as an
    ;; index since identical entries are usually not 'eq?').  Use that vhash
    ;; to avoid repeating duplicate entries.  This is particularly useful in
    ;; the presence of propagated inputs, where we could otherwise end up
    ;; repeating large trees.
    (mlet %state-monad ((visited (current-state)))
      (if (and (= format-version 4)
               (match (vhash-assq (manifest-entry-item entry) visited)
                 ((_ . previous-entry)
                  (manifest-entry=? previous-entry entry))
                 (#f #f)))
          (return #~(repeated #$(manifest-entry-name entry)
			      #$(manifest-entry-version entry)
			      (ungexp (manifest-entry-item entry)
				      (manifest-entry-output entry))))
          (mbegin %state-monad
            (set-current-state (vhash-consq (manifest-entry-item entry)
                                            entry visited))
            (mlet %state-monad ((deps (mapm %state-monad entry->gexp
                                            (manifest-entry-dependencies entry))))
              (return
               (match entry
                 (($ <manifest-entry> name version output (? string? path)
                                      (_ ...) (search-paths ...) _ (properties ...))
                  #~(#$name #$version #$output #$path
			    #$@(optional 'propagated-inputs deps)
			    #$@(optional 'search-paths
                                         (map search-path-specification->sexp
					      search-paths))
			    #$@(optional 'properties properties)))
                 (($ <manifest-entry> name version output package
                                      (_deps ...) (search-paths ...) _ (properties ...))
                  #~(#$name #$version #$output
			    (ungexp package (or output "out"))
			    #$@(optional 'propagated-inputs deps)
			    #$@(optional 'search-paths
                                         (map search-path-specification->sexp
					      search-paths))
			    #$@(optional 'properties properties))))))))))

  (unless (memq format-version '(3 4))
    (raise (formatted-message
            (G_ "cannot emit manifests formatted as version ~a")
            format-version)))

  (match manifest
    (($ <manifest> (entries ...))
     #~(manifest (version #$format-version)
                 (packages #$(run-with-state
                                 (mapm %state-monad entry->gexp entries)
                               vlist-null))))))

(define* (profile-derivation manifest
                             #:key
                             (name "profile")
                             (hooks %default-profile-hooks)
                             (locales? #t)
                             (allow-unsupported-packages? #f)
                             (allow-collisions? #f)
                             (relative-symlinks? #f)
                             (format-version %manifest-format-version)
                             system target)
  "Return a derivation that builds a profile (aka. 'user environment') with
the given MANIFEST.  The profile includes additional derivations returned by
the monadic procedures listed in HOOKS--such as an Info 'dir' file, etc.
Unless ALLOW-COLLISIONS? is true, a '&profile-collision-error' is raised if
entries in MANIFEST collide (for instance if there are two same-name packages
with a different version number.)  Unless ALLOW-UNSUPPORTED-PACKAGES? is true
or TARGET is set, raise an error if MANIFEST contains a package that does not
support SYSTEM.

When LOCALES? is true, the build is performed under a UTF-8 locale; this adds
a dependency on the 'glibc-utf8-locales' package.

When RELATIVE-SYMLINKS? is true, use relative file names for symlink targets.
This is one of the things to do for the result to be relocatable.

When TARGET is true, it must be a GNU triplet, and the packages in MANIFEST
are cross-built for TARGET."
  (define (check-supported-packages system)
    ;; Raise an error if a package in MANIFEST does not support SYSTEM.
    (map-manifest-entries
     (lambda (entry)

       (match (manifest-entry-item entry)
         ((? package? package)
          (unless (supported-package? package system)
            (raise (formatted-message (G_ "package ~a does not support ~a")
                                      (package-full-name package) system))))
         (_ #t)))
     manifest))

  (mlet* %store-monad ((system (if system
                                   (return system)
                                   (current-system)))
                       (target (if target
                                   (return target)
                                   (current-target-system)))
                       (ok? -> (pk 'ok?
				   (or allow-unsupported-packages? target
                                       (check-supported-packages system))))
                       (ok?    (pk 'ok-collide?
				   (if allow-collisions?
				       (return #t)
				       (check-for-collisions manifest system
							     #:target target))))
                       (extras (if (null? (manifest-entries manifest))
                                   (return '())
				   (pk 'accum
				       (mapm/accumulate-builds (lambda (hook)
								 (format (current-error-port) "Handling hook `~a'~%" hook)
								 (hook manifest
                                                                       system))
                                                               ;; hooks
							       '()
							       )))))
    (format (current-error-port) "Lowered extras `~a'~%" extras)
    
    (define extra-inputs
      (filter-map (lambda (drv)
                    (and (derivation? drv) (gexp-input drv)))
                  (pk ' extras extras)))

    (define libc-utf8-locales-for-target ;lazy reference
      (module-ref (resolve-interface '(gnu packages base))
                  'libc-utf8-locales-for-target))

    (define set-utf8-locale
      ;; Some file names (e.g., in 'nss-certs') are UTF-8 encoded so
      ;; install a UTF-8 locale.
      (let ((locales (libc-utf8-locales-for-target
                      (or system (%current-system)))))
        #~(begin
            (setenv "LOCPATH"
                    #$(file-append locales "/lib/locale/"
                                   (version-major+minor
                                    (package-version locales))))
            (setlocale LC_ALL "en_US.utf8"))))

    (define builder
      (with-imported-modules '((guix build profiles)
                               (guix build union)
                               (guix build utils)
                               (guix search-paths)
                               (guix records))
        #~(begin
            (use-modules (guix build profiles)
                         (guix search-paths)
                         (srfi srfi-1))

            (let ((line (cond-expand (guile-2.2 'line)
                                     (else _IOLBF)))) ;Guile 2.0
              (setvbuf (current-output-port) line)
              (setvbuf (current-error-port) line))

            #+(if locales? set-utf8-locale #t)

            (build-profile #$output '#$(pk 'manif-gexp (manifest->gexp manifest (pk 'format-vers format-version)))
                           #:extra-inputs '#$extra-inputs
                           #:symlink #$(if relative-symlinks?
                                           #~symlink-relative
                                           #~symlink)))))

    (pk 'builder builder)

    (pk 'gexp-out ((@@ (guix gexp) gexp-outputs) builder))
    (pk 'lowered (lower-gexp builder))
    
    ;; (return builder)

    (pk
     'drv
     (gexp->derivation name builder
		       #:system system
		       #:target target

		       ;; Don't complain about _IO* on Guile 2.2.
		       #:env-vars '(("GUILE_WARN_DEPRECATED" . "no"))

		       ;; Not worth offloading.
		       #:local-build? #t

		       ;; Disable grafts to test performance
		       ;; (unsorted `delete-duplicates' in graft.scm is killer)
		       #:graft? #f

		       ;; Disable substitution because it would trigger a
		       ;; connection to the substitute server, which is likely
		       ;; to have no substitute to offer.
		       #:substitutable? #f

		       #:properties `((type . profile)
				      (profile
				       (count
					. ,(pk
					    'num-entries
					    (length
					     (manifest-entries manifest))))))))
    ))

(define (manifest->derivation manifest system bootstrap?)
  "Return the derivation for a profile of MANIFEST.
BOOTSTRAP? specifies whether to use the bootstrap Guile to build the profile."
  (begin
    (format (current-error-port) "Making profile derivation for manifest w/ entries `~a'~%"
	    (map manifest-entry-name (manifest-entries manifest)))
    (pk 'prof-drv
	(profile-derivation manifest
			    #:system system

			    ;; Packages can have conflicting inputs, or explicit
			    ;; inputs that conflict with implicit inputs (e.g., gcc,
			    ;; gzip, etc.).  Thus, do not error out when we
			    ;; encounter collision.
			    #:allow-collisions? #t

			    #:hooks (if bootstrap?
					'()
					%default-profile-hooks)
			    #:locales? (not bootstrap?)))))

(define (guix-environment* opts)
  "Run the 'guix environment' command on OPTS, an alist resulting for
command-line option processing with 'parse-command-line'."
  (let* ((pure?        (assoc-ref opts 'pure))
         (container?   (assoc-ref opts 'container?))
         (link-prof?   (assoc-ref opts 'link-profile?))
         (symlinks     (assoc-ref opts 'symlinks))
         (network?     (assoc-ref opts 'network?))
         (no-cwd?      (assoc-ref opts 'no-cwd?))
         (emulate-fhs? (assoc-ref opts 'emulate-fhs?))
         (nesting?     (assoc-ref opts 'nesting?))
         (user         (assoc-ref opts 'user))
         (bootstrap?   (assoc-ref opts 'bootstrap?))
         (system       (assoc-ref opts 'system))
         (profile      (assoc-ref opts 'profile))
         (command  (or (assoc-ref opts 'exec)
                       ;; Spawn a shell if the user didn't specify
                       ;; anything in particular.
                       (if container?
                           ;; The user's shell is likely not available
                           ;; within the container.
                           '("/bin/sh")
                           (list %default-shell))))
         (mappings   (pick-all opts 'file-system-mapping))
         (white-list (pick-all opts 'inherit-regexp)))

    (define store-needed?
      ;; Whether connecting to the daemon is needed.
      (or container? (not profile)))

    (define-syntax-rule (with-store/maybe store exp ...)
      ;; Evaluate EXP... with STORE bound to a connection, unless
      ;; STORE-NEEDED? is false, in which case STORE is bound to #f.
      (let ((proc (lambda (store) exp ...)))
        (parameterize ((%graft? (assoc-ref opts 'graft?)))
          (if store-needed?
              (with-store s
                (set-build-options-from-command-line s opts)
                (with-build-handler (build-notifier #:use-substitutes?
                                                    (assoc-ref opts 'substitutes?)
                                                    #:verbosity
                                                    (assoc-ref opts 'verbosity)
                                                    #:dry-run?
                                                    (assoc-ref opts 'dry-run?))
                  (proc s)))
              (proc #f)))))

    (when container? (assert-container-features))

    (when (not container?)
      (when link-prof?
        (leave (G_ "'--link-profile' cannot be used without '--container'~%")))
      (when user
        (leave (G_ "'--user' cannot be used without '--container'~%")))
      (when no-cwd?
        (leave (G_ "--no-cwd cannot be used without '--container'~%")))
      (when emulate-fhs?
        (leave (G_ "'--emulate-fhs' cannot be used without '--container'~%")))
      (when nesting?
        (leave (G_ "'--nesting' cannot be used without '--container'~%")))
      (when (pair? symlinks)
        (leave (G_ "'--symlink' cannot be used without '--container'~%"))))

    (with-store/maybe store
      (with-status-verbosity (assoc-ref opts 'verbosity)
        (define manifest-from-opts
          (let ((orp (options/resolve-packages store opts)))
	    (pk 'finishedmanifest)
	    orp))

        (define manifest
          (if (pk 'prof profile)
              (profile-manifest profile)
              manifest-from-opts))

        (when (and profile
                   (> (length (manifest-entries manifest-from-opts)) 0))
          (leave (G_ "'--profile' cannot be used with package options~%")))

        (when (null? (manifest-entries manifest))
          (warning (G_ "no packages specified; creating an empty environment~%")))

        ;; Use the bootstrap Guile when requested.
        (parameterize ((%guile-for-build
                        (and store-needed?
                             (package-derivation
                              store
                              (if bootstrap?
                                  %bootstrap-guile
                                  (default-guile))
                              system))))
          (run-with-store store
            ;; Containers need a Bourne shell at /bin/sh.
            (mlet* %store-monad ((bash       (environment-bash container?
                                                               bootstrap?
                                                               system))
                                 (prof-drv   (pk 'prof-drv
						 (if profile
                                                     (return #f)
                                                     (manifest->derivation
                                                      manifest system bootstrap?))))
                                 (profile -> (if profile
                                                 (readlink* profile)
                                                 (derivation->output-path prof-drv)))
                                 (gc-root -> (assoc-ref opts 'gc-root))
				 )

	      ;; (return prof-drv)

              ;; First build the inputs.  This is necessary even for
              ;; --search-paths.  Additionally, we might need to build bash for
              ;; a container.
              (mbegin %store-monad
                (mwhen (pk 'store-need store-needed?)
                  (built-derivations (pk
				      'building-derivations
				      (append
				       (if prof-drv (list prof-drv) '())
				       (if (derivation? bash) (list bash) '())))))
                (mwhen gc-root
                  (register-gc-root profile gc-root))

                (mwhen (assoc-ref opts 'check?)
                  (return
                   (if container?
                       (warning (G_ "'--check' is unnecessary \
when using '--container'; doing nothing~%"))
                       (validate-child-shell-environment profile manifest))))

                (cond
                 ((assoc-ref opts 'search-paths)
                  (show-search-paths profile manifest #:pure? pure?)
                  (return #t))
                 (container?
                  (let ((bash-binary
                         (if bootstrap?
                             (derivation->output-path bash)
                             (string-append (derivation->output-path bash)
                                            "/bin/sh"))))
                    (launch-environment/container #:command command
                                                  #:bash bash-binary
                                                  #:user user
                                                  #:user-mappings mappings
                                                  #:profile profile
                                                  #:manifest manifest
                                                  #:white-list white-list
                                                  #:link-profile? link-prof?
                                                  #:network? network?
                                                  #:map-cwd? (not no-cwd?)
                                                  #:emulate-fhs? emulate-fhs?
                                                  #:nesting? nesting?
                                                  #:symlinks symlinks
                                                  #:setup-hook
                                                  (and emulate-fhs?
                                                       setup-fhs))))

                 (else
                  (return
                   (exit/status
                    (launch-environment/fork command profile manifest
                                             #:white-list white-list
                                             #:pure? pure?))))))
	      )))))))

(define (get-pkg)
  (begin
    (format #t "Attemtping spec->package~%")
    (pk
     'pkg-from-spec
     (specification->package "ros-humble-clearpath-desktop"))))

;; (define (get-manifest)
;;   (package->manifest-entry/raw (pk 'mainpkg (get-pkg))))

(define opts (parse-args '("ros-humble-rviz2" "-v3")))

(define-public (get-env)
  (guix-environment* opts))

;; (define info-dir-file (first %default-profile-hooks))

(define op/respkg* (store-lift options/resolve-packages))

(define manif
  (delay
    (run-with-store (open-connection)
      (op/respkg* opts))))

;; (define manif-val (force manif))

(define (do-info-hook)
  (info-dir-file (op/respkg* opts)))


(define (manifest-inputs manifest)
  "Return a list of <gexp-input> objects for MANIFEST."
  (define entry->input
    (memoize
     (match-lambda
       (($ <manifest-entry> name version output thing deps)
	;; THING may be a package or a file name.  In the latter case, assume
	;; it's already valid.
	(cons (gexp-input thing output)
              (append-map entry->input deps))))))

  (append-map entry->input (manifest-entries manifest)))



(define* (info-dir-file manifest #:optional system)
  "Return a derivation that builds the 'dir' file for all the entries of
MANIFEST."
  (define texinfo			;lazy reference
    (module-ref (resolve-interface '(gnu packages texinfo)) 'texinfo))
  (define gzip				;lazy reference
    (module-ref (resolve-interface '(gnu packages compression)) 'gzip))
  (define libc-utf8-locales-for-target	;lazy reference
    (module-ref (resolve-interface '(gnu packages base))
                'libc-utf8-locales-for-target))

  (define build
    (with-imported-modules '((guix build utils))
      #~(begin
          (use-modules (guix build utils)
                       (srfi srfi-1) (srfi srfi-26)
                       (ice-9 ftw))

          (define (info-file? file)
            (or (string-suffix? ".info" file)
                (string-suffix? ".info.gz" file)))

          (define (info-files top)
            (let ((infodir (string-append top "/share/info")))
              (map (cut string-append infodir "/" <>)
                   (or (scandir infodir info-file?) '()))))

          (define (info-file-language file)
            (let* ((base (if (string-suffix? ".gz" file)
                             (basename file ".info.gz")
                             (basename file ".info")))
                   (dot  (string-rindex base #\.)))
              (if dot
                  (string-drop base (+ 1 dot))
                  "en")))

          (define (install-info info)
            (let ((language (info-file-language info)))
              ;; We need to choose a valid locale for $LANGUAGE to be honored.
              (setenv "LC_ALL" "en_US.utf8")
              (setenv "LANGUAGE" language)
              (zero?
               (system* #+(file-append texinfo "/bin/install-info")
                        info
                        (apply string-append #$output "/share/info/dir"
                               (if (string=? "en" language)
                                   '("")
                                   `("." ,language)))))))

          (setenv "PATH" (string-append #+gzip "/bin")) ;for info.gz files
          (setenv "GUIX_LOCPATH"
                  #+(file-append (libc-utf8-locales-for-target system)
                                 "/lib/locale"))

          (mkdir-p (string-append #$output "/share/info"))
          (exit (every install-info
                       (append-map info-files
                                   '#$(manifest-inputs manifest)))))))

  build
  
  ;; (pk 'info-drv
  ;;  (gexp->derivation "info-dir" build
  ;;                    #:system system
  ;;                    #:local-build? #t
  ;;                    #:substitutable? #f
  ;; 		     #:graft? #f
  ;;                    #:properties
  ;;                    `((type . profile-hook)
  ;; 		       (hook . info-dir))))
  )

(define <gexp>        (@@ (guix gexp) <gexp>))
(define <gexp-input>  (@@ (guix gexp) <gexp-input>))
(define %gexp-input  (@@ (guix gexp) %gexp-input))
(define lookup-compiler  (@@ (guix gexp) lookup-compiler))
(define gexp-references  (@@ (guix gexp) gexp-references))
(define <gexp-output> (@@ (guix gexp) <gexp-output>))

(define (interesting? obj)
  (or (file-like? obj)
      (and (string? obj) (direct-store-path? obj))))

(define itercount 0)

(define handle-obj
  (mlambda (obj n?)
    (pk 'itercount itercount)
    (match obj
      ((? gexp-input? x) (%gexp-input
			  (gexp-input-thing (pk 'thing x))
			  (gexp-input-output x)
			  n?))
      ((? interesting? x) (%gexp-input (pk 'interesting x) "out" n?))
      ((? gexp? x)        (gexp-inputs x))
      (_                  #f))))

(use-modules (guix sets))

(define seen-set (set))

(define (seen? ref)
  (set-contains? seen-set ref))

(define (fold/tree proc seed lst)
  "Like 'fold', but recurse into sub-lists of LST and accept improper lists."
  (let loop ((obj lst)
	     (result seed))
    (set! itercount (+ 1 itercount))
    (match obj
      ((? seen?) result)
      (((? seen?) . tail)
       (loop tail result))
      ((head . tail)
       (set! seen-set (set-insert head seen-set))
       (loop tail (loop head result)))
      (_
       (proc obj result)))))

(define (gexp-inputs exp)
  "Return the list of <gexp-input> for EXP."
  (define set-gexp-input-native?
    (match-lambda
      (($ <gexp-input> thing output)
       (%gexp-input thing output #t))))

  ;; (define (parse-term term)
  ;;   (match term
  ;;     ((? symbol? sym) )))
  
  ;; (define (parse-sexp exp)
  ;;   (match exp
  ;;     ((hd . tl)
  ;;      )))
  
  (define (parse-ref ref)
    (match ref
      (($ <gexp-input> (? gexp? gexp))
       (gexp->approximate-sexp gexp))
      (($ <gexp-input> (? string? str))
       str)
      (($ <gexp-input> (? struct? thing) output n?)
       thing)
      (($ <gexp-input> (? pair? sexp) output n?)
       (parse-ref (gexp-input #~#$sexp #f)))
      (($ <gexp-output> (? string? out))
       `(output ,out))))
  
  (define (add-reference-inputs ref result)
    (match ref
      ((? seen?) result)
      (($ <gexp-input> (? gexp? exp) _ #t)
       (append (map set-gexp-input-native? (gexp-inputs exp))
	       result))
      (($ <gexp-input> (? gexp? exp) _ #f)
       (append (gexp-inputs exp) result))
      (($ <gexp-input> (? string? str))
       (if (direct-store-path? str)
           (begin (set! seen-set (set-insert ref seen-set))
		  (cons ref result))
           result))
      (($ <gexp-input> (? struct? thing) output n?)
       (if (lookup-compiler thing)
           ;; THING is a derivation, or a package, or an origin, etc.
	   (begin
	     (set! seen-set (set-insert ref seen-set))
             (cons ref result))
           result))
      (($ <gexp-input> (? pair? lst) output n?)
       ;; XXX: Scan LST for inputs.  Inherit N?.
       (pk 'folding)
       (fold/tree (lambda (obj result)
		    (if (seen? obj)
			result
			(match (handle-obj obj n?)
			  (#f result)
			  ((? list? res) (begin
					   (set! seen-set
						 (fold (lambda (r s)
							 (set-insert r s))
						       seen-set
						       res))
					   (append res obj)))
			  (res (begin
				 (set! seen-set (set-insert res seen-set))
				 (cons res obj))))))
		  result
		  lst))
      (_
       ;; Ignore references to other kinds of objects.
       result)))
  
  (let ((refs (gexp-references exp)))
    (for-each
     (lambda (r)
       (format (current-error-port) "ref: `~y'~%" (parse-ref r)))
     refs)
    (fold-right add-reference-inputs
		'()
		refs)))

(use-modules (statprof)
	     (ice-9 pretty-print))

;; (define info-drv-gexp (info-dir-file manif-val "x86_64-linux"))

;; (statprof (lambda () (gexp-inputs info-drv-gexp)))

(define get-entries
  (lambda ()
    (pretty-print
     (manifest-entry-dependencies
      (package->manifest-entry (get-pkg)))
     ;; (match (first
     ;; 	     (vhash-fold
     ;; 	      (lambda (k v res) (cons (cons k v) res))
     ;; 	      '()
     ;; 	      (package->depmap (pk 'mainpkg (get-pkg)))))
     ;;   ((and self
     ;; 	     ((pkg . out)
     ;; 	      .
     ;; 	      ($ <manifest-entry> name version output thing deps)))
     ;; 	(begin
     ;; 	  ;; (force deps)
     ;; 	  self)))
     )))

;; (get-entries)
(statprof get-entries #:hz 1000)

;; (define (mkdrv)
;;  (run-with-store (open-connection)
;;    (with-build-handler (build-notifier
;; 			#:use-substitutes? #f
;; 			#:verbosity 3
;; 			#:dry-run? #f)
;;      (with-status-verbosity 3
;;        info-drv-monadic))))

;; (statprof get-manifest)
;; (statprof get-builder)
;; (statprof do-info-hook)

;; (get-env)

;; (display
;;  (manifest-entry-name (man)))
