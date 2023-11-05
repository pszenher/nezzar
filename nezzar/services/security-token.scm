(define-module (nezzar services security-token)
  #:use-module (ice-9 format)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (guix packages)
  #:use-module (gnu services)
  #:use-module (gnu services configuration)
  #:use-module (gnu services shepherd)
  #:use-module (gnu system pam)
  #:use-module (nezzar packages hardware)

  #:export (tpm2-abrmd-service-type
	    tpm2-abrmd-configuration))

(define (serialize-field field-name val)
  (format #f "--~a~@[=~a~]~%" field-name val))

(define (serialize-string field-name val)
  (serialize-field field-name (string-append "\"" val "\"")))
(define (serialize-boolean field-name val)
  (if val (serialize-field field-name #f) ""))
(define serialize-number serialize-field)

(define (tcti-string? val)
  (let ((num-colons (lambda (str) (- (length (string-split str #\:)) 1))))
    (and (string? val)
	 (= 1 (num-colons val)))))
(define serialize-tcti-string serialize-string)

(define (logging-target? val)
  (and (string? val)
       (member val '("stdout" "syslog"))))
(define serialize-logging-target serialize-string)

(define-maybe string)

;;;
;;; TPM 2.0 Access Broker and Resource Manager Daemon
;;;

(define-configuration tpm2-abrmd-configuration
  (package
    (package tpm2-abrmd)
    "@code{tpm2-abrmd} Guix Package"
    empty-serializer)
  (tcti
   (tcti-string "libtss2-tcti-device.so.0:/dev/tpm0")
   "A string that describes the @acronym{TCTI, @acronym{TPM} Command
Transition Interface} and how to configure it for communication with
the next component down the @acronym{TSS2, TPM2 Software Stack}
stack. This string is formatted as @code{@var{tcti-name}:@var{tcti-conf}} where:

@table @var

@item tcti-name
The name of the @acronym{TCTI} library shared object file. Libraries
are found using the same algorithm as @cite{dlopen (3)}. If the
@acronym{TCTI} library file name follows the naming convention:
@code{libtss2-tcti-@var{<name>}.so.0} where @var{<name>} is the name
for the @acronym{TCTI}, the value of @var{<name>} may be supplied in
place of the full library file name.

@item tcti-conf
The configuration string passed to the @acronym{TCTI} library upon
initialization.

@end table

If this option is omitted (or a @code{NULL} string provided) then a
default @acronym{TCTI} is used in it's default configuration. If the
string does not contain a colon then it will be interpreted as only
the @var{tcti-name}. To provide only the configuration string (using
the default @acronym{TCTI}) then the first character in the string
passed to this option must be a colon followed by the configuration
string.")
  (allow-root
   (boolean #f)
   "Allow daemon to run as root. If this option is not provided the daemon
will refuse to run as the @code{root} user. Use of this option is @strong{not}
recommended.")
  (max-connections
   (number 27)
   "Set an upper bound on the number of concurrent client connections
allowed.  Once this number of client connections is reached new
connections will be rejected with an error.  If the option is not
specified the default is @code{27}.")
  (flush-all
   (boolean #f)
   "Flush all objects and sessions when daemon is started.")
  (logger
   (logging-target "stdout")
   "Direct logging output to named logging target. Supported targets are
@code{stdout} and @code{syslog}. If the logger option is not specified
the default is @code{stdout}.")
  (max-sessions
   (number 4)
   "Set and upper bound on the number of sessions that each client
connection is allowed to create (loaded or active) at any one time.
If the option is not specified the default is @code{4}.")
  (max-transients
   (number 27)
   "Set an upper bound on the number of transient objects that each client
connection allowed to load. Once this number of objects is reached
attempts to load new transient objects will produce an error. If the
option is not specified the default is @samp{27}.")
  (dbus-name
   (string "com.intel.tss2.Tabrmd")
   "Claim the given name on @code{dbus}. This option overrides the default
of @samp{com.intel.tss2.Tabrmd}.")
  (prng-seed-file
   maybe-string
   "Read seed for pseudo-random number generator from the provided file.")
  (session
   (boolean #f)
   "Connect daemon to the session dbus. If the option is not specified the
daemon connects to the system dbus."))

(define (tpm2-abrmd-shepherd-service config)
  (match-record config <tpm2-abrmd-configuration> (package)
    (shepherd-service
     (documentation "TPM 2.0 Access Broker and Resource Manager Daemon")
     (provision '(tpm2-abrmd))
     (requirement '(syslogd))
     (start #~(make-forkexec-constructor
	       (cons #$(file-append package "/sbin/tpm2-abrmd")
		     (string-split
		      ;; FIXME:  this is broken (not gexped, and wrong num of args...)
		      #$(serialize-configuration config)
		      #\newline))
	       #:user "tss"
	       #:group "tss"
	       #:log-file "/var/log/tpm2-abrmd.log"))
     (stop #~(make-kill-destructor)))))

(define (tpm2-abrmd-environment _)
  '(("TPM2_PKCS11_TCTI" . "tabrmd:")))

(define tpm2-abrmd-service-type
  (service-type
   (name 'tpm2-abrmd)
   (description
    "Run @command{tpm2-abrmd}, the TPM 2.0 Access Broker and Resource Manager Daemon")
   (extensions
    (list
     (service-extension session-environment-service-type
			tpm2-abrmd-environment)
     (service-extension shepherd-root-service-type
			(compose list tpm2-abrmd-shepherd-service))))))
