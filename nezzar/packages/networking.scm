(define-module (nezzar packages networking)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:)

  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages xdisorg)

  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-compression)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-xyz)  
  #:use-module (gnu packages python-web)

  #:use-module (gnu packages rust)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics))

(load "rust-anyhow-1.0.75.scm")
(load "rust-boringtun-0.6.0.scm")
(load "rust-console-subscriber-0.1.10.scm")
(load "rust-image-0.24.6.scm")
(load "rust-log-0.4.20.scm")
(load "rust-smoltcp-0.10.0.scm")
(load "rust-x25519-dalek-2.0.0-rc.3.scm")

(define-public rust-async-trait-0.1
  (package
    (name "rust-async-trait")
    (version "0.1.73")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "async-trait" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1w60x18qm18drm8pdl0ix4jai83nh8hlwfjswca3dh4096rww05w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))
       #:cargo-development-inputs (("rust-futures" ,rust-futures-0.3)
                                   ("rust-rustversion" ,rust-rustversion-1)
                                   ("rust-tracing" ,rust-tracing-0.1)
                                   ("rust-tracing-attributes" ,rust-tracing-attributes-0.1)
                                   ("rust-trybuild" ,rust-trybuild-1))))
    (home-page "https://github.com/dtolnay/async-trait")
    (synopsis "Type erasure for async trait methods")
    (description "Type erasure for async trait methods")
    (license (list license:expat license:asl2.0))))

(define-public rust-prost-derive-0.12
  (package
    (name "rust-prost-derive")
    (version "0.12.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "prost-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cjcib5w99sycw01j4a1j1xcx97crg9gfyc10zsnqhdxzaksnnr6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-itertools" ,rust-itertools-0.11)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/tokio-rs/prost")
    (synopsis "A Protocol Buffers implementation for the Rust Language.")
    (description
     "This package provides a Protocol Buffers implementation for the Rust Language.")
    (license license:asl2.0)))

(define-public rust-prost-0.12
  (package
    (name "rust-prost")
    (version "0.12.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "prost" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "039lgs7qbc8mvn2bk8hm84nhczqw79hs1x0d0qybaccw7cpx5zgl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-prost-derive" ,rust-prost-derive-0.12))
       #:cargo-development-inputs (("rust-criterion" ,rust-criterion-0.4)
                                   ("rust-env-logger" ,rust-env-logger-0.10)
                                   ("rust-log" ,rust-log-0.4)
                                   ("rust-proptest" ,rust-proptest-1)
                                   ("rust-rand" ,rust-rand-0.8))))
    (home-page "https://github.com/tokio-rs/prost")
    (synopsis "A Protocol Buffers implementation for the Rust Language.")
    (description
     "This package provides a Protocol Buffers implementation for the Rust Language.")
    (license license:asl2.0)))

(define-public rust-tokio-util-0.7
  (package
    (name "rust-tokio-util")
    (version "0.7.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-util" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "058y6x4mf0fsqji9rfyb77qbfyc50y4pk2spqgj6xsyr693z66al"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-io" ,rust-futures-io-0.3)
                       ("rust-futures-sink" ,rust-futures-sink-0.3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-slab" ,rust-slab-0.4)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tracing" ,rust-tracing-0.1))
       #:cargo-development-inputs (("rust-async-stream" ,rust-async-stream-0.3)
                                   ("rust-futures" ,rust-futures-0.3)
                                   ("rust-futures-test" ,rust-futures-test-0.3)
                                   ("rust-parking-lot" ,rust-parking-lot-0.12)
                                   ("rust-tempfile" ,rust-tempfile-3)
                                   ("rust-tokio" ,rust-tokio-1)
                                   ("rust-tokio-stream" ,rust-tokio-stream-0.1)
                                   ("rust-tokio-test" ,rust-tokio-test-0.4))))
    (home-page "https://tokio.rs")
    (synopsis "Additional utilities for working with Tokio.
")
    (description "Additional utilities for working with Tokio.")
    (license license:expat)))

