;; -*- mode: scheme; -*-
;; This is an operating system configuration for a VM image.
;; Modify it as you see fit and instantiate the changes by running:
;;
;;   guix system reconfigure /etc/config.scm
;;

(use-modules (gnu) (guix))
(use-service-modules networking)
(use-package-modules bash package-management)


;; ================================================================
;; | TEST IMPORTS
;; ================================================================

(use-modules ((gnu packages hardware)
	      #:select (tpm2-tss)
	      #:prefix guix:))

(use-modules ((nezzar services security-token)
	      #:select (tpm2-abrmd-service-type
			tpm2-abrmd-configuration)
	      #:prefix nezzar:))

;; |=END TESTING===================================================


(operating-system
  (host-name "gnu")
  (timezone "Etc/UTC")
  (locale "en_US.utf8")
  (keyboard-layout (keyboard-layout "us" "altgr-intl"))

  ;; Label for the GRUB boot menu.
  (label (string-append "GNU Guix "
                        (or (getenv "GUIX_DISPLAYED_VERSION")
                            (package-version guix))))

  (firmware '())
  (kernel-arguments '())

  ;; Below we assume /dev/vda is the VM's hard disk.
  ;; Adjust as needed.
  (bootloader (bootloader-configuration
               (bootloader grub-bootloader)
               (targets '("/dev/sda"))
               (terminal-outputs '(console))))
  (file-systems (cons (file-system
                        (mount-point "/")
                        (device "/dev/sda1")
                        (type "ext4"))
                      %base-file-systems))

  (users (cons (user-account
                (name "guest")
                (comment "GNU Guix Live")
                (password "")		;no password
                (group "users")
                (supplementary-groups '("wheel" "netdev"
                                        "audio" "video")))
               %base-user-accounts))

  ;; Our /etc/sudoers file.  Since 'guest' initially has an empty password,
  ;; allow for password-less sudo.
  (sudoers-file (plain-file "sudoers" "\
root ALL=(ALL) ALL
%wheel ALL=NOPASSWD: ALL\n"))

  (packages '())

  (services
   (append (list
	    (service syslog-service-type)

            (service login-service-type)
	    (service virtual-terminal-service-type)
	    (service mingetty-service-type
		     (mingetty-configuration (tty "tty1")))
	    (service mingetty-service-type
		     (mingetty-configuration (tty "tty2")))
	    (service mingetty-service-type
		     (mingetty-configuration (tty "tty3")))

	    (service static-networking-service-type
                     (list %loopback-static-networking))

	    ;; (service urandom-seed-service-type)
            (service guix-service-type)
            (service nscd-service-type)

	    (service udev-service-type)

	    (service special-files-service-type
		     `(("/bin/sh" ,(file-append bash "/bin/sh"))
		       ("/usr/bin/env" ,(file-append coreutils "/bin/env"))))

	    ;; ================================================================
	    ;; | TEST CONFIGURATION
	    ;; ================================================================
	    
	    ;; udev rules for TPM 2.0 Software Stack
	    (udev-rules-service 'tpm2 guix:tpm2-tss #:groups '("tss"))

	    (service nezzar:tpm2-abrmd-service-type
		     (nezzar:tpm2-abrmd-configuration))
	    
	    ;; |=END TESTING===================================================
	    
            ;; Uncomment the line below to add an SSH server.
            ;;(service openssh-service-type)

            ;; Use the DHCP client service rather than NetworkManager.
            (service dhcp-client-service-type))))

  (name-service-switch %default-nss))
