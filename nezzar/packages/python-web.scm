(define-module (nezzar packages python-web)
  #:use-module (srfi srfi-1)
  
  #:use-module (guix packages)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)

  #:use-module (gnu packages base)
  #:use-module (gnu packages check)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web))

(define python-pyee-11
  (package
    (name "python-pyee")
    (version "11.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyee" version))
       (sha256
	(base32 "0a9bgg2pmrdlbl5a2535indlwfkq299f71kj12nkx8w570gcahm6"))))
    (build-system pyproject-build-system)
    (arguments
     '(#:tests? #f
       ;; disable due to typerror on ~test_propagates_exception/failure~
       ))
    (propagated-inputs (list python-typing-extensions))
    (native-inputs (list
		    python
		    python-black
		    python-flake8
		    ;; python-flake8-black
		    python-isort
		    python-jupyter-console
		    python-mkdocs
		    ;; python-mkdocs-include-markdown-plugin
		    ;; python-mkdocstrings
		    python-pytest
		    python-pytest-asyncio
		    python-pytest-trio
		    python-toml
		    python-tox
		    python-trio
		    python-trio-typing
		    python-twine
		    python-twisted
		    ;; python-validate-pyproject
		    ))
    (home-page "")
    (synopsis
     "A rough port of Node.js's EventEmitter to Python with a few tricks of its own")
    (description
     "This package provides a rough port of Node.js's @code{EventEmitter} to Python
with a few tricks of its own")
    (license license:expat)))


(define python-greenlet-3
  (package
    (name "python-greenlet")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "greenlet" version))
       (sha256
	(base32 "02z1kiql8dc3jznxayqz1a2a9nf53qbl1r0yvhm491glj4zlx0qr"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-objgraph python-psutil))
    (home-page "https://greenlet.readthedocs.io/")
    (synopsis "Lightweight in-process concurrent programming")
    (description "Lightweight in-process concurrent programming")
    (license license:expat)))

(define %playwright-driver-binary-hashes
  '(("1.39.0" . "1mrasb1mhn5r5dga7g80v9rira0k0jnxjacgn1n2v4lchhrhrkx0")
    ("1.38.0" . "1zs8mfn41k5kv1r6vw8x3hw7z7ghmwfrvdhx9lvcllhrdiqzqkbm")))

(define* (make-playwright-driver-binary #:key
					version
					(platform "linux")
					(base-uri "https://playwright.azureedge.net/builds/driver"))
  (if (not (string=? platform "linux"))
      (error (string-append
	      "Expected playwright driver target platform to be Linux, you gave me:  "
	      platform))
      (package
	(name "playwright-driver-binary")
	(version version)
	(source
	 (origin
	   (method url-fetch)
	   (uri (string-append
		 base-uri "/" "playwright-" version "-" platform ".zip"))
	   (sha256
	    (base32 (or (assoc-ref %playwright-driver-binary-hashes version)
			(error (string-append "Invalid playwright driver version:  " version)))))))
	(build-system trivial-build-system)
	(arguments
	 '(#:builder
	   (begin
	     (let ((out-dir (assoc-ref %outputs "out"))
		   (zip-file (assoc-ref %build-inputs "source")))
	       (copy-file zip-file out-dir)))))
	(home-page "https://playwright.dev/")
	(synopsis "Prebuilt Javascript driver for Playwright browser automation tools")
	(description "Needed by python-playwright at build-time")
	(license license:asl2.0))))

;; (define python-pytest-playwright
;;   (package
;;     (name "python-pytest-playwright")
;;     (version "0.4.3")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri (pypi-uri "pytest-playwright" version))
;;        (sha256
;; 	(base32 "1kcw3pgf204vf0bm1ha49p85bkvqlbmr6ij5jmwabrmizd3jr7k9"))))
;;     (build-system pyproject-build-system)
;;     (propagated-inputs (list python-playwright python-pytest
;;                              python-pytest-base-url python-slugify))
;;     (home-page "https://github.com/microsoft/playwright-pytest")
;;     (synopsis
;;      "A pytest wrapper with fixtures for Playwright to automate web browsers")
;;     (description
;;      "This package provides a pytest wrapper with fixtures for Playwright to automate
;; web browsers")
;;     (license license:asl2.0)))

