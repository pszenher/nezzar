(define-module (nezzar services sound)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (gnu services configuration)
  #:use-module (gnu services dbus)
  #:use-module (gnu services shepherd)
  #:use-module ((gnu packages admin) #:select (shadow))
  #:use-module ((gnu packages linux) #:select (pipewire wireplumber))
  #:use-module (gnu packages guile)
  #:use-module (gnu system pam)
  #:use-module (gnu system shadow)
  #:use-module (ice-9 match)
  #:use-module (json)

  #:export (pipewire-service-type
	    pipewire-configuration
	    pipewire-client-configuration
	    pipewire-daemon-configuration
	    pipewire-pulse-configuration
	    pipewire-jack-configuration

	    wireplumber-service-type
	    wireplumber-configuration
	    wireplumber-daemon-configuration))

;; TODO: this should be read from 'package' field of <pipewire-configuration>
;;       instead of hard-coding
(define %pipewire-default-package pipewire)
(define %wireplumber-default-package wireplumber)

(define %pipewire-daemon-user  "pipewire")
(define %pipewire-daemon-group "pipewire")
(define %pipewire-daemon-supp-groups '("audio"))

(define %pipewire-daemon-runtime-dir "/var/run/pipewire")
(define %pipewire-pulse-daemon-runtime-dir "/var/run/pulse")

(define-maybe alist)

(define (serialize-alist field-name value)
  (let ((field-name-string (symbol->string field-name)))
    (if (string=? field-name-string "extra-config")
	(string-concatenate
	 (map (lambda (entry)
		(apply serialize-alist entry))
	      value))
	(string-append
	 field-name-string " = "
	 (scm->json-string value #:pretty #t) "\n"))))

(define (vector-or-list? value)
  (or (vector? value)
      (list?   value)))

(define (serialize-vector-or-list field-name value)
  (let ((value-vector (if (list? value) (list->vector value) value)))
    (string-append
     (symbol->string field-name) " = "
     (scm->json-string value-vector #:pretty #t) "\n")))

(define-configuration pipewire-daemon-configuration
  (context.properties
   (alist
    '((link.max-buffers          . 16)
      (core.daemon               . #t)
      (core.name                 . pipewire-0)
      (default.clock.min-quantum . 16)
      (vm.overrides
       .
       ((default.clock.min-quantum . 1024)))))
   "Configure properties in the system.")

  (context.spa-libs
   (alist
    '((audio.convert.* . audioconvert/libspa-audioconvert)
      (avb.*           . avb/libspa-avb)
      (api.alsa.*      . alsa/libspa-alsa)
      (api.v4l2.*      . v4l2/libspa-v4l2)
      (api.libcamera.* . libcamera/libspa-libcamera)
      (api.bluez5.*    . bluez5/libspa-bluez5)
      (api.vulkan.*    . vulkan/libspa-vulkan)
      (api.jack.*      . jack/libspa-jack)
      (support.*       . support/libspa-support)))
   "Used to find spa factory names. It maps an spa factory name regular
expression to a library name that should contain that factory.

<factory-name regex> = <library-name>")

  (context.modules
   (vector-or-list
    '#(((name  . libpipewire-module-rt)
	(args  . ((nice.level . -11)))
	(flags . #( ifexists nofail )))
       ;; The native communication protocol.
       ((name . libpipewire-module-protocol-native))
       ;; The profile module. Allows application to access profiler
       ;; and performance data. It provides an interface that is used
       ;; by pw-top and pw-profiler.
       ((name . libpipewire-module-profiler))
       ;; Allows applications to create metadata objects. It creates
       ;; a factory for Metadata objects.
       ((name . libpipewire-module-metadata))
       ;; Creates a factory for making devices that run in the
       ;; context of the PipeWire server.
       ((name . libpipewire-module-spa-device-factory))
       ;; Creates a factory for making nodes that run in the
       ;; context of the PipeWire server.
       ((name . libpipewire-module-spa-node-factory))
       ;; Allows creating nodes that run in the context of the
       ;; client. Is used by all clients that want to provide
       ;; data to PipeWire.
       ((name . libpipewire-module-client-node))
       ;; Allows creating devices that run in the context of the
       ;; client. Is used by the session manager.
       ((name . libpipewire-module-client-device))
       ;; The portal module monitors the PID of the portal process
       ;; and tags connections with the same PID as portal
       ;; connections.
       ((name  . libpipewire-module-portal)
	(flags . #( ifexists nofail )))
       ;; The access module can perform access checks and block
       ;; new clients.
       ((name . libpipewire-module-access))
       ;; Makes a factory for wrapping nodes in an adapter with a
       ;; converter and resampler.
       ((name . libpipewire-module-adapter))
       ;; Makes a factory for creating links between ports.
       ((name . libpipewire-module-link-factory))
       ;; Provides factories to make session manager objects.
       ((name . libpipewire-module-session-manager))))
   "Loads a module with the given parameters.
If ifexists is given, the module is ignored when it is not foun If
nofail is given, module initialization failures are ignored.

{ name = <module-name>
    [ args  = { <key> = <value> ... } ]
    [ flags = [ [ ifexists ] [ nofail ] ] ]
}")

  (context.objects
   (vector-or-list
    '#(;; A default dummy driver. This handles nodes marked with the "node.always-driver"
       ;; property when no other driver is currently active. JACK clients need this.
       ((factory . spa-node-factory)
	(args    . ((factory.name    . support.node.driver)
		    (node.name       . Dummy-Driver)
		    (node.group      . pipewire.dummy)
		    (priority.driver . 20000))))
       ((factory . spa-node-factory)
	(args    . ((factory.name    . support.node.driver)
		    (node.name       . Freewheel-Driver)
		    (node.group      . pipewire.freewheel)
		    (priority.driver . 19000)
		    (node.freewheel  . #t))))))
   "Creates an object from a PipeWire factory with the given parameters.
If nofail is given, errors are ignored (and no object is created).

{ factory = <factory-name>
    [ args  = { <key> = <value> ... } ]
    [ flags = [ [ nofail ] ] ]
}")

  (context.exec
   (vector-or-list '())
   "Execute the given program with arguments.

You can optionally start the session manager here, but it is better to
start it as a systemd service.  Run the session manager with -h for
options.

{ path = <program-name> [ args = \"<arguments>\" ] }")

  (extra-config
   maybe-alist
   "Additional pipewire daemon configuration in s-exp format"))


(define-configuration pipewire-client-configuration
  (context.properties
   (alist
    '((log.level . 0)))
   "Configure properties in the system.")

  (context.spa-libs
   (alist
    '((audio.convert.* . audioconvert/libspa-audioconvert)
      (support.*       . support/libspa-support)))
   "Used to find spa factory names. It maps an spa factory name regular
expression to a library name that should contain that factory.

<factory-name regex> = <library-name>")

  (context.modules
   (vector-or-list
    '#(;; The native communication protocol.
       (( name . libpipewire-module-protocol-native ))

       ;; Allows creating nodes that run in the context of the
       ;; client. Is used by all clients that want to provide
       ;; data to PipeWire.
       (( name . libpipewire-module-client-node ))

       ;; Allows creating devices that run in the context of the
       ;; client. Is used by the session manager.
       (( name . libpipewire-module-client-device ))

       ;; Makes a factory for wrapping nodes in an adapter with a
       ;; converter and resampler.
       (( name . libpipewire-module-adapter ))

       ;; Allows applications to create metadata objects. It creates
       ;; a factory for Metadata objects.
       (( name . libpipewire-module-metadata ))

       ;; Provides factories to make session manager objects.
       (( name . libpipewire-module-session-manager ))))
   "Loads a module with the given parameters.
If ifexists is given, the module is ignored when it is not foun If
nofail is given, module initialization failures are ignored.

{ name = <module-name>
    [ args  = { <key> = <value> ... } ]
    [ flags = [ [ ifexists ] [ nofail ] ] ]
}")

  (filter.properties
   (alist '())
   "Properties of pipewire audio filter.")

  (stream.properties
   (alist '())
   "Properties of pipewire audio stream.")

  (extra-config
   maybe-alist
   "Additional pipewire client configuration in s-exp format"))


(define-configuration pipewire-pulse-configuration

  (context.properties
   (alist '())
   "Configure properties in the system.")

  (context.spa-libs
   (alist
    '((audio.convert.* . audioconvert/libspa-audioconvert)
      (support.*       . support/libspa-support)))
   "Used to find spa factory names. It maps an spa factory name regular
expression to a library name that should contain that factory.

<factory-name regex> = <library-name>")

  (context.modules
   (vector-or-list
    '#(
       ((name  . libpipewire-module-rt)
	(args  . ((nice.level . -11)))
	(flags . #( ifexists nofail )))
       ((name . libpipewire-module-protocol-native))
       ((name . libpipewire-module-client-node))
       ((name . libpipewire-module-adapter))
       ((name . libpipewire-module-metadata ))
       ((name . libpipewire-module-protocol-pulse)
	(args . ()))
       ))
   "Loads a module with the given parameters.
If ifexists is given, the module is ignored when it is not foun If
nofail is given, module initialization failures are ignored.

{ name = <module-name>
    [ args  = { <key> = <value> ... } ]
    [ flags = [ [ ifexists ] [ nofail ] ] ]
}")

  (context.exec
   (vector-or-list
    '#(((path . "pactl")
	(args . "load-module module-always-sink"))))
   "Execute the given program with arguments.
Extra modules can be loaded here. Setup in default.pa can be moved
here.

{ path = <program-name> [ args = \"<arguments>\" ] }")

  (stream.properties
   (alist '())
   "Properties of pulseaudio audio stream.")

  (pulse.properties
   (alist
    '(;; the addresses this server listens on
      (server.address . #(unix:native))
      (vm.overrides
       .
       ((pulse.min.quantum . "1024/48000" ) ;22ms
	))))
   "Pulseaudio server properties.")

  (pulse.rules
   (vector-or-list
    '#(((matches . #(()))
	(actions . ((update-props . ()))))

       ;; skype does not want to use devices that don't have an S16 sample format.
       ((matches . #(
		     ((application.process.binary . "teams"))
		     ((application.process.binary . "teams-insiders"))
		     ((application.process.binary . "skypeforlinux"))))
	(actions . ((quirks . #( force-s16-info )))))

       ;; firefox marks the capture streams as don't move and then they
       ;; can't be moved with pavucontrol or other tools.
       ((matches . #(((application.process.binary . "firefox"))))
	(actions . ((quirks . #( remove-capture-dont-move )))))

       ;; speech dispatcher asks for too small latency and then underruns.
       ((matches . #(((application.name . "~speech-dispatcher*"))))
	(actions . ((update-props . ((pulse.min.req     . "1024/48000")
				     (pulse.min.quantum . "1024/48000"))))))))
   "Client/stream specific properties.")

  (extra-config
   maybe-alist
   "Additional pipewire pulseconfiguration in s-exp format"))

(define-configuration pipewire-jack-configuration
  (context.properties
   (alist
    '((log.level . 0)))
   "Configure properties in the system.")

  (context.spa-libs
   (alist
    '((support.*       . support/libspa-support)))
   "Used to find spa factory names. It maps an spa factory name regular
expression to a library name that should contain that factory.

<factory-name regex> = <library-name>")

  (context.modules
   (vector-or-list
    '#(;; Boost the data thread priority.
       ((name  . libpipewire-module-rt)
	(args  . ())
	(flags . #( ifexists nofail )))
       ((name . libpipewire-module-protocol-native))
       ((name . libpipewire-module-client-node))
       ((name . libpipewire-module-metadata ))))
   "Loads a module with the given parameters.
If ifexists is given, the module is ignored when it is not foun If
nofail is given, module initialization failures are ignored.

{ name = <module-name>
    [ args  = { <key> = <value> ... } ]
    [ flags = [ [ ifexists ] [ nofail ] ] ]
}")

  (jack.properties
   (alist '())
   "Global properties for all jack clients.")

  (jack.rules
   (vector-or-list
    '#(((matches . #(()))
	(actions . ((update-props . ()))))))
   "Client specific properties.")

  (extra-config
   maybe-alist
   "Additional pipewire jack configuration in s-exp format"))

(define-configuration/no-serialization pipewire-configuration
  (package       (package %pipewire-default-package)
		 "PipeWire package to use.")
  (system-mode?  (boolean #f)
		 "Run PipeWire daemon in system-mode.")
  (client-config (pipewire-client-configuration (pipewire-client-configuration))
		 "Configuration for PipeWire clients.")
  (daemon-config (pipewire-daemon-configuration (pipewire-daemon-configuration))
		 "Configuration for the PipeWire system daemon.")
  (pulse-config  (pipewire-pulse-configuration (pipewire-pulse-configuration))
		 "Configuration for the PulseAudio PipeWire support.")
  (jack-config   (pipewire-jack-configuration (pipewire-jack-configuration))
		 "Configuration for the JACK PipeWire support."))

(define (pipewire-environment config)
  (if (pipewire-configuration-system-mode? config)
      '(("PIPEWIRE_CONFIG_DIR"  . "/etc/pipewire")
	("PIPEWIRE_RUNTIME_DIR" . %pipewire-daemon-runtime-dir)
	("PULSE_RUNTIME_PATH"   . %pipewire-pulse-daemon-runtime-dir))
      '()))

(define (pipewire-etc config)
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
			 pipewire-jack-configuration-fields))))))))

(define (pipewire-udev config)
  (list (pipewire-configuration-package config)))

(define (pipewire-account config)
  "Return the user accounts and user groups for CONFIG."
  (if (pipewire-configuration-system-mode? config)
      (list (user-group (name %pipewire-daemon-group)
			(system? #t))
	    (user-account
             (name %pipewire-daemon-user)
             (group %pipewire-daemon-group)
	     (supplementary-groups %pipewire-daemon-supp-groups)
	     (comment "PipeWire System Daemon User")
	     (create-home-directory? #f)
	     (shell (file-append shadow "/sbin/nologin"))
	     (system? #t)))
      '()))

(define (pipewire-shepherd-service config)
  (if (pipewire-configuration-system-mode? config)
      (list
       (shepherd-service
	(documentation "PipeWire daemon.")
	(provision '(pipewire))
	(start #~(make-forkexec-constructor
		  (list #$(file-append
			   (pipewire-configuration-package config)
			   "/bin/pipewire"))
		  #:user #$%pipewire-daemon-user
		  #:group #$%pipewire-daemon-group
		  #:supplementary-groups #$%pipewire-daemon-supp-groups
		  #:environment-variables
		  (list
		   (string-append "PIPEWIRE_RUNTIME_DIR=" %pipewire-daemon-runtime-dir))))
	(stop #~(make-kill-destructor)))
       (shepherd-service
	(documentation "PipeWire PulseAudio daemon.")
	(provision '(pipewire-pulse))
	(requirement '(pipewire))
	(start #~(make-forkexec-constructor
		  (list #$(file-append
			   (pipewire-configuration-package config)
			   "/bin/pipewire-pulse"))
		  #:user #$%pipewire-daemon-user
		  #:group #$%pipewire-daemon-group
		  #:supplementary-groups #$%pipewire-daemon-supp-groups
		  #:environment-variables
		  (list
		   (string-append "PIPEWIRE_RUNTIME_DIR=" #$%pipewire-daemon-runtime-dir)
		   (string-append "PULSE_RUNTIME_PATH="   #$%pipewire-pulse-daemon-runtime-dir))))
	(stop #~(make-kill-destructor))))
      '()))

(define (pipewire-activation config)
  "Return the activation gexp for CONFIG (create pipewire runtime directories)."
  #~(let ((pw-user  (getpwnam #$%pipewire-daemon-user))
	  (pw-group (getgrnam #$%pipewire-daemon-group))
	  (pw-rt-dirs '( #$%pipewire-daemon-runtime-dir
			 #$%pipewire-pulse-daemon-runtime-dir ))
	  (activate-runtime-dir
	   (lambda (dirname)
	     (begin (mkdir-p dirname)
		    (chown dirname (passwd:uid pw-user) (passwd:gid pw-group))
		    (chmod dirname #o755)))))
      (begin
	(use-modules (guix build utils))
	(map activate-dir pw-rt-dirs))))

(define pipewire-service-type
  (service-type
   (name 'pipewire)
   (extensions
    (list (service-extension session-environment-service-type
			     pipewire-environment)
	  (service-extension etc-service-type
			     pipewire-etc)
	  (service-extension udev-service-type
			     pipewire-udev)
	  (service-extension account-service-type
			     pipewire-account)
	  (service-extension activation-service-type
			     pipewire-activation)
	  (service-extension shepherd-root-service-type
			     pipewire-shepherd-service)))
   (default-value (pipewire-configuration))
   (description "Configure PipeWire sound support.")))


;;
;; Wireplumber
;;

(define %wireplumber-default-scripts
  (map (lambda (filename)
	 `(,filename . (file-append %wireplumber-default-package
				    ,(string-append "/share/wireplumber/" filename))))
       '("main.lua.d/00-functions.lua"
	 "main.lua.d/20-default-access.lua"
	 "main.lua.d/30-alsa-monitor.lua"
	 "main.lua.d/30-libcamera-monitor.lua"
	 "main.lua.d/30-v4l2-monitor.lua"
	 "main.lua.d/40-device-defaults.lua"
	 "main.lua.d/40-stream-defaults.lua"
	 "main.lua.d/50-alsa-config.lua"
	 "main.lua.d/50-default-access-config.lua"
	 "main.lua.d/50-libcamera-config.lua"
	 "main.lua.d/50-v4l2-config.lua"
	 "main.lua.d/90-enable-all.lua"

	 "policy.lua.d/00-functions.lua"
	 "policy.lua.d/10-default-policy.lua"
	 "policy.lua.d/50-endpoints-config.lua"
	 "policy.lua.d/90-enable-all.lua"

	 "bluetooth.lua.d/00-functions.lua"
	 "bluetooth.lua.d/30-bluez-monitor.lua"
	 "bluetooth.lua.d/50-bluez-config.lua"
	 "bluetooth.lua.d/90-enable-all.lua")))

(define-configuration wireplumber-daemon-configuration
  (context.properties
   (alist
    '((log.level . 2)
      (wireplumber.script-engine . lua-scripting)))
   "Properties to configure the PipeWire context and some modules.")
  (context.spa-libs
   (alist
    '((api.alsa.*      . alsa/libspa-alsa)
      (api.bluez5.*    . bluez5/libspa-bluez5)
      (api.v4l2.*      . v4l2/libspa-v4l2)
      (api.libcamera.* . libcamera/libspa-libcamera)
      (audio.convert.* . audioconvert/libspa-audioconvert)
      (support.*       . support/libspa-support)))
   "Used to find spa factory names. It maps an spa factory name regular
expression to a library name that should contain that factory.

<factory-name regex> = <library-name>")
  (context.modules
   (vector-or-list
    '#(;; Boost the data thread priority.
       ((name  . libpipewire-module-rt)
	(args  . ())
	(flags . #( ifexists nofail )))
       ((name . libpipewire-module-protocol-native))
       ((name . libpipewire-module-client-node))
       ((name . libpipewire-module-client-device))
       ((name . libpipewire-module-adapter ))
       ((name . libpipewire-module-metadata ))
       ((name . libpipewire-module-session-manager ))))
   "PipeWire modules to load.
If ifexists is given, the module is ignored when it is not foun If
nofail is given, module initialization failures are ignored.

{ name = <module-name>
    [ args  = { <key> = <value> ... } ]
    [ flags = [ [ ifexists ] [ nofail ] ] ]
}")
  (wireplumber.components
   (vector-or-list
    '#(;; The lua scripting engine
       ((name . libwireplumber-module-lua-scripting) (type . module))

       ;; The lua configuration file(s)
       ;; Other components are loaded from there
       ((name . main.lua) (type . config/lua))
       ((name . policy.lua) (type . config/lua))
       ((name . bluetooth.lua) (type . config/lua))))
   "WirePlumber components to load.

{ name = <component-name>, type = <component-type> }")
  (extra-config
   maybe-alist
   "Additional WirePlumber configuration in s-exp format"))

(define-configuration/no-serialization wireplumber-configuration
  (package
    (package %wireplumber-default-package)
    "Wireplumber package to use.")
  (system-mode?  (boolean #f)
		 "Run WirePlumber daemon in system-mode.")
  (daemon-config (wireplumber-daemon-configuration (wireplumber-daemon-configuration))
		 "WirePlumber daemon context configuration.")
  (scripts (alist %wireplumber-default-scripts)
	   "WirePlumber script files"))

(define (wireplumber-etc config)
  `(("wireplumber"
     ,(file-union
       "wireplumber"
       `(("wireplumber.conf"
	  ,(mixed-text-file
	    "wireplumber.conf" (serialize-configuration
				(wireplumber-configuration-daemon-config config)
				wireplumber-daemon-configuration-fields)))
	 ,@(wireplumber-configuration-scripts config))))))

(define wireplumber-service-type
  (service-type
   (name 'wireplumber)
   (extensions
    (list (service-extension etc-service-type
			     wireplumber-etc)))
   (default-value (wireplumber-configuration))
   (description "Configure WirePlumber session manager support.")))
