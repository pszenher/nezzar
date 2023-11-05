;; Base include of GNU Guix system
(use-modules (gnu))

;;; guix os defaults import
(use-modules ((gnu system locale) #:select (%default-locale-definitions
					    %default-locale-libcs)))

;;; guix package modules
(use-modules ((gnu packages admin)         #:select (shadow)                 #:prefix guix:)
             ((gnu packages certs)         #:select (nss-certs)              #:prefix guix:)
	     ((gnu packages security-token) #:select (libfido2)              #:prefix guix:)
	     ((gnu packages hardware)
	      #:select (tpm2-tss)
	      #:prefix guix:))

;;; guix service modules
(use-modules ((gnu services desktop)       #:select (seatd-service-type)     #:prefix guix:)
	     ((gnu services networking)    #:select (ntp-service-type
						     dhcp-client-service-type
						     wpa-supplicant-service-type
						     wpa-supplicant-configuration) #:prefix guix:)
	     ((gnu services security-token) #:select (pcscd-service-type) #:prefix guix:))

;;; nonguix modules
(use-modules ((nongnu packages linux)      #:select (linux iwlwifi-firmware) #:prefix nonguix:)
	     ((nongnu system linux-initrd) #:select (microcode-initrd)       #:prefix nonguix:))

;; nezzar modules
(use-modules ((nezzar services pam-rundir) #:select (pam-rundir-service-type) #:prefix nezzar:))
(use-modules ((nezzar services security-token)
	      #:select (tpm2-abrmd-service-type
			tpm2-abrmd-configuration)
	      #:prefix nezzar:))

(operating-system
 ;; kernel configuration
 (kernel nonguix:linux)
 (kernel-loadable-modules '())
 (kernel-arguments %default-kernel-arguments)

 (hurd #f)
 
 ;; bootloader configuration
 (bootloader (bootloader-configuration
	      (bootloader grub-efi-bootloader)
	      ;; FIXME: set filesystems
	      (targets '("/boot/efi"))))

 (label (operating-system-default-label this-operating-system))

 (keyboard-layout (keyboard-layout "us"))
 
 (initrd-modules %base-initrd-modules)
 (initrd nonguix:microcode-initrd)
 (firmware (cons* nonguix:iwlwifi-firmware
		  %base-firmware))

 (host-name "akagi")

 (mapped-devices '())
 (file-systems
  (cons* (file-system
	  (device (file-system-label "akagi-guix-root"))
	  (mount-point "/")
	  (type "ext4"))
	 (file-system
	  (device (file-system-label "akagi-boot"))
	  (mount-point "/boot/efi")
	  (type "vfat"))
	 (file-system
	  (device "tmpfs")
	  (mount-point "/run/user")
	  (type "tmpfs")
	  (check? #f)
	  (options "size=1G")
	  (create-mount-point? #t))
	 (file-system
	  (device "tmpfs")
	  (mount-point "/tmp")
	  (type "tmpfs")
	  (check? #f)
	  (options "size=16G")
	  (create-mount-point? #t))
	 %base-file-systems))

 (swap-devices '())

 (users
  (cons* (user-account
          (name "paul")
          (comment "Paul")
          (group "users")
          (home-directory "/home/paul")
          (supplementary-groups '("wheel"
				  "netdev"
				  "audio"
				  "video"
				  "seat"
				  ;; "realtime"
				  "plugdev"
				  "kvm" ; Allow non-root kvm vm accel
				  "qemu" ; Allow access to system-wide qemu socket(s) (WIP)
				  ;; "pipewire"		; Allow access to system-wide pipewire socket(s)
				  )))
	 (user-account
	  (name "qemu")
	  (group "qemu")
	  (supplementary-groups '("kvm" ;; "vfio"
				  ))
	  (comment "User for daemonized virtualization processes")
	  (home-directory "/var/run/qemu")
	  (create-home-directory? #t)
	  (shell (file-append guix:shadow "/sbin/nologin"))
	  (system? #t))
	 (user-account
	  (name "tss")
	  (group "tss")
	  (comment "User for daemonized TPM Resource Manager")
	  (home-directory "/var/run/tss")
	  (create-home-directory? #t)
	  (shell (file-append guix:shadow "/sbin/nologin"))
	  (system? #t))
	 %base-user-accounts))
 (groups (cons* (user-group (system? #t) (name "qemu"))
		%base-groups))

 (skeletons (default-skeletons))
 (issue "\nThis is the GNU system.  Welcome.\n")

 (packages (cons* 
            guix:nss-certs
            %base-packages))

 (timezone "America/New_York")
 (locale "en_US.utf8")
 (locale-definitions %default-locale-definitions)
 (locale-libcs %default-locale-libcs)
 (name-service-switch %default-nss)

 (services (cons*

	    ;; Basic networking services (ip addr alloc and time sync)
	    ;; (service static-networking-service-type
	    ;; 	      (list %loopback-static-networking))
	    (service guix:dhcp-client-service-type)
	    (service guix:ntp-service-type)

	    ;; Wireless networking service
	    (service guix:wpa-supplicant-service-type
		     (guix:wpa-supplicant-configuration
		      (dbus? #f)
		      (interface "wlp59s0")
		      (config-file
		       (plain-file "wpa_supplicant.conf"
				   "
network={
	ssid=\"sdat\"
	#psk=\"bingobangobongo\"
	psk=86cfaf5363a0b7b1122daaf52a57df1dafd5ef93238e782f368813542c9d6cb0
}
network={
	ssid=\"Verizon_NLB9TK\"
	#psk=\"tenet-zoo3-dyne\"
	psk=a693be4b5fc390af54d556d4a81f562ae489f237dd85a1b8c05d93e12a5841c0
}
network={
	ssid=\"Gigantic_Pizza_5GHz\"
	#psk=\"88888888\"
	psk=07b5c58aff536f4bebc27172e40c2206a77c686cde540e8fdb768086e0da4d16
}
"))))
	     
	    ;; Configure display manager
	    (service guix:seatd-service-type)

	    ;; Create and destroy /run/user/${UID} directory on log in/out
	    (service nezzar:pam-rundir-service-type)

	    ;; PC/SC smart card daemon service
	    (service guix:pcscd-service-type)
	     
	    ;; udev rules for U2F (to enable device read by non-root users)
	    (udev-rules-service 'fido2 guix:libfido2 #:groups '("plugdev"))

	    ;; udev rules for TPM 2.0 Software Stack
	    (udev-rules-service 'tpm2 guix:tpm2-tss #:groups '("tss"))

	    (service nezzar:tpm2-abrmd-service-type
		     (nezzar:tpm2-abrmd-configuration))

	    %base-services))

 ;; WARN: do not set manually, should not need modification as end-user
 (essential-services
  (operating-system-default-essential-services this-operating-system))

 (pam-services (base-pam-services))
 (setuid-programs %setuid-programs)
 (sudoers-file %sudoers-specification))
