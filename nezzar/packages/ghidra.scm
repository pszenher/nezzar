(define-module (nezzar packages ghidra)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  ;; #:use-module (guix gexp)
  ;; #:use-module (guix utils)
  
  #:use-module (nonguix build-system binary)

  #:use-module (gnu packages base)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages java)

  ;; #:use-module (guix build-system cmake)
  ;; #:use-module (guix build-system emacs)

  ;; #:use-module (gnu packages base)

  ;; #:use-module (gnu packages bash)
  ;; #:use-module (gnu packages gcc)
  ;; #:use-module (gnu packages perl)
  ;; #:use-module (gnu packages python)

  ;; #:use-module (gnu packages emacs-xyz)
  ;; #:use-module (gnu packages multiprecision)
  ;; #:use-module (gnu packages version-control)
  )

(define-public ghidra
  (package
   (name "ghidra")
   (version "11.0")
   (home-page "https://www.nsa.gov/ghidra")
   (source (origin
	    (method url-fetch)
	    (uri (string-append
		  "https://github.com/NationalSecurityAgency/ghidra"
		  "/releases/download/"
		  "Ghidra_11.0_build/ghidra_11.0_PUBLIC_20231222.zip"))
	    (sha256
	     (base32
	      "155d8c0f0wvray0zkii7msl6kcn6wd73hj21kbydzcgn3kwl1wpi"))))
   (build-system binary-build-system)
   (arguments
    '(#:patchelf-plan '(("Ghidra/Features/Decompiler/os/linux_x86_64/decompile" ("glibc" "gcc"))
			("Ghidra/Features/Decompiler/os/linux_x86_64/sleigh"    ("glibc" "gcc"))
			("GPL/DemanglerGnu/os/linux_x86_64/demangler_gnu_v2_24" ("glibc" "gcc"))
			("GPL/DemanglerGnu/os/linux_x86_64/demangler_gnu_v2_41" ("glibc" "gcc")))))
   (inputs (list openjdk17 glibc `(,gcc "lib")))
   (native-inputs (list unzip))
   (synopsis "A software reverse engineering (SRE) framework created and maintained
by the National Security Agency Research Directorate")
   (description "Ghidra is a software reverse engineering (SRE) framework created and
maintained by the National Security Agency Research Directorate. This
framework includes a suite of full-featured, high-end software
analysis tools that enable users to analyze compiled code on a variety
of platforms including Windows, macOS, and Linux. Capabilities include
disassembly, assembly, decompilation, graphing, and scripting, along
with hundreds of other features. Ghidra supports a wide variety of
processor instruction sets and executable formats and can be run in
both user-interactive and automated modes. Users may also develop
their own Ghidra extension components and/or scripts using Java or
Python.")
   (license license:asl2.0)))

ghidra
