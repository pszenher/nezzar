(define-module (nezzar services sound)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (gnu services configuration)
  #:use-module (gnu services shepherd)
  #:use-module (gnu packages linux)
  #:use-module (gnu system pam)
  #:use-module (ice-9 match)
  #:use-module (json)

  #:export (pipewire-service-type
	    pipewire-configuration
	    pipewire-sub-configuration))

(define pipewire-default-package pipewire-0.3)

(define (serialize-alist field-name value)
  #~(if #$value (scm->json-string
		 #$value
		 #:unicode #t
		 #:pretty #t)
	""))
  
(define-configuration pipewire-sub-configuration
  (file  (file-like)
	 "Filename of target pipewire configuration file.")
  (extra (alist '())
	 "Additional pipewire configuration in s-exp format"))

;; (define (serialize-pipewire-sub-configuration field-name value)
;;   #~(case #$field-name
;;       (("file") (begin (use-modules (ice-9 textual-ports))
;; 		       (call-with-input-file #$value get-string-all)))
;;       (("extra") #$value)))
  
;; (define (serialize-pipewire-configuration configuration)
;;     (mixed-text-file
;;      #~(let ((file-name (case #$field-name
;; 			  (("client-config") "client.conf")
;; 			  (("daemon-config") "pipewire.conf")
;; 			  (("pulse-config")  "pipewire-pulse.conf")
;; 			  (("jack-config")   "jack.conf")))))))

;; (define (serialize-string field-name value) #~value)

(define (serialize-file-like field-name value)
  #~(begin
      (use-modules (ice-9 textual-ports))
      (call-with-input-file #$value get-string-all)))

(define-configuration/no-serialization pipewire-configuration
  (package
    (package pipewire-default-package)
    "PipeWire package to use.")
  (config-dir (string "/etc/pipewire/")
	      "System directory wherein PipeWire configuration files are stored")
  (client-config (pipewire-sub-configuration
		  (pipewire-sub-configuration
		   (file (file-append pipewire-default-package
				      "/share/pipewire/client.conf"))))
		 "Configuration for PipeWire clients.")
  (daemon-config (pipewire-sub-configuration
		  (pipewire-sub-configuration
		   (file (file-append pipewire-default-package
				      "/share/pipewire/pipewire.conf"))))
		 "Configuration for the PipeWire system daemon.")
  (pulse-config (pipewire-sub-configuration
		 (pipewire-sub-configuration
		  (file (file-append pipewire-default-package
				     "/share/pipewire/pipewire-pulse.conf"))))
		"Configuration for the PulseAudio PipeWire support.")
  (jack-config (pipewire-sub-configuration
		(pipewire-sub-configuration
		 (file (file-append pipewire-default-package
				    "/share/pipewire/jack.conf"))))
	       "Configuration for the JACK PipeWire support."))

(define pipewire-environment
  (lambda (config)
    '(("PIPEWIRE_CONFIG_DIR"  . (pipewire-configuration-config-dir config)))))

(define pipewire-etc
  (lambda (config)
    ;; (($ <pipewire-configuration> client-config daemon-config
    ;; 				 pulse-config jack-config)
    `(("pipewire"
       ,(file-union
	 "pipewire"
	 `(("client.conf"
	    ,(mixed-text-file
	      "client.conf" (serialize-configuration
			     (pipewire-configuration-client-config config)
			     pipewire-sub-configuration-fields)))
	   ("daemon.conf"
	    ,(mixed-text-file
	      "pipewire.conf" (serialize-configuration
			       (pipewire-configuration-daemon-config config)
			       pipewire-sub-configuration-fields)))
	   ("pipewire-pulse.conf"
	    ,(mixed-text-file
	      "pipewire-pulse.conf" (serialize-configuration
				     (pipewire-configuration-pulse-config config)
				     pipewire-sub-configuration-fields)))
	   ("jack.conf"
	    ,(mixed-text-file
	      "jack.conf" (serialize-configuration
			   (pipewire-configuration-jack-config config)
			   pipewire-sub-configuration-fields)))))))))

(define pipewire-udev
  (match-lambda
    (($ <pipewire-configuration> package)
     (list package))))

(define pipewire-service-type
  (service-type
   (name 'pipewire)
   (extensions
    (list (service-extension session-environment-service-type
			     pipewire-environment)
	  (service-extension etc-service-type
			     pipewire-etc)
	  (service-extension udev-service-type
			     pipewire-udev)))
   (default-value (pipewire-configuration))
   (description "Configure PipeWire sound support.")))
