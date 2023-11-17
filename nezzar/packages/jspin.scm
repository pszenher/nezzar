(define-module (nezzar packages jspin)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)

  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages java)

  #:use-module (nezzar packages spin))

;;; ================================================================
;;; || TODO:  jSpin build is broken, manual build not worth it...
;;; ================================================================

(define-public jspin
  (let ((version "5.0")
	(revision "1")
	(commit "d053eea30528c116cd8403e8922b87e779806d53"))
    (package
      (name "jspin")
      (version (git-version version revision commit))
      (source
       (origin
	 (method git-fetch)
	 (uri (git-reference
	       (url "https://github.com/motib/jspin.git")
	       (commit commit)))
	 (file-name (git-file-name name version))
	 (sha256
	  (base32
	   "1d98ffbpzw95k5078hzxmabv32sh276ahrji9p2sfgs32kskifs3"))))
      (build-system gnu-build-system)
      (arguments
       (list
	#:phases
	#~(modify-phases %standard-phases
	    (delete 'configure)
	    (delete 'check)
	    (replace 'build
	      (lambda _
		(begin
		  (apply invoke "javac" (find-files "jspin" "\\.java"))
		  (apply invoke "javac" (find-files "spinSpider" "\\.java"))
		  (apply invoke "javac" (find-files "filterSpin" "\\.java"))
		  (apply invoke "jar" "cfm"  "jSpin.jar"
			 "jspin/MANIFEST.MF"
			 (append
			  (find-files "jspin" "\\.class")
			  (find-files "spinSpider" "\\.class")
			  (find-files "filterSpin" "\\.class"))))))
	    (replace 'install
	      (lambda  _
		(begin
		  (install-file "jSpin.jar" (string-append #$output "/share/java/"))))))))
      (inputs
       (list `(,icedtea "jdk") spin graphviz))
      (home-page "https://github.com/motib/jspin")
      (synopsis "Java-based alternative GUI for running the SPIN model checker")
      (description "jspin enables running the SPIN model checker without knowing the
command-line arguments.  Most options are easily accessible from menus
and shortcuts.  The output is formatted to facilitate understanding
the results of a simulation or verification.")
      (license license:gpl2+))))
