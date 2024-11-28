(define-module (nezzar packages verified)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)

  #:use-module (nezzar packages sml)
  #:use-module (nezzar packages hol)

  #:use-module (nongnu packages coq))

(define-public cakeml
  (package
    (name "cakeml")
    (version "2648")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/CakeML/cakeml.git")
	     (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "1w8r23jn4q714hmpbv901gkzfgkbmxwhyz4dsb9m4n747pdbdpmp"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
	  (delete 'configure)
	  (replace 'build
	    (lambda* (#:key (make-flags '()) (parallel-build? #t) #:allow-other-keys)
	      ;; (chdir "misc")
	      (apply invoke "Holmake"
		     `(,@(if parallel-build?
			     `("-j" ,(number->string (parallel-job-count)))
			     '())
		       ,@make-flags
		       "-v")))))))
    (inputs (list hol4-277f6ad))
    (home-page "https://cakeml.org/")
    (synopsis "CakeML is a verified implementation of a significant subset of Standard ML.")
    (description "CakeML is a functional programming language and an ecosystem of
proofs and tools built around the language. The ecosystem includes a
proven-correct compiler that can bootstrap itself.")
    (license license:bsd-3)))

(define-public compcert-3.14
  (package
    (inherit compcert)
    (version "3.14")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AbsInt/compcert")
                    (commit (string-append "v" version))))
              (file-name (git-file-name (package-name compcert) version))
              (sha256
               (base32
                "030fsg0qr9aasmwk0ahp78sw8rbjmf6pl1w9ws5ghs61kyk4qwj1"))))))

;; cakeml
compcert-3.14
