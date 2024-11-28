(use-modules
 (guix scripts home)
 (statprof))

(debug-enable)

(display "Starting Home Build...\n")
(call-with-output-file "/tmp/homecfg.profile.grafts.tree.log"
  (lambda (port)
    (statprof
     (lambda ()
       (guix-home "build" "/home/paul/src/guix-config/home/home-configuration.scm" ;; "--no-grafts"
		  ))
       #:display-style 'tree
       #:port port)))
