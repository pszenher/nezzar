(define-module (nezzar build lake-build-system)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-9 gnu)
  #:use-module (srfi srfi-26)
  
  #:use-module ((guix build gnu-build-system) #:prefix gnu:)
  #:use-module (guix build utils)
  #:use-module (json)

  #:export (json->manifest.json
	    manifest.json?
	    manifest.json-version
	    manifest.json-name
	    manifest.json-lake-dir
	    manifest.json-packages-dir
	    manifest.json-packages

	    package-entry?
	    package-entry-name
	    package-entry-scope
	    package-entry-inherited
	    package-entry-config-file
	    package-entry-manifest-file
	    package-entry-type
	    package-entry-dir
	    package-entry-url
	    package-entry-rev
	    package-entry-input-rev
	    package-entry-subdir

	    lake-srcdir->installdir
	    
	    %standard-phases
	    lake-build))

(define optional
  (match-lambda*
    ((? procedure? proc)
     (match-lambda
       ((? unspecified? val) val)
       ((= proc res)         res)))
    (((? procedure? proc) default)
     (match-lambda
       ((? unspecified? val) default)
       ((= proc res)             res)))))

(define required
  (match-lambda*
    (()
     (match-lambda
       ((? unspecified?) (error "Required value was not passed"))
       (val val)))
    ((? procedure? pred)
     (match-lambda
       ((? unspecified?) (error "Required value was not passed"))
       ((? pred val) val)
       (val (error "Passed value failed to satisfy required predicate" val pred))))))