(define-public rust-pyo3-log-0.8
  (package
    (name "rust-pyo3-log")
    (version "0.8.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pyo3-log" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hrvdialyynmpnvydnfsnjm0mkmnv83acv237nkxhf35kcs2p760"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-arc-swap" ,rust-arc-swap-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-pyo3" ,rust-pyo3-0.19))
       #:cargo-development-inputs (("rust-pyo3" ,rust-pyo3-0.19)
                                   ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/vorner/pyo3-log")
    (synopsis "Logging bridge from pyo3 native extension to python")
    (description "Logging bridge from pyo3 native extension to python")
    (license (list license:asl2.0 license:expat))))

(define-public rust-pyo3-asyncio-macros-0.19
  (package
    (name "rust-pyo3-asyncio-macros")
    (version "0.19.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pyo3-asyncio-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cr6rrlyslrn2f06f0cn8aqcivw27jqw1xcn8ng1fiwm8835y174"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/awestlake87/pyo3-asyncio")
    (synopsis "Proc Macro Attributes for PyO3 Asyncio")
    (description "Proc Macro Attributes for @code{PyO3} Asyncio")
    (license license:asl2.0)))

(define-public rust-async-channel-1
  (package
    (name "rust-async-channel")
    (version "1.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "async-channel" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0dbdlkzlncbibd3ij6y6jmvjd0cmdn48ydcfdpfhw09njd93r5c1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-concurrent-queue" ,rust-concurrent-queue-2)
                       ("rust-event-listener" ,rust-event-listener-2)
                       ("rust-futures-core" ,rust-futures-core-0.3))))
    (home-page "https://github.com/smol-rs/async-channel")
    (synopsis "Async multi-producer multi-consumer channel")
    (description "Async multi-producer multi-consumer channel")
    (license (list license:asl2.0 license:expat))))

(define-public rust-pyo3-asyncio-0.19
  (package
    (name "rust-pyo3-asyncio")
    (version "0.19.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "pyo3-asyncio" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1bgda98jy7lm0ik2h4mb9lx1znfd799dq0yxg86hkjh7z70k9k52"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-async-channel" ,rust-async-channel-1)
                       ("rust-async-std" ,rust-async-std-1)
                       ("rust-clap" ,rust-clap-3)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-inventory" ,rust-inventory-0.3)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-pyo3" ,rust-pyo3-0.19)
                       ("rust-pyo3-asyncio-macros" ,rust-pyo3-asyncio-macros-0.19)
                       ("rust-tokio" ,rust-tokio-1))
       #:cargo-development-inputs (("rust-pyo3" ,rust-pyo3-0.19))))
    (home-page "https://github.com/awestlake87/pyo3-asyncio")
    (synopsis "PyO3 utilities for Python's Asyncio library")
    (description "@code{PyO3} utilities for Python's Asyncio library")
    (license license:asl2.0)))

(define-public rust-xattr-1
  (package
    (name "rust-xattr")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xattr" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11b93igkwsq88b6m14x63c13zns418njh6ngvg2fbwqzyw4n0s7l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/Stebalien/xattr")
    (synopsis "unix extended filesystem attributes")
    (description "unix extended filesystem attributes")
    (license (list license:expat license:asl2.0))))

