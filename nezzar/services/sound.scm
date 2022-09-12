(define-module (nezzar services sound)
  #:use-module (rde serializers json)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (gnu services configuration)
  #:use-module (gnu services shepherd)
  #:use-module (gnu packages linux)
  #:use-module (gnu system pam)
  #:use-module (ice-9 match))

(define pipewire-default-package pipewire-0.3)

(define-configuration pipewire-sub-configuration
  (file  (file-like)
	 "Filename of target pipewire configuration file.")
  (extra (json-config '())
	 "Additional pipewire configuration in s-exp format"))

(define (serialize-pipewire-sub-configuration field-name value) #~value)
(define (serialize-string field-name value) #~value)

(define-configuration pipewire-configuration
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

;; #~(let ((file-name (case #$field-name
;; 		       (("client-config") "client.conf")
;; 		       (("daemon-config") "pipewire.conf")
;; 		       (("pulse-config")  "pipewire-pulse.conf")
;; 		       (("jack-config")   "jack.conf"))))

(define pipewire-environment
  (match-lambda
    (($ <pipewire-configuration> config-dir)
     '(("PIPEWIRE_CONFIG_DIR"  . config-dir)))))

(define pipewire-etc
  (match-lambda
    (($ <pipewire-configuration> client-conf daemon-conf pulse-conf jack-conf)
     `(("pipewire"
	,(file-union
	  "pipewire"
	  `(("client.conf"
	     ,(mixed-text-file
	       "client.conf" (serialize-configuration
			      client-config
			      pipewire-sub-configuration-fields)))
	    ("daemon.conf"
	     ,(mixed-text-file
	       "pipewire.conf" (serialize-configuration
				daemon-config
				pipewire-sub-configuration-fields)))
	    ("pipewire-pulse.conf"
	     ,(mixed-text-file
	       "pipewire-pulse.conf" (serialize-configuration
				      pulse-config
				      pipewire-sub-configuration-fields)))
	    ("jack.conf"
	     ,(mixed-text-file
	       "jack.conf" (serialize-configuration
			    jack-config
			    pipewire-sub-configuration-fields))))))))))

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
