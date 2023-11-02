(define-public rust-webpki-roots-0.25
  (package
    (name "rust-webpki-roots")
    (version "0.25.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "webpki-roots" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1z13850xvsijjxxvzx1wq3m6pz78ih5q6wjcp7gpgwz4gfspn90l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/rustls/webpki-roots")
    (synopsis "Mozilla's CA root certificates for use with webpki")
    (description "Mozilla's CA root certificates for use with webpki")
    (license license:mpl2.0)))

(define-public rust-webpki-roots-0.24
  (package
    (name "rust-webpki-roots")
    (version "0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "webpki-roots" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "120q85pvzpckvvrg085a5jhh91fby94pgiv9y1san7lxbmnm94dj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustls-webpki" ,rust-rustls-webpki-0.101))))
    (home-page "https://github.com/rustls/webpki-roots")
    (synopsis "Mozilla's CA root certificates for use with webpki")
    (description "Mozilla's CA root certificates for use with webpki")
    (license license:mpl2.0)))

(define-public rust-tungstenite-0.20
  (package
    (name "rust-tungstenite")
    (version "0.20.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tungstenite" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fbgcv3h4h1bhhf5sqbwqsp7jnc44bi4m41sgmhzdsk2zl8aqgcy"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-data-encoding" ,rust-data-encoding-2)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-httparse" ,rust-httparse-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-native-tls" ,rust-native-tls-0.2)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rustls" ,rust-rustls-0.21)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.6)
                       ("rust-sha1" ,rust-sha1-0.10)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-url" ,rust-url-2)
                       ("rust-utf-8" ,rust-utf-8-0.7)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.24))))
    (home-page "https://github.com/snapview/tungstenite-rs")
    (synopsis "Lightweight stream-based WebSocket implementation")
    (description "Lightweight stream-based @code{WebSocket} implementation")
    (license (list license:expat license:asl2.0))))

(define-public rust-tokio-rustls-0.24
  (package
    (name "rust-tokio-rustls")
    (version "0.24.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-rustls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10bhibg57mqir7xjhb2xmf24xgfpx6fzpyw720a4ih8a737jg0y2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustls" ,rust-rustls-0.21)
                       ("rust-tokio" ,rust-tokio-1))))
    (home-page "https://github.com/rustls/tokio-rustls")
    (synopsis "Asynchronous TLS/SSL streams for Tokio using Rustls.")
    (description "Asynchronous TLS/SSL streams for Tokio using Rustls.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tokio-native-tls-0.3
  (package
    (name "rust-tokio-native-tls")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-native-tls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wkfg6zn85zckmv4im7mv20ca6b1vmlib5xwz9p7g19wjfmpdbmv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-native-tls" ,rust-native-tls-0.2)
                       ("rust-tokio" ,rust-tokio-1))))
    (home-page "https://tokio.rs")
    (synopsis
     "An implementation of TLS/SSL streams for Tokio using native-tls giving an implementation of TLS
for nonblocking I/O streams.
")
    (description
     "An implementation of TLS/SSL streams for Tokio using native-tls giving an
implementation of TLS for nonblocking I/O streams.")
    (license license:expat)))

(define-public rust-rustls-native-certs-0.6
  (package
    (name "rust-rustls-native-certs")
    (version "0.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustls-native-certs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "007zind70rd5rfsrkdcfm8vn09j8sg02phg9334kark6rdscxam9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-openssl-probe" ,rust-openssl-probe-0.1)
                       ("rust-rustls-pemfile" ,rust-rustls-pemfile-1)
                       ("rust-schannel" ,rust-schannel-0.1)
                       ("rust-security-framework" ,rust-security-framework-2))))
    (home-page "https://github.com/ctz/rustls-native-certs")
    (synopsis
     "rustls-native-certs allows rustls to use the platform native certificate store")
    (description
     "rustls-native-certs allows rustls to use the platform native certificate store")
    (license (list license:asl2.0 license:isc license:expat))))

