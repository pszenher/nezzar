(define-module (nezzar services pam-rundir)
  #:use-module (nezzar packages admin)
  #:use-module (gnu services)
  #:use-module (gnu system pam)
  #:use-module (guix gexp)
  #:export (pam-rundir-service-type))

(define (pam-rundir-pam-service config)
  (define optional-pam-rundir
    (pam-entry
     (control "optional")
     (module #~(string-append #$pam-rundir "/lib/security/pam_rundir.so"))))
  (list (lambda (pam)
	  (if (member (pam-service-name pam)
		      '("login" "greetd" "su" "slim" "gdm-password" "sddm"))
	      (pam-service
	       (inherit pam)
	       (session (append (pam-service-session pam)
				(list optional-pam-rundir))))
	      pam))))

(define pam-rundir-service-type
  (service-type
   (name 'pam-rundir)
   (extensions (list (service-extension
		      pam-root-service-type
		      pam-rundir-pam-service)))
   (default-value #f)
   (description "Activate PAM-rundir support.  It automatically creates/destroys the
user runtime dir (/run/user/${UID} on login/logout.")))
