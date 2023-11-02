(define-public rust-sval-flatten-2
  (package
    (name "rust-sval-flatten")
    (version "2.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval_flatten" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "121ac1pn2b113rgkf98n65kpwn2j80rikjzdwn5yaknxp9yqqcr3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-itoa" ,rust-itoa-1)
                       ("rust-ryu" ,rust-ryu-1)
                       ("rust-sval" ,rust-sval-2)
                       ("rust-sval-buffer" ,rust-sval-buffer-2))))
    (home-page "https://github.com/sval-rs/sval")
    (synopsis "Value flattening for sval")
    (description "Value flattening for sval")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sval-derive-2
  (package
    (name "rust-sval-derive")
    (version "2.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zba5y4gjiqzlyn6d6nzfh743qw97yjq2ll8130giddqwg5lnccf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-sval-derive-macros" ,rust-sval-derive-macros-2)
                       ("rust-sval-flatten" ,rust-sval-flatten-2))))
    (home-page "https://github.com/sval-rs/sval")
    (synopsis "Derive support for sval")
    (description "Derive support for sval")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sval-test-2
  (package
    (name "rust-sval-test")
    (version "2.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval_test" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bgbcdl7vniil0xiyvxscmzcwymhz2w2iywqgxjmc5c0krzg0hd4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-sval" ,rust-sval-2)
                       ("rust-sval-fmt" ,rust-sval-fmt-2))))
    (home-page "https://github.com/sval-rs/sval")
    (synopsis "Utilities for testing sval::Value implementations")
    (description "Utilities for testing sval::Value implementations")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sval-serde-2
  (package
    (name "rust-sval-serde")
    (version "2.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval_serde" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11h543cmg0qmprc7jn94crfxwv344wa04qf18hw7xdh5zz293wbz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1)
                       ("rust-sval" ,rust-sval-2)
                       ("rust-sval-buffer" ,rust-sval-buffer-2)
                       ("rust-sval-fmt" ,rust-sval-fmt-2))))
    (home-page "https://github.com/sval-rs/sval")
    (synopsis "Integration between serde::Serialize and sval::Value")
    (description "Integration between serde::Serialize and sval::Value")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sval-json-2
  (package
    (name "rust-sval-json")
    (version "2.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval_json" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wp0yyaldqr6kgqsblav86j8fxjp2jbmrsbsiw0yxrhambc3pq3n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-itoa" ,rust-itoa-1)
                       ("rust-ryu" ,rust-ryu-1)
                       ("rust-sval" ,rust-sval-2))))
    (home-page "https://github.com/sval-rs/sval")
    (synopsis "JSON support for sval")
    (description "JSON support for sval")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sval-fmt-2
  (package
    (name "rust-sval-fmt")
    (version "2.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval_fmt" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hqkjb7blcdqjlawnffmw0bq5gxf98i52lbgcnjabxr64a47ybsk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-itoa" ,rust-itoa-1)
                       ("rust-ryu" ,rust-ryu-1)
                       ("rust-sval" ,rust-sval-2))))
    (home-page "https://github.com/sval-rs/sval")
    (synopsis "Integration between std::fmt::Debug and sval::Value")
    (description "Integration between std::fmt::Debug and sval::Value")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sval-dynamic-2
  (package
    (name "rust-sval-dynamic")
    (version "2.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval_dynamic" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1f2p3xvq5qyg0w721as7dxrgqgrfqsc0m7qp2r1pn7fvkqjx54wx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-sval" ,rust-sval-2))))
    (home-page "https://github.com/sval-rs/sval")
    (synopsis "Object-safe versions of sval::Stream and sval::Value")
    (description "Object-safe versions of sval::Stream and sval::Value")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sval-buffer-2
  (package
    (name "rust-sval-buffer")
    (version "2.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval_buffer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0yglk3ma67605f28mwip09maf531mm1fak2pdr2a1klapib0bs2p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-sval" ,rust-sval-2)
                       ("rust-sval-ref" ,rust-sval-ref-2))))
    (home-page "https://github.com/sval-rs/sval")
    (synopsis "Value buffering for sval")
    (description "Value buffering for sval")
    (license (list license:asl2.0 license:expat))))

