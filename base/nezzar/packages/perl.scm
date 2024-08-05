(define-module (nezzar packages perl)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system perl)
  #:use-module ((guix licenses) #:prefix license:)

  #:use-module (gnu packages databases)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages perl-compression)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml))

(define-public perl-image-size
  (package
    (name "perl-image-size")
    (version "3.300")
    (source (origin
	      (method url-fetch)
	      (uri (string-append
		    "mirror://cpan/authors/id/R/RJ/RJRAY/Image-Size-" version
		    ".tar.gz"))
	      (sha256
	       (base32
		"0sq2kwdph55h4adx50fmy86brjkkv8grsw33xrhf1k9icpwb3jak"))))
    (build-system perl-build-system)
    (native-inputs
     (list perl-module-build))
    (home-page "https://metacpan.org/release/Image-Size")
    (synopsis "A library to extract height/width from images")
    (description "The Image::Size library is based upon the wwwis script written by Alex
Knowles (alex@ed.ac.uk), a tool to examine HTML and add 'width' and
'height' parameters to image tags. The sizes are cached internally
based on file name, so multiple calls on the same file name (such as
images used in bulleted lists, for example) do not result in repeated
computations.")
    (license (list license:artistic2.0 license:lgpl2.1))))

(define-public perl-latexml
  (package
    (name "perl-latexml")
    (version "0.8.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
	     "mirror://cpan/authors/id/B/BR/BRMILLER/"
	     "LaTeXML-" version ".tar.gz"))
       (sha256
	(base32
	 "0yfclh3bkksd4xvrhwf06xsbisp84x12vk6lml6yr7bp82a9vni5"))))
    (build-system perl-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
	 ;; Hard-override the 'check phase, as perl-build-system
	 ;; doesn't seem to expose override capabilities for make test
	 ;; arguments
	 (replace 'check
	   (lambda* (#:key target
		     (tests? (not target))
		     (test-target "check")
		     (make-flags '())
		     (parallel-tests? #t)
		     #:allow-other-keys)
	     (if (not tests?) (format #t "test suite not run~%")
		 (apply invoke
			"make" test-target
			`(,@(if (not parallel-tests?) '()
				(list
				 (string-append
				  "HARNESS_OPTIONS=j"
				  (number->string
				   ;; Set upper limit of 10 parallel
				   ;; test jobs, as higher job counts
				   ;; exceed ARG_MAX when dispatching
				   ;; tests
				   (min 10 (parallel-job-count))))))
			  ,@make-flags)))))
	 ;; Add wrapper phase for PERL5LIB env var, using methods from:
	 ;; - python-build-system    (gnu build python-build-system)
	 ;; - perl-image-exiftool    (gnu packages photo)
	 ;; - perl-eval-withlexicals (gnu packages perl)
	 (add-after 'install 'wrap
	   (lambda* (#:key outputs #:allow-other-keys)
	     (define (list-of-files dir)
	       (find-files dir (lambda (file stat)
				 (and (eq? 'regular (stat:type stat))
				      (not (wrapped-program? file))))))
	     ;; Make sure the "latexml*" commands find perl libraries (inc. its own)
	     ;; XXX: Shouldn't it be handled by PERL-BUILD-SYSTEM?
	     ;; XXX: Answer - yes, it should, but patches 26275
	     ;;               and 27003 were never merged...
	     (let* ((out          (assoc-ref outputs "out"))
		    (bin       (string-append out "/bin"))
		    (sbin      (string-append out "/sbin"))
		    (perl-lib  (string-append out "/lib/perl5/site_perl/"
					      ,(package-version perl)))
		    (perl-deps (search-path-as-string->list
				(or (getenv "PERL5LIB") "")))
		    (perl-path (list "PERL5LIB" 'prefix (cons* perl-lib perl-deps))))
	       (for-each (lambda (dir)
			   (for-each (lambda (file)
				       (wrap-program file perl-path))
				     (list-of-files dir)))
			 (list bin sbin))))))))
    (propagated-inputs
     (list perl-archive-zip
	   perl-db-file
	   perl-file-which
	   perl-getopt-long
	   perl-image-size
	   perl-io-string
	   perl-json-xs
	   perl-libwww
	   perl-mime-base64
	   perl-parse-recdescent
	   perl-pod-parser
	   perl-text-unidecode
	   perl-time-hires
	   perl-uri
	   perl-image-magick
	   perl-xml-libxml
	   perl-xml-libxslt))
    (home-page "https://metacpan.org/release/LaTeXML")
    (synopsis "Transforms TeX and LaTeX into XML/HTML/MathML")
    (description "LaTeXML is a TeX & LaTeX to XML, HTML, MathML, ePub, JATS,
etc converter.")
    (license license:public-domain)))
