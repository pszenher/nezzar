(define-public rust-clap-lex-0.3
  (package
    (name "rust-clap-lex")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_lex" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1a4dzbnlxiamfsn0pnkhn7n9bdfjh66j9fxm6mmr7d227vvrhh8d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-os-str-bytes" ,rust-os-str-bytes-6))))
    (home-page "https://github.com/clap-rs/clap/tree/master/clap_lex")
    (synopsis "Minimal, flexible command line parser")
    (description "Minimal, flexible command line parser")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-derive-4
  (package
    (name "rust-clap-derive")
    (version "4.0.21")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "054h5c62jy5c5li58696ymly0avyjvcbn1krcaawkbq2kwzk2xq1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-heck" ,rust-heck-0.4)
                       ("rust-proc-macro-error" ,rust-proc-macro-error-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/clap-rs/clap/tree/master/clap_derive")
    (synopsis
     "Parse command line argument by defining a struct, derive crate.")
    (description
     "Parse command line argument by defining a struct, derive crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-4
  (package
    (name "rust-clap")
    (version "4.0.32")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fcsz3zggk0g0y76vv7v7ivn72p1v980h2yhi0zf9y9mr45p1nx7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-bitflags" ,rust-bitflags-1)
                       ("rust-clap-derive" ,rust-clap-derive-4)
                       ("rust-clap-lex" ,rust-clap-lex-0.3)
                       ("rust-is-terminal" ,rust-is-terminal-0.4)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-strsim" ,rust-strsim-0.10)
                       ("rust-termcolor" ,rust-termcolor-1)
                       ("rust-terminal-size" ,rust-terminal-size-0.2)
                       ("rust-unicase" ,rust-unicase-2)
                       ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis
     "A simple to use, efficient, and full-featured Command Line Argument Parser")
    (description
     "This package provides a simple to use, efficient, and full-featured Command Line
Argument Parser")
    (license (list license:expat license:asl2.0))))

(define-public rust-rav1e-0.6
  (package
    (name "rust-rav1e")
    (version "0.6.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rav1e" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1h9fhmamb7mh3cv86y1qja9qb7r6w2jv3p8ydngvsyjy59lq7hqn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-aom-sys" ,rust-aom-sys-0.3)
                       ("rust-arbitrary" ,rust-arbitrary-0.4)
                       ("rust-arg-enum-proc-macro" ,rust-arg-enum-proc-macro-0.3)
                       ("rust-arrayvec" ,rust-arrayvec-0.7)
                       ("rust-av-metrics" ,rust-av-metrics-0.9)
                       ("rust-av1-grain" ,rust-av1-grain-0.2)
                       ("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-bitstream-io" ,rust-bitstream-io-1)
                       ("rust-built" ,rust-built-0.5)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-cc" ,rust-cc-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-clap" ,rust-clap-4)
                       ("rust-clap-complete" ,rust-clap-complete-4)
                       ("rust-clap-lex" ,rust-clap-lex-0.3)
                       ("rust-console" ,rust-console-0.15)
                       ("rust-crossbeam" ,rust-crossbeam-0.8)
                       ("rust-dav1d-sys" ,rust-dav1d-sys-0.7)
                       ("rust-fern" ,rust-fern-0.6)
                       ("rust-image" ,rust-image-0.24)
                       ("rust-interpolate-name" ,rust-interpolate-name-0.2)
                       ("rust-itertools" ,rust-itertools-0.10)
                       ("rust-ivf" ,rust-ivf-0.1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libfuzzer-sys" ,rust-libfuzzer-sys-0.3)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-maybe-rayon" ,rust-maybe-rayon-0.1)
                       ("rust-nasm-rs" ,rust-nasm-rs-0.2)
                       ("rust-new-debug-unreachable" ,rust-new-debug-unreachable-1)
                       ("rust-nom" ,rust-nom-7)
                       ("rust-noop-proc-macro" ,rust-noop-proc-macro-0.3)
                       ("rust-num-derive" ,rust-num-derive-0.3)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-rand-chacha" ,rust-rand-chacha-0.3)
                       ("rust-rust-hawktracer" ,rust-rust-hawktracer-0.7)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-scan-fmt" ,rust-scan-fmt-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-big-array" ,rust-serde-big-array-0.4)
                       ("rust-signal-hook" ,rust-signal-hook-0.3)
                       ("rust-simd-helpers" ,rust-simd-helpers-0.1)
                       ("rust-system-deps" ,rust-system-deps-6)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-toml" ,rust-toml-0.5)
                       ("rust-v-frame" ,rust-v-frame-0.3)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-winnow" ,rust-winnow-0.4)
                       ("rust-y4m" ,rust-y4m-0.8))))
    (home-page "https://github.com/xiph/rav1e/")
    (synopsis "The fastest and safest AV1 encoder")
    (description "The fastest and safest AV1 encoder")
    (license license:bsd-2)))