(define-public rust-value-bag-sval2-1
  (package
    (name "rust-value-bag-sval2")
    (version "1.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "value-bag-sval2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0i899mjnryxw0sp92n8qgnm1s2m56ba27l3qazsbnmqah486rq63"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-sval" ,rust-sval-2)
                       ("rust-sval-buffer" ,rust-sval-buffer-2)
                       ("rust-sval-dynamic" ,rust-sval-dynamic-2)
                       ("rust-sval-fmt" ,rust-sval-fmt-2)
                       ("rust-sval-json" ,rust-sval-json-2)
                       ("rust-sval-ref" ,rust-sval-ref-2)
                       ("rust-sval-serde" ,rust-sval-serde-2)
                       ("rust-sval-test" ,rust-sval-test-2))))
    (home-page "")
    (synopsis "Implementation detail for value-bag")
    (description "Implementation detail for value-bag")
    (license (list license:asl2.0 license:expat))))

(define-public rust-serde-buf-0.1
  (package
    (name "rust-serde-buf")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_buf" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1k2nc3pa7rbzyhhnjakw6nkx2wa6da6nrxf65s6p2d3xdjfvx1is"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/KodrAus/serde_buf.git")
    (synopsis "Generic buffering for serde")
    (description "Generic buffering for serde")
    (license (list license:asl2.0 license:expat))))

(define-public rust-value-bag-serde1-1
  (package
    (name "rust-value-bag-serde1")
    (version "1.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "value-bag-serde1" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gsp0cn62ay2qq52wzck0j66iavf9k03y6ipmnx3bjqyg7f3kfh7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-erased-serde" ,rust-erased-serde-0.3)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-buf" ,rust-serde-buf-0.1)
                       ("rust-serde-fmt" ,rust-serde-fmt-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-serde-test" ,rust-serde-test-1))))
    (home-page "")
    (synopsis "Implementation detail for value-bag")
    (description "Implementation detail for value-bag")
    (license (list license:asl2.0 license:expat))))

(define-public rust-value-bag-1
  (package
    (name "rust-value-bag")
    (version "1.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "value-bag" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gjvsnhhf9jp8h62zin6azqrpmgmnxq2ppj72d2dcayy5n8f2wja"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-value-bag-serde1" ,rust-value-bag-serde1-1)
                       ("rust-value-bag-sval2" ,rust-value-bag-sval2-1))))
    (home-page "https://github.com/sval-rs/value-bag")
    (synopsis "Anonymous structured values")
    (description "Anonymous structured values")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sval-ref-2
  (package
    (name "rust-sval-ref")
    (version "2.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval_ref" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qd9w4iqp8z7v0mf7icz1409g48jnibyrh9nbnms1hmq5x7hbvbm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-sval" ,rust-sval-2))))
    (home-page "https://github.com/sval-rs/sval")
    (synopsis "A variant of sval::Value for types with internal references")
    (description
     "This package provides a variant of sval::Value for types with internal
references")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sval-derive-macros-2
  (package
    (name "rust-sval-derive-macros")
    (version "2.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval_derive_macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11vmfpr028n4z9x0nlaqa1v7p4fij6fz7wxbr3mmizp9v6267nry"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/sval-rs/sval")
    (synopsis "Minimal derive support for `sval`")
    (description "Minimal derive support for `sval`")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sval-2
  (package
    (name "rust-sval")
    (version "2.10.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sval" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wq8dpcwkxf9i5ivaqgi736kalqdsn88yhsb9fh1dhmpilmg2pdi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-sval-derive-macros" ,rust-sval-derive-macros-2))))
    (home-page "https://github.com/sval-rs/sval")
    (synopsis "Streaming, structured value serialization")
    (description "Streaming, structured value serialization")
    (license (list license:asl2.0 license:expat))))

(define-public rust-log-0.4
  (package
    (name "rust-log")
    (version "0.4.20")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "log" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13rf7wphnwd61vazpxr7fiycin6cb1g8fmvgqg18i464p0y1drmm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-serde" ,rust-serde-1)
                       ("rust-sval" ,rust-sval-2)
                       ("rust-sval-ref" ,rust-sval-ref-2)
                       ("rust-value-bag" ,rust-value-bag-1))
       #:cargo-development-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                                   ("rust-serde" ,rust-serde-1)
                                   ("rust-serde-test" ,rust-serde-test-1)
                                   ("rust-sval" ,rust-sval-2)
                                   ("rust-sval-derive" ,rust-sval-derive-2)
                                   ("rust-value-bag" ,rust-value-bag-1))))
    (home-page "https://github.com/rust-lang/log")
    (synopsis "A lightweight logging facade for Rust
")
    (description "This package provides a lightweight logging facade for Rust")
    (license (list license:expat license:asl2.0))))

