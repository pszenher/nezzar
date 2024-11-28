(define-module (nezzar packages engineering)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages engineering)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages check)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages python)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages multiprecision)
  #:use-module ((guix licenses) #:prefix license:))

(define-public ifcopenshell
  (package
    (name "ifcopenshell")
    (version "0.7.0.231127")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/IfcOpenShell/IfcOpenShell.git")
	     (commit (string-append "v" version))
	     (recursive? #t)))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "15b9xc3r35mmx3390ll3a97pjhww30jwj80vvxgzpm1f5i9mn80w"))))
    (build-system cmake-build-system)
    (inputs
     (list boost
	   opencascade-occt
	   python
	   swig

	   libxml2
	   cgal
	   gmp
	   eigen))
    (arguments
     (list
      #:configure-flags
      #~(list
	 (string-append "-DOCC_LIBRARY_DIR=" #$opencascade-occt "/lib")
	 (string-append "-DOCC_INCLUDE_DIR=" #$opencascade-occt "/include/opencascade")
	 "-DCOLLADA_SUPPORT=OFF"
	 "-DHDF5_SUPPORT=OFF"
	 (string-append "-DCGAL_INCLUDE_DIR=" #$cgal "/include")
	 (string-append "-DGMP_INCLUDE_DIR="  #$gmp "/include") 
	 (string-append "-DGMP_LIBRARY_DIR="  #$gmp "/lib") 
	 (string-append "-DMPFR_INCLUDE_DIR=" #$mpfr "/include") 
	 (string-append "-DMPFR_LIBRARY_DIR=" #$mpfr "/lib") 
	 ;; (string-append "-DJSON_INCLUDE_DIR=" #$ "/include")
	 (string-append "-DEIGEN_DIR=" #$eigen "/include/eigen3"))
      ;; No tests to run
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
	  (replace 'configure
	    (lambda* (#:key outputs (configure-flags '()) (out-of-source? #t)
                      build-type target
                      #:allow-other-keys)
	      (let* ((out        (assoc-ref outputs "out"))
		     (abs-srcdir (getcwd))
		     (srcdir     (if out-of-source?
				     (string-append "../" (basename abs-srcdir) "/cmake")
				     ".")))
		(format #t "source directory: ~s (relative from build: ~s)~%"
			abs-srcdir srcdir)
		(when out-of-source?
		  (mkdir "../build")
		  (chdir "../build"))
		(format #t "build directory: ~s~%" (getcwd))

		(let ((args `(,srcdir
			      ,@(if build-type
				    (list (string-append "-DCMAKE_BUILD_TYPE="
							 build-type))
				    '())
			      ,(string-append "-DCMAKE_INSTALL_PREFIX=" out)
			      ;; ensure that the libraries are installed into /lib
			      "-DCMAKE_INSTALL_LIBDIR=lib"
			      ;; add input libraries to rpath
			      "-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE"
			      ;; add (other) libraries of the project itself to rpath
			      ,(string-append "-DCMAKE_INSTALL_RPATH=" out "/lib")
			      ;; enable verbose output from builds
			      "-DCMAKE_VERBOSE_MAKEFILE=ON"

			      ;;  Cross-build
			      ,@(if target
				    (list (string-append "-DCMAKE_C_COMPILER="
							 target "-gcc")
					  (string-append "-DCMAKE_CXX_COMPILER="
							 target "-g++")
					  (if (string-contains target "mingw")
					      "-DCMAKE_SYSTEM_NAME=Windows"
					      "-DCMAKE_SYSTEM_NAME=Linux"))
				    '())
			      ,@configure-flags)))
		  (format #t "running 'cmake' with arguments ~s~%" args)
		  (apply invoke "cmake" args)))))
	  (replace 'build
	    (lambda* (#:key (make-flags '()) (parallel-build? #t)
                      #:allow-other-keys)
	      (apply invoke "make"
		     `(,@(if parallel-build?
			     ;; NOTE: restrict max parallelism to prevent memory exhaustion during build
			     `("-j" ,(number->string (min 8 (parallel-job-count))))
			     '())
		       ,@make-flags)))))))
    (home-page "https://ifcopenshell.org/")
    (synopsis "Open source IFC toolkit and geometry engine")
    (description "IfcOpenShell is an open source (LGPL) software library for working
with Industry Foundation Classes (IFC). Complete parsing support is
provided for IFC2x3 TC1, IFC4 Add2 TC1, IFC4x1, IFC4x2, and IFC4x3
Add2. Extensive geometric support is implemented for the IFC releases
IFC2x3 TC1 and IFC4 Add2 TC1. Extending with support for arbitrary IFC
schemas is possible at compile-time when using C++ and at run-time
when using Python.")
    (license (list license:gpl3 license:lgpl3))))

(define-public freecad-1.0-rc2
  (package
    (inherit freecad)
    (name (package-name freecad))
    (version "1.0rc2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/FreeCAD/FreeCAD.git")
	     (commit version)
	     (recursive? #t)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "148g0d5xxbhjk27vqmmpv53malq1k7i68ym80qq2cz5my33rzych"))
       ;; https://github.com/FreeCAD/FreeCAD/pull/11496
       ;; (patches (search-patches "freecad-vtk-9.3.patch"))
       ))
    (inputs
     (append (package-inputs freecad)
	     `(("yaml-cpp" ,yaml-cpp)
	       ("googletest" ,googletest))))
    (arguments
     (substitute-keyword-arguments (package-arguments freecad)
       ((#:configure-flags flgs)
	#~(list
	   ;; NOTE: disable attempted write to python `site-packages` dir during `install` phase
	   "-DINSTALL_TO_SITEPACKAGES=OFF"
           "-DBUILD_QT5=ON"
           "-DBUILD_FLAT_MESH:BOOL=ON"
           "-DBUILD_ENABLE_CXX_STD:STRING=C++17"
           (string-append "-DCMAKE_INSTALL_LIBDIR=" #$output "/lib")))))))

(define-public freecad-1.0-rc3
  (package
   (inherit freecad)
   (name (package-name freecad))
   (version "1.0rc3")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
	   (url "https://github.com/FreeCAD/FreeCAD.git")
	   (commit version)
	   (recursive? #t)))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0fhgqdkqmr0qv0ncvwsnawj5il8ps4b4jhjy6988h57mqpd7s5ik"))
     ;; https://github.com/FreeCAD/FreeCAD/pull/11496
     ;; (patches (search-patches "freecad-vtk-9.3.patch"))
     ))
   (inputs
    (append (package-inputs freecad)
	    `(("yaml-cpp" ,yaml-cpp)
	      ("googletest" ,googletest))))
   (arguments
    (substitute-keyword-arguments (package-arguments freecad)
				  ((#:configure-flags flgs)
				   #~(list
				      ;; NOTE: disable attempted write to python `site-packages` dir during `install` phase
				      "-DINSTALL_TO_SITEPACKAGES=OFF"
				      "-DBUILD_QT5=ON"
				      "-DBUILD_FLAT_MESH:BOOL=ON"
				      "-DBUILD_ENABLE_CXX_STD:STRING=C++17"
				      (string-append "-DCMAKE_INSTALL_LIBDIR=" #$output "/lib")))))))

;; ifcopenshell

freecad-1.0-rc2
