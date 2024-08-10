(use-modules
 (gnu packages)
 (guix discovery)
 (guix diagnostics)
 ;; (guix modules)

 (ice-9 match)
 ;; (ice-9 format)
 (ice-9 vlist)
 

 ;; (ice-9 threads)
 (srfi srfi-1)
 ;; (srfi srfi-41)
 )


;; (fold-available-packages (lambda (name vers res . _)
;; 			   (cons name res)) '())
;; (fold-packages cons '())

;;; TIME: 1.264s
;; (fold-module-public-variables cons '() (all-modules (%package-module-path)))

;;; TIME: 1.171s
;; (define (fold-module-public-variables-par proc init modules)
;;   "Call (PROC OBJECT RESULT) for each variable exported by one of MODULES,
;; using INIT as the initial value of RESULT.  It is guaranteed to never traverse
;; the same object twice."

;;   (n-par-map 12 (lambda (module)
;; 		  ;; (map proc (module-map
;; 		  ;; 		 (lambda (sym var)
;; 		  ;; 		   (false-if-exception (variable-ref var)))
;; 		  ;; 		 module))
;; 		  (car
;; 		   (fold (lambda (obj res+seen)
;; 			   (match res+seen
;; 			     ((res . seen)
;; 			      (if (not (vhash-assq obj seen))
;; 				  (cons (cons obj res)
;; 					(vhash-consq obj #t seen))
;; 				  (cons res seen)))))
;; 			 (cons '() vlist-null)
;; 			 (module-map (lambda (sym var)
;; 				       (false-if-exception (variable-ref var)))
;; 				     module))))
;; 	     modules))

;;; TIME: 1.163s
;; (all-modules (%package-module-path))
;; (fold-modules cons '()  (%package-module-path))

;; (define* (scheme-modules directory #:optional sub-directory
;;                          #:key (warn (const #f)))
;;   "Return the list of Scheme modules available under DIRECTORY.
;; Optionally, narrow the search to SUB-DIRECTORY.

;; WARN is called when a module could not be loaded.  It is passed the module
;; name and the exception key and arguments."
;;   (define prefix-len
;;     (string-length directory))

;;   ;; Hide Guile warnings such as "source file [...] newer than compiled" when
;;   ;; loading user code, unless we're hacking on Guix proper.  See
;;   ;; <https://issues.guix.gnu.org/43747>.
;;   (parameterize ((current-warning-port (if (getenv "GUIX_UNINSTALLED")
;;                                            (current-warning-port)
;;                                            (%make-void-port "w"))))
;;     (filter-map (lambda (file)
;;                   (let* ((relative (string-drop file prefix-len))
;;                          (module   (file-name->module-name relative)))
;;                     (catch #t
;;                       (lambda ()
;;                         (resolve-interface module))
;;                       (lambda args
;;                         ;; Report the error, but keep going.
;;                         (warn file module args)
;;                         #f))))
;;                 (scheme-files (if sub-directory
;;                                   (string-append directory "/" sub-directory)
;;                                   directory)))))

;; (define* (fold-modules-fast proc init path #:key (warn (const #f)))
;;   "Fold over all the Scheme modules present in PATH, a list of directories.
;; Call (PROC MODULE RESULT) for each module that is found."
;;   (fold (lambda (spec result)
;;           (match spec
;;             ((? string? directory)
;;              (fold proc result (scheme-modules directory)))
;;             ((directory . sub-directory)
;;              (fold proc result
;;                    (scheme-modules directory sub-directory)))))
;;         '()
;;         path))

(define* (fold-modules* proc init path #:key (warn (const #f)))
  "Fold over all the Scheme modules present in PATH, a list of directories.
Call (PROC MODULE RESULT) for each module that is found."
  (fold (lambda (spec result)
          (match spec
            ((? string? directory)
             (fold proc result (scheme-modules* directory)))
            ((directory . sub-directory)
             (fold proc result
                   (scheme-modules* directory sub-directory)))))
        '()
        path))

;; (use-modules (statprof))

;; (set! %load-hook #f)

(define (call-with-autoload-filemap autoload-filemap thunk)

  ;; (define autoload-hashmap-map
  ;;   (map (match-lambda
  ;; 	   ((((? symbol? fst) . rest) . filename)
  ;; 	    (cons fst (cons rest filename))))
  ;; 	 autoload-filemap)
  ;;   (alist->vhash autoload-filemap))

  (define autoload-hashmap (alist->vhash autoload-filemap))
  
  (define try-module-autoload*
    try-module-autoload)
  (define (try-module-autoload-wrapper name . rest)
    (match (vhash-assoc name autoload-hashmap)
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

;; (let ((mkprom make-promise))
;;   (set! make-promise (lambda (exp)
;; 		       ;; (backtrace)
;; 		       (mkprom exp))))

(when #f
  (let ((real symbol-append)
	(count 0)
	(license-cache vlist-null)
	(gnu-cache vlist-null)
	(l-cache vlist-null))
    (set! symbol-append
	  (lambda syms
	    (match syms
	      (('license: sym)
	       (match (vhash-assq sym license-cache)
		 (#f (let ((newsym (apply real syms)))
		       ;; (pk 'miss sym newsym)
		       (set! license-cache (vhash-consq sym newsym license-cache))
		       newsym))
		 ((_ . fullsym) fullsym)))
	      (('gnu: sym)
	       (match (vhash-assq sym gnu-cache)
		 (#f (let ((newsym (apply real syms)))
		       ;; (pk 'miss sym newsym)
		       (set! gnu-cache (vhash-consq sym newsym gnu-cache))
		       newsym))
		 ((_ . fullsym) fullsym)))
	      (('l: sym)
	       (match (vhash-assq sym l-cache)
		 (#f (let ((newsym (apply real syms)))
		       ;; (pk 'miss sym newsym)
		       (set! l-cache (vhash-consq sym newsym l-cache))
		       newsym))
		 ((_ . fullsym) fullsym)))
	      (_
	       ;; (pk 'fullmiss syms)
	       (apply real syms)))))))


(use-modules (guix packages))
(define (fold-available-packages proc init)
  "Fold PROC over the list of available packages.  For each available package,
PROC is called along these lines:

  (PROC NAME VERSION RESULT
        #:outputs OUTPUTS
        #:location LOCATION
        …)

PROC can use #:allow-other-keys to ignore the bits it's not interested in.
When a package cache is available, this procedure does not actually load any
package module."
  (define cache #f
    ;; (load-package-cache (current-profile))
    )

  (if (and cache (cache-is-authoritative?))
      (vhash-fold (lambda (name vector result)
                    (match vector
                      (#(name version module symbol outputs
                              supported? deprecated?
                              file line column)
                       (proc name version result
                             #:outputs outputs
                             #:location (and file
                                             (location file line column))
                             #:supported? supported?
                             #:deprecated? deprecated?))))
                  init
                  cache)
      (fold-packages (lambda (package result)
                       (proc (package-name package)
                             (package-version package)
                             result
                             #:outputs (package-outputs package)
                             #:location (package-location package)
                             ;; #:supported?
                             ;; (->bool (supported-package? package))
                             #:deprecated?
                             (->bool
                              (package-superseded package))
			     ))
                     init)))

(set! %load-hook #f)

(gc-disable)
((@@ (statprof) statprof)
 ;; lambda ()
 ;; call-with-autoload-filemap
 ;; guix-module-union-filemap
 (lambda ()
   ;; for-each
   ;; (match-lambda
   ;;   ((name vers outs loc)
   ;;    (format #t "~30a ~30a ~30a ~30a~%"
   ;; 	      name vers (string-join outs ",") (location->string loc))))
   (for-each
    (match-lambda
      ((name vers outputs location)
       (display
	(string-append
	 (string-join
	  (list name vers ;; (string-join outputs ",") (location->string location)
		)
	  "\t")
	 "\n"))
       ;; (format #t "~a~/~a~/~a~/~a~%"
       ;; 	       name vers (string-join outputs ",") (location->string location))
       ))
    (fold-available-packages
     (lambda* (name vers res #:key outputs location #:allow-other-keys)
       (cons (list name vers outputs location)
	     res))
     '()))))
;; (map resolve-interface (fold-modules* cons '()  (%package-module-path)))
;; (fold-module-public-variables cons '() (all-modules (%package-module-path)))
;; (fold-packages cons '())

;; #:hz 10000
(gc-enable)
;; (gc)

;; (for-each
;;  (lambda _
;;    (fold-module-public-variables-par identity '() (all-modules (%package-module-path))))
;;  (iota 50))