(define-public rust-tokio-tungstenite-0.20
  (package
    (name "rust-tokio-tungstenite")
    (version "0.20.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tokio-tungstenite" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0v1v24l27hxi5hlchs7hfd5rgzi167x0ygbw220nvq0w5b5msb91"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-native-tls" ,rust-native-tls-0.2)
                       ("rust-rustls" ,rust-rustls-0.21)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.6)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-native-tls" ,rust-tokio-native-tls-0.3)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.24)
                       ("rust-tungstenite" ,rust-tungstenite-0.20)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.25))))
    (home-page "https://github.com/snapview/tokio-tungstenite")
    (synopsis
     "Tokio binding for Tungstenite, the Lightweight stream-based WebSocket implementation")
    (description
     "Tokio binding for Tungstenite, the Lightweight stream-based @code{WebSocket}
implementation")
    (license license:expat)))

(define-public rust-sync-wrapper-0.1
  (package
    (name "rust-sync-wrapper")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sync_wrapper" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0q01lyj0gr9a93n10nxsn8lwbzq97jqd6b768x17c8f7v7gccir0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-futures-core" ,rust-futures-core-0.3))))
    (home-page "https://docs.rs/sync_wrapper")
    (synopsis
     "A tool for enlisting the compilerâs help in proving the absence of concurrency")
    (description
     "This package provides a tool for enlisting the compilerâs help in proving the
absence of concurrency")
    (license license:asl2.0)))

(define-public rust-multer-2
  (package
    (name "rust-multer")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "multer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hjiphaypj3phqaj5igrzcia9xfmf4rr4ddigbh8zzb96k1bvb01"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-httparse" ,rust-httparse-1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-spin" ,rust-spin-0.9)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-version-check" ,rust-version-check-0.9))))
    (home-page "https://github.com/rousan/multer-rs")
    (synopsis
     "An async parser for `multipart/form-data` content-type in Rust.")
    (description
     "An async parser for `multipart/form-data` content-type in Rust.")
    (license license:expat)))

(define-public rust-matchit-0.7
  (package
    (name "rust-matchit")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "matchit" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "156bgdmmlv4crib31qhgg49nsjk88dxkdqp80ha2pk2rk6n6ax0f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/ibraheemdev/matchit")
    (synopsis "A high performance, zero-copy URL router.")
    (description
     "This package provides a high performance, zero-copy URL router.")
    (license (list license:expat license:bsd-3))))

(define-public rust-base64-0.21
  (package
    (name "rust-base64")
    (version "0.21.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "base64" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1y8x2xs9nszj5ix7gg4ycn5a6wy7ca74zxwqri3bdqzdjha6lqrm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/marshallpierce/rust-base64")
    (synopsis "encodes and decodes base64 as bytes or utf8")
    (description "encodes and decodes base64 as bytes or utf8")
    (license (list license:expat license:asl2.0))))

(define-public rust-headers-0.3
  (package
    (name "rust-headers")
    (version "0.3.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "headers" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0w62gnwh2p1lml0zqdkrx9dp438881nhz32zrzdy61qa0a9kns06"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-base64" ,rust-base64-0.21)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-headers-core" ,rust-headers-core-0.2)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-httpdate" ,rust-httpdate-1)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-sha1" ,rust-sha1-0.10))))
    (home-page "https://hyper.rs")
    (synopsis "typed HTTP headers")
    (description "typed HTTP headers")
    (license license:expat)))

(define-public rust-axum-macros-0.3
  (package
    (name "rust-axum-macros")
    (version "0.3.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "axum-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qkb5cg06bnp8994ay0smk57shd5hpphcmp90kd7p65dxh86mjnd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-heck" ,rust-heck-0.4)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/tokio-rs/axum")
    (synopsis "Macros for axum")
    (description "Macros for axum")
    (license license:expat)))