(define-public rust-tar-0.4
  (package
    (name "rust-tar")
    (version "0.4.40")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tar" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nrd3v2kfhb2zh0a44ag0s2348xjcdxiqx8cl14ir2923zmgqsmi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-filetime" ,rust-filetime-0.2)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-xattr" ,rust-xattr-1))
       #:cargo-development-inputs (("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://github.com/alexcrichton/tar-rs")
    (synopsis
     "A Rust implementation of a TAR file reader and writer. This library does not
currently handle compression, but it is abstract over all I/O readers and
writers. Additionally, great lengths are taken to ensure that the entire
contents are never required to be entirely resident in memory all at once.
")
    (description
     "This package provides a Rust implementation of a TAR file reader and writer.
This library does not currently handle compression, but it is abstract over all
I/O readers and writers.  Additionally, great lengths are taken to ensure that
the entire contents are never required to be entirely resident in memory all at
once.")
    (license (list license:expat license:asl2.0))))

(define-public python-mitmproxy-rs
  (package
    (name "python-mitmproxy-rs")
    (version "0.3.11")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/mitmproxy/mitmproxy_rs")
	     (commit version)))
       (modules '((guix build utils)))
       (patches (list
		 (local-file "patches/python-mitmproxy-rs-remove-unsupported-targets.patch")))
       (snippet
	'(begin
	   (for-each delete-file-recursively
		     '("mitmproxy-macos"
		       "mitmproxy-windows"))))
       (sha256
	(base32 "0g0ibfhhbciqxf97df1s5hjvjcfb2fcqmqwxzcs3m2f9b2px98jp"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:cargo-inputs
      `(("rust-pyo3" ,rust-pyo3-0.19)
	("rust-pyo3-asyncio" ,rust-pyo3-asyncio-0.19)
	("rust-pyo3-log" ,rust-pyo3-log-0.8)
	("rust-anyhow" ,rust-anyhow-1)
	("rust-async-trait" ,rust-async-trait-0.1)
	("rust-boringtun" ,rust-boringtun-0.6)
	("rust-console-subscriber" ,rust-console-subscriber-0.1)
	("rust-image" ,rust-image-0.24)
	("rust-log"   ,rust-log-0.4)
	("rust-once-cell" ,rust-once-cell-1)
	("rust-pretty-hex" ,rust-pretty-hex-0.3)
	("rust-prost" ,rust-prost-0.12)
	("rust-rand-core" ,rust-rand-core-0.6)
	("rust-smoltcp" ,rust-smoltcp-0.10)
	("rust-tokio" ,rust-tokio-1)
	("rust-tokio-util" ,rust-tokio-util-0.7)
	("rust-x25519-dalek" ,rust-x25519-dalek-2)

	("rust-data-encoding" ,rust-data-encoding-2)
	("rust-tar" ,rust-tar-0.4))
      #:cargo-development-inputs
      `(("rust-criterion" ,rust-criterion-0.5)
	("rust-env-logger" ,rust-env-logger-0.10)
	("rust-rand" ,rust-rand-0.8))
      #:imported-modules
      (append %cargo-build-system-modules
              %pyproject-build-system-modules)
      #:modules
      '((guix build cargo-build-system)
        ((guix build pyproject-build-system) #:prefix py:)
        (guix build utils))
      #:phases
      (let ((python-phase (lambda (phase)
			    `(',(symbol-append 'py: phase)
			      (assoc-ref py:%standard-phases ',phase)))))
	  #~(modify-phases %standard-phases
	      (add-after 'unpack 'chdir-rs
		(lambda _
		  (chdir "mitmproxy-rs")))
	      (add-before 'chdir-rs 'remove-other-os-cargo-members
		(lambda _
		  (substitute* "Cargo.toml"
		    (("\"mitmproxy-windows\\/redirector\",") "")
		    (("\"mitmproxy-macos\\/certificate-truster\",") ""))))
	      (add-before 'chdir-rs 'fix-dependencies
		(lambda* (#:key cargo-inputs #:allow-other-keys)
		  (delete-file "Cargo.lock")
		  (substitute* "mitmproxy-rs/Cargo.toml"
	            (("(mitmproxy = \\{ )(path = \"\\.\\.\\/\" \\})" _ prefix suffix)
		     (string-append prefix "version = \"" #$version "\", " suffix)))))
	      (add-after 'install
		  #$@(python-phase 'enable-bytecode-determinism))
	      (add-after 'py:enable-bytecode-determinism
		  #$@(python-phase 'build))
	      (add-after 'py:build
		  #$@(python-phase 'install))
	      (add-after 'py:install
		  #$@(python-phase 'add-install-to-pythonpath))))))
    (inputs (list python-wrapper))
    (native-inputs (list perl maturin))
    ;; (propagated-inputs (list python-mitmproxy-macos python-mitmproxy-windows))
    (home-page "")
    (synopsis "")
    (description "")
    (license license:expat)))

(define-public python-kaitaistruct
  (package
    (name "python-kaitaistruct")
    (version "0.10")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "kaitaistruct" version))
       (sha256
        (base32 "0ap5ka51gnc2mc4s1kqqsi6nb6zqv8wsrg17ryxazmkkj7idwi50"))))
    (build-system pyproject-build-system)
    ;; (propagated-inputs (list python-enum34))
    (home-page "https://kaitai.io")
    (synopsis
     "Kaitai Struct declarative parser generator for binary data: runtime library for Python")
    (description
     "Kaitai Struct declarative parser generator for binary data: runtime library for
Python")
    (license license:expat)))

(define python-service-identity-23
  (package
    (inherit python-service-identity)
    (version "23.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "service_identity" version))
       (sha256
	(base32 "07a3hswx4ilgqx6mllmx3w7v84sfn7w19avqx50m0x87cgckrczc"))))
    (propagated-inputs
     (list python-attrs
	   python-cryptography
	   python-pyasn1
           python-pyasn1-modules))
    (native-inputs
     (list python-coverage
	   python-pyopenssl
	   python-pytest
	   python-hatchling
	   python-hatch-fancy-pypi-readme
	   python-hatch-vcs))))

(define python-ldap3-2.9
 (package
   (inherit python-ldap3)
   (version "2.9.1")
   (source
    (origin
      (method url-fetch)
      (uri (pypi-uri "ldap3" version))
      (sha256
       (base32 "17r2ljx8ygyfcy3fvfya7dimikp0jl010mwbavd9vw73313zrrzk"))))
   ;; (propagated-inputs (list python-pyasn1))
))


(define python-aioquic-mitmproxy
  (package
    (inherit python-aioquic)
    (name "python-aioquic-mitmproxy")
    (version "0.9.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "aioquic_mitmproxy" version))
       (sha256
	(base32 "0xaxvmsyqfp2q44mji46vb6ifxyh2va77rsqcchx3hrj8kikksm1"))))
    (propagated-inputs (list python-certifi python-pylsqpack python-pyopenssl
                             python-service-identity))
    (native-inputs (list python-coverage))
    (home-page "https://pypi.org/project/aioquic-mitmproxy/")
    (synopsis
     "Fork of aioquic (https://github.com/aiortc/aioquic) with adjustments for mitmproxy.")))

(define python-urwid-mitmproxy
  (package
    (inherit python-urwid)
    (name "python-urwid-mitmproxy")
    (version "2.1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "urwid-mitmproxy" version))
       (sha256
	(base32 "1nkcd0vvckhn6kwdxvgkij77j8yw205ayhdj8gfjpfdchzjkhqmy"))))))

(define-public mitmproxy
  (package
    (name "mitmproxy")
    (version "10.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/mitmproxy/mitmproxy.git")
	     (commit version)))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "13izgllyjpw2p9af59nasf6fyy3x2p4bmbikqbrhp8qmnn7qr2zy"))
       (modules '((guix build utils)))
       (snippet
	;; Purge precompiled mitmproxy_wireguard binaries from test dir
	'(with-directory-excursion "test/wg-test-client/"
	   (for-each delete-file
		     '("windows-x86_64.exe"
		       "macos-x86_64"
		       "macos-aarch64"
		       "linux-x86_64"))))))
    (propagated-inputs
     (list
      python-aioquic-mitmproxy		; custom vers?
      ;; python-aioquic
      python-asgiref
      python-brotli
      python-certifi
      python-cryptography
      python-flask
      python-h11
      python-h2
      python-hyperframe
      python-kaitaistruct		; what is this
      python-ldap3-2.9
      python-mitmproxy-rs		; wat
      python-msgpack
      python-passlib
      python-protobuf
      ;; python-pydivert ; ;windows only?
      python-pyopenssl
      python-pyparsing
      python-pyperclip
      python-ruamel.yaml
      python-sortedcontainers
      python-tornado-6
      python-typing-extensions
      python-urwid-mitmproxy		; custom vers?
      ;; python-urwid
      python-wsproto
      python-publicsuffix2
      python-zstandard))
    (native-inputs
     (list python-pytest
	   python-pytest-asyncio
	   python-pytest-cov
	   python-pytest-timeout
	   python-pytest-xdist))
    (build-system pyproject-build-system)
    (arguments
     `(#:test-flags
       '("-k" ,(string-join
		'( ;; XXX: these fail due to what is likely something
		  ;;      to do with guix's python-flask package (a
		  ;;      TypeError is thrown due to a werkzeug object
		  ;;      encountered during the tests
		  ;; 
		  "not" "test_memory_usage_completed_flows"
		  "and"
		  "not" "test_memory_usage_errored_flows"
		  
		  ;; FIXME: re-enable once mitmproxy_wireguard is
		  ;;        packaged, replace prebuilt test bins with
		  ;;        guix store links
		  ;;
		  "and" "not" "test_wireguard")))
       #:phases
       ,#~(modify-phases %standard-phases
	    (add-before 'check 'set-temporary-home
	      ;; Tests expect writable "${HOME}/.mitmproxy" dir
	      (lambda _ (setenv "HOME" "/tmp"))))))
    (home-page "https://mitmproxy.org/")
    (synopsis "An interactive TLS-capable intercepting HTTP proxy for penetration
testers and software developers.")
    (description "mitmproxy is an interactive, SSL/TLS-capable intercepting proxy with a
console interface for HTTP/1, HTTP/2, and WebSockets.")
    (license license:expat)))

mitmproxy
