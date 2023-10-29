(define-module (nezzar packages desktop)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix svn-download)
  #:use-module (guix gexp)
  #:use-module (guix build utils)
  #:use-module (guix build-system ant)
  #:use-module (guix build-system maven)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages java)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages gl))

(define-public sweethome3d
  (package
    (name "sweethome3d")
    (version "7.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://sourceforge/sweethome3d/SweetHome3D-source/"
			   "SweetHome3D-" version "-src/"
			   "SweetHome3D-" version "-src.zip"))
       (sha256
	(base32 "1ah6ngwbl7757yjsfg6vmq1x1y3qicd24yphq25sy6wznr9zz6zl"))
       (modules '((guix build utils)))
       (snippet
	'(begin (map delete-file-recursively '("lib" "libtest")) #t))))
    (build-system ant-build-system)
    (arguments
     `(#:build-target "jarExecutable"
       #:tests? #f
       #:phases
       (modify-phases %standard-phases
	 (replace 'install
	   (install-jars "install"))
	 (add-after 'install 'install-runtime-script
	   (lambda* (#:key outputs inputs #:allow-other-keys)
	     (let* ((out (assoc-ref outputs "out"))
		    (bin (string-append out "/bin"))
		    (jdk (assoc-ref inputs "jdk"))
		    (script-name "sweethome3d"))
	       (mkdir-p bin)
	       (with-output-to-file (string-append bin "/" script-name)
		 (lambda _
		   (format
		    #t
		    (string-join
		     ;; TODO: set java runtime path with
		     ;;       'file-append and evaluate what
		     ;;       environment variables/runtime
		     ;;       args are necessary
		     (list
		      "#!/bin/sh"
		      (string-join
		       (list
			"exec" (string-append jdk "/bin/java")
			"-cp" (string-append
			       (getenv "CLASSPATH")
			       ":" out "/share/java/SweetHome3D-"
			       ,(package-version sweethome3d) ".jar")
			"com.eteks.sweethome3d.SweetHome3D -open \"$@\"")
		       " "))
		     "\n"))))
	       (chmod (string-append bin "/" script-name) #o755)))))))
    (inputs
     (list java-java3d
	   java-vecmath))
    (native-inputs
     (list unzip))
    (home-page "https://www.sweethome3d.com/")
    (synopsis "A free interior design application which helps you draw
the plan of your house, arrange furniture on it and visit the results
in 3D")
    (description "Sweet Home 3D is a free interior design application that helps you
place your furniture on a house 2D plan, with a 3D preview.

Available at https://www.sweethome3d.com/, this program is aimed at
people who want to design their interior quickly, whether they are
moving or they just want to redesign their existing home. Numerous
visual guides help you draw the plan of your home and layout
furniture. You may draw the walls of your rooms upon the image of an
existing plan, and then, drag and drop furniture onto the plan from a
catalog organized by categories. Each change in the 2D plan is
simultaneously updated in the 3D view, to show you a realistic
rendering of your layout.")
    (license license:gpl2)))

(define-public java-vecmath
  (package
    (name "java-vecmath")
    (version "1.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://debian/pool/main/v/vecmath/"
			   "vecmath_" version ".orig.tar.gz"))
       (sha256
	(base32 "1hpc8rhsvvd9fxrf7jx82fnidfjri6ws8cbk1hd1if40l0lcdb2x"))))
    (build-system ant-build-system)
    (arguments
     '(#:tests? #f			; no tests provided
       #:phases
       (modify-phases %standard-phases
	 (add-after 'unpack 'chdir
           (lambda _ (chdir "vecmath") #t))
	 (replace 'install
	   (install-jars "build")))))
    (home-page "https://salsa.debian.org/java-team/vecmath")
    (synopsis "")
    (description "")
    (license license:gpl2)))		; gpl2 with classpath exception

(define-public java-java3d
  (package
    (name "java-java3d")
    (version "1.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://debian/pool/main/j/java3d/"
			   "java3d_" version "+dfsg.orig.tar.gz"))
       (patches
	(search-patches "java-java3d-fix-powerpc-ftbfs.patch"
			"java-java3d-fix-generic-ftbfs.patch"
			"java-java3d-fix-ia64-ftbfs.patch"
			"java-java3d-no-maxmemory.patch"
			"java-java3d-pic-amd64.patch"
			"java-java3d-pic-i586.patch"
			"java-java3d-java-compat.patch"
			"java-java3d-java9-compatibility.patch"
			"java-java3d-java10-compatibility.patch"
			"java-java3d-fix-definition-of-GLsizeiptr.patch"))
       (sha256
	(base32 "10xymz7bjabcgfwj70aibrz8x6x7p7wwakx9p5gikhjj7jnd2lhc"))))
    (build-system ant-build-system)
    (arguments
     `(#:make-flags '("-DjavahBuild.notRequired=true")
       #:tests? #f
       #:phases
       (modify-phases %standard-phases
	 (add-before 'build 'chdir
           (lambda _ (chdir "j3d-core") #t))
	 (replace 'install
	   (install-jars "build")))))
    (inputs
     (list java-vecmath))
    (native-inputs
     (list libx11
	   libxt
	   mesa))
    (home-page "https://salsa.debian.org/java-team/java3d")
    (synopsis "A scene graph-based 3D application programming interface (API) for
the Java platform")
    (description "")
    (license license:gpl2)))	       ; gpl2 with classpath exception

(define-public java-freehep-graphics2d
  (package
    (name "java-freehep-graphics2d")
    (version "2.1.1")
    (source
     (origin
       (method svn-fetch)
       (uri (svn-reference
	     (url (string-append "svn://svn.freehep.org/svn/freehep/tags/"
				 "vectorgraphics-" version "/freehep-graphics2d"))
	     (revision 12821)))
       (file-name (string-append name "-" version "-checkout"))
       (sha256
	(base32
	 "0i3p80xvfmhqxsxs1pqgcz44d5cclrdwdrx5flxbhdffbfgmq10a"))))
    (build-system maven-build-system)
    (inputs
     (list java-freehep-util))
    (home-page "https://java.freehep.org/vectorgraphics/freehep-graphics2d")
    (synopsis "FreeHEP Graphics 2D Library")
    (description "FreeHEP Graphics 2D Library")
    (license license:lgpl2.1)))

(define-public java-freehep-util
  (package
    (name "java-freehep-util")
    (version "2.1.3")
    (source
     (origin
       (method svn-fetch)
       (uri (svn-reference
	     (url (string-append "svn://svn.freehep.org/svn/freehep/tags/"
				 "freehep-util-" version))
	     (revision 16548)))
       (file-name (string-append name "-" version "-checkout"))
       (sha256
	(base32
	 "0fq80sjrvcg084b67vhkgag0fbmqp75qbsyzrkf4fdnr6s8ypn47"))
       ;; (modules '((guix build utils)))
       ;; (snippet
       ;; 	'(begin
       ;; 	   ;; Drop <dependencies> tag from source
       ;; 	   ;; TODO: re-add dependencies when netbeans-import-util is packaged
       ;; 	   (substitute* "pom.xml" (("\n") ""))
       ;; 	   (substitute* "pom.xml" (("<dependencies>.*</dependencies>") ""))))
       ))
    (build-system maven-build-system)
    (arguments
     '(#:exclude ((org.netbeans . (openide-lookup)))))
    (home-page "https://java.freehep.org/freehep-util")
    (synopsis "General utility classes for FreeHEP")
    (description "General utility classes for FreeHEP.")
    (license license:lgpl2.1)))

(define-public java-netbeans-platform
  (package
    (name "java-netbeans-platform")
    (version "15")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/apache/netbeans.git")
	     (commit version)))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "0rfqncf2xwqaf51qhfqfad7nn66chcrz5vpsxnz86s3gqphhrriq"))
       (modules '((guix build utils)))
       (snippet
	'(for-each delete-file-recursively
		   (find-files "." "^external$"
			       #:directories? #t)))))
    (build-system ant-build-system)
    (arguments
     '(#:source-dir "nbbuild"
       #:build-target "build-platform"
       #:make-flags (list "-Dext.binaries.downloaded=true"
			  "-Dverify.checkout=false")))
    (home-page "https://netbeans.apache.org")
    (synopsis "Apache NetBeans")
    (description "Apache NetBeans is an open source development environment, tooling
platform, and application framework.")
    (license license:asl2.0)))

;; sweethome3d
;; java-freehep-graphics2d
java-netbeans-platform