(define (list-of proc)
  (match-lambda
    ((? unspecified?) '())
    ((or (? list?   val)
	 (? vector? (= vector->list val)))
     (map proc val))))

(define (vector-of proc)
  (compose list->vector (list-of proc)))

(define* (unspecify val #:optional (= equal?))
  (lambda (v)
    (if (= v val) *unspecified* v)))

(define-json-mapping <manifest.json> %make-manifest.json manifest.json?
  json->manifest.json <=> manifest.json->json
  <=>
  sexp->manifest.json <=> manifest.json->sexp

  (version       manifest.json-version      "version"     )
  (name          manifest.json-name         "name"        (optional identity #f)         (unspecify #f))
  (lake-dir      manifest.json-lake-dir     "lakeDir"     (optional identity #f)         (unspecify #f))
  (packages-dir  manifest.json-packages-dir "packagesDir" (optional identity #f)         (unspecify #f))
  (packages      manifest.json-packages     "packages"    (list-of  json->package-entry) (vector-of package-entry->sexp)))

(define-json-mapping <package-entry> %make-package-entry package-entry?
  json->package-entry <=> package-entry->json
  <=>
  sexp->package-entry <=> package-entry->sexp
  
  (name                 package-entry-name)
  (scope                package-entry-scope)
  (inherited            package-entry-inherited)
  (config-file          package-entry-config-file       "configFile")
  (manifest-file        package-entry-manifest-file     "manifestFile" )
  (type                 package-entry-type)
  (dir                  package-entry-dir)
  (url                  package-entry-url)
  (rev                  package-entry-rev)
  (input-rev            package-entry-input-rev         "inputRev")
  (subdir               package-entry-subdir            "subDir"))

(set-record-type-printer!
 <manifest.json>
 (lambda (rec port)
   (match rec
     (($ <manifest.json> vers name lakedir pkgdir pkgs)
      (format port "#<<manifest.json:v~a> name: ~s lakedir: ~s pkgdir: ~s pkgs: ~s"
	      vers name lakedir pkgdir (map package-entry-name pkgs))))))

(define git-package-entry?
  (match-lambda
    ((= package-entry-type "git") #t)
    (_ #f)))

(define local-package-entry?
  (match-lambda
    ((= package-entry-type "path") #f)
    (_ #f)))

(define (record->alist record)
  (let* ((rtd  (record-type-descriptor record))
	 (flds (record-type-fields rtd))
	 (accs (map (cut record-accessor rtd <>) flds)))
    (map
     (lambda (fld getval)
       (cons fld (getval record)))
     flds accs)))

(define (alist->record rtd alist)
  (let* ((ctr  (record-type-constructor rtd))
	 (flds (record-type-fields rtd))
	 (alist* (map (lambda (fld)
			(match (assoc fld alist)
			  (#f (error "Passed alist is missing record field:" fld))
			  ((_ . val) (cons fld val))))
		      flds)))
    (apply ctr (map cdr alist*))))

(define (override-fields rec . kwargs)
  (define rtd (record-type-descriptor rec))
  (let loop ((alist (record->alist rec))
	     (kwargs kwargs))
    (match kwargs
      (()
       (alist->record rtd alist))
      (((? keyword? kw) val . rest)
       (loop `((,(keyword->symbol kw) . ,val)
	       .
	       ,alist)
	     rest))
      ((notkw . rest)
       (error "Non-keyword argument in kwarg position:" notkw rest))
      (((? keyword? kw))
       (error "Missing value for final keyword argument:" kw)))))

(define %lake-manifest-path "./lake-manifest.json")
(define %lake-package-install-dir "./share/lean/lake")
(define (%lake-versioned-install-path lean-version)
  (string-append %lake-package-install-dir "/" lean-version))

(define* (lake-srcdir->installdir
	  srcdir #:key outdir lean-version)
  (let ((manif-path (string-append srcdir "/" %lake-manifest-path)))
    (if (not (file-exists? manif-path))
	(error "lake-manifest file not found at expected path, cannot determine package name for install"
	       manif-path)
	(let* ((manif-path (canonicalize-path manif-path))
	       (manif (call-with-input-file manif-path json->manifest.json))
	       (lake-name (manifest.json-name manif)))
	  (string-append
	   outdir "/share/lean/lake/" lean-version "/" lake-name)))))

(define (package-entry-remap entry inputs relpath)
  (match entry
    (($ <package-entry> name scope)
     (let ((target-name (string-append "lean-" scope "/" name)))
       (match (assoc target-name inputs)
	 (#f
	  (error "Failed to find remap of lake package in inputs:"
		 target-name inputs))
	 ((_ . (? string? pkgpath))
	  (let ((pkg-dir (string-append pkgpath "/" relpath "/" name)))
	    (if (file-exists? pkg-dir)
		(override-fields
		 entry
		 #:type "path"
		 #:dir
		 ;; XXX: should error and report properly if canonicalization fails
		 (canonicalize-path pkg-dir))
		(error "lake manifest dependency pkg dir does not exist:" pkg-dir)))))))))

(define* (manifest.json-remap manif inputs #:key (relpath "./."))
  (override-fields
   manif
   #:packages
   (map
    (cut package-entry-remap <> inputs relpath)
    (manifest.json-packages manif))))

(define* (patch-lake-manifest.json #:key inputs lean-version #:allow-other-keys)
  (if (not (file-exists? %lake-manifest-path))
      (format (current-warning-port)
	      "warn: lake-manifest file not found at expected path '~a', continuting..."
	      %lake-manifest-path)
      (let* ((manif-path (canonicalize-path %lake-manifest-path))
	     (manif (call-with-input-file manif-path json->manifest.json))
	     (manif* (manifest.json-remap
		      manif inputs
		      #:relpath (%lake-versioned-install-path lean-version))))
	(if (equal? manif manif*)
	    (format (current-error-port)
		    "Note: Patched manifest would be equivalent to current, nothing to do~%")
	    (call-with-output-file manif-path
	      (lambda (port)
		(scm->json
		 (manifest.json->sexp manif*)
		 port
		 #:pretty #t)))))))

(define (splice-when condition val)
    "Helper procedure for conditional list splicing.  Returns the empty
list if COND is #f, otherwise returns the singleton value to be spliced
wrapped in a list: (list VAL)."
  (if condition (list val) '()))

(define (splice? val)
    "Helper procedure for conditional list splicing.  Returns the empty
list if VAL is #f, otherwise returns the singleton value to be spliced
wrapped in a list: (list VAL)."
  (if val (list val) '()))

(define (splice=> val proc)
    "Helper procedure for conditional list splicing.  Returns the empty
list if VAL is #f, otherwise returns the value returned by (PROC VAL)
wrapped in a list: (list (PROC VAL))."
    (if val (list (proc val)) '()))

(define (splice-list-when condition lst)
  "Helper procedure for conditional list splicing.  Returns the empty
list if COND is #f, otherwise returns list LST.

Raises an error if the value of LST is not a list."
  (cond
   ((not (list? lst))
    (error "splice-list-when: expected list:" lst))
   (condition lst)
   (else      '())))

(define (lake-tests-configured?)
  (let ((status (system* "lake" "check-test")))
    (match (status:exit-val status)
      (0 #t)
      (1 #f)
      ((? integer? errval)
       (error "Expected a 0 or 1 return code from 'lake check-test', got:" errval))
      (val
       (error "Expected an integer return code from 'lake check-test', got:" val)))))

(define* (check
	  #:key
	  (tests? #t)
	  (test-flags '())
	  (test-exec-flags '())
	  #:allow-other-keys)
  (cond
   ((not tests?)
    (format #t "test suite not run~%"))
   ((not (lake-tests-configured?))
    (format #t "lake test suite not configured, no tests to run~%"))
   (else
    (apply invoke "lake"
	   `( ;; Pre-verb flags
	     "--verbose"

	     ;; Build verb
	     "test"
	     ,@test-flags
	     "--"
	     ,@test-exec-flags)))))

(define* (build #:key
		outputs
		(build-targets '())
		(build-flags '())
		(build-in-output? #f)
		lean-version
		#:allow-other-keys)
  (let*
      ((srcdir (getcwd))
       (out (assoc-ref outputs "out"))
       (args
	`(
	  ;; Pre-verb flags
	  "--verbose"

	  ;; FIXME: there has to be some way to set this for the
	  ;; default target...
	  ;;
	  ;; if not, snag the target names from TOML and list the
	  ;; cartesian product of them with the facet list
	  ;; 
	  ;; "-KdefaultFacets=[leanArts,shared,static]"

	  ,@build-flags
	  
	  ;; Build verb
	  "build"

	  ;; Build verb specific arguments

	  ,@build-targets)))

    (format #t "lake package source directory: ~s~%" srcdir)

    (when build-in-output?
      (let ((outdir (lake-srcdir->installdir
		     srcdir
		     #:outdir out
		     #:lean-version lean-version)))
	(format #t "`build-in-output?' enabled, copying sources for build:~%")
	(format #t "  ~s ==> ~s~%" srcdir out)
	(copy-recursively srcdir (lake-srcdir->installdir
				  srcdir
				  #:outdir out
				  #:lean-version lean-version))
	(format #t "sources copied, changing directory to outdir: ~s~%" outdir)
	(chdir outdir)))

    (apply invoke "lake" args)))

(define* (install #:key outputs lean-version build-in-output? #:allow-other-keys)
  (if build-in-output?
      (format #t "`build-in-output?' enabled, already installed, nothing to do~%")
      (let* ((out (assoc-ref outputs "out"))
	     (installdir (lake-srcdir->installdir
			  "."
			  #:outdir out
			  #:lean-version lean-version)))
	(mkdir-p installdir)
	(copy-recursively "." installdir))))

(define* (move-doc-gen4-docs #:key outputs lean-version #:allow-other-keys)
  (let* ((out (assoc-ref outputs "out"))
	 (installdir (lake-srcdir->installdir
		      "."
		      #:outdir out
		      #:lean-version lean-version))
	 (docdir-lake (string-append installdir "/.lake/build/doc"))
	 (docdir-out  (string-append out "/share/doc/DocGen4")))
    (if (file-exists? docdir-lake)
	(begin
	  (format #t "DocGen4 documentation directory found: `~a', moving to `~a'~%"
		  docdir-lake docdir-out)
	  (mkdir-p (dirname docdir-out))
	  (rename-file docdir-lake docdir-out))
	(format #t "No DocGen4 documentation directory, nothing to do~%"))))

(define %standard-phases
  ;; Bootstrap phase is purged; configure and install phases are rolled
  ;; into single `colcon' invocation in build phase
  (modify-phases gnu:%standard-phases
    (add-after 'unpack 'patch-lake-manifest.json
      patch-lake-manifest.json)
    (delete 'bootstrap)
    (delete 'configure)
    (replace 'build build)
    (replace 'check check)
    (replace 'install install)
    (add-after 'install 'move-doc-gen4-docs
      move-doc-gen4-docs)))

(define* (lake-build #:key inputs (phases %standard-phases)
		     #:allow-other-keys #:rest args)
  "Build the given package, applying all of PHASES in order."
  (apply gnu:gnu-build #:inputs inputs #:phases phases args))
