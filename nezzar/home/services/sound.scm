(define-module (nezzar home services sound)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:use-module (nezzar home services sound)

  #:export ())

(define pipewire-activation)

(define home-pipewire-service-type
  (service-type
   (name 'home-pipewire)
   (extensions
    (list (service-extension home-files-service-type
			     pipewire-configuration-files)
	  (service-extension home-activation-service-type
			     pipewire-activation)
	  (service-extension home-shepherd-service-type
			     pipewire-shepherd-service)))
    (description "Configure PipeWire sound support.")
    (default-value (home-pipewire-configuration))))
