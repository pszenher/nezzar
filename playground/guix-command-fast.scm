(use-modules ;; (system vm loader)
	     ;; (system vm trace)
	     ;; (system vm program)
	     ;; (ice-9 control)
	     ;; (ice-9 format)
 ((ice-9 match) #:select (match match-lambda))
	     ;; (ice-9 threads)
	     ;; (srfi srfi-1)
	     ;; (srfi srfi-26)
	     )

(assert-load-verbosity #t)

;; (define (bvs) (load-compiled "guix-module-cache.go"))
;; (define tagged-thnks (map (match-lambda
;; 			    ((file . bv) (cons (string->symbol file) (load-thunk-from-memory bv))))
;; 			  bvs))

;; (define (program-file-dependencies prog filename)
;;   (match prog
;;     ((? program? (= program-sources src-lst))
;;      (delete-duplicates
;;       (remove
;;        (cut eq? filename <>)
;;        (map (match-lambda
;; 	      ((_ (? string? filename) . _) (string->symbol filename)))
;; 	    src-lst))))))

;; (for-each
;;  (lambda (thunk)
;;    ;; (format #t ";;; loading ~a~%" thunk)
;;    (save-module-excursion
;;     (match-lambda
;;       ((file-sym . thunk)
;;        (set-current-module (make-fresh-user-module))
;;        (thunk)))))
;;  tagged-thnks)

;; ((@@ (guix ui) guix-main) "guix" "--help")

;; (define (process-module-thunk file thunk loaded)
;;   (let* ((tag (make-symbol "cached-module-loader"))
;; 	 (try-module-autoload-real try-module-autoload)
;; 	 (try-module-autoload-stub
;; 	  (lambda (name . rest)
;; 	    (let ((filename (string-append (string-join (map symbol->string name) "/") ".go")))
;; 	      ;; (format #t ";;; check  ~s~%" filename)
;; 	      (match (assoc (string->symbol filename) tagged-thnks)
;; 		(#f
;; 		 ;; (format #t ";;; allow  ~a~%" filename)
;; 		 (apply try-module-autoload-real name rest))
;; 		(((? symbol? file) . (? thunk? thunk))
;; 		 ;; (format #t ";;; handle ~a~%" file)
;; 		 (process-module-thunk file thunk loaded)
;; 		 ;; (format #t ";;; loaded ~s~%" file)
;; 		 #t)
;; 		;; (file+thunk
;; 		;;  ;; (pk 'adding-dep file file+thunk)
;; 		;;  (if (suspendable-continuation? tag)
;; 		;;      (begin
;; 		;;        (abort-to-prompt tag file+thunk)
;; 		;;        #t)
;; 		;;      (begin
;; 		;;        (pk "Cannot resume from continuation on package" file)
;; 		;;        (error "Can't abort w/o leaving paritally loaded state, exiting")))
;; 		;;  ;; FIXME: aborting seems to leave some modules in a partially-loaded state, which breaks (in order of appearance):
;; 		;;  ;; - (guix build-system python): search-auxiliary-paths from (gnu packages) isn't bound
;; 		;;  ;; - (guix monads): the `define-once' statement doesn't bind properly
;; 		;;  (abort-to-prompt tag file+thunk))
;; 		))))
;; 	 (resolve-module-real resolve-module)
;; 	 (resolve-module-stub (lambda (name . rest)
;; 				;; (when (match name
;; 				;; 	(('guix . _) #t)
;; 				;; 	(('gnu  . _) #t)
;; 				;; 	(_ #f))
;; 				;;   (format #t ";;; resolve-module: ~a, ~a~%" name rest))
;; 				(apply resolve-module-real name rest))))
;;     (if (or (resolve-module
;; 	     (match (reverse (string-split (symbol->string file) #\/))
;; 	       ((file . rest)
;; 		;; pk 'res?
;; 		(reverse
;; 		 (map string->symbol (cons (basename file ".go") rest)))))
;; 	     #f #:ensure #f))
;; 	#t
;; 	(call-with-module-autoload-lock
;; 	 (lambda ()
;; 	   ;; call-with-prompt tag
;; 	   ;; lambda ()
;; 	   (dynamic-wind
;; 	     (lambda ()
;; 	       (set! try-module-autoload try-module-autoload-stub)
;; 	       (set! resolve-module resolve-module-stub))
;; 	     (lambda ()
;; 	       ;; (format #t ";;; try    ~s~%" file)
;; 	       (save-module-excursion
;; 		(lambda ()
;; 		  (set-current-module (make-fresh-user-module))
;; 		  (thunk)))
;; 	       #t)
;; 	     (lambda ()
;; 	       (set! try-module-autoload try-module-autoload-real)
;; 	       (set! resolve-module resolve-module-real)))
;; 	   ;; (lambda (cont file+thunk) (cons cont file+thunk))
;; 	   )))))

;; (define (do-resolve)
;;   (let loop ((to-load (alist-delete 'guix/monads.scm tagged-thnks))
;; 	     (loaded   '())
;; 	     (deferred '()))
;;     (let ((loaded?   (cut member <> loaded))
;; 	  (deferred? (cut member <> deferred)))
;;       (match to-load
;; 	(() #t)
;; 	;; (((? thunk? cont) . rest)
;; 	;;  (match (process-module-thunk cont cont)
;; 	;;    (#t (loop rest
;; 	;; 	     (cons file loaded)
;; 	;; 	     (delete file deferred)))))
;; 	((((? symbol? file) . thunk) . rest)
;; 	 ;; (pk 'file file)
;; 	 (let* ((dep-tagged-thnks
;; 		 (filter-map
;; 		  (cut assoc <> tagged-thnks)
;; 		  (program-file-dependencies thunk file)))
;; 		(dep-files (map car dep-tagged-thnks)))
;; 	   ;; cond
;; 	   ;; ((loaded? file)
;; 	   ;;  (format #t ";;; cached ~s~%" file)
;; 	   ;;  (loop rest loaded deferred))
;; 	   ;; ((any deferred? dep-files) (error "ERR: Dependency loop!" file))
;; 	   ;; (every loaded? dep-files)
;; 	   (match (process-module-thunk file thunk loaded)
;; 	     (#t
;; 	      ;; (format #t ";;; LOAD:  ~a ~%" file)
;; 	      (loop rest
;; 		    (cons file loaded)
;; 		    (delete file deferred)))
;; 	     (((? thunk? cont) . (and file+thunk ((? symbol? filename) . (? procedure?))))
;; 	      ;; (format #t ";;; defer-cont  ~a for ~s ~%" cont filename)
;; 	      (loop (cons
;; 		     ;; push prerequisite to to-load stack
;; 		     file+thunk
;; 		     (cons
;; 		      ;; replace current file+thunk in to-load with continuation
;; 		      (cons file thunk)
;; 		      rest))
;; 		    loaded
;; 		    (cons file deferred)))
;; 	     ((and file+thunk ((? symbol? filename) . (? procedure?)))
;; 	      ;; (format #t ";;; defer  ~s for ~s ~%" file filename)
;; 	      (loop (cons file+thunk to-load)
;; 		    loaded
;; 		    (cons file deferred))))
;; 	   ;; (else
;; 	   ;;  (format #t ";;; ERROR: UNREACHABLE STATE ~s~%" file)
;; 	   ;;  (error file)
;; 	   ;;  ;; (loop (append dep-tagged-thnks to-load) loaded (cons file deferred))
;; 	   ;;  )
;; 	   ))))))

;; (do-resolve)


;; (define (call-with-autoload-map autoload-map thunk)

;;   (define try-module-autoload*
;;     try-module-autoload)
;;   (define (try-module-autoload-wrapper name . rest)
;;     (let ((filename
;; 	   (string->symbol
;; 	    (string-append
;; 	     (string-join
;; 	      (map symbol->string name) "/") ".go"))))
;;       (match (assq filename autoload-map)
;; 	(#f
;; 	 ;; (pk 'allow filename)
;; 	 (apply try-module-autoload* name rest))
;; 	(((? symbol? file) . bytecode)
;; 	 ;; (pk 'override filename)
;; 	 (save-module-excursion
;; 	  (lambda ()
;; 	    (set-current-module (make-fresh-user-module))
;; 	    (((@ (system vm loader) load-thunk-from-memory) bytecode))))))))

;;   (dynamic-wind
;;     (lambda () (set! try-module-autoload try-module-autoload-wrapper))
;;     thunk
;;     (lambda () (set! try-module-autoload try-module-autoload*))))

(define (call-with-autoload-filemap autoload-filemap thunk)

  (define try-module-autoload*
    try-module-autoload)
  (define (try-module-autoload-wrapper name . rest)
    (match (assoc name autoload-filemap)
      (#f
       (pk 'allow name)
       (apply try-module-autoload* name rest))
      ((_ . (? string? abspath))
       ;; (pk 'override name)
       (let ((thunk ((@ (system vm loader) load-thunk-from-file) abspath))) 
	 (save-module-excursion
	  (lambda ()
	    (set-current-module (make-fresh-user-module))
	    (thunk)))))))

  (dynamic-wind
    (lambda () (set! try-module-autoload try-module-autoload-wrapper))
    thunk
    (lambda () (set! try-module-autoload try-module-autoload*))))

(define guix-module-union-filemap
  (load-compiled "guix-module-filemap.go"))

(define guix-command-lst
  (load-compiled "guix-commands.go"))

;; (define guix-commands-lst
;;   (map (lambda (cmd) (apply (@@ (guix ui) command) (cdr cmd)))
;;    ;; (match-lambda
;;    ;;   (('command command-name synopsis category)
;;    ;;    ((@@ (guix ui) command) command-name synopsis category)))
;;    (load-compiled "guix-commands.go")))

(define (do-load)
  (call-with-autoload-filemap
   guix-module-union-filemap
   (lambda ()
     (begin
       (set! (@@ (guix ui) commands)
	     (const
	      (map (lambda (cmd) (apply (@@ (guix ui) command) (cdr cmd)))
		   ;; (match-lambda
		   ;;   (('command command-name synopsis category)
		   ;;    ((@@ (guix ui) command) command-name synopsis category)))
		   guix-command-lst)))
       
       ((@@ (guix ui) guix-main) "guix" "--help")))))

(do-load)

;; (use-modules (statprof))
;; (do-load)
;; (statprof do-load #:count-calls? #t #:hz 5000 #:display-style 'tree)
;; (call-with-trace do-load #:calls? #t #:width 200)

;; ((@ (guix ui) guix-main) "guix" "--help")