(define python-auditwheel
  (package
    (name "python-auditwheel")
    (version "5.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "auditwheel" version))
       (sha256
	(base32 "06fg7j5fdznkl0dj78xpl5z8iwfs0j44kqiwcsdck752nwx1by5a"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f ; requires docker
      #:phases
      #~(modify-phases %standard-phases
	  (replace 'build
            (lambda _
              ;; ZIP does not support timestamps before 1980.
              (setenv "SOURCE_DATE_EPOCH" "315532800")
              (invoke "python" "-m" "build" "--wheel" "--no-isolation" ".")))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((whl (car (find-files "dist" "\\.whl$"))))
                (invoke "pip" "--no-cache-dir" "--no-input"
                        "install" "--no-deps" "--prefix" #$output whl)))))))
    (propagated-inputs (list python-importlib-metadata
			     python-pyelftools))
    (native-inputs (list ;; python-docker
			 python-jsonschema
			 python-pretend
			 ;; python-pypatchelf
			 python-pytest
			 python-pytest-cov
			 python-setuptools-scm))
    (home-page "https://github.com/pypa/auditwheel")
    (synopsis "Cross-distribution Linux wheels")
    (description "Cross-distribution Linux wheels")
    (license license:expat)))

(define python-playwright-1.38
  (package
    (name "python-playwright")
    (version "1.38.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/microsoft/playwright-python.git")
	     (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
	(base32 "0xbxlkyqqilx331vxvaryv9fjc90j7z5dba7bzbd6mzdf074nxib"))))
    (build-system pyproject-build-system)
    (native-inputs (list
		    (make-playwright-driver-binary #:version version)

		    ;; build libs
		    python-setuptools-scm
		    python-auditwheel

		    ;; network/crypto libs
		    python-requests
		    python-service-identity
		    python-twine
		    python-twisted
		    python-pyopenssl
		    ;; python-types-pyopenssl  ; FIXME:  packages this

		    ;; image processing libs
		    python-pillow
		    python-pixelmatch

		    ;; test libs
		    python-pytest
		    python-pytest-asyncio
		    python-pytest-cov
		    python-pytest-repeat
		    python-pytest-timeout
		    python-pytest-xdist

		    ;; ci/qa/linter libs
		    python-autobahn
		    python-black
		    ;; python-pre-commit       ; FIXME:  packages this
		    python-flake8
		    python-flaky
		    python-mypy
		    python-objgraph))
    (propagated-inputs
     (list python-pyee python-greenlet))
    (arguments
     `(#:tests? #f ; test require network, TODO: enable those that don't
       #:phases
       ,#~(modify-phases %standard-phases

	    (add-before 'build 'set-setuptools-version
	      (lambda _
		;; pass version string to setuptools_scm (as
		;; guix eats the vcs directory)
		(setenv "SETUPTOOLS_SCM_PRETEND_VERSION" #$version)))

	    (add-after 'unpack 'patch-dependency-versions
	      (lambda _
		(substitute* "setup.py"
		  ;; Allow older version of greenlet
		  (("greenlet==2.0.2") "greenlet>=2.0.1")
		  ;; Allow newer versions of required packages
		  (("\"(wheel|setuptools-scm)==" _ pkg)
		   (string-append "\"" pkg ">=")))
		(substitute* "pyproject.toml"
		  ;; Allow newer versions of required packages
		  (("\"(setuptools|wheel|setuptools-scm|auditwheel)==" _ pkg)
		   (string-append "\"" pkg ">=")))))

	    (add-after 'unpack 'fix-setuppy-packages-value
	      ;; NOTE: Due to the unconventional local dev environment
	      ;;       of the playwright team, local rebuilds of this
	      ;;       package have been broken since Aug 2022, and
	      ;;       were only fixed in 1.39.  This backport allows
	      ;;       local builds to work without pip's -e dev
	      ;;       environment
	      ;; 
	      (lambda _
		(substitute* "setup.py"
		  (("(packages=\\[)\"playwright\"(\\],)" _ prefix suffix)
		   (string-join
		    (list prefix
			  "    \"playwright\","
			  "    \"playwright.async_api\","
			  "    \"playwright.sync_api\","
			  "    \"playwright._impl\","
			  "    \"playwright._impl.__pyinstaller\","
			  suffix)
		    "\n")))))

	    (add-after 'unpack 'stub-driver-download
	      (lambda _
		(substitute* "setup.py"
		  (("^(def download_driver)(\\(zip_name: str\\) -> None:)" match-str prefix suffix)
		   (string-join
		    (list match-str
			  (string-append "    print( f\"Skipping fetch of "
					 "https://playwright.azureedge.net/builds/driver/"
					 "playwright-{driver_version}-{zip_name}.zip"
					 "\")")
			  (string-append prefix "STUB" suffix))
		    "\n")))))

	    (add-before 'build 'copy-prebuilt-drivers
	      (lambda* (#:key inputs #:allow-other-keys)
		(begin
		  (mkdir-p "driver")
		  (copy-file
		   (assoc-ref inputs "playwright-driver-binary")
		   (string-append "driver/playwright-" #$version "-linux.zip")))))

	    ;; FIXME: these can't run without pytest-playwright, which
	    ;;        naturally depends on this package *insert sounds
	    ;;        of existential pain*
	    ;; 
	    ;; (add-after 'install 'test-chromium-driver
	    ;;   (lambda _
	    ;;     (invoke
	    ;; 	 "pytest"
	    ;; 	 "--maxfail=2" "--full-trace" "--browser" "chromium")))

	    ;; FIXME: gonna need nonguix's binary-build-system
	    ;;        to patch the ~node~ binary runpath from
	    ;;        the driver zipfile (or actually package
	    ;;        playwright-driver)
	    ;; 
	    (delete 'validate-runpath))))
    (home-page "https://playwright.dev/python/")
    (synopsis "Python version of the Playwright testing and automation library.")
    (description
     "Playwright is a Python library to automate Chromium, Firefox and
WebKit browsers with a single API. Playwright delivers automation that
is ever-green, capable, reliable and fast.")
    (license license:asl2.0)))

(define python-playwright-1.39
  (package
    (name "python-playwright")
    (version "1.39.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/microsoft/playwright-python.git")
	     (commit (string-append "release-"
				    ;; FIXME: this is disgusting, revise
				    (string-join (take (string-split version #\.) 2) ".")))))
       (file-name (git-file-name name version))
       (sha256
	(base32 "1bfrfa3sh73fxxv3c1x0zqh63zmhiii1m0gzm15vy7fz1qgz8ad5"))))
    (build-system pyproject-build-system)
    (native-inputs (list
		    (make-playwright-driver-binary #:version version)
		    python-setuptools
		    ;; python-setuptools-scm
		    ;; python-setuptools-scm-8
		    python-wheel))
    (propagated-inputs (list python-pyee-11 python-greenlet-3))
    (arguments
     (list
      #:tests? #f	 ; test require network, TODO: enable those that don't
      #:phases #~(modify-phases %standard-phases

		   (add-before 'build 'set-setuptools-version-file
		     (lambda _
		       ;; 
		       ;; pass version string to setuptools_scm (as
		       ;; guix eats the vcs directory)
		       ;;
		       ;; (setenv "SETUPTOOLS_SCM_PRETEND_VERSION" #$version)))
		       ;; 
		       ;; FIXME: just making the file ourselves right
		       ;;        now, setuptools-scm isn't packaged
		       ;;        right at a high enough version...
		       ;; 
		       (with-output-to-file "playwright/_repo_version.py"
			 (lambda ()
			   (display
			    (string-append "version = \"" #$version "\""))))))

		   (add-after 'unpack 'stub-driver-download
		     (lambda _
		       (substitute* "setup.py"
			 (("^(def download_driver)(\\(zip_name: str\\) -> None:)" match-str prefix suffix)
			  (string-join
			   (list match-str
				 (string-append "    print(f\"Skipping fetch of "
						"https://playwright.azureedge.net/builds/driver/"
						"playwright-{driver_version}-{zip_name}.zip"
						"\")")
				 (string-append prefix "STUB" suffix))
			   "\n")))))

		   ;; (add-before 'build 'copy-prebuilt-drivers
		   ;;   (lambda* (#:key inputs #:allow-other-keys)
		   ;;     (begin
		   ;; 	 (mkdir-p "driver")
		   ;; 	 (copy-file (assoc-ref inputs "playwright-driver-binary")
		   ;; 		    "driver/playwright-1.39.0-linux.zip"))))

		   (add-before 'build 'copy-prebuilt-drivers
		     (lambda* (#:key inputs #:allow-other-keys)
		       (begin
			 (mkdir-p "driver")
			 (copy-file
			  (assoc-ref inputs "playwright-driver-binary")
			  (string-append "driver/playwright-" #$version "-linux.zip")))))

		   ;; FIXME: gonna need nonguix's binary-build-system
		   ;;        to patch the ~node~ binary runpath from
		   ;;        the driver zipfile (or actually package
		   ;;        playwright-driver)
		   ;; 
		   ;; NOTE: also going to need to set permissions on
		   ;;       the unpacked scripts/binaries, solution is
		   ;;       same as above (right now they're set to
		   ;;       0x444
		   (delete 'validate-runpath))))
    (home-page "https://playwright.dev/python/")
    (synopsis "Python version of the Playwright testing and automation library.")
    (description
     "Playwright is a Python library to automate Chromium, Firefox and
WebKit browsers with a single API. Playwright delivers automation that
is ever-green, capable, reliable and fast.")
    (license license:asl2.0)))

python-playwright-1.38
