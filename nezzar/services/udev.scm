(define-module (nezzar services udev)
  #:use-module ((srfi srfi-1) #:select (unfold drop drop-right last))
  #:use-module ((srfi srfi-26) #:select (cut))
  #:use-module ((gnu services base) #:select (udev-rule))
  #:use-module ((gnu services configuration)
		#:select (alist?
			  serialize-configuration
			  define-configuration
			  configuration-field-getter
			  configuration-field-name
			  configuration-field-serializer))

  #:export (udev-rule*
	    make-udev-symlink-script
	    make-udev-symlink-env-rule))

(define (serialize-configuration-direct config fields)
  (apply string-append
	 (map (lambda (field)
		((configuration-field-serializer field)
		 (configuration-field-name field)
		 ((configuration-field-getter field) config)))
              fields)))

(define %udev-operator-classes
  '((compare     ==
		 != )
    (assign      =
		 :=)
    (append      +=
		 -= )))

(define %udev-properties
  (map (lambda (prop)
	 (cons ((compose string->symbol string-downcase car) prop)
	       (cdr prop)))
       '(("ACTION"	compare)
	 ("ATTRS"	compare)
	 ;; "ATTRS{filename}"
	 ("ATTR"	compare assign)
	 ;; "ATTR{filename}"
	 ;; "ATTR{key}"
	 ("CONST"	compare)
	 ;; "CONST{key}"
	 ("DEVPATH"	compare)
	 ("DRIVER"	compare)
	 ("DRIVERS"	compare)
	 ("ENV"		compare assign append)
	 ;; "ENV{key}"
	 ("GOTO"	assign)
	 ("GROUP"	assign)
	 ("IMPORT"	compare assign append)
	 ;; "IMPORT{type}"
	 ;; "IMPORT{}"
	 ("KERNEL"	compare)
	 ("KERNELS"	compare)
	 ("LABEL"	assign)
	 ("MODE"	assign)
	 ("NAME"	compare assign)
	 ("OPTIONS"	assign)
	 ("OWNER"	assign)
	 ("PROGRAM"	compare)
	 ("RESULT"	compare)
	 ("RUN"		assign append)
	 ;; "RUN{type}"
	 ("SECLABEL"	assign append)
	 ;; "SECLABEL{module}"
	 ("SUBSYSTEM"	compare)
	 ("SUBSYSTEMS"	compare)
	 ("SYMLINK"	compare assign append)
	 ("SYSCTL"	compare assign)
	 ;; "SYSCTL{kernel parameter}"
	 ("TAG"		compare assign append)
	 ("TAGS"	compare)
	 ("TEST"	compare)
	 ;; "TEST{octal mode mask}"
	 )))

