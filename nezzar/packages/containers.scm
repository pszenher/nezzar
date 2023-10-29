(define-module (nezzar packages containers)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  ;; #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (gnu packages golang))

(define-public apptainer
  (package
    (name "apptainer")
    (version "1.0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/apptainer/apptainer")
	     (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "1sn0zvmpmdy3dgaq2jr6jb8ygzfgc115r28idvivfzhcyq29041y"))
       (modules '((guix build utils)))
       (snippet
	`(begin
	   (with-output-to-file
	       "VERSION" (lambda _ (format #t ,version)))
	   ))))
    (build-system go-build-system)
    (arguments
     `(#:import-path "github.com/apptainer/apptainer"
       #:phases
       (modify-phases %standard-phases
	 (replace 'build
	   (lambda _
	     (invoke "go" "build" "-o" "./apptainer" "./cmd/apptainer"))))))
    ;; (build-system gnu-build-system)
    ;; (arguments
    ;;  `(#:phases (modify-phases %standard-phases
    ;; 		  (replace 'configure
    ;; 		    (lambda* (#:key version #:allow-other-keys)
    ;; 		      (invoke "bash" "./mconfig"))
    ;; 		    ))
    ;;    #:make-flags '("-C" "builddir")))
    (inputs
     (list go))
    (home-page "https://apptainer.org/")
    (synopsis "The Container System For Secure High Performance Computing")
    (description "Apptainer/Singularity is the most widely used
container system for HPC. It is designed to execute applications at
bare-metal performance while being secure, portable, and 100%
reproducible. Apptainer is an open-source project with a friendly
community of developers and users. The user base continues to expand,
with Apptainer/Singularity now used across industry and academia in
many areas of work.")
    (license license:bsd-3)))

