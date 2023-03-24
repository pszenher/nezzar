(define-module (nezzar services sensors)
  #:use-module ((srfi srfi-1)  #:select (fold remove))
  #:use-module ((srfi srfi-26) #:select (cut))
  #:use-module (guix gexp)
  #:use-module ((gnu services) #:select (service-type
					 service-extension
					 etc-service-type))
  #:use-module ((gnu services configuration)
		#:select (serialize-configuration
			  define-maybe
			  maybe-value-set?
			  configuration-field-name
			  configuration-field-getter
			  define-configuration
			  define-configuration/no-serialization))

  #:export (fancontrol-service-type
	    fancontrol-configuration
	    fancontrol-pwm-configuration))

(define (serialize-field field-name val)
  (format #f "~:@(~a~)=~a~%" (symbol->string field-name) val))
(define (serialize-field-list field-name val)
  (serialize-field field-name (format #f "~{~a~^ ~}" val)))

(define (u8-integer? val)
  (and (exact-integer? val)
       (not (negative? val))
       (< val 256)))

(define (serialize-u8-integer field-name val)
  (when (u8-integer? val)
    (serialize-field field-name (number->string val))))

(define (fancontrol-pair? val)
  (and (pair? val)
       (string? (car val))
       (or (string?     (cdr val))
	   (u8-integer? (cdr val)))))

(define (fancontrol-pair-list? val)
  (and (list? val) (and-map fancontrol-pair? val)))

(define (serialize-fancontrol-pair-list field-name val)
  (when (fancontrol-pair-list? val)
    (let ((subkeys (map car val))
	  (subvals (map cdr val)))
      (serialize-field-list
       field-name (map
		   (cut format #f "~a=~a" <> <>)
		   subkeys subvals)))))

(define-maybe u8-integer)
(define-maybe fancontrol-pair-list)

(define-configuration/no-serialization fancontrol-pwm-configuration
  (fcpwm    (string)        "File to write PWM commands to.")
  (fctemps  (string)        "Maps PWM outputs to temperature sensors.")
  (fcfans   (string)        "Maps PWM outputs to fan feedback.")
  (mintemp  (u8-integer)		;FIXME: can be higher than U8
	    "Temperature below which fan is set to minimum speed.")
  (maxtemp  (u8-integer)		;FIXME: can be higher than U8
	    "Temperature above which fan is set to maximum speed.")
  (minstart (u8-integer)
	    "Minimum speed at which the fan begins spinning.")
  (minstop  (u8-integer)
	    "Minimum speed at which the fan still spins.")
  (minpwm   (maybe-u8-integer)
	    "Minimum PWM value (used when temperature < mintemp), default 255.")
  (maxpwm   (maybe-u8-integer)
	    "Maximum PWM value (used when temperature > maxtemp), default 0.")
  (average  (maybe-u8-integer)		;FIXME: can be higher than U8
	    "Size of temperature averaging window, default 1 (no averaging)."))

(define (fancontrol-pwm-configuration-list? val)
  (and (list? val) (and-map fancontrol-pwm-configuration? val)))

(define (merge-fancontrol-pwm-configuration-list lst)
  (let ((pwm-fields (remove (compose (cut eqv? 'fcpwm <>) configuration-field-name)
			    fancontrol-pwm-configuration-fields))
	(get-pair    (lambda (get-field conf)
		       (cons (fancontrol-pwm-configuration-fcpwm conf)
			     (get-field                          conf)))))
    (when (fancontrol-pwm-configuration-list? lst)
      (fold (lambda (name getter res)
	      (let ((pair-list (filter (compose maybe-value-set? cdr)
				       (map (cut get-pair getter <>) lst))))
		(if (null? pair-list) res
		    (cons (cons name pair-list) res))))
	    '()
	    (map configuration-field-name   pwm-fields)
	    (map configuration-field-getter pwm-fields)))))

(define (serialize-fancontrol-pwm-configuration-list field-name val)
  (when (fancontrol-pwm-configuration-list? val)
    (let* ((conf-lst (merge-fancontrol-pwm-configuration-list val))
	   (fields   (map car conf-lst))
	   (pairs    (map cdr conf-lst)))
      (apply string-append
       (map serialize-fancontrol-pair-list fields pairs)))))

(define-configuration fancontrol-configuration
  (interval (u8-integer 1)
	    "Interval in seconds the main loop of fancontrol will be executed.")
  (devpath  (maybe-fancontrol-pair-list)
	    "Maps hwmon class devices to physical devices.")
  (devname  (maybe-fancontrol-pair-list)
	    "Maps hwmon class device names.")
  (devices  (fancontrol-pwm-configuration-list)
	    "List of pwm configurations mapping pwm output, fan input, and temperature input."))

(define (fancontrol-etc config)
  `(("fancontrol"
     ,(computed-file
       "fancontrol"
       (serialize-configuration
	config fancontrol-configuration-fields)))))
  
(define fancontrol-service-type
  (service-type
   (name 'fancontrol)
   (extensions
    (list (service-extension etc-service-type
			     fancontrol-etc)))
   (description "Configure PWM fan-speed control with lm_sensors.")))