(define-public rust-mime-0.3
  (package
    (name "rust-mime")
    (version "0.3.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mime" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16hkibgvb9klh0w0jk5crr5xv90l3wlf77ggymzjmvl1818vnxv8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/hyperium/mime")
    (synopsis "Strongly Typed Mimes")
    (description "Strongly Typed Mimes")
    (license (list license:expat license:asl2.0))))

(define-public rust-iri-string-0.7
  (package
    (name "rust-iri-string")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "iri-string" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1h07hkfkkjjvgzlaqpr5fia7hrgv7qxqdw4xrpdc3936gmk9p191"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-memchr" ,rust-memchr-2)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/lo48576/iri-string")
    (synopsis "IRI as string types")
    (description "IRI as string types")
    (license (list license:expat license:asl2.0))))

(define-public rust-http-range-header-0.3
  (package
    (name "rust-http-range-header")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "http-range-header" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13vm511vq3bhschkw2xi9nhxzkw53m55gn9vxg7qigfxc29spl5d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/MarcusGrass/parse-range-headers")
    (synopsis "No-dep range header parser")
    (description "No-dep range header parser")
    (license license:expat)))

(define-public rust-zstd-safe-7
  (package
    (name "rust-zstd-safe")
    (version "7.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zstd-safe" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gpav2lcibrpmyslmjkcn3w0w64qif3jjljd2h8lr4p249s7qx23"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-zstd-sys" ,rust-zstd-sys-2))))
    (home-page "https://github.com/gyscos/zstd-rs")
    (synopsis "Safe low-level bindings for the zstd compression library.")
    (description "Safe low-level bindings for the zstd compression library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-zstd-0.13
  (package
    (name "rust-zstd")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zstd" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0401q54s9r35x2i7m1kwppgkj79g0pb6xz3xpby7qlkdb44k7yxz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-zstd-safe" ,rust-zstd-safe-7))))
    (home-page "https://github.com/gyscos/zstd-rs")
    (synopsis "Binding for the zstd compression library.")
    (description "Binding for the zstd compression library.")
    (license license:expat)))

(define-public rust-deflate64-0.1
  (package
    (name "rust-deflate64")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "deflate64" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1aagh5mmyr8p08if33hizqwiq2as90v9smla89nydq6pivsfy766"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/anatawa12/deflate64-rs#readme")
    (synopsis "Deflate64 implementation based on .NET's implementation")
    (description "Deflate64 implementation based on .NET's implementation")
    (license license:expat)))

(define-public rust-async-compression-0.4
  (package
    (name "rust-async-compression")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "async-compression" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18lvgshffnnpvs8a0jgl04m56bz1p2zl4z0zdzra0nwixyxf4n7n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-brotli" ,rust-brotli-3)
                       ("rust-bzip2" ,rust-bzip2-0.4)
                       ("rust-deflate64" ,rust-deflate64-0.1)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-io" ,rust-futures-io-0.3)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-xz2" ,rust-xz2-0.1)
                       ("rust-zstd" ,rust-zstd-0.13)
                       ("rust-zstd-safe" ,rust-zstd-safe-7))))
    (home-page "https://github.com/Nullus157/async-compression")
    (synopsis
     "Adaptors between compression crates and Rust's modern asynchronous IO types.
")
    (description
     "Adaptors between compression crates and Rust's modern asynchronous IO types.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tower-http-0.4
  (package
    (name "rust-tower-http")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tower-http" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0h0i2flrw25zwxv72sifq4v5mwcb030spksy7r2a4xl2d4fvpib1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-compression" ,rust-async-compression-0.4)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-bitflags" ,rust-bitflags-2)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-http-body" ,rust-http-body-0.4)
                       ("rust-http-range-header" ,rust-http-range-header-0.3)
                       ("rust-httpdate" ,rust-httpdate-1)
                       ("rust-iri-string" ,rust-iri-string-0.7)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-mime-guess" ,rust-mime-guess-2)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-util" ,rust-tokio-util-0.7)
                       ("rust-tower" ,rust-tower-0.4)
                       ("rust-tower-layer" ,rust-tower-layer-0.3)
                       ("rust-tower-service" ,rust-tower-service-0.3)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-uuid" ,rust-uuid-1))))
    (home-page "https://github.com/tower-rs/tower-http")
    (synopsis "Tower middleware and utilities for HTTP clients and servers")
    (description "Tower middleware and utilities for HTTP clients and servers")
    (license license:expat)))