(define %udev-operators
  '(== != = += -= :=))

(define (udev-property? sym)
  (cond ((symbol? sym) (assq sym %udev-properties))
	((list?   sym) (and (assq (car sym) %udev-properties)))
	(else      #f)))
(define (serialize-udev-property _ val)
  (let ((serialize-key-name (compose string-upcase symbol->string)))
    (cond ((symbol? val) (format #f "~a" (serialize-key-name val)))
	  ((list?   val) (format #f "~a~@[{~a}~]"
				 (serialize-key-name (car val))
				 (cadr val)))
	  (else      #f))))

(define (udev-operator? sym)
  (memq sym %udev-operators))
(define (serialize-udev-operator _ val)
  (format #f "~a" val))

(define (serialize-string _ val)
  (format #f "~s" val))

(define-configuration udev-rule-expression
  (key        (udev-property) "udev property name.")
  (operator   (udev-operator) "Operation applied to udev property.")
  (expression (string)        "Expression applied to udev property."))

(define (udev-rule-expression-list? val)
  (and (list? val) (and-map udev-rule-expression? val)))
(define (serialize-udev-rule-expression-list _ val)
  (format #f "~{~a~^, ~}~%"
	  (map (cut serialize-configuration-direct <>
		    udev-rule-expression-fields)
	       val)))

(define udev-rule*
  (letrec ((arg-pair->udev-exp
	    (lambda (pair)
	      (if (alist? (cadr pair))
		  (apply append
			 (map (lambda (subpair)
				(arg-pair->udev-exp
				 (list (car pair)
				       subpair)))
			      (cadr pair)))
		  
		  ;; FIXME: clean-up this let expression
		  (let ((key (if (list? (cadr pair))
				 (list
				  (keyword->symbol (car pair))
				  (car (cadr pair)))
				 (keyword->symbol (car pair))))
			(exp (if (list? (cadr pair))
				 (cadr (cadr pair))
				 (cadr pair))))
		    (list
		     (udev-rule-expression
		      (key        key)
		      (operator   (if (eq? (car pair) #:run) '+= '==))
		      (expression exp)))))))
	   (arg-list->udev-exps (lambda (lst)
				  (unfold null? arg-pair->udev-exp (cut drop <> 2) lst)))
	   (udev-func `(lambda* (file-name #:key ,@(map car %udev-properties) #:rest args)
			 (udev-rule
			  file-name
			  (serialize-udev-rule-expression-list
			   #f
			   (apply append
				  (,arg-list->udev-exps args)))))))
    (eval udev-func (interaction-environment))))

`(("k10temp"      .  (const "cputemp"))
  ("fam15h_power" . (const "cpupower"))
  ("w83795"       .   (const "cpufan"))
  ("amdgpu"       . ,(lambda (a b in-file)
		       (string-append
			"gpu" (car (string-split in-file #\_))))))

(define (make-udev-symlink-script filename)
  (when (not (string? filename))
    (error "udev symlink script must have string filename: " filename))
  (let ((full-filename (format #f "udev-~a" filename)))
    (with-imported-modules
	'((guix build utils))
      (program-file full-filename
		    #~(let ((temp-logger
			     (lambda (exception)
			       (call-with-output-file (format #f "/tmp/~a.errlog" full-filename)
				 (lambda (p)
				   (begin (format p "~a failure:~%"     full-filename)
					  (format p "  args:      ~a~%" (command-line))
					  (format p "  exception: ~a~%" exception))))))
			    (hook-thunk
			     (lambda ()
			       (define (dir->lst str)
				 (let ((reg-match (regexp-exec (make-regexp "{.*}" regexp/basic) str)))
				   (map (lambda (val)
					  (string-append (match:prefix reg-match) val))
					(string-split
					 (string-trim-both (match:substring reg-match)
							   (string->char-set "{}"))
					 #\space))))
			       (let ((args (cdr (command-line))))
				 (let ((syspath (car  args))
				       (devpath (cadr  args)))
				   (begin
				     (use-modules (guix build utils) (ice-9 regex))
				     (mkdir-p (string-join
					       (drop-right (string-split devpath #\/) 1) "/"))
				     (map symlink
					  (dir->lst syspath)
					  (dir->lst devpath))))))))
			(with-exception-handler temp-logger hook-thunk))))))

(define (make-udev-symlink-env-rule driver id-attr input-file symlink-prefix)
  (append (if id-attr
	      `((,(format #f "ATTRS{~a}" id-attr) == "?*"))
	      '())
	  `((DRIVERS == ,driver)
	    (TEST == ,input-file)
	    ("ENV{.sensor_input_file}" += ,input-file)
	    ("ENV{.symlink_template}"  +=
	     ,(format #f "~a~@[$attr{~a}~]-~a"
		      symlink-prefix id-attr
		      (last (string-split input-file #\/)))))))

(display
 (udev-rule* "90-hwmon.rules"
  #:action  "add"
  #:drivers "piix4_smbus"
  #:attrs   '((vendor           "0x1002")
	      (device           "0x4385")
	      (subsystem_vendor "0x1043")
	      (subsystem_device "0x844b"))
  #:run     '(builtin "kmod load i2c:w83795g")))
