(define-public rust-platforms-3
  (package
    (name "rust-platforms")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "platforms" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1c6bzwn877aqdbbmyqsl753ycbciwvbdh4lpzijb8vrfb4zsprhl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://rustsec.org")
    (synopsis
     "Rust platform registry with information about valid Rust platforms (target
triple, target_arch, target_os) sourced from the Rust compiler.
")
    (description
     "Rust platform registry with information about valid Rust platforms (target
triple, target_arch, target_os) sourced from the Rust compiler.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-fiat-crypto-0.1
  (package
    (name "rust-fiat-crypto")
    (version "0.1.20")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fiat-crypto" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xvbcg6wh42q3n7294mzq5xxw8fpqsgc0d69dvm5srh1f6cgc9g8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/mit-plv/fiat-crypto")
    (synopsis "Fiat-crypto generated Rust")
    (description "Fiat-crypto generated Rust")
    (license (list license:expat license:asl2.0 license:bsd-1))))

(define-public rust-curve25519-dalek-derive-0.1
  (package
    (name "rust-curve25519-dalek-derive")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "curve25519-dalek-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cry71xxrr0mcy5my3fb502cwfxy6822k4pm19cwrilrg7hq4s7l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/dalek-cryptography/curve25519-dalek")
    (synopsis "curve25519-dalek Derives")
    (description "curve25519-dalek Derives")
    (license (list license:expat license:asl2.0))))

(define-public rust-libc-0.2
  (package
    (name "rust-libc")
    (version "0.2.149")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16z2zqswcbk1qg5yigfyr0d44v0974amdaj564dmv5dpi2y770d0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/rust-lang/libc")
    (synopsis "Raw FFI bindings to platform libraries like libc.
")
    (description "Raw FFI bindings to platform libraries like libc.")
    (license (list license:expat license:asl2.0))))

(define-public rust-cpufeatures-0.2
  (package
    (name "rust-cpufeatures")
    (version "0.2.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cpufeatures" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1l0gzsyy576n017g9bf0vkv5hhg9cpz1h1libxyfdlzcgbh0yhnf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis
     "Lightweight runtime CPU feature detection for aarch64, loongarch64, and x86/x86_64 targets, 
with no_std support and support for mobile targets including Android and iOS
")
    (description
     "Lightweight runtime CPU feature detection for aarch64, loongarch64, and
x86/x86_64 targets, with no_std support and support for mobile targets including
Android and @code{iOS}")
    (license (list license:expat license:asl2.0))))

(define-public rust-curve25519-dalek-4
  (package
    (name "rust-curve25519-dalek")
    (version "4.0.0-rc.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "curve25519-dalek" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19s7w3k9l97p2m171ammxxkac3ig9vf289lxd1znzq06ziqcwsj3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-cpufeatures" ,rust-cpufeatures-0.2)
                       ("rust-curve25519-dalek-derive" ,rust-curve25519-dalek-derive-0.1)
                       ("rust-digest" ,rust-digest-0.10)
                       ("rust-fiat-crypto" ,rust-fiat-crypto-0.1)
                       ("rust-platforms" ,rust-platforms-3)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-subtle" ,rust-subtle-2)
                       ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/dalek-cryptography/curve25519-dalek")
    (synopsis
     "A pure-Rust implementation of group operations on ristretto255 and Curve25519")
    (description
     "This package provides a pure-Rust implementation of group operations on
ristretto255 and Curve25519")
    (license license:bsd-3)))

(define-public rust-x25519-dalek-2
  (package
    (name "rust-x25519-dalek")
    (version "2.0.0-rc.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "x25519-dalek" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fp6yil0kqqqzaff1wpg2l7m5c1vjcn731jqkl2ig3k8v83swzzc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-curve25519-dalek" ,rust-curve25519-dalek-4)
                       ("rust-rand-core" ,rust-rand-core-0.6)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-zeroize" ,rust-zeroize-1))
       #:cargo-development-inputs (("rust-bincode" ,rust-bincode-1)
                                   ("rust-criterion" ,rust-criterion-0.4)
                                   ("rust-rand-core" ,rust-rand-core-0.6))))
    (home-page "https://dalek.rs/")
    (synopsis
     "X25519 elliptic curve Diffie-Hellman key exchange in pure-Rust, using curve25519-dalek.")
    (description
     "X25519 elliptic curve Diffie-Hellman key exchange in pure-Rust, using
curve25519-dalek.")
    (license license:bsd-3)))

