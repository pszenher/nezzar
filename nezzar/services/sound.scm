(define-module (nezzar services sound)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (gnu services configuration)
  #:use-module (gnu services shepherd)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages guile)
  #:use-module (gnu system pam)
  #:use-module (ice-9 match)
  #:use-module (json)

  #:export (pipewire-service-type
	    pipewire-configuration
	    pipewire-client-configuration
	    pipewire-daemon-configuration
	    pipewire-pulse-configuration
	    pipewire-jack-configuration))

;; TODO: this should be read from 'package' field of <pipewire-configuration>
;;       instead of hard-coding
(define pipewire-default-package pipewire-0.3)
(define wireplumber-default-package wireplumber)

(define-maybe alist)

(define (serialize-alist field-name value)
  (if (null? (quote value))
      ""
      (scm->json-string
       value
       #:unicode #t
       #:pretty #t)))

(define (file-like-or-#f? value)
  (or (file-like? value)
      (and (boolean? value)
	   (not      value))))

(define (serialize-file-like-or-#f field-name value)
  (if (boolean? value) ""
      #~(begin
	  (use-modules (ice-9 textual-ports))
	  (call-with-input-file #$value get-string-all))))

(define-configuration pipewire-client-configuration
  (file  (file-like-or-#f (file-append
		     pipewire-default-package
		     "/share/pipewire/client.conf"))
	 "Filename of target pipewire client configuration file.")
  (extra maybe-alist
	 "Additional pipewire client configuration in s-exp format"))

(define-configuration pipewire-daemon-configuration
  (file  (file-like-or-#f (file-append
		     pipewire-default-package
		     "/share/pipewire/pipewire.conf"))
	 "Filename of target pipewire daemon configuration file.")
  (extra maybe-alist
	 "Additional pipewire daemon configuration in s-exp format"))

(define-configuration pipewire-pulse-configuration
  (file  (file-like-or-#f (file-append
		     pipewire-default-package
		     "/share/pipewire/pipewire-pulse.conf"))
	 "Filename of target pipewire pulse configuration file.")
  (extra maybe-alist
	 "Additional pipewire pulseconfiguration in s-exp format"))

(define-configuration pipewire-jack-configuration
  (file  (file-like-or-#f (file-append
		     pipewire-default-package
		     "/share/pipewire/jack.conf"))
	 "Filename of target pipewire jack configuration file.")
  (extra maybe-alist
	 "Additional pipewire jack configuration in s-exp format"))

(define-configuration/no-serialization pipewire-configuration
  (package
    (package pipewire-default-package)
    "PipeWire package to use.")
  (config-dir (string "/etc/pipewire/")
	      "System directory wherein PipeWire configuration files are stored")
  (client-config (pipewire-client-configuration (pipewire-client-configuration))
		 "Configuration for PipeWire clients.")
  (daemon-config (pipewire-daemon-configuration (pipewire-daemon-configuration))
		 "Configuration for the PipeWire system daemon.")
  (pulse-config (pipewire-pulse-configuration (pipewire-pulse-configuration))
		"Configuration for the PulseAudio PipeWire support.")
  (jack-config (pipewire-jack-configuration (pipewire-jack-configuration))
	       "Configuration for the JACK PipeWire support."))

;; (define-configuration/no-serialization wireplumber-configuration
;;   (package
;;     (package wireplumber-default-package)
;;     "Wireplumber package to use.")
;;   (config-dir (string "/etc/wireplumber/")
;; 	      "System directory wherein Wireplumber configuration files are stored")
;;   (config


(define pipewire-environment
  (lambda (config)
    `(("PIPEWIRE_CONFIG_DIR"  . ,(pipewire-configuration-config-dir config)))))

(define pipewire-etc
  (lambda (config)
    `(("pipewire"
       ,(file-union
	 "pipewire"
	 `(("client.conf"
	    ,(mixed-text-file
	      "client.conf" (serialize-configuration
			     (pipewire-configuration-client-config config)
			     pipewire-client-configuration-fields)))
	   ("pipewire.conf"
	    ,(mixed-text-file
	      "pipewire.conf" (serialize-configuration
			       (pipewire-configuration-daemon-config config)
			       pipewire-daemon-configuration-fields)))
	   ("pipewire-pulse.conf"
	    ,(mixed-text-file
	      "pipewire-pulse.conf" (serialize-configuration
				     (pipewire-configuration-pulse-config config)
				     pipewire-pulse-configuration-fields)))
	   ("jack.conf"
	    ,(mixed-text-file
	      "jack.conf" (serialize-configuration
			   (pipewire-configuration-jack-config config)
			   pipewire-jack-configuration-fields)))))))))

(define pipewire-udev
  (lambda (config)
    (list (pipewire-configuration-package config))))

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
