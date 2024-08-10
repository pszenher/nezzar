(use-modules
 (srfi srfi-26)
 
 (ice-9 binary-ports)
 (ice-9 format)
 (ice-9 match)
 
 ((system base compile) #:select (compile))
 (rnrs bytevectors)

 (guix build utils))

(define guix-union-path
  (string-append
   "/gnu/store/ld4xwrx7c3jg60cqyq0da69hrlrr1841-guix-module-union"
   "/lib/guile/" (effective-version) "/site-ccache"))

(define guile-ccache-path
  "/gnu/store/93jzwshnwlsijjf97ssdpw3w516cd6ja-guile-3.0.9/lib/guile/3.0/ccache")

(begin

  (let* ((guix-go-files
	  (with-directory-excursion
	      guix-union-path
	    (append
	     ;; (find-files "gnu"  ".*\\.go$" #:stat stat)
	     (find-files "guix" ".*\\.go$" #:stat stat))))
	 (guix-go-bvs
	  (with-directory-excursion
	      guix-union-path
	    (map (lambda (filename)
		   ;; FIXME: should use vectors here for efficient bytecode comp.
		   (cons
		    (string->symbol filename)
		    (call-with-input-file filename get-bytevector-all)))
		 guix-go-files))))

    ;; (format (current-error-port) "~y~%" guix-go-files)
    (format (current-error-port) "Num .go files collected: ~a~%" (length guix-go-files))
    
    (call-with-output-file "guix-module-cache.go"
      (lambda (port)
	(match (compile `'(,@guix-go-bvs)
			#:to 'bytecode
			#:opts '(#:to-file? #t))
	  ((? bytevector? bv)  (put-bytevector port bv))
	  ;; In Guile 3.0.9, the linker can return a procedure instead of
	  ;; a bytevector.  Adjust to that.
	  ((? procedure? proc) (proc port)))))))

(let* ((guile-go-files
	(with-directory-excursion
	    guile-ccache-path
	  (find-files "." ".*\\.go$" #:stat stat)))
       (closure-go-files
	(with-directory-excursion
	    guix-union-path
	  (find-files "." ".*\\.go$" #:stat stat)))
       (closure-module-map
	(map (lambda (rel-filename)
	       (cons
		(match
		    (match (reverse (string-split rel-filename #\/))
		      ((file . rest)
		       (reverse
			(map string->symbol
			     (cons (basename file ".go") rest)))))
		  (('. . module-name) module-name))
		(canonicalize-path (string-append guix-union-path "/" rel-filename))))
	     closure-go-files))
       (guile-module-map
	(map (lambda (rel-filename)
	       (cons
		(match
		    (match (reverse (string-split rel-filename #\/))
		      ((file . rest)
		       (reverse
			(map string->symbol
			     (cons (basename file ".go") rest)))))
		  (('. . module-name) module-name))
		(canonicalize-path (string-append guile-ccache-path "/" rel-filename))))
	     guile-go-files))
       (final-module-map (append guile-module-map closure-module-map)))
  (format (current-error-port) "Num .go files collected: ~a~%" (length final-module-map))

  (call-with-output-file "guix-module-filemap.go"
    (lambda (port)
      (match (compile `'(,@final-module-map)
		      #:to 'bytecode
		      #:opts '(#:to-file? #t))
	((? bytevector? bv)  (put-bytevector port bv))
	;; In Guile 3.0.9, the linker can return a procedure instead of
	;; a bytevector.  Adjust to that.
	((? procedure? proc) (proc port))))))


(define (source-file-command file)
  "Read FILE, a Scheme source file, and return either a <command> object based
on the 'define-command' top-level form found therein, or #f if FILE does not
contain a 'define-command' form."
  (define (file-sans-extension file)
    "Return the substring of FILE without its extension, if any."
    (let ((dot (string-rindex file #\.)))
      (if dot
          (substring file 0 dot)
          file)))
  
  (define command-name
    (match (filter (negate string-null?)
                   (string-split file #\/))
      ((_ ... "guix" (or "scripts" "extensions") name)
       (list (file-sans-extension name)))
      ((_ ... "guix" (or "scripts" "extensions") first second)
       (list first (file-sans-extension second)))))

  ;; The strategy here is to parse FILE.  This is much cheaper than a
  ;; technique based on run-time introspection where we'd load FILE and all
  ;; the modules it depends on.
  (call-with-input-file file
    (lambda (port)
      (let loop ()
        (match (read port)
          (('define-command _ ('synopsis synopsis)
             _ ...)
           `(command ,command-name ,synopsis 'main))
          (('define-command _
             ('category category) ('synopsis synopsis)
             _ ...)
           `(command ,command-name ,synopsis ,category))
          ((? eof-object?)
           #f)
          (_
           (loop)))))))

(call-with-output-file "guix-commands.go"
    (lambda (port)
      (match (compile `'(,@(map source-file-command ((@@ (guix ui) command-files))))
		      #:to 'bytecode
		      #:opts '(#:to-file? #t))
	((? bytevector? bv)  (put-bytevector port bv))
	;; In Guile 3.0.9, the linker can return a procedure instead of
	;; a bytevector.  Adjust to that.
	((? procedure? proc) (proc port)))))

;; (call-with-output-file "guix-commands.go"
;;   (lambda (port)
;;     (write
     
;;      port)))