(define-public rust-http-body-0.4
  (package
    (name "rust-http-body")
    (version "0.4.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "http-body" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1l967qwwlvhp198xdrnc0p5d7jwfcp6q2lm510j6zqw4s4b8zwym"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2))))
    (home-page "https://github.com/hyperium/http-body")
    (synopsis
     "Trait representing an asynchronous, streaming, HTTP request or response body.
")
    (description
     "Trait representing an asynchronous, streaming, HTTP request or response body.")
    (license license:expat)))

(define-public rust-axum-core-0.3
  (package
    (name "rust-axum-core")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "axum-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0b1d9nkqb8znaba4qqzxzc968qwj4ybn4vgpyz9lz4a7l9vsb7vm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-http-body" ,rust-http-body-0.4)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-rustversion" ,rust-rustversion-1)
                       ("rust-tower-http" ,rust-tower-http-0.4)
                       ("rust-tower-layer" ,rust-tower-layer-0.3)
                       ("rust-tower-service" ,rust-tower-service-0.3)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/tokio-rs/axum")
    (synopsis "Core types and traits for axum")
    (description "Core types and traits for axum")
    (license license:expat)))

(define-public rust-axum-0.6
  (package
    (name "rust-axum")
    (version "0.6.20")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "axum" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gynqkg3dcy1zd7il69h8a3zax86v6qq5zpawqyn87mr6979x0iv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-axum-core" ,rust-axum-core-0.3)
                       ("rust-axum-macros" ,rust-axum-macros-0.3)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-bitflags" ,rust-bitflags-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-headers" ,rust-headers-0.3)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-http-body" ,rust-http-body-0.4)
                       ("rust-hyper" ,rust-hyper-0.14)
                       ("rust-itoa" ,rust-itoa-1)
                       ("rust-matchit" ,rust-matchit-0.7)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-mime" ,rust-mime-0.3)
                       ("rust-multer" ,rust-multer-2)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-rustversion" ,rust-rustversion-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-serde-path-to-error" ,rust-serde-path-to-error-0.1)
                       ("rust-serde-urlencoded" ,rust-serde-urlencoded-0.7)
                       ("rust-sha1" ,rust-sha1-0.10)
                       ("rust-sync-wrapper" ,rust-sync-wrapper-0.1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-tungstenite" ,rust-tokio-tungstenite-0.20)
                       ("rust-tower" ,rust-tower-0.4)
                       ("rust-tower-http" ,rust-tower-http-0.4)
                       ("rust-tower-layer" ,rust-tower-layer-0.3)
                       ("rust-tower-service" ,rust-tower-service-0.3)
                       ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/tokio-rs/axum")
    (synopsis "Web framework that focuses on ergonomics and modularity")
    (description "Web framework that focuses on ergonomics and modularity")
    (license license:expat)))

