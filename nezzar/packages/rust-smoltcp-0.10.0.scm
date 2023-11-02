(define-public rust-rstest-macros-0.17
  (package
    (name "rust-rstest-macros")
    (version "0.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rstest_macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1a7w30h0g88v40p938skcbngsm6x6pf49gc369ydnznar2hs2319"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-syn" ,rust-syn-1)
                       ("rust-unicode-ident" ,rust-unicode-ident-1))))
    (home-page "https://github.com/la10736/rstest")
    (synopsis "Rust fixture based test framework. It use procedural macro
to implement fixtures and table based tests.
")
    (description
     "Rust fixture based test framework.  It use procedural macro to implement
fixtures and table based tests.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rstest-0.17
  (package
    (name "rust-rstest")
    (version "0.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rstest" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qnrx40c05ziz2sxhrj0i4pamvlip8cx7w62439qr1wils3b86yy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures" ,rust-futures-0.3)
                       ("rust-futures-timer" ,rust-futures-timer-3)
                       ("rust-rstest-macros" ,rust-rstest-macros-0.17)
                       ("rust-rustc-version" ,rust-rustc-version-0.4))))
    (home-page "https://github.com/la10736/rstest")
    (synopsis "Rust fixture based test framework. It use procedural macro
to implement fixtures and table based tests.
")
    (description
     "Rust fixture based test framework.  It use procedural macro to implement
fixtures and table based tests.")
    (license (list license:expat license:asl2.0))))

(define-public rust-managed-0.8
  (package
    (name "rust-managed")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "managed" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13b1j5gpm55jxk24qrbpc25j0ds47bkk9g83d04kp50ab9r8va0c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/m-labs/rust-managed")
    (synopsis
     "An interface for logically owning objects, whether or not heap allocation is available.")
    (description
     "An interface for logically owning objects, whether or not heap allocation is
available.")
    (license license:bsd-0)))

(define-public rust-atomic-polyfill-0.1
  (package
    (name "rust-atomic-polyfill")
    (version "0.1.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "atomic-polyfill" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0a4vd4zq75xmwbi33flf35qmm2nf99kx3hx2m21lslqnyfrpxzz3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-critical-section" ,rust-critical-section-1))))
    (home-page "https://github.com/embassy-rs/atomic-polyfill")
    (synopsis "Atomic polyfills, for targets where they're not available.")
    (description "Atomic polyfills, for targets where they're not available.")
    (license (list license:expat license:asl2.0))))

(define-public rust-heapless-0.7
  (package
    (name "rust-heapless")
    (version "0.7.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "heapless" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hq7ifnzpdj9rc06rhys4qa3qkr6q3k01kwfca0ak7lbl4jbq16v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atomic-polyfill" ,rust-atomic-polyfill-0.1)
                       ("rust-atomic-polyfill" ,rust-atomic-polyfill-0.1)
                       ("rust-atomic-polyfill" ,rust-atomic-polyfill-0.1)
                       ("rust-defmt" ,rust-defmt-0.3)
                       ("rust-hash32" ,rust-hash32-0.2)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-spin" ,rust-spin-0.9)
                       ("rust-stable-deref-trait" ,rust-stable-deref-trait-1)
                       ("rust-ufmt-write" ,rust-ufmt-write-0.1))))
    (home-page "https://github.com/japaric/heapless")
    (synopsis
     "`static` friendly data structures that don't require dynamic memory allocation")
    (description
     "`static` friendly data structures that don't require dynamic memory allocation")
    (license (list license:expat license:asl2.0))))

(define-public rust-smoltcp-0.10
  (package
    (name "rust-smoltcp")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smoltcp" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0a821xvbddx6l74zxm6mr6jy1mk3223s7pv6wsa7pslgmhv3lbld"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-defmt" ,rust-defmt-0.3)
                       ("rust-heapless" ,rust-heapless-0.7)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-managed" ,rust-managed-0.8))
       #:cargo-development-inputs (("rust-env-logger" ,rust-env-logger-0.10)
                                   ("rust-getopts" ,rust-getopts-0.2)
                                   ("rust-rand" ,rust-rand-0.8)
                                   ("rust-rstest" ,rust-rstest-0.17)
                                   ("rust-url" ,rust-url-2))))
    (home-page "https://github.com/smoltcp-rs/smoltcp")
    (synopsis
     "A TCP/IP stack designed for bare-metal, real-time systems without a heap.")
    (description
     "This package provides a TCP/IP stack designed for bare-metal, real-time systems
without a heap.")
    (license license:bsd-0)))