(define-public rust-avif-serialize-0.8
  (package
    (name "rust-avif-serialize")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "avif-serialize" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1llnwlj11wcifdlny8x8yksl3zmz8i6a35il0cd4ar335yj7av47"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.7))))
    (home-page "https://lib.rs/avif-serialize")
    (synopsis
     "Minimal writer for AVIF header structure (MPEG/HEIF/MIAF/ISO-BMFF)")
    (description
     "Minimal writer for AVIF header structure (MPEG/HEIF/MIAF/ISO-BMFF)")
    (license license:bsd-3)))

(define-public rust-ravif-0.11
  (package
    (name "rust-ravif")
    (version "0.11.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ravif" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vhn2p31z31c01j6i28slgbi01wq1hmyqjidwfkqy430hh16kp5s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-avif-serialize" ,rust-avif-serialize-0.8)
                       ("rust-imgref" ,rust-imgref-1)
                       ("rust-loop9" ,rust-loop9-0.1)
                       ("rust-quick-error" ,rust-quick-error-2)
                       ("rust-rav1e" ,rust-rav1e-0.6)
                       ("rust-rav1e" ,rust-rav1e-0.6)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-rgb" ,rust-rgb-0.8))))
    (home-page "https://lib.rs/ravif")
    (synopsis
     "rav1e-based pure Rust library for encoding images in AVIF format (powers the `cavif` tool)")
    (description
     "rav1e-based pure Rust library for encoding images in AVIF format (powers the
`cavif` tool)")
    (license license:bsd-3)))

(define-public rust-qoi-0.4
  (package
    (name "rust-qoi")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "qoi" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00c0wkb112annn2wl72ixyd78mf56p4lxkhlmsggx65l3v3n8vbz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytemuck" ,rust-bytemuck-1))))
    (home-page "https://github.com/aldanor/qoi-rust")
    (synopsis "VERY fast encoder/decoder for QOI (Quite Okay Image) format")
    (description "VERY fast encoder/decoder for QOI (Quite Okay Image) format")
    (license (list license:expat license:asl2.0))))

(define-public rust-gif-0.12
  (package
    (name "rust-gif")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gif" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ibhjyrslfv9qm400gp4hd50v9ibva01j4ab9bwiq1aycy9jayc0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-color-quant" ,rust-color-quant-1)
                       ("rust-weezl" ,rust-weezl-0.1))))
    (home-page "https://github.com/image-rs/image-gif")
    (synopsis "GIF de- and encoder")
    (description "GIF de- and encoder")
    (license (list license:expat license:asl2.0))))

(define-public rust-image-0.24
  (package
    (name "rust-image")
    (version "0.24.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "image" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fhaypwc4ngal4pjq30knl4hymb5lx1i8lh392jc62p2h6m0jyaj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-byteorder" ,rust-byteorder-1)
                       ("rust-color-quant" ,rust-color-quant-1)
                       ("rust-dav1d" ,rust-dav1d-0.6)
                       ("rust-dcv-color-primitives" ,rust-dcv-color-primitives-0.4)
                       ("rust-exr" ,rust-exr-1)
                       ("rust-gif" ,rust-gif-0.12)
                       ("rust-jpeg-decoder" ,rust-jpeg-decoder-0.3)
                       ("rust-mp4parse" ,rust-mp4parse-0.12)
                       ("rust-num-rational" ,rust-num-rational-0.4)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-png" ,rust-png-0.17)
                       ("rust-qoi" ,rust-qoi-0.4)
                       ("rust-ravif" ,rust-ravif-0.11)
                       ("rust-rgb" ,rust-rgb-0.8)
                       ("rust-tiff" ,rust-tiff-0.8)
                       ("rust-webp" ,rust-webp-0.2))
       #:cargo-development-inputs (("rust-crc32fast" ,rust-crc32fast-1)
                                   ("rust-criterion" ,rust-criterion-0.3)
                                   ("rust-glob" ,rust-glob-0.3)
                                   ("rust-jpeg-decoder" ,rust-jpeg-decoder-0.3)
                                   ("rust-num-complex" ,rust-num-complex-0.4)
                                   ("rust-quickcheck" ,rust-quickcheck-1))))
    (home-page "https://github.com/image-rs/image")
    (synopsis
     "Imaging library. Provides basic image processing and encoders/decoders for common image formats.")
    (description
     "Imaging library.  Provides basic image processing and encoders/decoders for
common image formats.")
    (license license:expat)))