(define-public rust-tonic-0.9
  (package
    (name "rust-tonic")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tonic" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0nlx35lvah5hdcp6lg1d6dlprq0zz8ijj6f727szfcv479m6d0ih"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-stream" ,rust-async-stream-0.3)
                       ("rust-async-trait" ,rust-async-trait-0.1)
                       ("rust-axum" ,rust-axum-0.6)
                       ("rust-base64" ,rust-base64-0.21)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-futures-util" ,rust-futures-util-0.3)
                       ("rust-h2" ,rust-h2-0.3)
                       ("rust-http" ,rust-http-0.2)
                       ("rust-http-body" ,rust-http-body-0.4)
                       ("rust-hyper" ,rust-hyper-0.14)
                       ("rust-hyper-timeout" ,rust-hyper-timeout-0.4)
                       ("rust-percent-encoding" ,rust-percent-encoding-2)
                       ("rust-pin-project" ,rust-pin-project-1)
                       ("rust-prost" ,rust-prost-0.11)
                       ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.6)
                       ("rust-rustls-pemfile" ,rust-rustls-pemfile-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-rustls" ,rust-tokio-rustls-0.24)
                       ("rust-tokio-stream" ,rust-tokio-stream-0.1)
                       ("rust-tower" ,rust-tower-0.4)
                       ("rust-tower-layer" ,rust-tower-layer-0.3)
                       ("rust-tower-service" ,rust-tower-service-0.3)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-webpki-roots" ,rust-webpki-roots-0.23))))
    (home-page "https://github.com/hyperium/tonic")
    (synopsis
     "A gRPC over HTTP/2 implementation focused on high performance, interoperability, and flexibility.
")
    (description
     "This package provides a @code{gRPC} over HTTP/2 implementation focused on high
performance, interoperability, and flexibility.")
    (license license:expat)))

(define-public rust-prost-types-0.11
  (package
    (name "rust-prost-types")
    (version "0.11.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "prost-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04ryk38sqkp2nf4dgdqdfbgn6zwwvjraw6hqq6d9a6088shj4di1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-prost" ,rust-prost-0.11))))
    (home-page "https://github.com/tokio-rs/prost")
    (synopsis "A Protocol Buffers implementation for the Rust Language.")
    (description
     "This package provides a Protocol Buffers implementation for the Rust Language.")
    (license license:asl2.0)))

(define-public rust-prost-derive-0.11
  (package
    (name "rust-prost-derive")
    (version "0.11.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "prost-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1d3mw2s2jba1f7wcjmjd6ha2a255p2rmynxhm1nysv9w1z8xilp5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/tokio-rs/prost")
    (synopsis "A Protocol Buffers implementation for the Rust Language.")
    (description
     "This package provides a Protocol Buffers implementation for the Rust Language.")
    (license license:asl2.0)))

(define-public rust-prost-0.11
  (package
    (name "rust-prost")
    (version "0.11.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "prost" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1kc1hva2h894hc0zf6r4r8fsxfpazf7xn5rj3jya9sbrsyhym0hb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-prost-derive" ,rust-prost-derive-0.11))))
    (home-page "https://github.com/tokio-rs/prost")
    (synopsis "A Protocol Buffers implementation for the Rust Language.")
    (description
     "This package provides a Protocol Buffers implementation for the Rust Language.")
    (license license:asl2.0)))

(define-public rust-console-api-0.5
  (package
    (name "rust-console-api")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "console-api" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13mi2vlqhill22hm2kjj2147miyz075pf04phf557wfrni9md2f2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-prost" ,rust-prost-0.11)
                       ("rust-prost-types" ,rust-prost-types-0.11)
                       ("rust-tonic" ,rust-tonic-0.9)
                       ("rust-tracing-core" ,rust-tracing-core-0.1))))
    (home-page "https://github.com/tokio-rs/console/blob/main/console-api")
    (synopsis "Protobuf wire format bindings for the Tokio console.
")
    (description "Protobuf wire format bindings for the Tokio console.")
    (license license:expat)))

(define-public rust-console-subscriber-0.1
  (package
    (name "rust-console-subscriber")
    (version "0.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "console-subscriber" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jqi1p6nnlcw8zk1alh7bg9vqc47vmhybkq9v2zcwzy019k45kyl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-console-api" ,rust-console-api-0.5)
                       ("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5)
                       ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.8)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-hdrhistogram" ,rust-hdrhistogram-7)
                       ("rust-humantime" ,rust-humantime-2)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-prost-types" ,rust-prost-types-0.11)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-thread-local" ,rust-thread-local-1)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-tokio-stream" ,rust-tokio-stream-0.1)
                       ("rust-tonic" ,rust-tonic-0.9)
                       ("rust-tracing" ,rust-tracing-0.1)
                       ("rust-tracing-core" ,rust-tracing-core-0.1)
                       ("rust-tracing-subscriber" ,rust-tracing-subscriber-0.3))
       #:cargo-development-inputs (("rust-futures" ,rust-futures-0.3)
                                   ("rust-tokio" ,rust-tokio-1))))
    (home-page
     "https://github.com/tokio-rs/console/blob/main/console-subscriber")
    (synopsis
     "A `tracing-subscriber::Layer` for collecting Tokio console telemetry.
")
    (description
     "This package provides a `tracing-subscriber::Layer` for collecting Tokio console
telemetry.")
    (license license:expat)))

