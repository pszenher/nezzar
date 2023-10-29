(use-modules (guix packages)
	     (guix download)
	     (guix build-system node)
	     ((guix licenses) #:prefix license:)
	     
	     (gnu packages node-xyz)
	     (gnu packages commencement)
	     (gnu packages python))

;;; NOTE: all package definitions containing a 'substitute*' snippet
;;;       have been modified from the npm-binary importer output so as
;;;       to disable the "prepare" phase from its package.json
;;; 
;;;       These preparation scripts are typically broken in the guix
;;;       build process, as they expect certain binaries to be in
;;;       PATH, and/or access to the network.  They are also generally
;;;       not needed, as we are fetching the prebuilt packages from
;;;       npm.  

;; (define-public node-typescript-5.2.2
;;   (package
;;     (name "node-typescript")
;;     (version "5.2.2")
;;     (source
;;      (origin
;;        (method url-fetch)
;;        (uri "https://registry.npmjs.org/typescript/-/typescript-5.2.2.tgz")
;;        (sha256
;; 	(base32 "036sdbprinic26d1bg4bcr6ifql7w421killnnnj3f9g3a90zqsj"))))
;;     (build-system node-build-system)
;;     (arguments
;;      '(#:tests? #f
;;        #:phases (modify-phases %standard-phases
;;                   (delete 'build)
;;                   (add-after 'patch-dependencies 'delete-dev-dependencies
;;                     (lambda _
;;                       (delete-dependencies '("@esfx/canceltoken" "@octokit/rest"
;;                                              "@types/chai"
;;                                              "@types/fs-extra"
;;                                              "@types/glob"
;;                                              "@types/microsoft__typescript-etw"
;;                                              "@types/minimist"
;;                                              "@types/mocha"
;;                                              "@types/ms"
;;                                              "@types/node"
;;                                              "@types/source-map-support"
;;                                              "@types/which"
;;                                              "@typescript-eslint/eslint-plugin"
;;                                              "@typescript-eslint/parser"
;;                                              "@typescript-eslint/utils"
;;                                              "azure-devops-node-api"
;;                                              "c8"
;;                                              "chai"
;;                                              "chalk"
;;                                              "chokidar"
;;                                              "del"
;;                                              "diff"
;;                                              "esbuild"
;;                                              "eslint"
;;                                              "eslint-formatter-autolinkable-stylish"
;;                                              "eslint-plugin-local"
;;                                              "eslint-plugin-no-null"
;;                                              "eslint-plugin-simple-import-sort"
;;                                              "fast-xml-parser"
;;                                              "fs-extra"
;;                                              "glob"
;;                                              "hereby"
;;                                              "jsonc-parser"
;;                                              "minimist"
;;                                              "mocha"
;;                                              "mocha-fivemat-progress-reporter"
;;                                              "ms"
;;                                              "node-fetch"
;;                                              "source-map-support"
;;                                              "tslib"
;;                                              "typescript"
;;                                              "which")))))))
;;     (home-page "https://www.typescriptlang.org/")
;;     (synopsis
;;      "TypeScript is a language for application scale JavaScript development")
;;     (description
;;      "TypeScript is a language for application scale JavaScript development")
;;     (license license:asl2.0)))

(define-public node-streamsearch-0.1.2
  (package
    (name "node-streamsearch")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/streamsearch/-/streamsearch-0.1.2.tgz")
       (sha256
        (base32 "1sqjavakk11j04fnvl34zbsl1vqzlf6n8y2mmiz9mprpnrdcn2z3"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (home-page "https://www.npmjs.com/package/node-streamsearch")
    (synopsis "Streaming Boyer-Moore-Horspool searching for node.js")
    (description "Streaming Boyer-Moore-Horspool searching for node.js")
    (license #f)))
(define-public node-dicer-0.2.5
  (package
    (name "node-dicer")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/dicer/-/dicer-0.2.5.tgz")
       (sha256
        (base32 "19w1sx0g2wg8js359v60jgql2d51k11b78s44aqf73r5iadsifk7"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (inputs `(("node-readable-stream" ,node-readable-stream-1.1.14)
              ("node-streamsearch" ,node-streamsearch-0.1.2)))
    (home-page "https://github.com/mscdex/dicer#readme")
    (synopsis "A very fast streaming multipart parser for node.js")
    (description "A very fast streaming multipart parser for node.js")
    (license #f)))
(define-public node-isarray-0.0.1
  (package
    (name "node-isarray")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/isarray/-/isarray-0.0.1.tgz")
       (sha256
        (base32 "02lz1bvrrj779zlwidir18a7dp1ac194r7d0jbnhm04n0q14911y"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tap")))))))
    (home-page "https://github.com/juliangruber/isarray")
    (synopsis "Array#isArray for older browsers")
    (description "Array#isArray for older browsers")
    (license license:expat)))
(define-public node-string-decoder-0.10.31
  (package
    (name "node-string-decoder")
    (version "0.10.31")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/string_decoder/-/string_decoder-0.10.31.tgz")
       (sha256
        (base32 "11i0qawpjawca6lsip266jqk8ll41gy9m44a4yr7w5g6mzz6yviy"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tap")))))))
    (home-page "https://github.com/rvagg/string_decoder")
    (synopsis "The string_decoder module from Node core")
    (description "The string_decoder module from Node core")
    (license license:expat)))
(define-public node-readable-stream-1.1.14
  (package
    (name "node-readable-stream")
    (version "1.1.14")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/readable-stream/-/readable-stream-1.1.14.tgz")
       (sha256
        (base32 "1r4xspbx092zm5hvq7fk2q1rjx0pj8mzb0fxl42idz14bb63z69c"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tap")))))))
    (inputs `(("node-inherits" ,node-inherits)
              ("node-string-decoder" ,node-string-decoder-0.10.31)
              ("node-isarray" ,node-isarray-0.0.1)
              ("node-core-util-is" ,node-core-util-is-1.0.3)))
    (home-page "https://www.npmjs.com/package/node-readable-stream")
    (synopsis
     "Streams3, a user-land copy of the stream library from Node.js v0.11.x")
    (description
     "Streams3, a user-land copy of the stream library from Node.js v0.11.x")
    (license license:expat)))
(define-public node-busboy-0.2.14
  (package
    (name "node-busboy")
    (version "0.2.14")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/busboy/-/busboy-0.2.14.tgz")
       (sha256
        (base32 "08yhsqc8skcwfahscpznfihni2ifqhhb95cmazsxhni1asklw92p"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (inputs `(("node-readable-stream" ,node-readable-stream-1.1.14)
              ("node-dicer" ,node-dicer-0.2.5)))
    (home-page "https://github.com/mscdex/busboy#readme")
    (synopsis "A streaming parser for HTML form data for node.js")
    (description "A streaming parser for HTML form data for node.js")
    (license #f)))
(define-public node-multer-1.4.4
  (package
    (name "node-multer")
    (version "1.4.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/multer/-/multer-1.4.4.tgz")
       (sha256
        (base32 "0m5hnaj84pabrjxqsspi4l4xf6sga68nji48v3dary15ij0m37jz"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("deep-equal" "express"
                                             "form-data"
                                             "fs-temp"
                                             "mocha"
                                             "rimraf"
                                             "standard"
                                             "testdata-w3c-json-form")))))))
    (inputs `(("node-xtend" ,node-xtend-4.0.2)
              ("node-type-is" ,node-type-is-1.6.18)
              ("node-on-finished" ,node-on-finished-2.4.1)
              ("node-object-assign" ,node-object-assign-4.1.1)
              ("node-mkdirp" ,node-mkdirp-0.5.6)
              ("node-concat-stream" ,node-concat-stream-1.6.2)
              ("node-busboy" ,node-busboy-0.2.14)
              ("node-append-field" ,node-append-field-1.0.0)))
    (home-page "https://github.com/expressjs/multer#readme")
    (synopsis "Middleware for handling `multipart/form-data`.")
    (description "Middleware for handling `multipart/form-data`.")
    (license license:expat)))
(define-public node-babel-plugin-syntax-export-namespace-from-7.8.3
  (package
    (name "node-babel-plugin-syntax-export-namespace-from")
    (version "7.8.3")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/plugin-syntax-export-namespace-from/-/plugin-syntax-export-namespace-from-7.8.3.tgz")
       (sha256
        (base32 "0iz3qbfdyqxm29yl3i2a4yqx1kn5wf5kpn6h2040svl5svfh0l5k"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@babel/core")))))))
    (inputs `(("node-babel-helper-plugin-utils" ,node-babel-helper-plugin-utils-7.22.5)
              ("node-babel-core" ,node-babel-core-7.23.0)))
    (home-page
     "https://www.npmjs.com/package/node-babel-plugin-syntax-export-namespace-from")
    (synopsis "Allow parsing of export namespace from")
    (description "Allow parsing of export namespace from")
    (license license:expat)))
(define-public node-babel-plugin-proposal-export-namespace-from-7.18.9
  (package
    (name "node-babel-plugin-proposal-export-namespace-from")
    (version "7.18.9")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/plugin-proposal-export-namespace-from/-/plugin-proposal-export-namespace-from-7.18.9.tgz")
       (sha256
        (base32 "0y4n45z53wjbf61yg367pc23akapgpil0qdl437y9cywilkqj9g0"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@babel/core"
                                             "@babel/helper-plugin-test-runner")))))))
    (inputs `(("node-babel-plugin-syntax-export-namespace-from" ,node-babel-plugin-syntax-export-namespace-from-7.8.3)
              ("node-babel-helper-plugin-utils" ,node-babel-helper-plugin-utils-7.22.5)
              ("node-babel-core" ,node-babel-core-7.23.0)))
    (home-page
     "https://babel.dev/docs/en/next/babel-plugin-proposal-export-namespace-from")
    (synopsis "Compile export namespace to ES2015")
    (description "Compile export namespace to ES2015")
    (license license:expat)))
(define-public node-ampproject-remapping-2.2.1
  (package
    (name "node-ampproject-remapping")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@ampproject/remapping/-/remapping-2.2.1.tgz")
       (sha256
        (base32 "18m2vvym1xxbn8mqvh8krqzfw5qbhj5qkcxdh7d1qj9503a0j78j"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@rollup/plugin-typescript"
                                             "@types/jest"
                                             "@typescript-eslint/eslint-plugin"
                                             "@typescript-eslint/parser"
                                             "eslint"
                                             "eslint-config-prettier"
                                             "jest"
                                             "jest-config"
                                             "npm-run-all"
                                             "prettier"
                                             "rollup"
                                             "ts-jest"
                                             "tslib"
                                             "typescript")))))))
    (inputs `(("node-jridgewell-trace-mapping" ,node-jridgewell-trace-mapping-0.3.19)
              ("node-jridgewell-gen-mapping" ,node-jridgewell-gen-mapping-0.3.3)))
    (home-page "https://github.com/ampproject/remapping#readme")
    (synopsis
     "Remap sequential sourcemaps through transformations to point at the original source code")
    (description
     "Remap sequential sourcemaps through transformations to point at the original source code")
    (license license:asl2.0)))
(define-public node-babel-compat-data-7.22.20
  (package
    (name "node-babel-compat-data")
    (version "7.22.20")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/compat-data/-/compat-data-7.22.20.tgz")
       (sha256
        (base32 "0mc0hchiid3yqvvyg2yp5grxgxlgwpc4w2lgrkp4p9dzz7rniw3i"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@mdn/browser-compat-data"
                                             "core-js-compat"
                                             "electron-to-chromium")))))))
    (home-page "https://www.npmjs.com/package/node-babel-compat-data")
    (synopsis "")
    (description "")
    (license license:expat)))
(define-public node-babel-helper-validator-option-7.22.15
  (package
    (name "node-babel-helper-validator-option")
    (version "7.22.15")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/helper-validator-option/-/helper-validator-option-7.22.15.tgz")
       (sha256
        (base32 "0swz1dchfk5zpk09x4jbd700azjhq92iyh06zsah6yl3kfgzpkfq"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (home-page
     "https://www.npmjs.com/package/node-babel-helper-validator-option")
    (synopsis "Validate plugin/preset options")
    (description "Validate plugin/preset options")
    (license license:expat)))
(define-public node-caniuse-lite-1.0.30001541
  (package
    (name "node-caniuse-lite")
    (version "1.0.30001541")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/caniuse-lite/-/caniuse-lite-1.0.30001541.tgz")
       (sha256
        (base32 "1679y9ql65sz1rjinvd98il406nbiwpysnnd5kkdbxqac3gs72ay"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (home-page "https://github.com/browserslist/caniuse-lite#readme")
    (synopsis "A smaller version of caniuse-db, with only the essentials!")
    (description "A smaller version of caniuse-db, with only the essentials!")
    (license license:cc-by4.0)))
(define-public node-electron-to-chromium-1.4.534
  (package
    (name "node-electron-to-chromium")
    (version "1.4.534")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/electron-to-chromium/-/electron-to-chromium-1.4.534.tgz")
       (sha256
        (base32 "09qh2bp7bkj01xk8j5kg0zycvn4nhacg30qh8zf8b5jy38j9s6cs"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "codecov"
                                             "compare-versions" "node-fetch"
                                             "nyc" "shelljs")))))))
    (home-page "https://github.com/kilian/electron-to-chromium#readme")
    (synopsis "Provides a list of electron-to-chromium version mappings")
    (description "Provides a list of electron-to-chromium version mappings")
    (license license:isc)))
(define-public node-node-releases-2.0.13
  (package
    (name "node-node-releases")
    (version "2.0.13")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/node-releases/-/node-releases-2.0.13.tgz")
       (sha256
        (base32 "0lyzb1wixv981anpzskac70sslaarvw6iqj6niyyhj138zakfp7j"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("semver")))))))
    (home-page "https://github.com/chicoxyzzy/node-releases#readme")
    (synopsis "Node.js releases data")
    (description "Node.js releases data")
    (license license:expat)))
(define-public node-escalade-3.1.1
  (package
    (name "node-escalade")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/escalade/-/escalade-3.1.1.tgz")
       (sha256
        (base32 "17d7icirlarj6mjx321z04klpvjsxwga8c8svai2547bid131y30"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("bundt" "esm" "uvu")))))))
    (home-page "https://github.com/lukeed/escalade#readme")
    (synopsis
     "A tiny (183B to 210B) and fast utility to ascend parent directories")
    (description
     "A tiny (183B to 210B) and fast utility to ascend parent directories")
    (license license:expat)))
(define-public node-picocolors-1.0.0
  (package
    (name "node-picocolors")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/picocolors/-/picocolors-1.0.0.tgz")
       (sha256
        (base32 "10zk2pciqiyxjapg6yp7n02nbvvyy00a6k8sz7jibsh6lhmyqqk0"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (home-page "https://github.com/alexeyraspopov/picocolors#readme")
    (synopsis
     "The tiniest and the fastest library for terminal output formatting with ANSI colors")
    (description
     "The tiniest and the fastest library for terminal output formatting with ANSI colors")
    (license license:isc)))
(define-public node-update-browserslist-db-1.0.13
  (package
    (name "node-update-browserslist-db")
    (version "1.0.13")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/update-browserslist-db/-/update-browserslist-db-1.0.13.tgz")
       (sha256
        (base32 "1q8rsxf1r90xaqqrx1rf8ahaf73bc17myjdqlyxqgb05fjg43i9y"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("browserslist")))))))
    (inputs `(("node-picocolors" ,node-picocolors-1.0.0)
              ("node-escalade" ,node-escalade-3.1.1)
              ;; ("node-browserslist" ,node-browserslist-4.22.0)
	      ))
    (home-page "https://github.com/browserslist/update-db#readme")
    (synopsis
     "CLI tool to update caniuse-lite to refresh target browsers from Browserslist config")
    (description
     "CLI tool to update caniuse-lite to refresh target browsers from Browserslist config")
    (license license:expat)))
(define-public node-browserslist-4.22.0
  (package
    (name "node-browserslist")
    (version "4.22.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/browserslist/-/browserslist-4.22.0.tgz")
       (sha256
        (base32 "18myh40j5ckkw7bx0l5gybpd8yi4z2qwnnajh454v060zdm0y06z"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (inputs `(("node-update-browserslist-db" ,node-update-browserslist-db-1.0.13)
              ("node-node-releases" ,node-node-releases-2.0.13)
              ("node-electron-to-chromium" ,node-electron-to-chromium-1.4.534)
              ("node-caniuse-lite" ,node-caniuse-lite-1.0.30001541)))
    (home-page "https://github.com/browserslist/browserslist#readme")
    (synopsis
     "Share target browsers between different front-end tools, like Autoprefixer, Stylelint and babel-env-preset")
    (description
     "Share target browsers between different front-end tools, like Autoprefixer, Stylelint and babel-env-preset")
    (license license:expat)))
(define-public node-yallist-3.1.1
  (package
    (name "node-yallist")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/yallist/-/yallist-3.1.1.tgz")
       (sha256
        (base32 "016afm3iv7pfrg9nj7952dph6sg00lryk8wv4nr0qdp8rzk4mwah"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tap")))))))
    (home-page "https://github.com/isaacs/yallist#readme")
    (synopsis "Yet Another Linked List")
    (description "Yet Another Linked List")
    (license license:isc)))
(define-public node-lru-cache-5.1.1
  (package
    (name "node-lru-cache")
    (version "5.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/lru-cache/-/lru-cache-5.1.1.tgz")
       (sha256
        (base32 "0nj8d71w5yb3rmiaxby5scwfl0n1jdaplr0p6dp619j4jn0ph7mi"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("benchmark" "tap")))))))
    (inputs `(("node-yallist" ,node-yallist-3.1.1)))
    (home-page "https://github.com/isaacs/node-lru-cache#readme")
    (synopsis "A cache object that deletes the least-recently-used items.")
    (description "A cache object that deletes the least-recently-used items.")
    (license license:isc)))
(define-public node-babel-helper-compilation-targets-7.22.15
  (package
    (name "node-babel-helper-compilation-targets")
    (version "7.22.15")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/helper-compilation-targets/-/helper-compilation-targets-7.22.15.tgz")
       (sha256
        (base32 "0x07qzichmw9j1bqrpr591f893kamxbc95m1vvbnlhrn27p854hl"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@babel/helper-plugin-test-runner"
                                             "@types/lru-cache"
                                             "@types/semver")))))))
    (inputs `(("node-semver" ,node-semver-6.3.1)
              ("node-lru-cache" ,node-lru-cache-5.1.1)
              ("node-browserslist" ,node-browserslist-4.22.0)
              ("node-babel-helper-validator-option" ,node-babel-helper-validator-option-7.22.15)
              ("node-babel-compat-data" ,node-babel-compat-data-7.22.20)))
    (home-page
     "https://www.npmjs.com/package/node-babel-helper-compilation-targets")
    (synopsis "Helper functions on Babel compilation targets")
    (description "Helper functions on Babel compilation targets")
    (license license:expat)))
(define-public node-babel-helpers-7.23.1
  (package
    (name "node-babel-helpers")
    (version "7.23.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/@babel/helpers/-/helpers-7.23.1.tgz")
       (sha256
        (base32 "0bd26bld2hdcz8bf87lv6a64l9gdqyspxddgs7vvdgbypakkajsg"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@babel/generator"
                                             "@babel/helper-plugin-test-runner"
                                             "@babel/parser"
                                             "regenerator-runtime" "terser")))))))
    (inputs `(("node-babel-types" ,node-babel-types-7.23.0)
              ("node-babel-traverse" ,node-babel-traverse-7.23.0)
              ("node-babel-template" ,node-babel-template-7.22.15)))
    (home-page "https://babel.dev/docs/en/next/babel-helpers")
    (synopsis "Collection of helper functions used by Babel transforms.")
    (description "Collection of helper functions used by Babel transforms.")
    (license license:expat)))
(define-public node-jridgewell-set-array-1.1.2
  (package
    (name "node-jridgewell-set-array")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@jridgewell/set-array/-/set-array-1.1.2.tgz")
       (sha256
        (base32 "1zq7ws2fnaqgs6dzg9nnd9li45drq1bk76cabq7m1309j8r7g1bm"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@rollup/plugin-typescript"
                                             "@types/mocha"
                                             "@types/node"
                                             "@typescript-eslint/eslint-plugin"
                                             "@typescript-eslint/parser"
                                             "c8"
                                             "eslint"
                                             "eslint-config-prettier"
                                             "mocha"
                                             "npm-run-all"
                                             "prettier"
                                             "rollup"
                                             "typescript")))))))
    (home-page "https://github.com/jridgewell/set-array#readme")
    (synopsis
     "Like a Set, but provides the index of the `key` in the backing array")
    (description
     "Like a Set, but provides the index of the `key` in the backing array")
    (license license:expat)))
(define-public node-jridgewell-gen-mapping-0.3.3
  (package
    (name "node-jridgewell-gen-mapping")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@jridgewell/gen-mapping/-/gen-mapping-0.3.3.tgz")
       (sha256
        (base32 "0sbsas6ggi5gb30g5n1b31mdpmwc5w83ggwxky5b3klh1y8nwxrc"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@rollup/plugin-typescript"
                                             "@types/mocha"
                                             "@types/node"
                                             "@typescript-eslint/eslint-plugin"
                                             "@typescript-eslint/parser"
                                             "benchmark"
                                             "c8"
                                             "eslint"
                                             "eslint-config-prettier"
                                             "mocha"
                                             "npm-run-all"
                                             "prettier"
                                             "rollup"
                                             "typescript")))))))
    (inputs `(("node-jridgewell-trace-mapping" ,node-jridgewell-trace-mapping-0.3.19)
              ("node-jridgewell-sourcemap-codec" ,node-jridgewell-sourcemap-codec-1.4.15)
              ("node-jridgewell-set-array" ,node-jridgewell-set-array-1.1.2)))
    (home-page "https://github.com/jridgewell/gen-mapping#readme")
    (synopsis "Generate source maps")
    (description "Generate source maps")
    (license license:expat)))
(define-public node-jridgewell-resolve-uri-3.1.1
  (package
    (name "node-jridgewell-resolve-uri")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@jridgewell/resolve-uri/-/resolve-uri-3.1.1.tgz")
       (sha256
        (base32 "0dm5gsk8wr58b33fp499rc1k9gz50fnwix95398f4mlr5j8pi87x"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@jridgewell/resolve-uri-latest"
                                             "@rollup/plugin-typescript"
                                             "@typescript-eslint/eslint-plugin"
                                             "@typescript-eslint/parser"
                                             "c8"
                                             "eslint"
                                             "eslint-config-prettier"
                                             "mocha"
                                             "npm-run-all"
                                             "prettier"
                                             "rollup"
                                             "typescript")))))))
    (home-page "https://github.com/jridgewell/resolve-uri#readme")
    (synopsis "Resolve a URI relative to an optional base URI")
    (description "Resolve a URI relative to an optional base URI")
    (license license:expat)))
(define-public node-jridgewell-sourcemap-codec-1.4.15
  (package
    (name "node-jridgewell-sourcemap-codec")
    (version "1.4.15")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.4.15.tgz")
       (sha256
        (base32 "1ada9hszqx7aiv2l0sb1lxpkf860czjplxpnc0ybfs934b74jndg"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@rollup/plugin-typescript"
                                             "@types/node"
                                             "@typescript-eslint/eslint-plugin"
                                             "@typescript-eslint/parser"
                                             "benchmark"
                                             "c8"
                                             "eslint"
                                             "eslint-config-prettier"
                                             "mocha"
                                             "npm-run-all"
                                             "prettier"
                                             "rollup"
                                             "source-map"
                                             "source-map-js"
                                             "sourcemap-codec"
                                             "typescript")))))))
    (home-page "https://github.com/jridgewell/sourcemap-codec#readme")
    (synopsis "Encode/decode sourcemap mappings")
    (description "Encode/decode sourcemap mappings")
    (license license:expat)))
(define-public node-jridgewell-trace-mapping-0.3.19
  (package
    (name "node-jridgewell-trace-mapping")
    (version "0.3.19")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@jridgewell/trace-mapping/-/trace-mapping-0.3.19.tgz")
       (sha256
        (base32 "11jbyiz7i4mhgyicxg3ygj12z6h1j23xmkj2g1mr6wgz9hniamyq"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@rollup/plugin-typescript"
                                             "@typescript-eslint/eslint-plugin"
                                             "@typescript-eslint/parser"
                                             "ava"
                                             "benchmark"
                                             "c8"
                                             "esbuild"
                                             "eslint"
                                             "eslint-config-prettier"
                                             "eslint-plugin-no-only-tests"
                                             "npm-run-all"
                                             "prettier"
                                             "rollup"
                                             "tsx"
                                             "typescript")))))))
    (inputs `(("node-jridgewell-sourcemap-codec" ,node-jridgewell-sourcemap-codec-1.4.15)
              ("node-jridgewell-resolve-uri" ,node-jridgewell-resolve-uri-3.1.1)))
    (home-page "https://github.com/jridgewell/trace-mapping#readme")
    (synopsis "Trace the original position through a source map")
    (description "Trace the original position through a source map")
    (license license:expat)))
(define-public node-jsesc-2.5.2
  (package
    (name "node-jsesc")
    (version "2.5.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/jsesc/-/jsesc-2.5.2.tgz")
       (sha256
        (base32 "12r5ijjqqj5ajj1bp97hjvnhr9wd5xlw620y7wkn4j74apdjnnmf"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("coveralls" "grunt"
                                             "grunt-template"
                                             "istanbul"
                                             "mocha"
                                             "regenerate"
                                             "requirejs")))))))
    (home-page "https://mths.be/jsesc")
    (synopsis
     "Given some data, jsesc returns the shortest possible stringified & ASCII-safe representation of that data.")
    (description
     "Given some data, jsesc returns the shortest possible stringified & ASCII-safe representation of that data.")
    (license license:expat)))
(define-public node-babel-generator-7.23.0
  (package
    (name "node-babel-generator")
    (version "7.23.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/generator/-/generator-7.23.0.tgz")
       (sha256
        (base32 "1wy8dld3a529qvirbqzpygzx1v99624q06w4dll0x71lzg3v1k3m"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@babel/helper-fixtures"
                                             "@babel/parser"
                                             "@jridgewell/sourcemap-codec"
                                             "@types/jsesc" "charcodes")))))))
    (inputs `(("node-jsesc" ,node-jsesc-2.5.2)
              ("node-jridgewell-trace-mapping" ,node-jridgewell-trace-mapping-0.3.19)
              ("node-jridgewell-gen-mapping" ,node-jridgewell-gen-mapping-0.3.3)
              ("node-babel-types" ,node-babel-types-7.23.0)))
    (home-page "https://babel.dev/docs/en/next/babel-generator")
    (synopsis "Turns an AST into code.")
    (description "Turns an AST into code.")
    (license license:expat)))
(define-public node-js-tokens-4.0.0
  (package
    (name "node-js-tokens")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/js-tokens/-/js-tokens-4.0.0.tgz")
       (sha256
        (base32 "0lrw3qvcfmxrwwi7p7ng4r17yw32ki7jpnbj2a65ddddv2icg16q"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("coffeescript" "esprima"
                                             "everything.js" "mocha")))))))
    (home-page "https://github.com/lydell/js-tokens#readme")
    (synopsis "A regex that tokenizes JavaScript.")
    (description "A regex that tokenizes JavaScript.")
    (license license:expat)))
(define-public node-babel-highlight-7.22.20
  (package
    (name "node-babel-highlight")
    (version "7.22.20")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/highlight/-/highlight-7.22.20.tgz")
       (sha256
        (base32 "02ngxxp92w5qj75qhn8q8dcdi6v3al8pbbavdlbf9hzj6nmwbhpb"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("strip-ansi")))))))
    (inputs `(("node-js-tokens" ,node-js-tokens-4.0.0)
              ("node-chalk" ,node-chalk-2.4.2)
              ("node-babel-helper-validator-identifier" ,node-babel-helper-validator-identifier-7.22.20)))
    (home-page "https://babel.dev/docs/en/next/babel-highlight")
    (synopsis "Syntax highlight JavaScript strings for output in terminals.")
    (description
     "Syntax highlight JavaScript strings for output in terminals.")
    (license license:expat)))
(define-public node-color-convert-1.9.3
  (package
    (name "node-color-convert")
    (version "1.9.3")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/color-convert/-/color-convert-1.9.3.tgz")
       (sha256
        (base32 "1ahbdssv1qgwlzvhv7731hpfgz8wny0619x97b7n5x9lckj17i0j"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("chalk" "xo")))))))
    (inputs `(("node-color-name" ,node-color-name)))
    (home-page "https://github.com/Qix-/color-convert#readme")
    (synopsis "Plain color conversion functions")
    (description "Plain color conversion functions")
    (license license:expat)))
(define-public node-ansi-styles-3.2.1
  (package
    (name "node-ansi-styles")
    (version "3.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/ansi-styles/-/ansi-styles-3.2.1.tgz")
       (sha256
        (base32 "1wqd08glq159q724kvpi6nnf87biajr749a7r9c84xm639g6463k"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "babel-polyfill"
                                             "svg-term-cli" "xo")))))))
    (inputs `(("node-color-convert" ,node-color-convert-1.9.3)))
    (home-page "https://github.com/chalk/ansi-styles#readme")
    (synopsis "ANSI escape codes for styling strings in the terminal")
    (description "ANSI escape codes for styling strings in the terminal")
    (license license:expat)))
(define-public node-has-flag-3.0.0
  (package
    (name "node-has-flag")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/has-flag/-/has-flag-3.0.0.tgz")
       (sha256
        (base32 "1sp0m48zavms86q7vkf90mwll9z2bqi11hk3s01aw8nw40r72jzd"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "xo")))))))
    (home-page "https://github.com/sindresorhus/has-flag#readme")
    (synopsis "Check if argv has a specific flag")
    (description "Check if argv has a specific flag")
    (license license:expat)))
(define-public node-supports-color-5.5.0
  (package
    (name "node-supports-color")
    (version "5.5.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/supports-color/-/supports-color-5.5.0.tgz")
       (sha256
        (base32 "1ap0lk4n0m3948cnkfmyz71pizqlzjdfrhs0f954pksg4jnk52h5"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "import-fresh" "xo")))))))
    (inputs `(("node-has-flag" ,node-has-flag-3.0.0)))
    (home-page "https://github.com/chalk/supports-color#readme")
    (synopsis "Detect whether a terminal supports color")
    (description "Detect whether a terminal supports color")
    (license license:expat)))
(define-public node-chalk-2.4.2
  (package
    (name "node-chalk")
    (version "2.4.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/chalk/-/chalk-2.4.2.tgz")
       (sha256
        (base32 "0wf6hln5gcjb2n8p18gag6idghl6dfq4if6pxa6s1jqnwr94x26h"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "coveralls"
                                             "execa"
                                             "flow-bin"
                                             "import-fresh"
                                             "matcha"
                                             "nyc"
                                             "resolve-from"
                                             "typescript"
                                             "xo")))))))
    (inputs `(("node-supports-color" ,node-supports-color-5.5.0)
              ("node-escape-string-regexp" ,node-escape-string-regexp-1.0.5)
              ("node-ansi-styles" ,node-ansi-styles-3.2.1)))
    (home-page "https://github.com/chalk/chalk#readme")
    (synopsis "Terminal string styling done right")
    (description "Terminal string styling done right")
    (license license:expat)))
(define-public node-babel-code-frame-7.22.13
  (package
    (name "node-babel-code-frame")
    (version "7.22.13")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/code-frame/-/code-frame-7.22.13.tgz")
       (sha256
        (base32 "1avrpizhim2yfc4p2lc931s37zxwwjqvwn5av5abfr6blvknp1sy"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("import-meta-resolve"
                                             "strip-ansi")))))))
    (inputs `(("node-chalk" ,node-chalk-2.4.2)
              ("node-babel-highlight" ,node-babel-highlight-7.22.20)))
    (home-page "https://babel.dev/docs/en/next/babel-code-frame")
    (synopsis
     "Generate errors that contain a code frame that point to source locations.")
    (description
     "Generate errors that contain a code frame that point to source locations.")
    (license license:expat)))
(define-public node-babel-template-7.22.15
  (package
    (name "node-babel-template")
    (version "7.22.15")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/template/-/template-7.22.15.tgz")
       (sha256
        (base32 "1wqc6hwliwwmfzs99a1kjz0bmiv0877pbwypjwdaz9f0h34mcfvf"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (inputs `(("node-babel-types" ,node-babel-types-7.23.0)
              ("node-babel-parser" ,node-babel-parser-7.23.0)
              ("node-babel-code-frame" ,node-babel-code-frame-7.22.13)))
    (home-page "https://babel.dev/docs/en/next/babel-template")
    (synopsis "Generate an AST from a string template.")
    (description "Generate an AST from a string template.")
    (license license:expat)))
(define-public node-babel-helper-function-name-7.23.0
  (package
    (name "node-babel-helper-function-name")
    (version "7.23.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/helper-function-name/-/helper-function-name-7.23.0.tgz")
       (sha256
        (base32 "1fzy50fgw7nib3yqgnqnpkayirw4jirikr92kcxysp7wk4isn1p9"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (inputs `(("node-babel-types" ,node-babel-types-7.23.0)
              ("node-babel-template" ,node-babel-template-7.22.15)))
    (home-page "https://babel.dev/docs/en/next/babel-helper-function-name")
    (synopsis
     "Helper function to change the property 'name' of every function")
    (description
     "Helper function to change the property 'name' of every function")
    (license license:expat)))
(define-public node-babel-helper-hoist-variables-7.22.5
  (package
    (name "node-babel-helper-hoist-variables")
    (version "7.22.5")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/helper-hoist-variables/-/helper-hoist-variables-7.22.5.tgz")
       (sha256
        (base32 "1hmqzar33qrnhshj1v9bhb7p308hqk6m3dpmf6scqn348g5kx5fi"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@babel/traverse")))))))
    (inputs `(("node-babel-types" ,node-babel-types-7.23.0)))
    (home-page "https://babel.dev/docs/en/next/babel-helper-hoist-variables")
    (synopsis "Helper function to hoist variables")
    (description "Helper function to hoist variables")
    (license license:expat)))
(define-public node-babel-parser-7.23.0
  (package
    (name "node-babel-parser")
    (version "7.23.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/@babel/parser/-/parser-7.23.0.tgz")
       (sha256
        (base32 "0a4c88qrjc447ckkvqz1i4pcvvgdh8myvkqzsjpllxdhbcxwlqg5"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@babel/code-frame"
                                             "@babel/helper-check-duplicate-nodes"
                                             "@babel/helper-fixtures"
                                             "@babel/helper-string-parser"
                                             "@babel/helper-validator-identifier"
                                             "charcodes")))))))
    (home-page "https://babel.dev/docs/en/next/babel-parser")
    (synopsis "A JavaScript parser")
    (description "A JavaScript parser")
    (license license:expat)))
(define-public node-globals-11.12.0
  (package
    (name "node-globals")
    (version "11.12.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/globals/-/globals-11.12.0.tgz")
       (sha256
        (base32 "1xjsxgvvvksbp04c7010xmcnpnnrdbj84xl0vfjdqzw5q92qr99q"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "xo")))))))
    (home-page "https://github.com/sindresorhus/globals#readme")
    (synopsis "Global identifiers from different JavaScript environments")
    (description "Global identifiers from different JavaScript environments")
    (license license:expat)))
(define-public node-babel-traverse-7.23.0
  (package
    (name "node-babel-traverse")
    (version "7.23.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/traverse/-/traverse-7.23.0.tgz")
       (sha256
        (base32 "0xfibgfddna83lxqyprzcxfgk4gjqila9yr173cch99a2hyhp6ds"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@babel/core"
                                             "@babel/helper-plugin-test-runner")))))))
    (inputs `(("node-globals" ,node-globals-11.12.0)
              ("node-debug" ,node-debug-4.3.4)
              ("node-babel-types" ,node-babel-types-7.23.0)
              ("node-babel-parser" ,node-babel-parser-7.23.0)
              ("node-babel-helper-split-export-declaration" ,node-babel-helper-split-export-declaration-7.22.6)
              ("node-babel-helper-hoist-variables" ,node-babel-helper-hoist-variables-7.22.5)
              ("node-babel-helper-function-name" ,node-babel-helper-function-name-7.23.0)
              ("node-babel-helper-environment-visitor" ,node-babel-helper-environment-visitor-7.22.20)
              ("node-babel-generator" ,node-babel-generator-7.23.0)
              ("node-babel-code-frame" ,node-babel-code-frame-7.22.13)))
    (home-page "https://babel.dev/docs/en/next/babel-traverse")
    (synopsis
     "The Babel Traverse module maintains the overall tree state, and is responsible for replacing, removing, and adding nodes")
    (description
     "The Babel Traverse module maintains the overall tree state, and is responsible for replacing, removing, and adding nodes")
    (license license:expat)))
(define-public node-convert-source-map-2.0.0
  (package
    (name "node-convert-source-map")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/convert-source-map/-/convert-source-map-2.0.0.tgz")
       (sha256
        (base32 "160qzrwfhj8xkc2ya476hp7sahaj5gnzv4hi6xl9zq74qwz2bxqp"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("inline-source-map" "tap")))))))
    (home-page "https://github.com/thlorenz/convert-source-map")
    (synopsis
     "Converts a source-map from/to  different formats and allows adding/changing properties.")
    (description
     "Converts a source-map from/to  different formats and allows adding/changing properties.")
    (license license:expat)))
(define-public node-gensync-1.0.0-beta.2
  (package
    (name "node-gensync")
    (version "1.0.0-beta.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/gensync/-/gensync-1.0.0-beta.2.tgz")
       (sha256
        (base32 "1j8piprq5pvns7j60gm0jkrdmnm8zrfl2wwarf94ypd34vpr57yz"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("babel-core" "babel-preset-env"
                                             "eslint"
                                             "eslint-config-prettier"
                                             "eslint-plugin-node"
                                             "eslint-plugin-prettier"
                                             "flow-bin"
                                             "jest"
                                             "prettier")))))))
    (home-page "https://github.com/loganfsmyth/gensync")
    (synopsis
     "Allows users to use generators in order to write common functions that can be both sync or async.")
    (description
     "Allows users to use generators in order to write common functions that can be both sync or async.")
    (license license:expat)))
(define-public node-json5-2.2.3
  (package
    (name "node-json5")
    (version "2.2.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/json5/-/json5-2.2.3.tgz")
       (sha256
        (base32 "0yrpsb1frqahc48n6w2jzvhd7m8r9w2w9ylqkg41zl80nqyv7bq8"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("core-js" "eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "npm-run-all"
                                             "regenerate"
                                             "rollup"
                                             "rollup-plugin-buble"
                                             "rollup-plugin-commonjs"
                                             "rollup-plugin-node-resolve"
                                             "rollup-plugin-terser"
                                             "sinon"
                                             "tap"
                                             "unicode-10.0.0")))))))
    (home-page "http://json5.org/")
    (synopsis "JSON for Humans")
    (description "JSON for Humans")
    (license license:expat)))
(define-public node-babel-core-7.23.0
  (package
    (name "node-babel-core")
    (version "7.23.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/@babel/core/-/core-7.23.0.tgz")
       (sha256
        (base32 "11si8hicm3zp86f0sq0v0wf6if0gmv9z59x5iajasgyfqyxml5mw"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@babel/helper-transform-fixture-test-runner"
                                             "@babel/plugin-syntax-flow"
                                             "@babel/plugin-transform-flow-strip-types"
                                             "@babel/plugin-transform-modules-commonjs"
                                             "@babel/preset-env"
                                             "@babel/preset-typescript"
                                             "@jridgewell/trace-mapping"
                                             "@types/convert-source-map"
                                             "@types/debug"
                                             "@types/gensync"
                                             "@types/resolve"
                                             "@types/semver"
                                             "rimraf"
                                             "ts-node")))))))
    (inputs `(("node-semver" ,node-semver-6.3.1)
              ("node-json5" ,node-json5-2.2.3)
              ("node-gensync" ,node-gensync-1.0.0-beta.2)
              ("node-debug" ,node-debug-4.3.4)
              ("node-convert-source-map" ,node-convert-source-map-2.0.0)
              ("node-babel-types" ,node-babel-types-7.23.0)
              ("node-babel-traverse" ,node-babel-traverse-7.23.0)
              ("node-babel-template" ,node-babel-template-7.22.15)
              ("node-babel-parser" ,node-babel-parser-7.23.0)
              ("node-babel-helpers" ,node-babel-helpers-7.23.1)
              ("node-babel-helper-module-transforms" ,node-babel-helper-module-transforms-7.23.0)
              ("node-babel-helper-compilation-targets" ,node-babel-helper-compilation-targets-7.22.15)
              ("node-babel-generator" ,node-babel-generator-7.23.0)
              ("node-babel-code-frame" ,node-babel-code-frame-7.22.13)
              ("node-ampproject-remapping" ,node-ampproject-remapping-2.2.1)))
    (home-page "https://babel.dev/docs/en/next/babel-core")
    (synopsis "Babel compiler core.")
    (description "Babel compiler core.")
    (license license:expat)))
(define-public node-babel-helper-environment-visitor-7.22.20
  (package
    (name "node-babel-helper-environment-visitor")
    (version "7.22.20")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/helper-environment-visitor/-/helper-environment-visitor-7.22.20.tgz")
       (sha256
        (base32 "0qh9nkg5hv88mjc4fwcpzvk77rz6a2kfy9sr5di3sfgg0acpw21c"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@babel/traverse" "@babel/types")))))))
    (home-page
     "https://babel.dev/docs/en/next/babel-helper-environment-visitor")
    (synopsis
     "Helper visitor to only visit nodes in the current 'this' context")
    (description
     "Helper visitor to only visit nodes in the current 'this' context")
    (license license:expat)))
(define-public node-babel-helper-module-imports-7.22.15
  (package
    (name "node-babel-helper-module-imports")
    (version "7.22.15")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/helper-module-imports/-/helper-module-imports-7.22.15.tgz")
       (sha256
        (base32 "192yyd86m93hma6w0pnw1qpk87vibcily8fxdvcy69n7s8i8krfb"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@babel/core" "@babel/traverse")))))))
    (inputs `(("node-babel-types" ,node-babel-types-7.23.0)))
    (home-page "https://babel.dev/docs/en/next/babel-helper-module-imports")
    (synopsis "Babel helper functions for inserting module loads")
    (description "Babel helper functions for inserting module loads")
    (license license:expat)))
(define-public node-babel-helper-split-export-declaration-7.22.6
  (package
    (name "node-babel-helper-split-export-declaration")
    (version "7.22.6")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/helper-split-export-declaration/-/helper-split-export-declaration-7.22.6.tgz")
       (sha256
        (base32 "03sdrd5by9grp1y65gmv2pal8znmhdfd1i3awd92v6kjcazm4xl5"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (inputs `(("node-babel-types" ,node-babel-types-7.23.0)))
    (home-page
     "https://babel.dev/docs/en/next/babel-helper-split-export-declaration")
    (synopsis "")
    (description "")
    (license license:expat)))
(define-public node-babel-helper-module-transforms-7.23.0
  (package
    (name "node-babel-helper-module-transforms")
    (version "7.23.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/helper-module-transforms/-/helper-module-transforms-7.23.0.tgz")
       (sha256
        (base32 "06hb5kd5d2qhr0p65wf6x0wgn3rpnmk69yzjlimdnpwnvzk7qlcl"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@babel/core" "@babel/traverse")))))))
    (inputs `(("node-babel-helper-validator-identifier" ,node-babel-helper-validator-identifier-7.22.20)
              ("node-babel-helper-split-export-declaration" ,node-babel-helper-split-export-declaration-7.22.6)
              ("node-babel-helper-simple-access" ,node-babel-helper-simple-access-7.22.5)
              ("node-babel-helper-module-imports" ,node-babel-helper-module-imports-7.22.15)
              ("node-babel-helper-environment-visitor" ,node-babel-helper-environment-visitor-7.22.20)
              ;; ("node-babel-core" ,node-babel-core-7.23.0)
	      ))
    (home-page
     "https://babel.dev/docs/en/next/babel-helper-module-transforms")
    (synopsis
     "Babel helper functions for implementing ES6 module transformations")
    (description
     "Babel helper functions for implementing ES6 module transformations")
    (license license:expat)))
(define-public node-babel-helper-plugin-utils-7.22.5
  (package
    (name "node-babel-helper-plugin-utils")
    (version "7.22.5")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/helper-plugin-utils/-/helper-plugin-utils-7.22.5.tgz")
       (sha256
        (base32 "0yhffjdyz2bipj73rpxmaixhg4jpp575vdaxdwj42q200wlym5vx"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (home-page "https://babel.dev/docs/en/next/babel-helper-plugin-utils")
    (synopsis "General utilities for plugins to use")
    (description "General utilities for plugins to use")
    (license license:expat)))
(define-public node-babel-helper-string-parser-7.22.5
  (package
    (name "node-babel-helper-string-parser")
    (version "7.22.5")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/helper-string-parser/-/helper-string-parser-7.22.5.tgz")
       (sha256
        (base32 "18ynmnd6m6nsrbkcvvzl6gf5xid4m8xv17n906iajxjzpazy8fb8"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("charcodes")))))))
    (home-page "https://babel.dev/docs/en/next/babel-helper-string-parser")
    (synopsis "A utility package to parse strings")
    (description "A utility package to parse strings")
    (license license:expat)))
(define-public node-babel-helper-validator-identifier-7.22.20
  (package
    (name "node-babel-helper-validator-identifier")
    (version "7.22.20")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/helper-validator-identifier/-/helper-validator-identifier-7.22.20.tgz")
       (sha256
        (base32 "10bv4f6ar9cfilgyp0hcikzdplb2zga2w8ymkc49ladh21jzb6bx"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@unicode/unicode-15.1.0"
                                             "charcodes")))))))
    (home-page
     "https://www.npmjs.com/package/node-babel-helper-validator-identifier")
    (synopsis "Validate identifier/keywords name")
    (description "Validate identifier/keywords name")
    (license license:expat)))
(define-public node-to-fast-properties-2.0.0
  (package
    (name "node-to-fast-properties")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/to-fast-properties/-/to-fast-properties-2.0.0.tgz")
       (sha256
        (base32 "10q99rgk8nfl8k7q0aqmik4wkbm8zp4z0rpwbm8b0gr4pi4gw4y7"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava")))))))
    (home-page "https://github.com/sindresorhus/to-fast-properties#readme")
    (synopsis "Force V8 to use fast properties for an object")
    (description "Force V8 to use fast properties for an object")
    (license license:expat)))
(define-public node-babel-types-7.23.0
  (package
    (name "node-babel-types")
    (version "7.23.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/@babel/types/-/types-7.23.0.tgz")
       (sha256
        (base32 "1ynr5ypcbxwdvipvyzpm8s7j7b9cbs9bhavyf5wwxss8xmvkqvdm"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@babel/generator"
                                             "@babel/parser" "glob")))))))
    (inputs `(("node-to-fast-properties" ,node-to-fast-properties-2.0.0)
              ("node-babel-helper-validator-identifier" ,node-babel-helper-validator-identifier-7.22.20)
              ("node-babel-helper-string-parser" ,node-babel-helper-string-parser-7.22.5)))
    (home-page "https://babel.dev/docs/en/next/babel-types")
    (synopsis "Babel Types is a Lodash-esque utility library for AST nodes")
    (description
     "Babel Types is a Lodash-esque utility library for AST nodes")
    (license license:expat)))
(define-public node-babel-helper-simple-access-7.22.5
  (package
    (name "node-babel-helper-simple-access")
    (version "7.22.5")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/helper-simple-access/-/helper-simple-access-7.22.5.tgz")
       (sha256
        (base32 "0h19nwpzp1dq148vyv6n0jsdffbm4pr2c9zlwq9x68mbrjip8cf7"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@babel/core" "@babel/traverse")))))))
    (inputs `(("node-babel-types" ,node-babel-types-7.23.0)))
    (home-page "https://babel.dev/docs/en/next/babel-helper-simple-access")
    (synopsis
     "Babel helper for ensuring that access to a given value is performed through simple accesses")
    (description
     "Babel helper for ensuring that access to a given value is performed through simple accesses")
    (license license:expat)))
(define-public node-babel-plugin-transform-modules-commonjs-7.23.0
  (package
    (name "node-babel-plugin-transform-modules-commonjs")
    (version "7.23.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@babel/plugin-transform-modules-commonjs/-/plugin-transform-modules-commonjs-7.23.0.tgz")
       (sha256
        (base32 "08xgrdcpsdqknz183jcpmhpjc7ngsn4nfd101kg3f08fxxz3haxj"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@babel/core"
                                             "@babel/helper-plugin-test-runner"
                                             "@babel/plugin-external-helpers")))))))
    (inputs `(("node-babel-helper-simple-access" ,node-babel-helper-simple-access-7.22.5)
              ("node-babel-helper-plugin-utils" ,node-babel-helper-plugin-utils-7.22.5)
              ("node-babel-helper-module-transforms" ,node-babel-helper-module-transforms-7.23.0)
              ("node-babel-core" ,node-babel-core-7.23.0)))
    (home-page
     "https://babel.dev/docs/en/next/babel-plugin-transform-modules-commonjs")
    (synopsis "This plugin transforms ES2015 modules to CommonJS")
    (description "This plugin transforms ES2015 modules to CommonJS")
    (license license:expat)))
(define-public node-fix-esm-1.0.1
  (package
    (name "node-fix-esm")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/fix-esm/-/fix-esm-1.0.1.tgz")
       (sha256
        (base32 "0d9vpzwg83ii26ml2yqyd988wxjh9f1f1yfwbpqv6xj8cs3nv7nk"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("clear-module" "p-defer")))))))
    (inputs `(("node-babel-plugin-transform-modules-commonjs" ,node-babel-plugin-transform-modules-commonjs-7.23.0)
              ("node-babel-plugin-proposal-export-namespace-from" ,node-babel-plugin-proposal-export-namespace-from-7.18.9)
              ("node-babel-core" ,node-babel-core-7.23.0)))
    (home-page "https://www.npmjs.com/package/node-fix-esm")
    (synopsis
     "Fixes ERR_REQUIRE_ESM errors so that you can require ESM modules from CommonJS")
    (description
     "Fixes ERR_REQUIRE_ESM errors so that you can require ESM modules from CommonJS")
    (license #f)))
(define-public node-koa-multer-3.0.2
  (package
    (name "node-koa-multer")
    (version "3.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/@koa/multer/-/multer-3.0.2.tgz")
       (sha256
        (base32 "1jaw9w38dg7y44lhin1k3w68615vqzrsgd2g2fmqy0lzx7889q74"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@commitlint/cli"
                                             "@commitlint/config-conventional"
                                             "@koa/router"
                                             "concat-stream"
                                             "eslint-config-xo-lass"
                                             "fixpack"
                                             "form-data"
                                             "fs-temp"
                                             "husky"
                                             "koa"
                                             "lint-staged"
                                             "mocha"
                                             "multer"
                                             "nyc"
                                             "on-finished"
                                             "remark-cli"
                                             "remark-preset-github"
                                             "rimraf"
                                             "testdata-w3c-json-form"
                                             "xo")))))))
    (inputs `(("node-fix-esm" ,node-fix-esm-1.0.1)
              ("node-multer" ,node-multer-1.4.4)))
    (home-page "https://github.com/koajs/multer")
    (synopsis
     "Route middleware for Koa that handles `multipart/form-data` using multer")
    (description
     "Route middleware for Koa that handles `multipart/form-data` using multer")
    (license license:expat)))
(define-public node-methods-1.1.2
  (package
    (name "node-methods")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/methods/-/methods-1.1.2.tgz")
       (sha256
        (base32 "0g50ci0gc8r8kq1i06q078gw7azkakp7j3yw5qfi6gq2qk8hdlnz"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("istanbul" "mocha")))))))
    (home-page "https://github.com/jshttp/methods")
    (synopsis "HTTP methods that node supports")
    (description "HTTP methods that node supports")
    (license license:expat)))
(define-public node-path-to-regexp-6.2.1
  (package
    (name "node-path-to-regexp")
    (version "6.2.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/path-to-regexp/-/path-to-regexp-6.2.1.tgz")
       (sha256
        (base32 "0b1pqddwllywnda7fhqyhj7nwc9bv4c5ybk4r2hyy5xz58z3s0iy"))
       (modules '((guix build utils)))
       (snippet
	;; Purge scuffed '--sourceRoot' argument in entities package.json
        '(substitute* "package.json"
	   (("\"prepare\": \".*\",") "")))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@borderless/ts-scripts"
                                             "@size-limit/preset-small-lib"
                                             "@types/jest"
                                             "@types/node"
                                             "@types/semver"
                                             "semver"
                                             "size-limit"
                                             "typescript")))))))
    (home-page "https://github.com/pillarjs/path-to-regexp#readme")
    (synopsis "Express style path to RegExp utility")
    (description "Express style path to RegExp utility")
    (license license:expat)))
(define-public node-koa-router-12.0.0
  (package
    (name "node-koa-router")
    (version "12.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/@koa/router/-/router-12.0.0.tgz")
       (sha256
        (base32 "0cj1hndq7svqbw0f6ypg79lgbkqchn5wygrgprc6nahqcxkhyc7y"))
       (modules '((guix build utils)))
       (snippet
        '(substitute* "package.json"
	   (("\"prepare\": \".*\"") "\"prepare\": \"\"")))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@commitlint/cli"
                                             "@commitlint/config-conventional"
                                             "@ladjs/env"
                                             "ava"
                                             "cross-env"
                                             "eslint"
                                             "eslint-config-xo-lass"
                                             "expect.js"
                                             "fixpack"
                                             "husky"
                                             "jsdoc-to-markdown"
                                             "koa"
                                             "lint-staged"
                                             "mocha"
                                             "nyc"
                                             "remark-cli"
                                             "remark-preset-github"
                                             "should"
                                             "supertest"
                                             "wrk"
                                             "xo")))))))
    (inputs `(("node-path-to-regexp" ,node-path-to-regexp-6.2.1)
              ("node-methods" ,node-methods-1.1.2)
              ("node-koa-compose" ,node-koa-compose-4.2.0)
              ("node-http-errors" ,node-http-errors-2.0.0)))
    (home-page "https://github.com/koajs/router")
    (synopsis
     "Router middleware for koa. Maintained by Forward Email and Lad.")
    (description
     "Router middleware for koa. Maintained by Forward Email and Lad.")
    (license license:expat)))
(define-public node-phc-format-1.0.0
  (package
    (name "node-phc-format")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/@phc/format/-/format-1.0.0.tgz")
       (sha256
        (base32 "1hdw08akx9ld1sgsphjcx0cfh3ybw76pmcnj7znni07pb11pr0k5"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "nyc" "xo")))))))
    (home-page "https://github.com/simonepri/phc-format#readme")
    (synopsis "PHC string format serializer/deserializer")
    (description "PHC string format serializer/deserializer")
    (license license:expat)))
(define-public node-node-addon-api-7.0.0
  (package
    (name "node-node-addon-api")
    (version "7.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/node-addon-api/-/node-addon-api-7.0.0.tgz")
       (sha256
        (base32 "13blyz0jamdqnnqdakgf11dv9wa0x6x88j3jnsa0sgqd7zwz4d85"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("benchmark" "bindings"
                                             "clang-format"
                                             "eslint"
                                             "eslint-config-semistandard"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "fs-extra"
                                             "path"
                                             "pre-commit"
                                             "safe-buffer")))))))
    (home-page "https://github.com/nodejs/node-addon-api")
    (synopsis "Node.js API (Node-API)")
    (description "Node.js API (Node-API)")
    (license license:expat)))
(define-public node-argon2-0.31.0
  (package
    (name "node-argon2")
    (version "0.31.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/argon2/-/argon2-0.31.0.tgz")
       (sha256
        (base32 "153aw99rmq17xfpgqgk75di8avgmw89lkrg1cyjdyzll969x72bi"))
       (modules '((guix build utils)))
       (snippet
        '(substitute* "package.json"
	   (("\"install\": \"node-pre-gyp [a-z -]*\",")
	    "\"install\": \"CC=gcc node-pre-gyp install --build-from-source\",")))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/node" "c8" "mocha"
                                             "node-gyp" "prettier"
                                             "typescript"))))
		  (add-after 'avoid-node-gyp-rebuild 'avoid-node-pre-gyp-rebuild
		    (lambda* (#:key outputs #:allow-other-keys)
		      (let ((out (assoc-ref outputs "out")))
			(substitute* (string-append out "/lib/node_modules/argon2/package.json")
			  ;; 
			  ;; FIXME: should patch Guix's
			  ;;        node-build-system to do this
			  ;;        automatically, alongside regular
			  ;;        'node-gyp' rebuilds
			  ;; 
			  (("\"install\":\".*node-pre-gyp [a-z -]*\"") "\"install\":\"echo Guix: avoiding node-pre-gyp rebuild\"")
			  ;; 
			  ;; HACK: adds compiled argon node into
			  ;;       subsequent installs of argon
			  ;; 
			  ;; NOTE: a better implementation here would
			  ;;       probably package the argon2 node
			  ;;       and remap the "host" key to the
			  ;;       store output containing the
			  ;;       compressed package, such as:
			  ;;
			  ;;       (("\"host\":\"[\\\\/a-Z0-9\\.:-]*\"")
			  ;;        (string-append "\"host\":\"file://" out "\""))
			  ;; 
			  (("\"files\":\\[") "\"files\":[\"lib/binding/napi-v3/argon2.node\","))))))))
    (inputs `(("node-node-addon-api" ,node-node-addon-api-7.0.0)
              ("node-phc-format" ,node-phc-format-1.0.0)
              ("node-mapbox-node-pre-gyp" ,node-mapbox-node-pre-gyp-1.0.11)))
    (native-inputs (list python gcc-toolchain))
    (home-page "https://github.com/ranisalt/node-argon2#readme")
    (synopsis "An Argon2 library for Node")
    (description "An Argon2 library for Node")
    (license license:expat)))
(define-public node-big-integer-1.6.51
  (package
    (name "node-big-integer")
    (version "1.6.51")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/big-integer/-/big-integer-1.6.51.tgz")
       (sha256
        (base32 "1gmxda7xp2labaxbsinvw5n9kjmglg065sp0n8d98mgn938m20l2"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/lodash" "@types/node"
                                             "coveralls"
                                             "jasmine"
                                             "jasmine-core"
                                             "karma"
                                             "karma-cli"
                                             "karma-coverage"
                                             "karma-jasmine"
                                             "karma-phantomjs-launcher"
                                             "lodash"
                                             "typescript"
                                             "uglifyjs")))))))
    (home-page "https://github.com/peterolson/BigInteger.js#readme")
    (synopsis "An arbitrary length integer library for Javascript")
    (description "An arbitrary length integer library for Javascript")
    (license license:unlicense)))
(define-public node-browser-hrtime-1.1.8
  (package
    (name "node-browser-hrtime")
    (version "1.1.8")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/browser-hrtime/-/browser-hrtime-1.1.8.tgz")
       (sha256
        (base32 "183vfp2j1bqbhkyhqa2z8fm52wjr372i5pgqgwn1ip1iin465hcm"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@semantic-release/changelog"
                                             "@semantic-release/git"
                                             "@types/jest"
                                             "@types/node"
                                             "coveralls"
                                             "dotenv-cli"
                                             "http-server"
                                             "jest"
                                             "jest-puppeteer"
                                             "nyc"
                                             "prettier"
                                             "puppeteer"
                                             "puppeteer-to-istanbul"
                                             "rollup"
                                             "rollup-plugin-copy"
                                             "rollup-plugin-sourcemaps"
                                             "rollup-plugin-terser"
                                             "rollup-plugin-typescript2"
                                             "semantic-release"
                                             "terser"
                                             "ts-jest"
                                             "tslint"
                                             "tslint-config-prettier"
                                             "typescript")))))))
    (home-page "https://github.com/cabinjs/browser-hrtime#readme")
    (synopsis "use process.hrtime() in the browser")
    (description "use process.hrtime() in the browser")
    (license license:expat)))
(define-public node-commander-7.2.0
  (package
    (name "node-commander")
    (version "7.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/commander/-/commander-7.2.0.tgz")
       (sha256
        (base32 "1xj8chx8pprr2mm2yrv506msr1m3psh997msf3r0379h65g8kc6b"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/jest" "@types/node"
                                             "@typescript-eslint/eslint-plugin"
                                             "@typescript-eslint/parser"
                                             "eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-jest"
                                             "jest"
                                             "standard"
                                             "ts-jest"
                                             "tsd"
                                             "typescript")))))))
    (home-page "https://github.com/tj/commander.js#readme")
    (synopsis "the complete solution for node.js command-line programs")
    (description "the complete solution for node.js command-line programs")
    (license license:expat)))
(define-public node-type-fest-0.21.3
  (package
    (name "node-type-fest")
    (version "0.21.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/type-fest/-/type-fest-0.21.3.tgz")
       (sha256
        (base32 "1lgxx43v2bklf98x4n0wal6pmkxwjcsbr7jcskg7lhwcpgqxfp0k"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@sindresorhus/tsconfig"
                                             "expect-type" "tsd" "typescript"
                                             "xo")))))))
    (home-page "https://github.com/sindresorhus/type-fest#readme")
    (synopsis "A collection of essential TypeScript types")
    (description "A collection of essential TypeScript types")
    (license #f)))
(define-public node-ansi-escapes-4.3.2
  (package
    (name "node-ansi-escapes")
    (version "4.3.2")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/ansi-escapes/-/ansi-escapes-4.3.2.tgz")
       (sha256
        (base32 "04q7gsp5223nsak4qngcy2ldlzsrpwj9645898fav8lr4zqhla24"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/node" "ava" "tsd" "xo")))))))
    (inputs `(("node-type-fest" ,node-type-fest-0.21.3)))
    (home-page "https://github.com/sindresorhus/ansi-escapes#readme")
    (synopsis "ANSI escape codes for manipulating the terminal")
    (description "ANSI escape codes for manipulating the terminal")
    (license license:expat)))
(define-public node-cli-width-3.0.0
  (package
    (name "node-cli-width")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/cli-width/-/cli-width-3.0.0.tgz")
       (sha256
        (base32 "14lrps16wnzl1zkf45j3gyj6cir14x5i2kjcafr121cf03f58di5"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("coveralls" "nyc"
                                             "standard-version" "tap-spec"
                                             "tape")))))))
    (home-page "https://github.com/knownasilya/cli-width")
    (synopsis
     "Get stdout window width, with two fallbacks, tty and then a default.")
    (description
     "Get stdout window width, with two fallbacks, tty and then a default.")
    (license license:isc)))
(define-public node-chardet-0.7.0
  (package
    (name "node-chardet")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/chardet/-/chardet-0.7.0.tgz")
       (sha256
        (base32 "1rzgqsq7cyzyrm60l7zmqzr7mzpvhm0d6daxdjd0ajngd6vvlfjs"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("github-publish-release" "mocha")))))))
    (home-page "https://github.com/runk/node-chardet")
    (synopsis "Character detector")
    (description "Character detector")
    (license license:expat)))
(define-public node-os-tmpdir-1.0.2
  (package
    (name "node-os-tmpdir")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/os-tmpdir/-/os-tmpdir-1.0.2.tgz")
       (sha256
        (base32 "12ddjb45wq0swr2159wiaxl2balnli8127if7sc89h3psz125rqk"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "xo")))))))
    (home-page "https://github.com/sindresorhus/os-tmpdir#readme")
    (synopsis "Node.js os.tmpdir() ponyfill")
    (description "Node.js os.tmpdir() ponyfill")
    (license license:expat)))
(define-public node-tmp-0.0.33
  (package
    (name "node-tmp")
    (version "0.0.33")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/tmp/-/tmp-0.0.33.tgz")
       (sha256
        (base32 "1ifn24mp4ds8yx9i79739gsdsj5ml6vzx8v3w5vg0m74dig22fyj"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("vows")))))))
    (inputs `(("node-os-tmpdir" ,node-os-tmpdir-1.0.2)))
    (home-page "http://github.com/raszi/node-tmp")
    (synopsis "Temporary file and directory creator")
    (description "Temporary file and directory creator")
    (license license:expat)))
(define-public node-external-editor-3.1.0
  (package
    (name "node-external-editor")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/external-editor/-/external-editor-3.1.0.tgz")
       (sha256
        (base32 "144s4byzz1d51y2c860fw3bfsx5bwi48hsxzcss8bpyf1bqq0vy6"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/chai" "@types/chardet"
                                             "@types/mocha"
                                             "@types/node"
                                             "@types/tmp"
                                             "chai"
                                             "es6-shim"
                                             "mocha"
                                             "ts-node"
                                             "tslint"
                                             "typescript")))))))
    (inputs `(("node-tmp" ,node-tmp-0.0.33)
              ("node-iconv-lite" ,node-iconv-lite-0.4.24)
              ("node-chardet" ,node-chardet-0.7.0)))
    (home-page "https://github.com/mrkmg/node-external-editor#readme")
    (synopsis
     "Edit a string with the users preferred text editor using $VISUAL or $ENVIRONMENT")
    (description
     "Edit a string with the users preferred text editor using $VISUAL or $ENVIRONMENT")
    (license license:expat)))
(define-public node-escape-string-regexp-1.0.5
  (package
    (name "node-escape-string-regexp")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz")
       (sha256
        (base32 "0iy3jirnnslnfwk8wa5xkg56fnbmg7bsv5v2a1s0qgbnfqp7j375"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "xo")))))))
    (home-page "https://github.com/sindresorhus/escape-string-regexp")
    (synopsis "Escape RegExp special characters")
    (description "Escape RegExp special characters")
    (license license:expat)))
(define-public node-figures-3.2.0
  (package
    (name "node-figures")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/figures/-/figures-3.2.0.tgz")
       (sha256
        (base32 "1pzcy96zv5nbl9k2gclqy8nb0msq0amazsmnkjsrr41liqw6skvd"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "markdown-table" "tsd"
                                             "xo")))))))
    (inputs `(("node-escape-string-regexp" ,node-escape-string-regexp-1.0.5)))
    (home-page "https://github.com/sindresorhus/figures#readme")
    (synopsis "Unicode symbols with Windows CMD fallbacks")
    (description "Unicode symbols with Windows CMD fallbacks")
    (license license:expat)))
(define-public node-mute-stream-0.0.8
  (package
    (name "node-mute-stream")
    (version "0.0.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/mute-stream/-/mute-stream-0.0.8.tgz")
       (sha256
        (base32 "05kcx7pqrkbg6ypfispwxgd66ik4abh17bw5rcfhwzz32fcwhm9y"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tap")))))))
    (home-page "https://github.com/isaacs/mute-stream#readme")
    (synopsis "Bytes go in, but they don't come out (when muted).")
    (description "Bytes go in, but they don't come out (when muted).")
    (license license:isc)))
(define-public node-base64-js-1.5.1
  (package
    (name "node-base64-js")
    (version "1.5.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/base64-js/-/base64-js-1.5.1.tgz")
       (sha256
        (base32 "118a46skxnrgx5bdd68ny9xxjcvyb7b1clj2hf82d196nm2skdxi"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("babel-minify" "benchmark"
                                             "browserify" "standard" "tape")))))))
    (home-page "https://github.com/beatgammit/base64-js")
    (synopsis "Base64 encoding/decoding in pure JS")
    (description "Base64 encoding/decoding in pure JS")
    (license license:expat)))
(define-public node-buffer-5.7.1
  (package
    (name "node-buffer")
    (version "5.7.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/buffer/-/buffer-5.7.1.tgz")
       (sha256
        (base32 "1g60az00dzb1grcszyg12gyrl9jr9bwvrk2y9xjdwym3nxasrgwq"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("airtap" "benchmark"
                                             "browserify"
                                             "concat-stream"
                                             "hyperquest"
                                             "is-buffer"
                                             "is-nan"
                                             "split"
                                             "standard"
                                             "tape"
                                             "through2"
                                             "uglify-js")))))))
    (inputs `(("node-ieee754" ,node-ieee754)
              ("node-base64-js" ,node-base64-js-1.5.1)))
    (home-page "https://github.com/feross/buffer")
    (synopsis "Node.js Buffer API, for the browser")
    (description "Node.js Buffer API, for the browser")
    (license license:expat)))
(define-public node-bl-4.1.0
  (package
    (name "node-bl")
    (version "4.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/bl/-/bl-4.1.0.tgz")
       (sha256
        (base32 "1jx7lm4mr80nzdw0k873llpl1x6i1n0m422v1scwla8qml4vkpl3"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("faucet" "standard" "tape")))))))
    (inputs `(("node-readable-stream" ,node-readable-stream-3.6.2)
              ("node-inherits" ,node-inherits)
              ("node-buffer" ,node-buffer-5.7.1)))
    (home-page "https://github.com/rvagg/bl")
    (synopsis
     "Buffer List: collect buffers and access with a standard readable Buffer interface, streamable too!")
    (description
     "Buffer List: collect buffers and access with a standard readable Buffer interface, streamable too!")
    (license license:expat)))
(define-public node-mimic-fn-2.1.0
  (package
    (name "node-mimic-fn")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/mimic-fn/-/mimic-fn-2.1.0.tgz")
       (sha256
        (base32 "1gv60if81lf2gkwvgixgsx8p87ddhsf1aswkihmfzi462hk5qw7a"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "tsd" "xo")))))))
    (home-page "https://github.com/sindresorhus/mimic-fn#readme")
    (synopsis "Make a function mimic another one")
    (description "Make a function mimic another one")
    (license license:expat)))
(define-public node-onetime-5.1.2
  (package
    (name "node-onetime")
    (version "5.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/onetime/-/onetime-5.1.2.tgz")
       (sha256
        (base32 "1kda4mbpk8csafchkakglpfyhsnmdkcl6gv1qi9v5dqwh3mb4ngh"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "tsd" "xo")))))))
    (inputs `(("node-mimic-fn" ,node-mimic-fn-2.1.0)))
    (home-page "https://github.com/sindresorhus/onetime#readme")
    (synopsis "Ensure a function is only called once")
    (description "Ensure a function is only called once")
    (license license:expat)))
(define-public node-restore-cursor-3.1.0
  (package
    (name "node-restore-cursor")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/restore-cursor/-/restore-cursor-3.1.0.tgz")
       (sha256
        (base32 "0agcwdj60w84fji19wc2a6fj9b9apsf56yx3awlb0k0zndmp2j09"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tsd" "xo")))))))
    (inputs `(("node-signal-exit" ,node-signal-exit-3.0.7)
              ("node-onetime" ,node-onetime-5.1.2)))
    (home-page "https://github.com/sindresorhus/restore-cursor#readme")
    (synopsis "Gracefully restore the CLI cursor on exit")
    (description "Gracefully restore the CLI cursor on exit")
    (license license:expat)))
(define-public node-cli-cursor-3.1.0
  (package
    (name "node-cli-cursor")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/cli-cursor/-/cli-cursor-3.1.0.tgz")
       (sha256
        (base32 "0k4qgv5xd9m6rh4aj20gzgdzf1zb647ddxpky3db911vqm6hxkxm"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/node" "ava" "tsd" "xo")))))))
    (inputs `(("node-restore-cursor" ,node-restore-cursor-3.1.0)))
    (home-page "https://github.com/sindresorhus/cli-cursor#readme")
    (synopsis "Toggle the CLI cursor")
    (description "Toggle the CLI cursor")
    (license license:expat)))
(define-public node-cli-spinners-2.9.1
  (package
    (name "node-cli-spinners")
    (version "2.9.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/cli-spinners/-/cli-spinners-2.9.1.tgz")
       (sha256
        (base32 "0vwm5g4rgziv9f5qap31lmfg476gl89hwkvh4rw2qpf96ly5cqqq"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/node" "ava" "log-update"
                                             "string-length" "tsd" "xo")))))))
    (home-page "https://github.com/sindresorhus/cli-spinners#readme")
    (synopsis "Spinners for use in the terminal")
    (description "Spinners for use in the terminal")
    (license license:expat)))
(define-public node-is-interactive-1.0.0
  (package
    (name "node-is-interactive")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/is-interactive/-/is-interactive-1.0.0.tgz")
       (sha256
        (base32 "194g35nginih951q6i1wvfk3wpff3kdrxn5hpzrjwjjmv1wqk11c"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/node" "ava" "tsd" "xo")))))))
    (home-page "https://github.com/sindresorhus/is-interactive#readme")
    (synopsis "Check if stdout or stderr is interactive")
    (description "Check if stdout or stderr is interactive")
    (license license:expat)))
(define-public node-has-flag-4.0.0
  (package
    (name "node-has-flag")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/has-flag/-/has-flag-4.0.0.tgz")
       (sha256
        (base32 "1cdmvliwz8h02nwg0ipli0ydd1l82sz9s1m7bj5bn9yr24afp9vp"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "tsd" "xo")))))))
    (home-page "https://github.com/sindresorhus/has-flag#readme")
    (synopsis "Check if argv has a specific flag")
    (description "Check if argv has a specific flag")
    (license license:expat)))
(define-public node-supports-color-7.2.0
  (package
    (name "node-supports-color")
    (version "7.2.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/supports-color/-/supports-color-7.2.0.tgz")
       (sha256
        (base32 "0jjyglzdzscmhgidn43zc218q5jf9h03hmaaq9h4wqil2vywlspi"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "import-fresh" "xo")))))))
    (inputs `(("node-has-flag" ,node-has-flag-4.0.0)))
    (home-page "https://github.com/chalk/supports-color#readme")
    (synopsis "Detect whether a terminal supports color")
    (description "Detect whether a terminal supports color")
    (license license:expat)))
(define-public node-chalk-4.1.2
  (package
    (name "node-chalk")
    (version "4.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/chalk/-/chalk-4.1.2.tgz")
       (sha256
        (base32 "02prgl8d52k2vgxnssx06ha2sjm2vp6v6s6kqgkar1ryllx68k78"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "coveralls"
                                             "execa"
                                             "import-fresh"
                                             "matcha"
                                             "nyc"
                                             "resolve-from"
                                             "tsd"
                                             "xo")))))))
    (inputs `(("node-supports-color" ,node-supports-color-7.2.0)
              ("node-ansi-styles" ,node-ansi-styles-4.3.0)))
    (home-page "https://github.com/chalk/chalk#readme")
    (synopsis "Terminal string styling done right")
    (description "Terminal string styling done right")
    (license license:expat)))
(define-public node-is-unicode-supported-0.1.0
  (package
    (name "node-is-unicode-supported")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/is-unicode-supported/-/is-unicode-supported-0.1.0.tgz")
       (sha256
        (base32 "1gnakv580clcgcmh0nqrwqy53sdnrv4vglgixd2w8bic4bzgw5bw"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "tsd" "xo")))))))
    (home-page "https://github.com/sindresorhus/is-unicode-supported#readme")
    (synopsis "Detect whether the terminal supports Unicode")
    (description "Detect whether the terminal supports Unicode")
    (license license:expat)))
(define-public node-log-symbols-4.1.0
  (package
    (name "node-log-symbols")
    (version "4.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/log-symbols/-/log-symbols-4.1.0.tgz")
       (sha256
        (base32 "08qkf3cqwbi8azqxk2mz2mkfpndw71kklyk4x70a8aqvq6m0drrj"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "strip-ansi" "tsd" "xo")))))))
    (inputs `(("node-is-unicode-supported" ,node-is-unicode-supported-0.1.0)
              ("node-chalk" ,node-chalk-4.1.2)))
    (home-page "https://github.com/sindresorhus/log-symbols#readme")
    (synopsis
     "Colored symbols for various log levels. Example: `âï¸ Success`")
    (description
     "Colored symbols for various log levels. Example: `âï¸ Success`")
    (license license:expat)))
(define-public node-clone-1.0.4
  (package
    (name "node-clone")
    (version "1.0.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/clone/-/clone-1.0.4.tgz")
       (sha256
        (base32 "08w0b18a2bjh19fm2jwxyl7irxk8g4m0bm3ah99x7ph04iaxb4rk"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("nodeunit")))))))
    (home-page "https://github.com/pvorb/node-clone#readme")
    (synopsis "deep cloning of objects and arrays")
    (description "deep cloning of objects and arrays")
    (license license:expat)))
(define-public node-defaults-1.0.4
  (package
    (name "node-defaults")
    (version "1.0.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/defaults/-/defaults-1.0.4.tgz")
       (sha256
        (base32 "07l9fhw54y31467ijn780byl3ck72x32wmk2q2pvk6rpv28f1px6"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tap")))))))
    (inputs `(("node-clone" ,node-clone-1.0.4)))
    (home-page "https://github.com/sindresorhus/node-defaults#readme")
    (synopsis "merge single level defaults over a config object")
    (description "merge single level defaults over a config object")
    (license license:expat)))
(define-public node-wcwidth-1.0.1
  (package
    (name "node-wcwidth")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/wcwidth/-/wcwidth-1.0.1.tgz")
       (sha256
        (base32 "1a53pbnxfmhnlvzzgq8p8yqh0gzlsibj7263gx8s86q63v1wna4z"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tape")))))))
    (inputs `(("node-defaults" ,node-defaults-1.0.4)))
    (home-page "https://github.com/timoxley/wcwidth#readme")
    (synopsis "Port of C's wcwidth() and wcswidth()")
    (description "Port of C's wcwidth() and wcswidth()")
    (license license:expat)))
(define-public node-ora-5.4.1
  (package
    (name "node-ora")
    (version "5.4.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/ora/-/ora-5.4.1.tgz")
       (sha256
        (base32 "1657w05svjq62vlf0dvkhmbrh4hsbyash7504im8fi3apjhckv41"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/node" "ava" "get-stream"
                                             "tsd" "xo")))))))
    (inputs `(("node-wcwidth" ,node-wcwidth-1.0.1)
              ("node-strip-ansi" ,node-strip-ansi-6.0.1)
              ("node-log-symbols" ,node-log-symbols-4.1.0)
              ("node-is-unicode-supported" ,node-is-unicode-supported-0.1.0)
              ("node-is-interactive" ,node-is-interactive-1.0.0)
              ("node-cli-spinners" ,node-cli-spinners-2.9.1)
              ("node-cli-cursor" ,node-cli-cursor-3.1.0)
              ("node-chalk" ,node-chalk-4.1.2)
              ("node-bl" ,node-bl-4.1.0)))
    (home-page "https://github.com/sindresorhus/ora#readme")
    (synopsis "Elegant terminal spinner")
    (description "Elegant terminal spinner")
    (license license:expat)))
(define-public node-run-async-2.4.1
  (package
    (name "node-run-async")
    (version "2.4.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/run-async/-/run-async-2.4.1.tgz")
       (sha256
        (base32 "0kwddnvq40f38jzgvz9cxs0jk730nx3gfcdb3xvm7ma05sf3mp0f"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("mocha")))))))
    (home-page "https://github.com/SBoudrias/run-async#readme")
    (synopsis
     "Utility method to run function either synchronously or asynchronously using the common `this.async()` style.")
    (description
     "Utility method to run function either synchronously or asynchronously using the common `this.async()` style.")
    (license license:expat)))
(define-public node-through-2.3.8
  (package
    (name "node-through")
    (version "2.3.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/through/-/through-2.3.8.tgz")
       (sha256
        (base32 "0gjpaj9lwd6s356z2lljj2yj0pxwvdr8sckb6lkmfgmi1y67mchn"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("stream-spec" "tape" "from")))))))
    (home-page "https://github.com/dominictarr/through")
    (synopsis "simplified stream construction")
    (description "simplified stream construction")
    (license license:expat)))
(define-public node-color-name-1.1.4
  (package
    (name "node-color-name")
    (version "1.1.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/color-name/-/color-name-1.1.4.tgz")
       (sha256
        (base32 "020p7x7k8rlph38lhsqpqvkx0b70lzlmk6mgal9r9sz8c527qysh"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (home-page "https://github.com/colorjs/color-name")
    (synopsis "A list of color names and its values")
    (description "A list of color names and its values")
    (license license:expat)))
(define-public node-color-convert-2.0.1
  (package
    (name "node-color-convert")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/color-convert/-/color-convert-2.0.1.tgz")
       (sha256
        (base32 "1qbw9rwfzcp7y0cpa8gmwlj7ccycf9pwn15zvf2s06f070ss83wj"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("chalk" "xo")))))))
    (inputs `(("node-color-name" ,node-color-name-1.1.4)))
    (home-page "https://github.com/Qix-/color-convert#readme")
    (synopsis "Plain color conversion functions")
    (description "Plain color conversion functions")
    (license license:expat)))
(define-public node-ansi-styles-4.3.0
  (package
    (name "node-ansi-styles")
    (version "4.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.3.0.tgz")
       (sha256
        (base32 "0zwqsx67hr7m4a8dpd0jzkp2rjm5v7938x4rhcqh7djsv139llrc"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/color-convert" "ava"
                                             "svg-term-cli" "tsd" "xo")))))))
    (inputs `(("node-color-convert" ,node-color-convert-2.0.1)))
    (home-page "https://github.com/chalk/ansi-styles#readme")
    (synopsis "ANSI escape codes for styling strings in the terminal")
    (description "ANSI escape codes for styling strings in the terminal")
    (license license:expat)))
(define-public node-wrap-ansi-6.2.0
  (package
    (name "node-wrap-ansi")
    (version "6.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/wrap-ansi/-/wrap-ansi-6.2.0.tgz")
       (sha256
        (base32 "1y3qsslrq9zlxgpmr0p1g5wnq39csj39dg2pll03g1sdy09c8vyl"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "chalk" "coveralls"
                                             "has-ansi" "nyc" "xo")))))))
    (inputs `(("node-strip-ansi" ,node-strip-ansi-6.0.1)
              ("node-string-width" ,node-string-width-4.2.3)
              ("node-ansi-styles" ,node-ansi-styles-4.3.0)))
    (home-page "https://github.com/chalk/wrap-ansi#readme")
    (synopsis "Wordwrap a string with ANSI escape codes")
    (description "Wordwrap a string with ANSI escape codes")
    (license license:expat)))
(define-public node-inquirer-8.2.6
  (package
    (name "node-inquirer")
    (version "8.2.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/inquirer/-/inquirer-8.2.6.tgz")
       (sha256
        (base32 "1wna54avj9qxhhy1sa8abf481zc2pvdmwsq1mdqbzyxkir5j3zwh"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("chai" "chai-string"
                                             "chalk-pipe"
                                             "cmdify"
                                             "mocha"
                                             "mockery"
                                             "nyc"
                                             "sinon"
                                             "terminal-link")))))))
    (inputs `(("node-wrap-ansi" ,node-wrap-ansi-6.2.0)
              ("node-through" ,node-through-2.3.8)
              ("node-strip-ansi" ,node-strip-ansi-6.0.1)
              ("node-string-width" ,node-string-width-4.2.3)
              ("node-rxjs" ,node-rxjs-7.8.1)
              ("node-run-async" ,node-run-async-2.4.1)
              ("node-ora" ,node-ora-5.4.1)
              ("node-mute-stream" ,node-mute-stream-0.0.8)
              ("node-lodash" ,node-lodash-4.17.21)
              ("node-figures" ,node-figures-3.2.0)
              ("node-external-editor" ,node-external-editor-3.1.0)
              ("node-cli-width" ,node-cli-width-3.0.0)
              ("node-cli-cursor" ,node-cli-cursor-3.1.0)
              ("node-chalk" ,node-chalk-4.1.2)
              ("node-ansi-escapes" ,node-ansi-escapes-4.3.2)))
    (home-page "https://github.com/SBoudrias/Inquirer.js#readme")
    (synopsis
     "A collection of common interactive command line user interfaces.")
    (description
     "A collection of common interactive command line user interfaces.")
    (license license:expat)))
(define-public node-detect-libc-2.0.2
  (package
    (name "node-detect-libc")
    (version "2.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/detect-libc/-/detect-libc-2.0.2.tgz")
       (sha256
        (base32 "10fzc59na0q4j51rsyc23h76w30zakn9qqiq1j81l0gbqbrkj4s9"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "benchmark" "nyc"
                                             "proxyquire" "semistandard")))))))
    (home-page "https://github.com/lovell/detect-libc#readme")
    (synopsis
     "Node.js module to detect the C standard library (libc) implementation family and version")
    (description
     "Node.js module to detect the C standard library (libc) implementation family and version")
    (license license:asl2.0)))
(define-public node-semver-6.3.1
  (package
    (name "node-semver")
    (version "6.3.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/semver/-/semver-6.3.1.tgz")
       (sha256
        (base32 "0c0jxgjhgpxx7hdbmwghndq2mdpg58295mwv1b8cp6g070m096rw"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@npmcli/template-oss" "tap")))))))
    (home-page "https://github.com/npm/node-semver#readme")
    (synopsis "The semantic version parser used by npm.")
    (description "The semantic version parser used by npm.")
    (license license:isc)))
(define-public node-make-dir-3.1.0
  (package
    (name "node-make-dir")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/make-dir/-/make-dir-3.1.0.tgz")
       (sha256
        (base32 "1p3larbzfz9nny2m83x9isf5sng6gdc0x1vf6kyn24abln5anm7c"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/graceful-fs"
                                             "@types/node"
                                             "ava"
                                             "codecov"
                                             "graceful-fs"
                                             "nyc"
                                             "path-type"
                                             "tempy"
                                             "tsd"
                                             "xo")))))))
    (inputs `(("node-semver" ,node-semver-6.3.1)))
    (home-page "https://github.com/sindresorhus/make-dir#readme")
    (synopsis "Make a directory and its parents if needed - Think `mkdir -p`")
    (description
     "Make a directory and its parents if needed - Think `mkdir -p`")
    (license license:expat)))
(define-public node-node-fetch-2.7.0
  (package
    (name "node-node-fetch")
    (version "2.7.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/node-fetch/-/node-fetch-2.7.0.tgz")
       (sha256
        (base32 "0aw328j90q3r1d35xgxlz604675hc579h3hlmwpn1nq1kdk4h0x7"))
       (modules '((guix build utils)))
       (snippet
        '(substitute* "package.json"
	   (("\"prepare\": \".*\"") "\"prepare\": \"\"")))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@ungap/url-search-params"
                                             "abort-controller"
                                             "abortcontroller-polyfill"
                                             "babel-core"
                                             "babel-plugin-istanbul"
                                             "babel-plugin-transform-async-generator-functions"
                                             "babel-polyfill"
                                             "babel-preset-env"
                                             "babel-register"
                                             "chai"
                                             "chai-as-promised"
                                             "chai-iterator"
                                             "chai-string"
                                             "codecov"
                                             "cross-env"
                                             "form-data"
                                             "is-builtin-module"
                                             "mocha"
                                             "nyc"
                                             "parted"
                                             "promise"
                                             "resumer"
                                             "rollup"
                                             "rollup-plugin-babel"
                                             "string-to-arraybuffer"
                                             "teeny-request"
                                             "encoding")))))))
    (inputs `(("node-whatwg-url" ,node-whatwg-url-5.0.0)
              ("node-encoding" ,node-encoding-0.1.13)))
    (home-page "https://github.com/bitinn/node-fetch")
    (synopsis "A light-weight module that brings window.fetch to node.js")
    (description "A light-weight module that brings window.fetch to node.js")
    (license license:expat)))
(define-public node-abbrev-1.1.1
  (package
    (name "node-abbrev")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/abbrev/-/abbrev-1.1.1.tgz")
       (sha256
        (base32 "0vdsff38rgn0qylyj6x42n13bnxfqxb9ql34bzs4z9grlli9vh8c"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tap")))))))
    (home-page "https://github.com/isaacs/abbrev-js#readme")
    (synopsis "Like ruby's abbrev module, but in js")
    (description "Like ruby's abbrev module, but in js")
    (license license:isc)))
(define-public node-nopt-5.0.0
  (package
    (name "node-nopt")
    (version "5.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/nopt/-/nopt-5.0.0.tgz")
       (sha256
        (base32 "1h4pv5dd3yd8zvf4z61sg9ydqvwimdws1w2dm581kj93j35sxivz"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tap")))))))
    (inputs `(("node-abbrev" ,node-abbrev-1.1.1)))
    (home-page "https://github.com/npm/nopt#readme")
    (synopsis
     "Option parsing for Node, supporting types, shorthands, etc. Used by npm.")
    (description
     "Option parsing for Node, supporting types, shorthands, etc. Used by npm.")
    (license license:isc)))
(define-public node-readable-stream-3.6.2
  (package
    (name "node-readable-stream")
    (version "3.6.2")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/readable-stream/-/readable-stream-3.6.2.tgz")
       (sha256
        (base32 "0pdb0mrh95ks672ikgj8frx9nh078bfyngknj70ak2iibv06dn7d"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@babel/cli" "@babel/core"
                                             "@babel/polyfill"
                                             "@babel/preset-env"
                                             "airtap"
                                             "assert"
                                             "bl"
                                             "deep-strict-equal"
                                             "events.once"
                                             "glob"
                                             "gunzip-maybe"
                                             "hyperquest"
                                             "lolex"
                                             "nyc"
                                             "pump"
                                             "rimraf"
                                             "tap"
                                             "tape"
                                             "tar-fs"
                                             "util-promisify")))))))
    (inputs `(("node-util-deprecate" ,node-util-deprecate)
              ("node-string-decoder" ,node-string-decoder)
              ("node-inherits" ,node-inherits)))
    (home-page "https://github.com/nodejs/readable-stream#readme")
    (synopsis "Streams3, a user-land copy of the stream library from Node.js")
    (description
     "Streams3, a user-land copy of the stream library from Node.js")
    (license license:expat)))
(define-public node-are-we-there-yet-2.0.0
  (package
    (name "node-are-we-there-yet")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/are-we-there-yet/-/are-we-there-yet-2.0.0.tgz")
       (sha256
        (base32 "0dnd6fpia4mm58zlilx5wk2dqssmv157ckqj6vagkdks7jrxxn7m"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@npmcli/eslint-config"
                                             "@npmcli/template-oss" "eslint"
                                             "eslint-plugin-node" "tap")))))))
    (inputs `(("node-readable-stream" ,node-readable-stream-3.6.2)
              ("node-delegates" ,node-delegates-1.0.0)))
    (home-page "https://github.com/npm/are-we-there-yet")
    (synopsis
     "Keep track of the overall completion of many disparate processes")
    (description
     "Keep track of the overall completion of many disparate processes")
    (license license:isc)))
(define-public node-aproba-2.0.0
  (package
    (name "node-aproba")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/aproba/-/aproba-2.0.0.tgz")
       (sha256
        (base32 "1x9b0j6z15bnmhbw8fca0xnafj9ci1y091r0l0ms72rbbqb4zchc"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("standard" "tap")))))))
    (home-page "https://github.com/iarna/aproba")
    (synopsis
     "A ridiculously light-weight argument validator (now browser friendly)")
    (description
     "A ridiculously light-weight argument validator (now browser friendly)")
    (license license:isc)))
(define-public node-color-support-1.1.3
  (package
    (name "node-color-support")
    (version "1.1.3")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/color-support/-/color-support-1.1.3.tgz")
       (sha256
        (base32 "0mdpbqki4iz5fmm4rpviwvw8ra0wjp0ccqf3cyvwh8nxwanlxhv1"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tap")))))))
    (home-page "https://github.com/isaacs/color-support#readme")
    (synopsis
     "A module which will endeavor to guess your terminal's level of color support.")
    (description
     "A module which will endeavor to guess your terminal's level of color support.")
    (license license:isc)))
(define-public node-console-control-strings-1.1.0
  (package
    (name "node-console-control-strings")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/console-control-strings/-/console-control-strings-1.1.0.tgz")
       (sha256
        (base32 "0dl328x4g2dqhf4lbfajf4c7vlb6m7ff8adpk1ngig7s1i49pm7h"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("standard" "tap")))))))
    (home-page "https://github.com/iarna/console-control-strings#readme")
    (synopsis
     "A library of cross-platform tested terminal/console command strings for doing things like color and cursor positioning.  This is a subset of both ansi and vt100.  All control codes included work on both Windows & Unix-like OSes, except where noted.")
    (description
     "A library of cross-platform tested terminal/console command strings for doing things like color and cursor positioning.  This is a subset of both ansi and vt100.  All control codes included work on both Windows & Unix-like OSes, except where noted.")
    (license license:isc)))
(define-public node-has-unicode-2.0.1
  (package
    (name "node-has-unicode")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/has-unicode/-/has-unicode-2.0.1.tgz")
       (sha256
        (base32 "1b7c6mrpncz2x7s6r1v9kcmqw6hix039kbkbzqz0czma56gxsqfh"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("require-inject" "tap")))))))
    (home-page "https://github.com/iarna/has-unicode")
    (synopsis "Try to guess if your terminal supports unicode")
    (description "Try to guess if your terminal supports unicode")
    (license license:isc)))
(define-public node-emoji-regex-8.0.0
  (package
    (name "node-emoji-regex")
    (version "8.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/emoji-regex/-/emoji-regex-8.0.0.tgz")
       (sha256
        (base32 "01xi3ikahnlj77h2gqs3jb7kmnxn1nsb9dmnpvpqw288zgxxkk5m"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@babel/cli" "@babel/core"
                                             "@babel/plugin-proposal-unicode-property-regex"
                                             "@babel/preset-env"
                                             "mocha"
                                             "regexgen"
                                             "unicode-12.0.0")))))))
    (home-page "https://mths.be/emoji-regex")
    (synopsis
     "A regular expression to match all Emoji-only symbols as per the Unicode Standard.")
    (description
     "A regular expression to match all Emoji-only symbols as per the Unicode Standard.")
    (license license:expat)))
(define-public node-is-fullwidth-code-point-3.0.0
  (package
    (name "node-is-fullwidth-code-point")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz")
       (sha256
        (base32 "0jmw03rxmbwbrkx0a8wq05qsjhdrx9jn3vns88dhy1y6bnp5shbg"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "tsd-check" "xo")))))))
    (home-page
     "https://github.com/sindresorhus/is-fullwidth-code-point#readme")
    (synopsis
     "Check if the character represented by a given Unicode code point is fullwidth")
    (description
     "Check if the character represented by a given Unicode code point is fullwidth")
    (license license:expat)))
(define-public node-ansi-regex-5.0.1
  (package
    (name "node-ansi-regex")
    (version "5.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.1.tgz")
       (sha256
        (base32 "1ng0r2k4mcz7b2bfr6g1dschnxm0vifaslsvv2smv06smb6ss3hf"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "tsd" "xo")))))))
    (home-page "https://github.com/chalk/ansi-regex#readme")
    (synopsis "Regular expression for matching ANSI escape codes")
    (description "Regular expression for matching ANSI escape codes")
    (license license:expat)))
(define-public node-strip-ansi-6.0.1
  (package
    (name "node-strip-ansi")
    (version "6.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.1.tgz")
       (sha256
        (base32 "1jh81jj6cn1lli1c7m6xi0ynra9zdghb1g63v1nib7zlpz87bnwv"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "tsd" "xo")))))))
    (inputs `(("node-ansi-regex" ,node-ansi-regex-5.0.1)))
    (home-page "https://github.com/chalk/strip-ansi#readme")
    (synopsis "Strip ANSI escape codes from a string")
    (description "Strip ANSI escape codes from a string")
    (license license:expat)))
(define-public node-string-width-4.2.3
  (package
    (name "node-string-width")
    (version "4.2.3")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/string-width/-/string-width-4.2.3.tgz")
       (sha256
        (base32 "0d19spdisrqxd6311fc7z1yg34ww6rwh1zxdk6pnk03fnaqlzfxd"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "tsd" "xo")))))))
    (inputs `(("node-strip-ansi" ,node-strip-ansi-6.0.1)
              ("node-is-fullwidth-code-point" ,node-is-fullwidth-code-point-3.0.0)
              ("node-emoji-regex" ,node-emoji-regex-8.0.0)))
    (home-page "https://github.com/sindresorhus/string-width#readme")
    (synopsis
     "Get the visual width of a string - the number of columns required to display it")
    (description
     "Get the visual width of a string - the number of columns required to display it")
    (license license:expat)))
(define-public node-wide-align-1.1.5
  (package
    (name "node-wide-align")
    (version "1.1.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/wide-align/-/wide-align-1.1.5.tgz")
       (sha256
        (base32 "0k2zsixfhs4bahdn22bjjbbnxldlaxaxczwzaxv4wflf1f4h2n7c"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tap")))))))
    (inputs `(("node-string-width" ,node-string-width-4.2.3)))
    (home-page "https://github.com/iarna/wide-align#readme")
    (synopsis
     "A wide-character aware text alignment function for use on the console or with fixed width fonts.")
    (description
     "A wide-character aware text alignment function for use on the console or with fixed width fonts.")
    (license license:isc)))
(define-public node-gauge-3.0.2
  (package
    (name "node-gauge")
    (version "3.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/gauge/-/gauge-3.0.2.tgz")
       (sha256
        (base32 "0mx3v0ar34dh0p88dm9xfh19f3jjx40139q58z5ibnb6cnpywxw8"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("readable-stream"
                                             "require-inject" "standard"
                                             "tap" "through2")))))))
    (inputs `(("node-wide-align" ,node-wide-align-1.1.5)
              ("node-strip-ansi" ,node-strip-ansi-6.0.1)
              ("node-string-width" ,node-string-width-4.2.3)
              ("node-signal-exit" ,node-signal-exit-3.0.7)
              ("node-object-assign" ,node-object-assign-4.1.1)
              ("node-has-unicode" ,node-has-unicode-2.0.1)
              ("node-console-control-strings" ,node-console-control-strings-1.1.0)
              ("node-color-support" ,node-color-support-1.1.3)
              ("node-aproba" ,node-aproba-2.0.0)))
    (home-page "https://github.com/npm/gauge")
    (synopsis "A terminal based horizontal guage")
    (description "A terminal based horizontal guage")
    (license license:isc)))
(define-public node-set-blocking-2.0.0
  (package
    (name "node-set-blocking")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/set-blocking/-/set-blocking-2.0.0.tgz")
       (sha256
        (base32 "0gb9mvv8bjfavsxlzq56189qis7z2lrp893px04xl2cyvgkswd6r"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("chai" "coveralls" "mocha" "nyc"
                                             "standard" "standard-version")))))))
    (home-page "https://github.com/yargs/set-blocking#readme")
    (synopsis
     "set blocking stdio and stderr ensuring that terminal output does not truncate")
    (description
     "set blocking stdio and stderr ensuring that terminal output does not truncate")
    (license license:isc)))
(define-public node-npmlog-5.0.1
  (package
    (name "node-npmlog")
    (version "5.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/npmlog/-/npmlog-5.0.1.tgz")
       (sha256
        (base32 "1wk8s79vxn6r2d2c4gj6z81jl7dskl3aghgrjvbwjv1s3lh5glgs"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@npmcli/lint" "tap")))))))
    (inputs `(("node-set-blocking" ,node-set-blocking-2.0.0)
              ("node-gauge" ,node-gauge-3.0.2)
              ("node-console-control-strings" ,node-console-control-strings-1.1.0)
              ("node-are-we-there-yet" ,node-are-we-there-yet-2.0.0)))
    (home-page "https://github.com/npm/npmlog#readme")
    (synopsis "logger for npm")
    (description "logger for npm")
    (license license:isc)))
(define-public node-fs-realpath-1.0.0
  (package
    (name "node-fs-realpath")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz")
       (sha256
        (base32 "174g5vay9jnd7h5q8hfdw6dnmwl1gdpn4a8sz0ysanhj2f3wp04y"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (home-page "https://github.com/isaacs/fs.realpath#readme")
    (synopsis
     "Use node's fs.realpath, but fall back to the JS implementation if the native one fails")
    (description
     "Use node's fs.realpath, but fall back to the JS implementation if the native one fails")
    (license license:isc)))
(define-public node-inflight-1.0.6
  (package
    (name "node-inflight")
    (version "1.0.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz")
       (sha256
        (base32 "16w864087xsh3q7f5gm3754s7bpsb9fq3dhknk9nmbvlk3sxr7ss"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tap")))))))
    (inputs `(("node-wrappy" ,node-wrappy)
              ("node-once" ,node-once)))
    (home-page "https://github.com/isaacs/inflight")
    (synopsis
     "Add callbacks to requests in flight to avoid async duplication")
    (description
     "Add callbacks to requests in flight to avoid async duplication")
    (license license:isc)))
(define-public node-balanced-match-1.0.2
  (package
    (name "node-balanced-match")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.2.tgz")
       (sha256
        (base32 "1hdwrr7qqb37plj7962xbwjx1jvjz7ahl7iqrwh82yhcvnmzfm6q"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("matcha" "tape")))))))
    (home-page "https://github.com/juliangruber/balanced-match")
    (synopsis "Match balanced character pairs, like \"{\" and \"}\"")
    (description "Match balanced character pairs, like \"{\" and \"}\"")
    (license license:expat)))
(define-public node-concat-map-0.0.1
  (package
    (name "node-concat-map")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz")
       (sha256
        (base32 "0qa2zqn9rrr2fqdki44s4s2dk2d8307i4556kv25h06g43b2v41m"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tape")))))))
    (home-page "https://github.com/substack/node-concat-map")
    (synopsis "concatenative mapdashery")
    (description "concatenative mapdashery")
    (license license:expat)))
(define-public node-brace-expansion-1.1.11
  (package
    (name "node-brace-expansion")
    (version "1.1.11")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz")
       (sha256
        (base32 "1nlmjvlwlp88knblnayns0brr7a9m2fynrlwq425lrpb4mcn9gc4"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("matcha" "tape")))))))
    (inputs `(("node-concat-map" ,node-concat-map-0.0.1)
              ("node-balanced-match" ,node-balanced-match-1.0.2)))
    (home-page "https://github.com/juliangruber/brace-expansion")
    (synopsis "Brace expansion as known from sh/bash")
    (description "Brace expansion as known from sh/bash")
    (license license:expat)))
(define-public node-minimatch-3.1.2
  (package
    (name "node-minimatch")
    (version "3.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/minimatch/-/minimatch-3.1.2.tgz")
       (sha256
        (base32 "0kd3h6q90kvmzzw1v7cc3dr911gjkb9s547cdvfncfqanq84p5hk"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tap")))))))
    (inputs `(("node-brace-expansion" ,node-brace-expansion-1.1.11)))
    (home-page "https://github.com/isaacs/minimatch#readme")
    (synopsis "a glob matcher in javascript")
    (description "a glob matcher in javascript")
    (license license:isc)))
(define-public node-path-is-absolute-1.0.1
  (package
    (name "node-path-is-absolute")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.tgz")
       (sha256
        (base32 "0p7p04xxd8q495qhxmxydyjgzcf762dp1hp2wha2b52n3agp0vbf"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("xo")))))))
    (home-page "https://github.com/sindresorhus/path-is-absolute#readme")
    (synopsis "Node.js 0.12 path.isAbsolute() ponyfill")
    (description "Node.js 0.12 path.isAbsolute() ponyfill")
    (license license:expat)))
(define-public node-glob-7.2.3
  (package
    (name "node-glob")
    (version "7.2.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/glob/-/glob-7.2.3.tgz")
       (sha256
        (base32 "10a336nxv867xkjs3ipgbharwdzp5lnz7wr8viawn1lc66qqx8zh"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("memfs" "mkdirp" "rimraf" "tap"
                                             "tick")))))))
    (inputs `(("node-path-is-absolute" ,node-path-is-absolute-1.0.1)
              ("node-once" ,node-once)
              ("node-minimatch" ,node-minimatch-3.1.2)
              ("node-inherits" ,node-inherits)
              ("node-inflight" ,node-inflight-1.0.6)
              ("node-fs-realpath" ,node-fs-realpath-1.0.0)))
    (home-page "https://github.com/isaacs/node-glob#readme")
    (synopsis "a little globber")
    (description "a little globber")
    (license license:isc)))
(define-public node-rimraf-3.0.2
  (package
    (name "node-rimraf")
    (version "3.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/rimraf/-/rimraf-3.0.2.tgz")
       (sha256
        (base32 "0lkzjyxjij6ssh5h2l3ncp0zx00ylzhww766dq2vf1s7v07w4xjq"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("mkdirp" "tap")))))))
    (inputs `(("node-glob" ,node-glob-7.2.3)))
    (home-page "https://github.com/isaacs/rimraf#readme")
    (synopsis "A deep deletion module for node (like `rm -rf`)")
    (description "A deep deletion module for node (like `rm -rf`)")
    (license license:isc)))
(define-public node-lru-cache-6.0.0
  (package
    (name "node-lru-cache")
    (version "6.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/lru-cache/-/lru-cache-6.0.0.tgz")
       (sha256
        (base32 "0pnziizgv8jpg708ykywcjby0syjz1l2ll1j727rdxhw0gmhvr2w"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("benchmark" "tap")))))))
    (inputs `(("node-yallist" ,node-yallist-4.0.0)))
    (home-page "https://github.com/isaacs/node-lru-cache#readme")
    (synopsis "A cache object that deletes the least-recently-used items.")
    (description "A cache object that deletes the least-recently-used items.")
    (license license:isc)))
(define-public node-semver-7.5.4
  (package
    (name "node-semver")
    (version "7.5.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/semver/-/semver-7.5.4.tgz")
       (sha256
        (base32 "1h61k8cz9404sydgdyhf76ahm2yqqri87aibi6ss5x4q26f8srqj"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@npmcli/eslint-config"
                                             "@npmcli/template-oss" "tap")))))))
    (inputs `(("node-lru-cache" ,node-lru-cache-6.0.0)))
    (home-page "https://github.com/npm/node-semver#readme")
    (synopsis "The semantic version parser used by npm.")
    (description "The semantic version parser used by npm.")
    (license license:isc)))
(define-public node-chownr-2.0.0
  (package
    (name "node-chownr")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/chownr/-/chownr-2.0.0.tgz")
       (sha256
        (base32 "177wsdfmn1d2f12wy8m875b5y9a74ibfdh33jarlv3a0zrbmvqlv"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("mkdirp" "rimraf" "tap")))))))
    (home-page "https://github.com/isaacs/chownr#readme")
    (synopsis "like `chown -R`")
    (description "like `chown -R`")
    (license license:isc)))
(define-public node-fs-minipass-2.1.0
  (package
    (name "node-fs-minipass")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/fs-minipass/-/fs-minipass-2.1.0.tgz")
       (sha256
        (base32 "029kdjb6h8gp0gfx7rx6yzwbv7pnd7i119gn563ynv0dqx02p5gx"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("mutate-fs" "tap")))))))
    (inputs `(("node-minipass" ,node-minipass-3.3.6)))
    (home-page "https://github.com/npm/fs-minipass#readme")
    (synopsis "fs read and write streams based on minipass")
    (description "fs read and write streams based on minipass")
    (license license:isc)))
(define-public node-minipass-5.0.0
  (package
    (name "node-minipass")
    (version "5.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/minipass/-/minipass-5.0.0.tgz")
       (sha256
        (base32 "0gyp0rswjzj01mqapa714zw9h5m2jbynfcfz01g107wgdhc5hwdy"))
       (modules '((guix build utils)))
       (snippet
        '(substitute* "package.json"
	   (("\"prepare\": \".*\"") "\"prepare\": \"echo Guix: avoiding prepare build\"")))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/node" "end-of-stream"
                                             "node-abort-controller"
                                             "prettier"
                                             "tap"
                                             "through2"
                                             "ts-node"
                                             "typedoc"
                                             "typescript")))))))
    (home-page "https://github.com/isaacs/minipass#readme")
    (synopsis "minimal implementation of a PassThrough stream")
    (description "minimal implementation of a PassThrough stream")
    (license license:isc)))
(define-public node-minipass-3.3.6
  (package
    (name "node-minipass")
    (version "3.3.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/minipass/-/minipass-3.3.6.tgz")
       (sha256
        (base32 "0pcyrxs22fnr6n1910qa7mpvdwfnxjvwnkwf5j04f6d28ds91lks"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/node" "end-of-stream"
                                             "prettier"
                                             "tap"
                                             "through2"
                                             "ts-node"
                                             "typescript")))))))
    (inputs `(("node-yallist" ,node-yallist-4.0.0)))
    (home-page "https://github.com/isaacs/minipass#readme")
    (synopsis "minimal implementation of a PassThrough stream")
    (description "minimal implementation of a PassThrough stream")
    (license license:isc)))
(define-public node-minizlib-2.1.2
  (package
    (name "node-minizlib")
    (version "2.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/minizlib/-/minizlib-2.1.2.tgz")
       (sha256
        (base32 "1vffn3i5ys3w74s8m8n4l7vvzijddi44flpaxdfv96q85n513va4"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tap")))))))
    (inputs `(("node-yallist" ,node-yallist-4.0.0)
              ("node-minipass" ,node-minipass-3.3.6)))
    (home-page "https://github.com/isaacs/minizlib#readme")
    (synopsis
     "A small fast zlib stream built on [minipass](http://npm.im/minipass) and Node.js's zlib binding.")
    (description
     "A small fast zlib stream built on [minipass](http://npm.im/minipass) and Node.js's zlib binding.")
    (license license:expat)))
(define-public node-mkdirp-1.0.4
  (package
    (name "node-mkdirp")
    (version "1.0.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/mkdirp/-/mkdirp-1.0.4.tgz")
       (sha256
        (base32 "06nqac14zbpar89jc7s574l1qpmamr1kzy0dr3qyhvxg8570f5qx"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("require-inject" "tap")))))))
    (home-page "https://github.com/isaacs/node-mkdirp#readme")
    (synopsis "Recursively mkdir, like `mkdir -p`")
    (description "Recursively mkdir, like `mkdir -p`")
    (license license:expat)))
(define-public node-yallist-4.0.0
  (package
    (name "node-yallist")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz")
       (sha256
        (base32 "0jadz9mh1lzfk19bvqqlrg40ggfk2yyfyrpgj5c62dk54ym7h358"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tap")))))))
    (home-page "https://github.com/isaacs/yallist#readme")
    (synopsis "Yet Another Linked List")
    (description "Yet Another Linked List")
    (license license:isc)))
(define-public node-tar-6.2.0
  (package
    (name "node-tar")
    (version "6.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/tar/-/tar-6.2.0.tgz")
       (sha256
        (base32 "0wkd9cq0c94pvlxz5lqkqrsw2sihlfzfkghqs34dv2ac9nwcscwl"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@npmcli/eslint-config"
                                             "@npmcli/template-oss"
                                             "chmodr"
                                             "end-of-stream"
                                             "events-to-array"
                                             "mutate-fs"
                                             "nock"
                                             "rimraf"
                                             "tap")))))))
    (inputs `(("node-yallist" ,node-yallist-4.0.0)
              ("node-mkdirp" ,node-mkdirp-1.0.4)
              ("node-minizlib" ,node-minizlib-2.1.2)
              ("node-minipass" ,node-minipass-5.0.0)
              ("node-fs-minipass" ,node-fs-minipass-2.1.0)
              ("node-chownr" ,node-chownr-2.0.0)))
    (home-page "https://github.com/isaacs/node-tar#readme")
    (synopsis "tar for node")
    (description "tar for node")
    (license license:isc)))
(define-public node-mapbox-node-pre-gyp-1.0.11
  (package
    (name "node-mapbox-node-pre-gyp")
    (version "1.0.11")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/@mapbox/node-pre-gyp/-/node-pre-gyp-1.0.11.tgz")
       (sha256
        (base32 "093c07nqm3s3s4yk8nb6663h07chpaahamr3s3kvpw2zhmz4pbl6"))
       (modules '((guix build utils)))
       ;; Hack to disable broken 'node-tar' library import
       ;; NOTE: will fail if decompression is required 
       (snippet
	'(substitute* "lib/install.js"
	   (("require\\('tar'\\)") "null")))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@mapbox/cloudfriend"
                                             "@mapbox/eslint-config-mapbox"
                                             "aws-sdk"
                                             "codecov"
                                             "eslint"
                                             "eslint-plugin-node"
                                             "mock-aws-s3"
                                             "nock"
                                             "node-addon-api"
                                             "nyc"
                                             "tape"
                                             "tar-fs")))))))
    (inputs `(("node-tar" ,node-tar-6.2.0)
              ("node-semver" ,node-semver-7.5.4)
              ("node-rimraf" ,node-rimraf-3.0.2)
              ("node-npmlog" ,node-npmlog-5.0.1)
              ("node-nopt" ,node-nopt-5.0.0)
              ("node-node-fetch" ,node-node-fetch-2.7.0)
              ("node-make-dir" ,node-make-dir-3.1.0)
              ("node-https-proxy-agent" ,node-https-proxy-agent-5.0.1)
              ("node-detect-libc" ,node-detect-libc-2.0.2)))
    (home-page "https://github.com/mapbox/node-pre-gyp#readme")
    (synopsis "Node.js native addon binary install tool")
    (description "Node.js native addon binary install tool")
    (license license:bsd-3)))
(define-public node-nan-2.18.0
  (package
    (name "node-nan")
    (version "2.18.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/nan/-/nan-2.18.0.tgz")
       (sha256
        (base32 "08d0manhzys5fb5kphm306xbbnb157yxmwdjrcdjicjhd0cilg7k"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("bindings" "commander"
                                             "glob"
                                             "request"
                                             "node-gyp"
                                             "readable-stream"
                                             "tap"
                                             "xtend")))))))
    (home-page "https://github.com/nodejs/nan#readme")
    (synopsis
     "Native Abstractions for Node.js: C++ header for Node 0.8 -> 20 compatibility")
    (description
     "Native Abstractions for Node.js: C++ header for Node 0.8 -> 20 compatibility")
    (license license:expat)))
(define-public node-mimic-response-2.1.0
  (package
    (name "node-mimic-response")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/mimic-response/-/mimic-response-2.1.0.tgz")
       (sha256
        (base32 "09scpfzi3b31b2imhd4g15q4asqzr1ph8la3q7cfb0cpdl7fsasy"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@sindresorhus/tsconfig"
                                             "@types/node"
                                             "ava"
                                             "create-test-server"
                                             "pify"
                                             "tsd"
                                             "xo")))))))
    (home-page "https://github.com/sindresorhus/mimic-response#readme")
    (synopsis "Mimic a Node.js HTTP response stream")
    (description "Mimic a Node.js HTTP response stream")
    (license license:expat)))
(define-public node-decompress-response-4.2.1
  (package
    (name "node-decompress-response")
    (version "4.2.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/decompress-response/-/decompress-response-4.2.1.tgz")
       (sha256
        (base32 "06wbc842v8cx5y7m45ql91kr49hiv07yiil6db37qx9p6m4kxixp"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/node" "ava" "get-stream"
                                             "pify" "tsd" "xo")))))))
    (inputs `(("node-mimic-response" ,node-mimic-response-2.1.0)))
    (home-page "https://github.com/sindresorhus/decompress-response#readme")
    (synopsis "Decompress a HTTP response if needed")
    (description "Decompress a HTTP response if needed")
    (license license:expat)))
(define-public node-simple-concat-1.0.1
  (package
    (name "node-simple-concat")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/simple-concat/-/simple-concat-1.0.1.tgz")
       (sha256
        (base32 "0gknha4csvbwagam34g0qx67nzlfg9wm22nki8ak77xbkiscpz3a"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("standard" "tape")))))))
    (home-page "https://github.com/feross/simple-concat")
    (synopsis
     "Super-minimalist version of `concat-stream`. Less than 15 lines!")
    (description
     "Super-minimalist version of `concat-stream`. Less than 15 lines!")
    (license license:expat)))
(define-public node-simple-get-3.1.1
  (package
    (name "node-simple-get")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/simple-get/-/simple-get-3.1.1.tgz")
       (sha256
        (base32 "03i9xnrd673yn1l14prcj0w6rmvixnaznlz9h99k8z5racfpxkqa"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("self-signed-https" "standard"
                                             "string-to-stream" "tape")))))))
    (inputs `(("node-simple-concat" ,node-simple-concat-1.0.1)
              ("node-once" ,node-once)
              ("node-decompress-response" ,node-decompress-response-4.2.1)))
    (home-page "https://github.com/feross/simple-get")
    (synopsis
     "Simplest way to make http get requests. Supports HTTPS, redirects, gzip/deflate, streams in < 100 lines.")
    (description
     "Simplest way to make http get requests. Supports HTTPS, redirects, gzip/deflate, streams in < 100 lines.")
    (license license:expat)))
(define-public node-canvas-2.11.2
  (package
    (name "node-canvas")
    (version "2.11.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/canvas/-/canvas-2.11.2.tgz")
       (sha256
        (base32 "088gfjfy7i9miri7jv3jvzr86dw43sffzjiimyy593aciaj5c45f"))
       (modules '((guix build utils)))
       (snippet
        '(substitute* "package.json"
	   (("\"install\": \".*\",") "\"install\": \"echo Guix: avoiding node-gyp rebuild\",")))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/node" "assert-rejects"
                                             "dtslint"
                                             "express"
                                             "js-yaml"
                                             "mocha"
                                             "pixelmatch"
                                             "standard"
                                             "typescript")))))))
    (inputs `(("node-simple-get" ,node-simple-get-3.1.1)
              ("node-nan" ,node-nan-2.18.0)
              ("node-mapbox-node-pre-gyp" ,node-mapbox-node-pre-gyp-1.0.11)))
    (home-page "https://github.com/Automattic/node-canvas")
    (synopsis "Canvas graphics API backed by Cairo")
    (description "Canvas graphics API backed by Cairo")
    (license license:expat)))
(define-public node-cssstyle-3.0.0
  (package
    (name "node-cssstyle")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/cssstyle/-/cssstyle-3.0.0.tgz")
       (sha256
        (base32 "0lcn1nsbdf96lvl08wn2pyl8zwq1hfv868sm6yw27amfcr1kffag"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("babel-generator"
                                             "babel-traverse"
                                             "babel-types"
                                             "babylon"
                                             "eslint"
                                             "eslint-config-prettier"
                                             "eslint-plugin-prettier"
                                             "jest"
                                             "minipass-fetch"
                                             "npm-run-all"
                                             "prettier"
                                             "resolve")))))))
    (inputs `(("node-rrweb-cssom" ,node-rrweb-cssom-0.6.0)))
    (home-page "https://github.com/jsdom/cssstyle")
    (synopsis "CSSStyleDeclaration Object Model implementation")
    (description "CSSStyleDeclaration Object Model implementation")
    (license license:expat)))
(define-public node-abab-2.0.6
  (package
    (name "node-abab")
    (version "2.0.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/abab/-/abab-2.0.6.tgz")
       (sha256
        (base32 "16fshnwgbidyr2agsc61bqlip448fmhpfp9w5952xwahfmmqjal9"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("eslint" "karma"
                                             "karma-cli"
                                             "karma-firefox-launcher"
                                             "karma-mocha"
                                             "karma-webpack"
                                             "mocha"
                                             "webpack")))))))
    (home-page "https://github.com/jsdom/abab#readme")
    (synopsis
     "WHATWG spec-compliant implementations of window.atob and window.btoa.")
    (description
     "WHATWG spec-compliant implementations of window.atob and window.btoa.")
    (license license:bsd-3)))
(define-public node-data-urls-4.0.0
  (package
    (name "node-data-urls")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/data-urls/-/data-urls-4.0.0.tgz")
       (sha256
        (base32 "1cx2qrsppr7yl9mmrkj4kim8vz18fprx1jk1506gl6n5qqwqqchd"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@domenic/eslint-config"
                                             "eslint" "jest" "minipass-fetch")))))))
    (inputs `(("node-whatwg-url" ,node-whatwg-url-12.0.1)
              ("node-whatwg-mimetype" ,node-whatwg-mimetype-3.0.0)
              ("node-abab" ,node-abab-2.0.6)))
    (home-page "https://github.com/jsdom/data-urls#readme")
    (synopsis "Parses data: URLs")
    (description "Parses data: URLs")
    (license license:expat)))
(define-public node-decimal-js-10.4.3
  (package
    (name "node-decimal-js")
    (version "10.4.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/decimal.js/-/decimal.js-10.4.3.tgz")
       (sha256
        (base32 "04zil8gkb4h6yxx5g2gdjr3gb8icy9hh93fbx4s7jqgvps9gxb71"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (home-page "https://github.com/MikeMcl/decimal.js#readme")
    (synopsis "An arbitrary-precision Decimal type for JavaScript.")
    (description "An arbitrary-precision Decimal type for JavaScript.")
    (license license:expat)))
(define-public node-domexception-4.0.0
  (package
    (name "node-domexception")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/domexception/-/domexception-4.0.0.tgz")
       (sha256
        (base32 "0hv6i0y144pjzbbigkjjgljfwd4zdn9ywqbn30q5kkslbzs897rs"))
       (modules '((guix build utils)))
       (snippet
        '(substitute* "package.json"
	   (("\"prepare\": \".*\"") "\"prepare\": \"\"")))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@domenic/eslint-config"
                                             "eslint" "minipass-fetch"
                                             "mocha" "webidl2js")))))))
    (inputs `(("node-webidl-conversions" ,node-webidl-conversions-7.0.0)))
    (home-page "https://github.com/jsdom/domexception#readme")
    (synopsis "An implementation of the DOMException class from browsers")
    (description "An implementation of the DOMException class from browsers")
    (license license:expat)))
(define-public node-asynckit-0.4.0
  (package
    (name "node-asynckit")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/asynckit/-/asynckit-0.4.0.tgz")
       (sha256
        (base32 "1kvxnmjbjwqc8gvp4ms7d8w8x7y41rcizmz4898694h7ywq4y9cc"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("browserify"
                                             "browserify-istanbul"
                                             "coveralls"
                                             "eslint"
                                             "istanbul"
                                             "obake"
                                             "phantomjs-prebuilt"
                                             "pre-commit"
                                             "reamde"
                                             "rimraf"
                                             "size-table"
                                             "tap-spec"
                                             "tape")))))))
    (home-page "https://github.com/alexindigo/asynckit#readme")
    (synopsis "Minimal async jobs utility library, with streams support")
    (description "Minimal async jobs utility library, with streams support")
    (license license:expat)))
(define-public node-delayed-stream-1.0.0
  (package
    (name "node-delayed-stream")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/delayed-stream/-/delayed-stream-1.0.0.tgz")
       (sha256
        (base32 "1lr98585rayrc5xfj599hg6mxqvks38diir74ivivyvx47jgqf5c"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("fake" "far")))))))
    (home-page "https://github.com/felixge/node-delayed-stream")
    (synopsis
     "Buffers events from a stream until you are ready to handle them.")
    (description
     "Buffers events from a stream until you are ready to handle them.")
    (license license:expat)))
(define-public node-combined-stream-1.0.8
  (package
    (name "node-combined-stream")
    (version "1.0.8")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/combined-stream/-/combined-stream-1.0.8.tgz")
       (sha256
        (base32 "04hm5rrkwda2qgy1afwhrz42asmflw5hxkbpxddn741ywnmmmgmn"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("far")))))))
    (inputs `(("node-delayed-stream" ,node-delayed-stream-1.0.0)))
    (home-page "https://github.com/felixge/node-combined-stream")
    (synopsis "A stream that emits multiple other streams one after another.")
    (description
     "A stream that emits multiple other streams one after another.")
    (license license:expat)))
(define-public node-form-data-4.0.0
  (package
    (name "node-form-data")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/form-data/-/form-data-4.0.0.tgz")
       (sha256
        (base32 "06nqasmm3cjads5j0iq6l0qbjbz7xkda2qns6zbmikgbahdwflf9"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/node" "browserify"
                                             "browserify-istanbul"
                                             "coveralls"
                                             "cross-spawn"
                                             "eslint"
                                             "fake"
                                             "far"
                                             "formidable"
                                             "in-publish"
                                             "is-node-modern"
                                             "istanbul"
                                             "obake"
                                             "puppeteer"
                                             "pkgfiles"
                                             "pre-commit"
                                             "request"
                                             "rimraf"
                                             "tape"
                                             "typescript")))))))
    (inputs `(("node-mime-types" ,node-mime-types-2.1.35)
              ("node-combined-stream" ,node-combined-stream-1.0.8)
              ("node-asynckit" ,node-asynckit-0.4.0)))
    (home-page "https://github.com/form-data/form-data#readme")
    (synopsis
     "A library to create readable \"multipart/form-data\" streams. Can be used to submit forms and file uploads to other web applications.")
    (description
     "A library to create readable \"multipart/form-data\" streams. Can be used to submit forms and file uploads to other web applications.")
    (license license:expat)))
(define-public node-html-encoding-sniffer-3.0.0
  (package
    (name "node-html-encoding-sniffer")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/html-encoding-sniffer/-/html-encoding-sniffer-3.0.0.tgz")
       (sha256
        (base32 "155ygfx1mcbrx02a3m28yyvdxymh4wv047dkrbbr53ih563nsl84"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@domenic/eslint-config"
                                             "eslint" "mocha")))))))
    (inputs `(("node-whatwg-encoding" ,node-whatwg-encoding-2.0.0)))
    (home-page "https://github.com/jsdom/html-encoding-sniffer#readme")
    (synopsis "Sniff the encoding from a HTML byte stream")
    (description "Sniff the encoding from a HTML byte stream")
    (license license:expat)))
(define-public node-tootallnate-once-2.0.0
  (package
    (name "node-tootallnate-once")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/@tootallnate/once/-/once-2.0.0.tgz")
       (sha256
        (base32 "1gvvzrf4fqd8vvy9w2l5h2jam41xgxj8hcvdc90rqm603zijdlfg"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/jest" "@types/node"
                                             "abort-controller"
                                             "jest"
                                             "rimraf"
                                             "ts-jest"
                                             "typescript")))))))
    (home-page "https://github.com/TooTallNate/once#readme")
    (synopsis "Creates a Promise that waits for a single event")
    (description "Creates a Promise that waits for a single event")
    (license license:expat)))
(define-public node-http-proxy-agent-5.0.0
  (package
    (name "node-http-proxy-agent")
    (version "5.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/http-proxy-agent/-/http-proxy-agent-5.0.0.tgz")
       (sha256
        (base32 "1nr4qq4v14wq2i25wzywhxpkn9d22n10qdnkxiidppzj8lvffbs9"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/debug" "@types/node"
                                             "@typescript-eslint/eslint-plugin"
                                             "@typescript-eslint/parser"
                                             "eslint"
                                             "eslint-config-airbnb"
                                             "eslint-config-prettier"
                                             "eslint-import-resolver-typescript"
                                             "eslint-plugin-import"
                                             "eslint-plugin-jsx-a11y"
                                             "eslint-plugin-react"
                                             "mocha"
                                             "proxy"
                                             "rimraf"
                                             "typescript")))))))
    (inputs `(("node-debug" ,node-debug-4.3.4)
              ("node-agent-base" ,node-agent-base-6.0.2)
              ("node-tootallnate-once" ,node-tootallnate-once-2.0.0)))
    (home-page "https://github.com/TooTallNate/node-http-proxy-agent#readme")
    (synopsis "An HTTP(s) proxy `http.Agent` implementation for HTTP")
    (description "An HTTP(s) proxy `http.Agent` implementation for HTTP")
    (license license:expat)))
(define-public node-agent-base-6.0.2
  (package
    (name "node-agent-base")
    (version "6.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/agent-base/-/agent-base-6.0.2.tgz")
       (sha256
        (base32 "0cg85gngrap12xzz8ibdjw98hcfhgcidg2w7ll7whsrf59ps0vdw"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/debug" "@types/mocha"
                                             "@types/node"
                                             "@types/semver"
                                             "@types/ws"
                                             "@typescript-eslint/eslint-plugin"
                                             "@typescript-eslint/parser"
                                             "async-listen"
                                             "cpy-cli"
                                             "eslint"
                                             "eslint-config-airbnb"
                                             "eslint-config-prettier"
                                             "eslint-import-resolver-typescript"
                                             "eslint-plugin-import"
                                             "eslint-plugin-jsx-a11y"
                                             "eslint-plugin-react"
                                             "mocha"
                                             "rimraf"
                                             "semver"
                                             "typescript"
                                             "ws")))))))
    (inputs `(("node-debug" ,node-debug-4.3.4)))
    (home-page "https://github.com/TooTallNate/node-agent-base#readme")
    (synopsis "Turn a function into an `http.Agent` instance")
    (description "Turn a function into an `http.Agent` instance")
    (license license:expat)))
(define-public node-https-proxy-agent-5.0.1
  (package
    (name "node-https-proxy-agent")
    (version "5.0.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/https-proxy-agent/-/https-proxy-agent-5.0.1.tgz")
       (sha256
        (base32 "0690f44jaazg21wii9vxzva1lk4kma0gh6yj1g9ybwii8fs6z8bd"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/debug" "@types/node"
                                             "@typescript-eslint/eslint-plugin"
                                             "@typescript-eslint/parser"
                                             "eslint"
                                             "eslint-config-airbnb"
                                             "eslint-config-prettier"
                                             "eslint-import-resolver-typescript"
                                             "eslint-plugin-import"
                                             "eslint-plugin-jsx-a11y"
                                             "eslint-plugin-react"
                                             "mocha"
                                             "proxy"
                                             "rimraf"
                                             "typescript")))))))
    (inputs `(("node-debug" ,node-debug-4.3.4)
              ("node-agent-base" ,node-agent-base-6.0.2)))
    (home-page "https://github.com/TooTallNate/node-https-proxy-agent#readme")
    (synopsis "An HTTP(s) proxy `http.Agent` implementation for HTTPS")
    (description "An HTTP(s) proxy `http.Agent` implementation for HTTPS")
    (license license:expat)))
(define-public node-is-potential-custom-element-name-1.0.1
  (package
    (name "node-is-potential-custom-element-name")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/is-potential-custom-element-name/-/is-potential-custom-element-name-1.0.1.tgz")
       (sha256
        (base32 "08c677pbqjj21h9n6p3m94rmgha0lr3410al6w9sy8k42fxjbr5n"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("mocha" "regenerate")))))))
    (home-page
     "https://github.com/mathiasbynens/is-potential-custom-element-name")
    (synopsis
     "Check whether a given string matches the `PotentialCustomElementName` production as defined in the HTML Standard.")
    (description
     "Check whether a given string matches the `PotentialCustomElementName` production as defined in the HTML Standard.")
    (license license:expat)))
(define-public node-nwsapi-2.2.7
  (package
    (name "node-nwsapi")
    (version "2.2.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/nwsapi/-/nwsapi-2.2.7.tgz")
       (sha256
        (base32 "0v961fy4s2n9zb7qjip453ijslxw2faqpxxqhj31wgvfaprvy7cf"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (home-page "http://javascript.nwbox.com/nwsapi/")
    (synopsis "Fast CSS Selectors API Engine")
    (description "Fast CSS Selectors API Engine")
    (license license:expat)))
(define-public node-entities-4.5.0
  (package
    (name "node-entities")
    (version "4.5.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/entities/-/entities-4.5.0.tgz")
       (sha256
        (base32 "0cm6cgsfcsgk3djx00wiv3vfrrq9kwlvkny83yxna2qs6pvn033b"))
       (modules '((guix build utils)))
       (snippet
	;; Purge scuffed '--sourceRoot' argument in entities package.json
        '(substitute* "package.json"
	   (("\"prepare\": \".*\"") "\"prepare\": \"\"")))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/jest" "@types/node"
                                             "@typescript-eslint/eslint-plugin"
                                             "@typescript-eslint/parser"
                                             "eslint"
                                             "eslint-config-prettier"
                                             "eslint-plugin-node"
                                             "jest"
                                             "prettier"
                                             "ts-jest"
                                             "typedoc"
                                             "typescript")))))))
    ;; (propagated-inputs
    ;;  (list node-typescript-5.2.2))
    (home-page "https://github.com/fb55/entities#readme")
    (synopsis "Encode & decode XML and HTML entities with ease & speed")
    (description "Encode & decode XML and HTML entities with ease & speed")
    (license license:bsd-2)))
(define-public node-parse5-7.1.2
  (package
    (name "node-parse5")
    (version "7.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/parse5/-/parse5-7.1.2.tgz")
       (sha256
        (base32 "1ic521hg8jlhf5x05w4crzzz56q8g4j19fr4ha73wxi5vqjh9gki"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (inputs `(("node-entities" ,node-entities-4.5.0)))
    (home-page "https://github.com/inikulin/parse5")
    (synopsis "HTML parser and serializer.")
    (description "HTML parser and serializer.")
    (license license:expat)))
(define-public node-rrweb-cssom-0.6.0
  (package
    (name "node-rrweb-cssom")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/rrweb-cssom/-/rrweb-cssom-0.6.0.tgz")
       (sha256
        (base32 "0liyw7jmpkcab2896gym941fh4a8j0bjnsixz5xx4m2qciixrglp"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (home-page "https://github.com/rrweb-io/CSSOM#readme")
    (synopsis "CSS Object Model implementation and CSS parser")
    (description "CSS Object Model implementation and CSS parser")
    (license license:expat)))
(define-public node-xmlchars-2.2.0
  (package
    (name "node-xmlchars")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/xmlchars/-/xmlchars-2.2.0.tgz")
       (sha256
        (base32 "1a3daxxjcy0p0qbxcqp6d9z6h1czsab5xabanyavvr33i4lh1ydx"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@commitlint/cli"
                                             "@commitlint/config-angular"
                                             "@types/chai"
                                             "@types/mocha"
                                             "chai"
                                             "conventional-changelog-cli"
                                             "husky"
                                             "mocha"
                                             "ts-node"
                                             "tslint"
                                             "tslint-config-lddubeau"
                                             "typescript")))))))
    (home-page "https://github.com/lddubeau/xmlchars#readme")
    (synopsis
     "Utilities for determining if characters belong to character classes defined by the XML specs.")
    (description
     "Utilities for determining if characters belong to character classes defined by the XML specs.")
    (license license:expat)))
(define-public node-saxes-6.0.0
  (package
    (name "node-saxes")
    (version "6.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/saxes/-/saxes-6.0.0.tgz")
       (sha256
        (base32 "1nwn5r953v568imgl8zz9bkr1ra67zkbilk5qdsx3jqwpvxm5pqw"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@commitlint/cli"
                                             "@commitlint/config-angular"
                                             "@types/chai"
                                             "@types/mocha"
                                             "@types/node"
                                             "@typescript-eslint/eslint-plugin"
                                             "@typescript-eslint/eslint-plugin-tslint"
                                             "@typescript-eslint/parser"
                                             "@xml-conformance-suite/js"
                                             "@xml-conformance-suite/mocha"
                                             "@xml-conformance-suite/test-data"
                                             "chai"
                                             "conventional-changelog-cli"
                                             "eslint"
                                             "eslint-config-lddubeau-base"
                                             "eslint-config-lddubeau-ts"
                                             "eslint-import-resolver-typescript"
                                             "eslint-plugin-import"
                                             "eslint-plugin-jsx-a11y"
                                             "eslint-plugin-prefer-arrow"
                                             "eslint-plugin-react"
                                             "eslint-plugin-simple-import-sort"
                                             "husky"
                                             "mocha"
                                             "renovate-config-lddubeau"
                                             "simple-dist-tag"
                                             "ts-node"
                                             "tsd"
                                             "tslint"
                                             "tslint-microsoft-contrib"
                                             "typedoc"
                                             "typescript")))))))
    (inputs `(("node-xmlchars" ,node-xmlchars-2.2.0)))
    (home-page "https://github.com/lddubeau/saxes#readme")
    (synopsis "An evented streaming XML parser in JavaScript")
    (description "An evented streaming XML parser in JavaScript")
    (license license:isc)))
(define-public node-symbol-tree-3.2.4
  (package
    (name "node-symbol-tree")
    (version "3.2.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/symbol-tree/-/symbol-tree-3.2.4.tgz")
       (sha256
        (base32 "1g2ap5vvjzp141idqnd5vpn3hzy3ihwr8vqivyxdn2yh00570sca"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("babel-eslint" "coveralls"
                                             "eslint"
                                             "eslint-plugin-import"
                                             "istanbul"
                                             "jsdoc-to-markdown"
                                             "tape")))))))
    (home-page "https://github.com/jsdom/js-symbol-tree#symbol-tree")
    (synopsis
     "Turn any collection of objects into its own efficient tree or linked list using Symbol")
    (description
     "Turn any collection of objects into its own efficient tree or linked list using Symbol")
    (license license:expat)))
(define-public node-psl-1.9.0
  (package
    (name "node-psl")
    (version "1.9.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/psl/-/psl-1.9.0.tgz")
       (sha256
        (base32 "1qbng513j3yn8pjkbq4j5mr2ywz5gx4wwd3pzgyk3rwzkp77q0nc"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("browserify"
                                             "browserslist-browserstack"
                                             "browserstack-local"
                                             "chai"
                                             "commit-and-pr"
                                             "eslint"
                                             "JSONStream"
                                             "mocha"
                                             "porch"
                                             "request"
                                             "selenium-webdriver"
                                             "serve-handler"
                                             "uglify-js"
                                             "watchify")))))))
    (home-page "https://github.com/lupomontero/psl#readme")
    (synopsis "Domain name parser based on the Public Suffix List")
    (description "Domain name parser based on the Public Suffix List")
    (license license:expat)))
(define-public node-universalify-0.2.0
  (package
    (name "node-universalify")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/universalify/-/universalify-0.2.0.tgz")
       (sha256
        (base32 "10kff0da3msig21rx2lsvvxhzva950nwiqxpsv5dh6r0rk926k49"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("colortape" "coveralls" "nyc"
                                             "standard" "tape")))))))
    (home-page "https://github.com/RyanZim/universalify#readme")
    (synopsis
     "Make a callback- or promise-based function support both promises and callbacks.")
    (description
     "Make a callback- or promise-based function support both promises and callbacks.")
    (license license:expat)))
(define-public node-querystringify-2.2.0
  (package
    (name "node-querystringify")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/querystringify/-/querystringify-2.2.0.tgz")
       (sha256
        (base32 "1ykb5bf3l3yrqviv9xiibhlzqzy06j81gh3lqpxm3naqihm7mc7v"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("assume" "coveralls" "mocha"
                                             "nyc" "pre-commit")))))))
    (home-page "https://github.com/unshiftio/querystringify")
    (synopsis
     "Querystringify - Small, simple but powerful query string parser.")
    (description
     "Querystringify - Small, simple but powerful query string parser.")
    (license license:expat)))
(define-public node-requires-port-1.0.0
  (package
    (name "node-requires-port")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/requires-port/-/requires-port-1.0.0.tgz")
       (sha256
        (base32 "1qn60lbgy6apjdkcgk2rpda122xz5zx3ml8hlljxjq1042gpcl31"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("assume" "istanbul" "mocha"
                                             "pre-commit")))))))
    (home-page "https://github.com/unshiftio/requires-port")
    (synopsis
     "Check if a protocol requires a certain port number to be added to an URL.")
    (description
     "Check if a protocol requires a certain port number to be added to an URL.")
    (license license:expat)))
(define-public node-url-parse-1.5.10
  (package
    (name "node-url-parse")
    (version "1.5.10")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/url-parse/-/url-parse-1.5.10.tgz")
       (sha256
        (base32 "02h85rfw81qlkp24sg8vxahlif8kv0xf3brm98ddbxv4wxna2jki"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("assume" "browserify"
                                             "c8"
                                             "mocha"
                                             "pre-commit"
                                             "sauce-browsers"
                                             "sauce-test"
                                             "uglify-js")))))))
    (inputs `(("node-requires-port" ,node-requires-port-1.0.0)
              ("node-querystringify" ,node-querystringify-2.2.0)))
    (home-page "https://github.com/unshiftio/url-parse#readme")
    (synopsis
     "Small footprint URL parser that works seamlessly across Node.js and browser environments")
    (description
     "Small footprint URL parser that works seamlessly across Node.js and browser environments")
    (license license:expat)))
(define-public node-tough-cookie-4.1.3
  (package
    (name "node-tough-cookie")
    (version "4.1.3")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/tough-cookie/-/tough-cookie-4.1.3.tgz")
       (sha256
        (base32 "094fpgn60ifr4a8m8bqf7hkpvmzhsjd0nyhmkbrdpdkwqr4gcbcq"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("async" "eslint"
                                             "eslint-config-prettier"
                                             "eslint-plugin-prettier"
                                             "genversion"
                                             "nyc"
                                             "prettier"
                                             "vows")))))))
    (inputs `(("node-url-parse" ,node-url-parse-1.5.10)
              ("node-universalify" ,node-universalify-0.2.0)
              ("node-punycode" ,node-punycode-2.3.0)
              ("node-psl" ,node-psl-1.9.0)))
    (home-page "https://github.com/salesforce/tough-cookie")
    (synopsis "RFC6265 Cookies and Cookie Jar for node.js")
    (description "RFC6265 Cookies and Cookie Jar for node.js")
    (license license:bsd-3)))
(define-public node-w3c-xmlserializer-4.0.0
  (package
    (name "node-w3c-xmlserializer")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/w3c-xmlserializer/-/w3c-xmlserializer-4.0.0.tgz")
       (sha256
        (base32 "1djilxdrsr6r0v59ynq8sxrakrpfznk82fch9v3lb0axya4lwwh0"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@domenic/eslint-config"
                                             "eslint" "jest" "jsdom")))))))
    (inputs `(("node-xml-name-validator" ,node-xml-name-validator-4.0.0)))
    (home-page "https://github.com/jsdom/w3c-xmlserializer#readme")
    (synopsis "A per-spec XML serializer implementation")
    (description "A per-spec XML serializer implementation")
    (license license:expat)))
(define-public node-whatwg-encoding-2.0.0
  (package
    (name "node-whatwg-encoding")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/whatwg-encoding/-/whatwg-encoding-2.0.0.tgz")
       (sha256
        (base32 "119ywz6qic22dh6y12vpdwwjna77mmsgyrlj46kqkk5xp838xjx3"))
       (modules '((guix build utils)))
       (snippet
        '(substitute* "package.json"
	   (("\"prepare\": \".*\"") "\"prepare\": \"\"")))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@domenic/eslint-config"
                                             "eslint" "minipass-fetch"
                                             "mocha")))))))
    (inputs `(("node-iconv-lite" ,node-iconv-lite-0.6.3)))
    (home-page "https://github.com/jsdom/whatwg-encoding#readme")
    (synopsis "Decode strings according to the WHATWG Encoding Standard")
    (description "Decode strings according to the WHATWG Encoding Standard")
    (license license:expat)))
(define-public node-whatwg-mimetype-3.0.0
  (package
    (name "node-whatwg-mimetype")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/whatwg-mimetype/-/whatwg-mimetype-3.0.0.tgz")
       (sha256
        (base32 "1sqpgdzrm8q02xi2i5mk1gr2zyy3znb2jhmyapxhsz090qprr890"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@domenic/eslint-config"
                                             "eslint" "jest" "minipass-fetch"
                                             "printable-string"
                                             "whatwg-encoding")))))))
    (home-page "https://github.com/jsdom/whatwg-mimetype#readme")
    (synopsis
     "Parses, serializes, and manipulates MIME types, according to the WHATWG MIME Sniffing Standard")
    (description
     "Parses, serializes, and manipulates MIME types, according to the WHATWG MIME Sniffing Standard")
    (license license:expat)))
(define-public node-punycode-2.3.0
  (package
    (name "node-punycode")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/punycode/-/punycode-2.3.0.tgz")
       (sha256
        (base32 "0v449nngp3gdvic0x0i2p83mwwsr357mb6c84nrdf3gvhr78insg"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("codecov" "istanbul" "mocha")))))))
    (home-page "https://mths.be/punycode")
    (synopsis
     "A robust Punycode converter that fully complies to RFC 3492 and RFC 5891, and works on nearly all JavaScript platforms.")
    (description
     "A robust Punycode converter that fully complies to RFC 3492 and RFC 5891, and works on nearly all JavaScript platforms.")
    (license license:expat)))
(define-public node-tr46-4.1.1
  (package
    (name "node-tr46")
    (version "4.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/tr46/-/tr46-4.1.1.tgz")
       (sha256
        (base32 "0gmn0jdkr9aw5n1qd962dlj8lc66qjaq50s09zz7kizwd1q1k54v"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@domenic/eslint-config"
                                             "@unicode/unicode-15.0.0"
                                             "eslint" "minipass-fetch"
                                             "mocha" "regenerate")))))))
    (inputs `(("node-punycode" ,node-punycode-2.3.0)))
    (home-page "https://github.com/jsdom/tr46#readme")
    (synopsis
     "An implementation of the Unicode UTS #46: Unicode IDNA Compatibility Processing")
    (description
     "An implementation of the Unicode UTS #46: Unicode IDNA Compatibility Processing")
    (license license:expat)))
(define-public node-webidl-conversions-7.0.0
  (package
    (name "node-webidl-conversions")
    (version "7.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/webidl-conversions/-/webidl-conversions-7.0.0.tgz")
       (sha256
        (base32 "0m743429c5hi2wmaq9mbc4bk02ss46bxkwlcqqn9xn8q21w14kgx"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@domenic/eslint-config"
                                             "eslint" "mocha" "nyc")))))))
    (home-page "https://github.com/jsdom/webidl-conversions#readme")
    (synopsis
     "Implements the WebIDL algorithms for converting to and from JavaScript values")
    (description
     "Implements the WebIDL algorithms for converting to and from JavaScript values")
    (license license:bsd-2)))
(define-public node-whatwg-url-12.0.1
  (package
    (name "node-whatwg-url")
    (version "12.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/whatwg-url/-/whatwg-url-12.0.1.tgz")
       (sha256
        (base32 "1ik40zbg7cd43l05zf2gkd0pivya9ijdsgbnah88pqrvgrpnxpm0"))
       (modules '((guix build utils)))
       (snippet
        '(substitute* "package.json"
	   (("\"prepare\": \".*\"") "\"prepare\": \"\"")))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@domenic/eslint-config"
                                             "benchmark"
                                             "domexception"
                                             "esbuild"
                                             "eslint"
                                             "jest"
                                             "minipass-fetch"
                                             "webidl2js")))))))
    (inputs `(("node-webidl-conversions" ,node-webidl-conversions-7.0.0)
              ("node-tr46" ,node-tr46-4.1.1)))
    (home-page "https://github.com/jsdom/whatwg-url#readme")
    (synopsis
     "An implementation of the WHATWG URL Standard's URL API and parsing machinery")
    (description
     "An implementation of the WHATWG URL Standard's URL API and parsing machinery")
    (license license:expat)))
(define-public node-bufferutil-4.0.7
  (package
    (name "node-bufferutil")
    (version "4.0.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/bufferutil/-/bufferutil-4.0.7.tgz")
       (sha256
        (base32 "1yj39zhjk1hf1dbbaznxpcainhv4n3r687d86f7fc2mfww6hf65n"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("mocha" "node-gyp" "prebuildify")))))))
    (inputs `(("node-node-gyp-build" ,node-node-gyp-build-4.6.1)))
    (home-page "https://github.com/websockets/bufferutil")
    (synopsis "WebSocket buffer utils")
    (description "WebSocket buffer utils")
    (license license:expat)))
(define-public node-node-gyp-build-4.6.1
  (package
    (name "node-node-gyp-build")
    (version "4.6.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/node-gyp-build/-/node-gyp-build-4.6.1.tgz")
       (sha256
        (base32 "1gs0c5jwg88ww40n567l6p3qhydmwsy9rdv8x3ildzi78gaxskdk"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("array-shuffle" "standard"
                                             "tape")))))))
    (home-page "https://github.com/prebuild/node-gyp-build")
    (synopsis
     "Build tool and bindings loader for node-gyp that supports prebuilds")
    (description
     "Build tool and bindings loader for node-gyp that supports prebuilds")
    (license license:expat)))
(define-public node-utf-8-validate-6.0.3
  (package
    (name "node-utf-8-validate")
    (version "6.0.3")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/utf-8-validate/-/utf-8-validate-6.0.3.tgz")
       (sha256
        (base32 "14m4gs53fb420cx4jixcliz3agwnjiivzmzp2l5j08cc6hzgxv32"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("mocha" "node-gyp" "prebuildify"
                                             "prebuildify-cross")))))))
    (inputs `(("node-node-gyp-build" ,node-node-gyp-build-4.6.1)))
    (home-page "https://github.com/websockets/utf-8-validate")
    (synopsis "Check if a buffer contains valid UTF-8")
    (description "Check if a buffer contains valid UTF-8")
    (license license:expat)))
(define-public node-ws-8.14.2
  (package
    (name "node-ws")
    (version "8.14.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/ws/-/ws-8.14.2.tgz")
       (sha256
        (base32 "09f6pyfl5mpb7alsnjcg4dxas8f6h863ch5bkab2n1nn673sq717"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("benchmark" "bufferutil"
                                             "eslint"
                                             "eslint-config-prettier"
                                             "eslint-plugin-prettier"
                                             "mocha"
                                             "nyc"
                                             "prettier"
                                             "utf-8-validate")))))))
    (home-page "https://github.com/websockets/ws")
    (synopsis
     "Simple to use, blazing fast and thoroughly tested websocket client and server for Node.js")
    (description
     "Simple to use, blazing fast and thoroughly tested websocket client and server for Node.js")
    (license license:expat)))
(define-public node-xml-name-validator-4.0.0
  (package
    (name "node-xml-name-validator")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/xml-name-validator/-/xml-name-validator-4.0.0.tgz")
       (sha256
        (base32 "08sxfvwyq28kn0h00mwa9kklybf6h0hzrqzx3m85pviyy666l56n"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@domenic/eslint-config"
                                             "benchmark" "eslint" "mocha")))))))
    (home-page "https://github.com/jsdom/xml-name-validator#readme")
    (synopsis
     "Validates whether a string matches the production for an XML name or qualified name")
    (description
     "Validates whether a string matches the production for an XML name or qualified name")
    (license license:asl2.0)))
(define-public node-jsdom-22.1.0
  (package
    (name "node-jsdom")
    (version "22.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/jsdom/-/jsdom-22.1.0.tgz")
       (sha256
        (base32 "1g44wkd226fdyvgj1adbzhv61dapv3056cihq7sadhd3kqrrdibl"))
       (modules '((guix build utils)))
       (snippet
        '(substitute* "package.json"
	   (("\"prepare\": \".*\"") "\"prepare\": \"\"")))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@domenic/eslint-config"
                                             "benchmark"
                                             "chai"
                                             "eslint"
                                             "eslint-plugin-html"
                                             "eslint-plugin-jsdom-internal"
                                             "js-yaml"
                                             "minimatch"
                                             "mocha"
                                             "mocha-sugar-free"
                                             "pngjs"
                                             "server-destroy"
                                             "webidl2js"
                                             "yargs"
                                             "canvas")))))))
    (inputs `(("node-xml-name-validator" ,node-xml-name-validator-4.0.0)
              ("node-ws" ,node-ws-8.14.2)
              ("node-whatwg-url" ,node-whatwg-url-12.0.1)
              ("node-whatwg-mimetype" ,node-whatwg-mimetype-3.0.0)
              ("node-whatwg-encoding" ,node-whatwg-encoding-2.0.0)
              ("node-webidl-conversions" ,node-webidl-conversions-7.0.0)
              ("node-w3c-xmlserializer" ,node-w3c-xmlserializer-4.0.0)
              ("node-tough-cookie" ,node-tough-cookie-4.1.3)
              ("node-symbol-tree" ,node-symbol-tree-3.2.4)
              ("node-saxes" ,node-saxes-6.0.0)
              ("node-rrweb-cssom" ,node-rrweb-cssom-0.6.0)
              ("node-parse5" ,node-parse5-7.1.2)
              ("node-nwsapi" ,node-nwsapi-2.2.7)
              ("node-is-potential-custom-element-name" ,node-is-potential-custom-element-name-1.0.1)
              ("node-https-proxy-agent" ,node-https-proxy-agent-5.0.1)
              ("node-http-proxy-agent" ,node-http-proxy-agent-5.0.0)
              ("node-html-encoding-sniffer" ,node-html-encoding-sniffer-3.0.0)
              ("node-form-data" ,node-form-data-4.0.0)
              ("node-domexception" ,node-domexception-4.0.0)
              ("node-decimal-js" ,node-decimal-js-10.4.3)
              ("node-data-urls" ,node-data-urls-4.0.0)
              ("node-cssstyle" ,node-cssstyle-3.0.0)
              ("node-abab" ,node-abab-2.0.6)
              ("node-canvas" ,node-canvas-2.11.2)))
    (home-page "https://github.com/jsdom/jsdom#readme")
    (synopsis "A JavaScript implementation of many web standards")
    (description "A JavaScript implementation of many web standards")
    (license license:expat)))
(define-public node-immediate-3.0.6
  (package
    (name "node-immediate")
    (version "3.0.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/immediate/-/immediate-3.0.6.tgz")
       (sha256
        (base32 "04cxfcl4zm2qfsrrd19n5w4w8k8309wl1k2xq0c0ic2hjvrr5iwq"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("browserify"
                                             "browserify-transform-cli"
                                             "derequire"
                                             "inline-process-browser"
                                             "jshint"
                                             "tape"
                                             "uglify-js"
                                             "unreachable-branch-transform")))))))
    (home-page "https://www.npmjs.com/package/node-immediate")
    (synopsis "A cross browser microtask library")
    (description "A cross browser microtask library")
    (license license:expat)))
(define-public node-lie-3.3.0
  (package
    (name "node-lie")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/lie/-/lie-3.3.0.tgz")
       (sha256
        (base32 "0vm3wrzfrjmv2qjcf6fch7znad6k6kd5b34cb31jy3m1shf4df1d"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("browserify"
                                             "browserify-transform-cli"
                                             "bundle-collapser"
                                             "copyfiles"
                                             "derequire"
                                             "es3ify"
                                             "inline-process-browser"
                                             "istanbul"
                                             "jshint"
                                             "mkdirp"
                                             "mocha"
                                             "mocha-phantomjs"
                                             "phantomjs"
                                             "promises-aplus-tests"
                                             "rimraf"
                                             "typescript"
                                             "uglify-js"
                                             "unreachable-branch-transform")))))))
    (inputs `(("node-immediate" ,node-immediate-3.0.6)))
    (home-page "https://github.com/calvinmetcalf/lie#readme")
    (synopsis "A basic but performant promise implementation")
    (description "A basic but performant promise implementation")
    (license license:expat)))
(define-public node-pako-1.0.11
  (package
    (name "node-pako")
    (version "1.0.11")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/pako/-/pako-1.0.11.tgz")
       (sha256
        (base32 "0h9rmpkzyav4qxpb185z89nrhi17gy8p5mxz1k1l19sj0gf2hh0d"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ansi" "benchmark"
                                             "browserify"
                                             "buffer-from"
                                             "eslint"
                                             "istanbul"
                                             "mocha"
                                             "multiparty"
                                             "ndoc"
                                             "uglify-js"
                                             "zlibjs")))))))
    (home-page "https://github.com/nodeca/pako")
    (synopsis
     "zlib port to javascript - fast, modularized, with browser support")
    (description
     "zlib port to javascript - fast, modularized, with browser support")
    (license #f)))
(define-public node-setimmediate-1.0.5
  (package
    (name "node-setimmediate")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/setimmediate/-/setimmediate-1.0.5.tgz")
       (sha256
        (base32 "17icj9sgsg9fcyclds1a8mlgmspza3fa6sidq11fsr43d4igrfaw"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("jshint" "mocha" "http-server"
                                             "opener" "zuul")))))))
    (home-page "https://github.com/yuzujs/setImmediate#readme")
    (synopsis "A shim for the setImmediate efficient script yielding API")
    (description "A shim for the setImmediate efficient script yielding API")
    (license license:expat)))
(define-public node-jszip-3.10.1
  (package
    (name "node-jszip")
    (version "3.10.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/jszip/-/jszip-3.10.1.tgz")
       (sha256
        (base32 "08qvnasvaajkjkjr2lp7jz63b0fmb9brr0ivpw3v7bj5lsig85si"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("benchmark" "browserify"
                                             "eslint"
                                             "grunt"
                                             "grunt-browserify"
                                             "grunt-cli"
                                             "grunt-contrib-uglify"
                                             "http-server"
                                             "jszip-utils"
                                             "package-json-versionify"
                                             "playwright"
                                             "qunit"
                                             "tmp"
                                             "typescript")))))))
    (inputs `(("node-setimmediate" ,node-setimmediate-1.0.5)
              ("node-readable-stream" ,node-readable-stream-2.3.8)
              ("node-pako" ,node-pako-1.0.11)
              ("node-lie" ,node-lie-3.3.0)))
    (home-page "https://github.com/Stuk/jszip#readme")
    (synopsis
     "Create, read and edit .zip files with JavaScript http://stuartk.com/jszip")
    (description
     "Create, read and edit .zip files with JavaScript http://stuartk.com/jszip")
    (license #f)))
(define-public node-negotiator-0.6.3
  (package
    (name "node-negotiator")
    (version "0.6.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/negotiator/-/negotiator-0.6.3.tgz")
       (sha256
        (base32 "04sjfqwmsamf29a67zwrjdi3h62avc3y6a9y6a74zsgpl1xnhbli"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("eslint"
                                             "eslint-plugin-markdown" "mocha"
                                             "nyc")))))))
    (home-page "https://github.com/jshttp/negotiator#readme")
    (synopsis "HTTP content negotiation")
    (description "HTTP content negotiation")
    (license license:expat)))
(define-public node-accepts-1.3.8
  (package
    (name "node-accepts")
    (version "1.3.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/accepts/-/accepts-1.3.8.tgz")
       (sha256
        (base32 "0xbds0r4v51s5lprkr6snag2xr5ssbavh9hmqygj4y427z59l65z"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("deep-equal" "eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-markdown"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "mocha"
                                             "nyc")))))))
    (inputs `(("node-negotiator" ,node-negotiator-0.6.3)
              ("node-mime-types" ,node-mime-types-2.1.35)))
    (home-page "https://github.com/jshttp/accepts#readme")
    (synopsis "Higher-level content negotiation")
    (description "Higher-level content negotiation")
    (license license:expat)))
(define-public node-ylru-1.3.2
  (package
    (name "node-ylru")
    (version "1.3.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/ylru/-/ylru-1.3.2.tgz")
       (sha256
        (base32 "0ci6i7wffffafwf5nrliznvcnb33am5ps7haws0vipcy33qpyaij"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/node"
                                             "beautify-benchmark"
                                             "benchmark"
                                             "egg-bin"
                                             "egg-ci"
                                             "eslint"
                                             "eslint-config-egg"
                                             "git-contributor"
                                             "hashlru"
                                             "ko-sleep"
                                             "lru-cache"
                                             "runscript"
                                             "typescript")))))))
    (home-page "https://github.com/node-modules/ylru")
    (synopsis "Extends LRU base on hashlru")
    (description "Extends LRU base on hashlru")
    (license license:expat)))
(define-public node-cache-content-type-1.0.1
  (package
    (name "node-cache-content-type")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/cache-content-type/-/cache-content-type-1.0.1.tgz")
       (sha256
        (base32 "0fm77a80pchkaik7ik5rzdbvc49jdrz30jm6ilc1a6rq97pmjv14"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("egg-bin" "egg-ci" "eslint"
                                             "eslint-config-egg" "mm")))))))
    (inputs `(("node-ylru" ,node-ylru-1.3.2)
              ("node-mime-types" ,node-mime-types-2.1.35)))
    (home-page "https://github.com/node-modules/cache-content-type#readme")
    (synopsis
     "Create a full Content-Type header given a MIME type or extension and catch the result")
    (description
     "Create a full Content-Type header given a MIME type or extension and catch the result")
    (license license:expat)))
(define-public node-content-disposition-0.5.4
  (package
    (name "node-content-disposition")
    (version "0.5.4")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/content-disposition/-/content-disposition-0.5.4.tgz")
       (sha256
        (base32 "0ljl6r5vqhyscjb723f8ddlzrzg66zlh9q01xahjrhlanskwi574"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("deep-equal" "eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-markdown"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "istanbul"
                                             "mocha")))))))
    (inputs `(("node-safe-buffer" ,node-safe-buffer)))
    (home-page "https://github.com/jshttp/content-disposition#readme")
    (synopsis "Create and parse Content-Disposition header")
    (description "Create and parse Content-Disposition header")
    (license license:expat)))
(define-public node-content-type-1.0.5
  (package
    (name "node-content-type")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/content-type/-/content-type-1.0.5.tgz")
       (sha256
        (base32 "1j0jpnlxjrdpbnq7s1h1xga2n8562j5g6612f7fl40jz82cd0cdc"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("deep-equal" "eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "mocha"
                                             "nyc")))))))
    (home-page "https://github.com/jshttp/content-type#readme")
    (synopsis "Create and parse HTTP Content-Type header")
    (description "Create and parse HTTP Content-Type header")
    (license license:expat)))
(define-public node-tsscmp-1.0.6
  (package
    (name "node-tsscmp")
    (version "1.0.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/tsscmp/-/tsscmp-1.0.6.tgz")
       (sha256
        (base32 "1pprs4amcvy4whygfd1pllkscx2rdmavf9b1zqqv6h015zqg9fha"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (home-page "https://github.com/suryagh/tsscmp#readme")
    (synopsis "Timing safe string compare using double HMAC")
    (description "Timing safe string compare using double HMAC")
    (license license:expat)))
(define-public node-keygrip-1.1.0
  (package
    (name "node-keygrip")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/keygrip/-/keygrip-1.1.0.tgz")
       (sha256
        (base32 "081zzfrygsjmkbfllik14p1f08rjmcns0anida3vli0jvklml30n"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("mocha" "nyc")))))))
    (inputs `(("node-tsscmp" ,node-tsscmp-1.0.6)))
    (home-page "https://github.com/crypto-utils/keygrip#readme")
    (synopsis "Key signing and verification for rotated credentials")
    (description "Key signing and verification for rotated credentials")
    (license license:expat)))
(define-public node-cookies-0.8.0
  (package
    (name "node-cookies")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/cookies/-/cookies-0.8.0.tgz")
       (sha256
        (base32 "1rm6qycpngywacl5rci8rhngcndp3wyl22rww26wkxrg573r26ar"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("eslint" "express" "mocha" "nyc"
                                             "restify" "supertest")))))))
    (inputs `(("node-keygrip" ,node-keygrip-1.1.0)
              ("node-depd" ,node-depd-2.0.0)))
    (home-page "https://github.com/pillarjs/cookies#readme")
    (synopsis "Cookies, optionally signed using Keygrip.")
    (description "Cookies, optionally signed using Keygrip.")
    (license license:expat)))
(define-public node-ms-2.1.2
  (package
    (name "node-ms")
    (version "2.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/ms/-/ms-2.1.2.tgz")
       (sha256
        (base32 "0j7vrqxzg2fxip3q0cws360wk3cz2nprr8zkragipziz1piscmqi"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("eslint" "expect.js" "husky"
                                             "lint-staged" "mocha")))))))
    (home-page "https://github.com/zeit/ms#readme")
    (synopsis "Tiny millisecond conversion utility")
    (description "Tiny millisecond conversion utility")
    (license license:expat)))
(define-public node-debug-4.3.4
  (package
    (name "node-debug")
    (version "4.3.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/debug/-/debug-4.3.4.tgz")
       (sha256
        (base32 "1kwbyb5m63bz8a2bvhy4gsnsma6ks5wa4w5qya6qb9ip5sdjr4h4"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("brfs" "browserify"
                                             "coveralls"
                                             "istanbul"
                                             "karma"
                                             "karma-browserify"
                                             "karma-chrome-launcher"
                                             "karma-mocha"
                                             "mocha"
                                             "mocha-lcov-reporter"
                                             "xo")))))))
    (inputs `(("node-ms" ,node-ms-2.1.2)))
    (home-page "https://github.com/debug-js/debug#readme")
    (synopsis "Lightweight debugging utility for Node.js and the browser")
    (description "Lightweight debugging utility for Node.js and the browser")
    (license license:expat)))
(define-public node-delegates-1.0.0
  (package
    (name "node-delegates")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/delegates/-/delegates-1.0.0.tgz")
       (sha256
        (base32 "0qb4rw56fbxcpc2iwj1x0qxzakwwqigxgggggd6ajl7d27sdpvxz"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("mocha" "should")))))))
    (home-page "https://github.com/visionmedia/node-delegates#readme")
    (synopsis "delegate methods and accessors to another property")
    (description "delegate methods and accessors to another property")
    (license license:expat)))
(define-public node-destroy-1.2.0
  (package
    (name "node-destroy")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/destroy/-/destroy-1.2.0.tgz")
       (sha256
        (base32 "1a6gf6hn9zc4g6v3dqdcsc3v1n22qbv1s5xmdakljjgmdkl2gzcd"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "mocha"
                                             "nyc")))))))
    (home-page "https://github.com/stream-utils/destroy#readme")
    (synopsis "destroy a stream if possible")
    (description "destroy a stream if possible")
    (license license:expat)))
(define-public node-encodeurl-1.0.2
  (package
    (name "node-encodeurl")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/encodeurl/-/encodeurl-1.0.2.tgz")
       (sha256
        (base32 "13afvicx42ha4k29571sg0i4b76xjggyxvmmmibm258ipf6mjinb"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "istanbul"
                                             "mocha")))))))
    (home-page "https://github.com/pillarjs/encodeurl#readme")
    (synopsis
     "Encode a URL to a percent-encoded form, excluding already-encoded sequences")
    (description
     "Encode a URL to a percent-encoded form, excluding already-encoded sequences")
    (license license:expat)))
(define-public node-escape-html-1.0.3
  (package
    (name "node-escape-html")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/escape-html/-/escape-html-1.0.3.tgz")
       (sha256
        (base32 "0rh35dvab1wbp87dy1m6rynbcb9rbs5kry7jk17ixyxx7if1a0d1"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("benchmark" "beautify-benchmark")))))))
    (home-page "https://github.com/component/escape-html")
    (synopsis "Escape string for use in HTML")
    (description "Escape string for use in HTML")
    (license license:expat)))
(define-public node-fresh-0.5.2
  (package
    (name "node-fresh")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/fresh/-/fresh-0.5.2.tgz")
       (sha256
        (base32 "0k44badcxkwy202kz404w078l660f65jaijg473xv38ay3wpdri5"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("beautify-benchmark" "benchmark"
                                             "eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-markdown"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "istanbul"
                                             "mocha")))))))
    (home-page "https://github.com/jshttp/fresh#readme")
    (synopsis "HTTP response freshness testing")
    (description "HTTP response freshness testing")
    (license license:expat)))
(define-public node-deep-equal-1.0.1
  (package
    (name "node-deep-equal")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/deep-equal/-/deep-equal-1.0.1.tgz")
       (sha256
        (base32 "1l2y1275m8gxv51a37bjx9dz54k0l1qhyhc535z80fhpr35jd4k7"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tape")))))))
    (home-page "https://github.com/substack/node-deep-equal#readme")
    (synopsis "node's assert.deepEqual algorithm")
    (description "node's assert.deepEqual algorithm")
    (license license:expat)))
(define-public node-http-assert-1.5.0
  (package
    (name "node-http-assert")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/http-assert/-/http-assert-1.5.0.tgz")
       (sha256
        (base32 "0qqwy2abv5n2yiclswxsg0cprr7lv3c7v4np95ks74r1igwv3zca"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-markdown"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "istanbul"
                                             "mocha")))))))
    (inputs `(("node-http-errors" ,node-http-errors-1.8.1)
              ("node-deep-equal" ,node-deep-equal-1.0.1)))
    (home-page "https://github.com/jshttp/http-assert#readme")
    (synopsis "assert with status codes")
    (description "assert with status codes")
    (license license:expat)))
(define-public node-depd-1.1.2
  (package
    (name "node-depd")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/depd/-/depd-1.1.2.tgz")
       (sha256
        (base32 "07645ghplj1qy8z6g3vz1855xjy2j217q90bib3m44c2npk6pql3"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("benchmark" "beautify-benchmark"
                                             "eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-markdown"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "istanbul"
                                             "mocha")))))))
    (home-page "https://github.com/dougwilson/nodejs-depd#readme")
    (synopsis "Deprecate all the things")
    (description "Deprecate all the things")
    (license license:expat)))
(define-public node-http-errors-1.8.1
  (package
    (name "node-http-errors")
    (version "1.8.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/http-errors/-/http-errors-1.8.1.tgz")
       (sha256
        (base32 "14kydkrxnvpc267g3d1vjzsxbzq6lcrc8dh1crdvykcx59iwi12n"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-markdown"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "mocha"
                                             "nyc")))))))
    (inputs `(("node-toidentifier" ,node-toidentifier-1.0.1)
              ("node-statuses" ,node-statuses-1.5.0)
              ("node-setprototypeof" ,node-setprototypeof-1.2.0)
              ("node-inherits" ,node-inherits)
              ("node-depd" ,node-depd-1.1.2)))
    (home-page "https://github.com/jshttp/http-errors#readme")
    (synopsis "Create HTTP error objects")
    (description "Create HTTP error objects")
    (license license:expat)))
(define-public node-has-tostringtag-1.0.0
  (package
    (name "node-has-tostringtag")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/has-tostringtag/-/has-tostringtag-1.0.0.tgz")
       (sha256
        (base32 "04sjfp579qsbdb6lq9xpm6iz5k0ngg13abqs15zdh9sy26cn9hfr"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@ljharb/eslint-config" "aud"
                                             "auto-changelog"
                                             "core-js"
                                             "eslint"
                                             "get-own-property-symbols"
                                             "nyc"
                                             "safe-publish-latest"
                                             "tape")))))))
    (inputs `(("node-has-symbols" ,node-has-symbols-1.0.3)))
    (home-page "https://github.com/inspect-js/has-tostringtag#readme")
    (synopsis
     "Determine if the JS environment has `Symbol.toStringTag` support. Supports spec, or shams.")
    (description
     "Determine if the JS environment has `Symbol.toStringTag` support. Supports spec, or shams.")
    (license license:expat)))
(define-public node-is-generator-function-1.0.10
  (package
    (name "node-is-generator-function")
    (version "1.0.10")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/is-generator-function/-/is-generator-function-1.0.10.tgz")
       (sha256
        (base32 "0iqcr4pxv9iiqjsv1glhsjlzr16xfaahq7hxmn9lgqshxpqyn03i"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@ljharb/eslint-config" "aud"
                                             "auto-changelog"
                                             "core-js"
                                             "eslint"
                                             "make-generator-function"
                                             "nyc"
                                             "safe-publish-latest"
                                             "tape"
                                             "uglify-register")))))))
    (inputs `(("node-has-tostringtag" ,node-has-tostringtag-1.0.0)))
    (home-page "https://github.com/inspect-js/is-generator-function#readme")
    (synopsis "Determine if a function is a native generator function.")
    (description "Determine if a function is a native generator function.")
    (license license:expat)))
(define-public node-co-4.6.0
  (package
    (name "node-co")
    (version "4.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/co/-/co-4.6.0.tgz")
       (sha256
        (base32 "166g74ggagkjs3vgpavffm8rignh3lw0j945w67yc8iq98m3dm11"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("browserify" "istanbul-harmony"
                                             "mocha" "mz")))))))
    (home-page "https://github.com/tj/co#readme")
    (synopsis "generator async control flow goodness")
    (description "generator async control flow goodness")
    (license license:expat)))
(define-public node-koa-compose-4.2.0
  (package
    (name "node-koa-compose")
    (version "4.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/koa-compose/-/koa-compose-4.2.0.tgz")
       (sha256
        (base32 "0s828xc8dryfr5kj9hdrhalv62i0rmlih8g13zin93k6xnghvnc3"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("codecov" "jest" "matcha"
                                             "standard")))))))
    (home-page "https://github.com/koajs/compose#readme")
    (synopsis "compose Koa middleware")
    (description "compose Koa middleware")
    (license license:expat)))
(define-public node-koa-convert-2.0.0
  (package
    (name "node-koa-convert")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/koa-convert/-/koa-convert-2.0.0.tgz")
       (sha256
        (base32 "0clzlrlav9f4rmdfnhjb790g8aigr239naikhhnszyswmpwcpcc1"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("koa" "koa-v1"
                                             "mocha"
                                             "nyc"
                                             "rimraf"
                                             "standard"
                                             "supertest")))))))
    (inputs `(("node-koa-compose" ,node-koa-compose-4.2.0)
              ("node-co" ,node-co-4.6.0)))
    (home-page "https://github.com/gyson/koa-convert#readme")
    (synopsis
     "convert modern Koa legacy generator-based middleware to promise-based middleware")
    (description
     "convert modern Koa legacy generator-based middleware to promise-based middleware")
    (license license:expat)))
(define-public node-ee-first-1.1.1
  (package
    (name "node-ee-first")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/ee-first/-/ee-first-1.1.1.tgz")
       (sha256
        (base32 "175r500n567a04qmswzw5hkgdnika3dvn63n284jlar2gvmyhj2i"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("istanbul" "mocha")))))))
    (home-page "https://github.com/jonathanong/ee-first")
    (synopsis "return the first event in a set of ee/event pairs")
    (description "return the first event in a set of ee/event pairs")
    (license license:expat)))
(define-public node-on-finished-2.4.1
  (package
    (name "node-on-finished")
    (version "2.4.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/on-finished/-/on-finished-2.4.1.tgz")
       (sha256
        (base32 "02mxvpahgv07xaih7lmpn8wic9v4jph3fir0qpd6qf4w0kql4kgn"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-markdown"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "mocha"
                                             "nyc")))))))
    (inputs `(("node-ee-first" ,node-ee-first-1.1.1)))
    (home-page "https://github.com/jshttp/on-finished#readme")
    (synopsis "Execute a callback when a request closes, finishes, or errors")
    (description
     "Execute a callback when a request closes, finishes, or errors")
    (license license:expat)))
(define-public node-only-0.0.2
  (package
    (name "node-only")
    (version "0.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/only/-/only-0.0.2.tgz")
       (sha256
        (base32 "14ims4cdkaxnj7hwh8yy41b3h8l0ykqa74dqcfm2ag0v88k26lcl"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("mocha" "should")))))))
    (home-page "https://www.npmjs.com/package/node-only")
    (synopsis "return whitelisted properties of an object")
    (description "return whitelisted properties of an object")
    (license #f)))
(define-public node-parseurl-1.3.3
  (package
    (name "node-parseurl")
    (version "1.3.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/parseurl/-/parseurl-1.3.3.tgz")
       (sha256
        (base32 "06h2bx1rilkdir3v9jlg94r1q2fn895s0vxjjs0wx5z027x4pvsn"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("beautify-benchmark" "benchmark"
                                             "eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "fast-url-parser"
                                             "istanbul"
                                             "mocha")))))))
    (home-page "https://github.com/pillarjs/parseurl#readme")
    (synopsis "parse a url with memoization")
    (description "parse a url with memoization")
    (license license:expat)))
(define-public node-statuses-1.5.0
  (package
    (name "node-statuses")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/statuses/-/statuses-1.5.0.tgz")
       (sha256
        (base32 "0g6ydb53k8b5rhll1z667riba9454ipkl4hgkc5vzc62l4h10g18"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("csv-parse" "eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-markdown"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "istanbul"
                                             "mocha"
                                             "raw-body"
                                             "stream-to-array")))))))
    (home-page "https://github.com/jshttp/statuses#readme")
    (synopsis "HTTP status utility")
    (description "HTTP status utility")
    (license license:expat)))
(define-public node-vary-1.1.2
  (package
    (name "node-vary")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/vary/-/vary-1.1.2.tgz")
       (sha256
        (base32 "0wbf4kmfyzc23dc0vjcmymkd1ks50z5gvv23lkkkayipf438cy3k"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("beautify-benchmark" "benchmark"
                                             "eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-markdown"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "istanbul"
                                             "mocha"
                                             "supertest")))))))
    (home-page "https://github.com/jshttp/vary#readme")
    (synopsis "Manipulate the HTTP Vary header")
    (description "Manipulate the HTTP Vary header")
    (license license:expat)))
(define-public node-koa-2.14.2
  (package
    (name "node-koa")
    (version "2.14.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/koa/-/koa-2.14.2.tgz")
       (sha256
        (base32 "04fncgwb20rh79zqi4nbc4zg02gg257xrpjzffsxllcaclig7mms"))
       (modules '((guix build utils)))
       (snippet
        '(substitute* "package.json"
	   (("\"prepare\": \".*\"") "\"prepare\": \"\"")))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("eslint" "eslint-config-koa"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "gen-esm-wrapper"
                                             "jest"
                                             "supertest")))))))
    (inputs `(("node-vary" ,node-vary-1.1.2)
              ("node-type-is" ,node-type-is-1.6.18)
              ("node-statuses" ,node-statuses-1.5.0)
              ("node-parseurl" ,node-parseurl-1.3.3)
              ("node-only" ,node-only-0.0.2)
              ("node-on-finished" ,node-on-finished-2.4.1)
              ("node-koa-convert" ,node-koa-convert-2.0.0)
              ("node-koa-compose" ,node-koa-compose-4.2.0)
              ("node-is-generator-function" ,node-is-generator-function-1.0.10)
              ("node-http-errors" ,node-http-errors-1.8.1)
              ("node-http-assert" ,node-http-assert-1.5.0)
              ("node-fresh" ,node-fresh-0.5.2)
              ("node-escape-html" ,node-escape-html-1.0.3)
              ("node-encodeurl" ,node-encodeurl-1.0.2)
              ("node-destroy" ,node-destroy-1.2.0)
              ("node-depd" ,node-depd-2.0.0)
              ("node-delegates" ,node-delegates-1.0.0)
              ("node-debug" ,node-debug-4.3.4)
              ("node-cookies" ,node-cookies-0.8.0)
              ("node-content-type" ,node-content-type-1.0.5)
              ("node-content-disposition" ,node-content-disposition-0.5.4)
              ("node-cache-content-type" ,node-cache-content-type-1.0.1)
              ("node-accepts" ,node-accepts-1.3.8)))
    (home-page "https://github.com/koajs/koa#readme")
    (synopsis "Koa web app framework")
    (description "Koa web app framework")
    (license license:expat)))
(define-public node-inflation-2.0.0
  (package
    (name "node-inflation")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/inflation/-/inflation-2.0.0.tgz")
       (sha256
        (base32 "1zwc5v3v5fn2rskvc98628xzsh6bz3sbyayx7wpbzhjjnq2rccdv"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("istanbul" "mocha"
                                             "readable-stream" "should")))))))
    (home-page "https://github.com/stream-utils/inflation#readme")
    (synopsis "Easily unzip an HTTP stream")
    (description "Easily unzip an HTTP stream")
    (license license:expat)))
(define-public node-call-bind-1.0.2
  (package
    (name "node-call-bind")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/call-bind/-/call-bind-1.0.2.tgz")
       (sha256
        (base32 "06il2ki0bprw4s0a12bwnzwjc8gwwcw6f0cda0jyvj46sj56z5f3"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@ljharb/eslint-config" "aud"
                                             "auto-changelog"
                                             "eslint"
                                             "nyc"
                                             "safe-publish-latest"
                                             "tape")))))))
    (inputs `(("node-get-intrinsic" ,node-get-intrinsic-1.2.1)
              ("node-function-bind" ,node-function-bind-1.1.1)))
    (home-page "https://github.com/ljharb/call-bind#readme")
    (synopsis "Robustly `.call.bind()` a function")
    (description "Robustly `.call.bind()` a function")
    (license license:expat)))
(define-public node-function-bind-1.1.1
  (package
    (name "node-function-bind")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/function-bind/-/function-bind-1.1.1.tgz")
       (sha256
        (base32 "10p0s9ypggwmazik4azdhywjnnayagnjxk10cjzsrhxlk1y2wm9d"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@ljharb/eslint-config" "covert"
                                             "eslint" "jscs" "tape")))))))
    (home-page "https://github.com/Raynos/function-bind")
    (synopsis "Implementation of Function.prototype.bind")
    (description "Implementation of Function.prototype.bind")
    (license license:expat)))
(define-public node-has-1.0.3
  (package
    (name "node-has")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/has/-/has-1.0.3.tgz")
       (sha256
        (base32 "0wsmn2vcbqb23xpbzxipjd7xcdljid2gwnwl7vn5hkp0zkpgk363"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@ljharb/eslint-config" "eslint"
                                             "tape")))))))
    (inputs `(("node-function-bind" ,node-function-bind-1.1.1)))
    (home-page "https://github.com/tarruda/has")
    (synopsis "Object.prototype.hasOwnProperty.call shortcut")
    (description "Object.prototype.hasOwnProperty.call shortcut")
    (license license:expat)))
(define-public node-has-proto-1.0.1
  (package
    (name "node-has-proto")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/has-proto/-/has-proto-1.0.1.tgz")
       (sha256
        (base32 "0lgnq6pcakprcxq176803bhv901sdjp23nii1rfh4q1dd5nxa457"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@ljharb/eslint-config" "aud"
                                             "auto-changelog"
                                             "eslint"
                                             "in-publish"
                                             "npmignore"
                                             "safe-publish-latest"
                                             "tape")))))))
    (home-page "https://github.com/inspect-js/has-proto#readme")
    (synopsis
     "Does this environment have the ability to get the [[Prototype]] of an object on creation with `__proto__`?")
    (description
     "Does this environment have the ability to get the [[Prototype]] of an object on creation with `__proto__`?")
    (license license:expat)))
(define-public node-has-symbols-1.0.3
  (package
    (name "node-has-symbols")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/has-symbols/-/has-symbols-1.0.3.tgz")
       (sha256
        (base32 "19p65j4wxry2y75capz52i4miva1z5m6b2qs1b8aj4hy5xl1gk6x"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@ljharb/eslint-config" "aud"
                                             "auto-changelog"
                                             "core-js"
                                             "eslint"
                                             "get-own-property-symbols"
                                             "nyc"
                                             "safe-publish-latest"
                                             "tape")))))))
    (home-page "https://github.com/ljharb/has-symbols#readme")
    (synopsis
     "Determine if the JS environment has Symbol support. Supports spec, or shams.")
    (description
     "Determine if the JS environment has Symbol support. Supports spec, or shams.")
    (license license:expat)))
(define-public node-get-intrinsic-1.2.1
  (package
    (name "node-get-intrinsic")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/get-intrinsic/-/get-intrinsic-1.2.1.tgz")
       (sha256
        (base32 "0pffwzq9hhajnpv2zng5vix5qnxry41nk94m2wbmwgw5v7wsmy0c"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@ljharb/eslint-config" "aud"
                                             "auto-changelog"
                                             "call-bind"
                                             "es-abstract"
                                             "es-value-fixtures"
                                             "eslint"
                                             "evalmd"
                                             "for-each"
                                             "gopd"
                                             "make-async-function"
                                             "make-async-generator-function"
                                             "make-generator-function"
                                             "mock-property"
                                             "npmignore"
                                             "nyc"
                                             "object-inspect"
                                             "safe-publish-latest"
                                             "tape")))))))
    (inputs `(("node-has-symbols" ,node-has-symbols-1.0.3)
              ("node-has-proto" ,node-has-proto-1.0.1)
              ("node-has" ,node-has-1.0.3)
              ("node-function-bind" ,node-function-bind-1.1.1)))
    (home-page "https://github.com/ljharb/get-intrinsic#readme")
    (synopsis
     "Get and robustly cache all JS language-level intrinsics at first require time")
    (description
     "Get and robustly cache all JS language-level intrinsics at first require time")
    (license license:expat)))
(define-public node-object-inspect-1.12.3
  (package
    (name "node-object-inspect")
    (version "1.12.3")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/object-inspect/-/object-inspect-1.12.3.tgz")
       (sha256
        (base32 "1ai21szcxddav1648fb78rdkhvkgpn6k2d8il9s7agk3lvgais2a"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@ljharb/eslint-config"
                                             "@pkgjs/support"
                                             "aud"
                                             "auto-changelog"
                                             "core-js"
                                             "error-cause"
                                             "es-value-fixtures"
                                             "eslint"
                                             "for-each"
                                             "functions-have-names"
                                             "has-tostringtag"
                                             "in-publish"
                                             "make-arrow-function"
                                             "mock-property"
                                             "npmignore"
                                             "nyc"
                                             "safe-publish-latest"
                                             "string.prototype.repeat"
                                             "tape")))))))
    (home-page "https://github.com/inspect-js/object-inspect")
    (synopsis "string representations of objects in node and the browser")
    (description "string representations of objects in node and the browser")
    (license license:expat)))
(define-public node-side-channel-1.0.4
  (package
    (name "node-side-channel")
    (version "1.0.4")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/side-channel/-/side-channel-1.0.4.tgz")
       (sha256
        (base32 "0dfp0r5j0i847w1q88riq2yp4mc0wrs0a6ys57j1m21nlny88arm"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@ljharb/eslint-config" "aud"
                                             "auto-changelog"
                                             "eslint"
                                             "nyc"
                                             "safe-publish-latest"
                                             "tape")))))))
    (inputs `(("node-object-inspect" ,node-object-inspect-1.12.3)
              ("node-get-intrinsic" ,node-get-intrinsic-1.2.1)
              ("node-call-bind" ,node-call-bind-1.0.2)))
    (home-page "https://github.com/ljharb/side-channel#readme")
    (synopsis
     "Store information about any JS value in a side channel. Uses WeakMap if available.")
    (description
     "Store information about any JS value in a side channel. Uses WeakMap if available.")
    (license license:expat)))
(define-public node-qs-6.11.2
  (package
    (name "node-qs")
    (version "6.11.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/qs/-/qs-6.11.2.tgz")
       (sha256
        (base32 "1drnh0gw07cgyy4r890hg5id64290x1dc989m5f5j9rsxgam2ydw"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@ljharb/eslint-config" "aud"
                                             "browserify"
                                             "eclint"
                                             "eslint"
                                             "evalmd"
                                             "for-each"
                                             "has-override-mistake"
                                             "has-property-descriptors"
                                             "has-symbols"
                                             "iconv-lite"
                                             "in-publish"
                                             "mkdirp"
                                             "mock-property"
                                             "npmignore"
                                             "nyc"
                                             "object-inspect"
                                             "qs-iconv"
                                             "safe-publish-latest"
                                             "safer-buffer"
                                             "tape")))))))
    (inputs `(("node-side-channel" ,node-side-channel-1.0.4)))
    (home-page "https://github.com/ljharb/qs")
    (synopsis
     "A querystring parser that supports nesting and arrays, with a depth limit")
    (description
     "A querystring parser that supports nesting and arrays, with a depth limit")
    (license license:bsd-3)))
(define-public node-bytes-3.1.2
  (package
    (name "node-bytes")
    (version "3.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/bytes/-/bytes-3.1.2.tgz")
       (sha256
        (base32 "10f5wgg4izi14lc425v7ljr1ayk28ycdjckfxpm4bnj0bankfpl3"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("eslint"
                                             "eslint-plugin-markdown" "mocha"
                                             "nyc")))))))
    (home-page "https://github.com/visionmedia/bytes.js#readme")
    (synopsis "Utility to parse a string bytes to bytes and vice-versa")
    (description "Utility to parse a string bytes to bytes and vice-versa")
    (license license:expat)))
(define-public node-depd-2.0.0
  (package
    (name "node-depd")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/depd/-/depd-2.0.0.tgz")
       (sha256
        (base32 "19yl2piwl0ci2lvn5j5sk0z4nbldj6apsrqds3ql2d09aqh8m998"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("benchmark" "beautify-benchmark"
                                             "eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-markdown"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "istanbul"
                                             "mocha"
                                             "safe-buffer"
                                             "uid-safe")))))))
    (home-page "https://github.com/dougwilson/nodejs-depd#readme")
    (synopsis "Deprecate all the things")
    (description "Deprecate all the things")
    (license license:expat)))
(define-public node-setprototypeof-1.2.0
  (package
    (name "node-setprototypeof")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/setprototypeof/-/setprototypeof-1.2.0.tgz")
       (sha256
        (base32 "1qnzx8bl8h1vga28pf59mjd52wvh1hf3ma18d4zpwmijlrpcqfy8"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("mocha" "standard")))))))
    (home-page "https://github.com/wesleytodd/setprototypeof")
    (synopsis "A small polyfill for Object.setprototypeof")
    (description "A small polyfill for Object.setprototypeof")
    (license license:isc)))
(define-public node-statuses-2.0.1
  (package
    (name "node-statuses")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/statuses/-/statuses-2.0.1.tgz")
       (sha256
        (base32 "0nig6ygf53sj8vcqvbcwrzm4ln986rcz16kn5qjv1y4s9m1l164i"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("csv-parse" "eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-markdown"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "mocha"
                                             "nyc"
                                             "raw-body"
                                             "stream-to-array")))))))
    (home-page "https://github.com/jshttp/statuses#readme")
    (synopsis "HTTP status utility")
    (description "HTTP status utility")
    (license license:expat)))
(define-public node-toidentifier-1.0.1
  (package
    (name "node-toidentifier")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/toidentifier/-/toidentifier-1.0.1.tgz")
       (sha256
        (base32 "021fp42m51qbqbqabwhxky8bkfkkwza65lqiz7d2gqwd91vwqvqq"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-markdown"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "mocha"
                                             "nyc")))))))
    (home-page "https://github.com/component/toidentifier#readme")
    (synopsis "Convert a string of words to a JavaScript identifier")
    (description "Convert a string of words to a JavaScript identifier")
    (license license:expat)))
(define-public node-http-errors-2.0.0
  (package
    (name "node-http-errors")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/http-errors/-/http-errors-2.0.0.tgz")
       (sha256
        (base32 "1dypd936i09cvjyxx338da0nimbm4cqi2rrxhjch3ix2wmwx6ky1"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-markdown"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "mocha"
                                             "nyc")))))))
    (inputs `(("node-toidentifier" ,node-toidentifier-1.0.1)
              ("node-statuses" ,node-statuses-2.0.1)
              ("node-setprototypeof" ,node-setprototypeof-1.2.0)
              ("node-inherits" ,node-inherits)
              ("node-depd" ,node-depd-2.0.0)))
    (home-page "https://github.com/jshttp/http-errors#readme")
    (synopsis "Create HTTP error objects")
    (description "Create HTTP error objects")
    (license license:expat)))
(define-public node-iconv-lite-0.4.24
  (package
    (name "node-iconv-lite")
    (version "0.4.24")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.4.24.tgz")
       (sha256
        (base32 "0da6ff7dlx6lfhdafsd9sv0h09sicpfakms8bqylrm4f17r68v2p"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("mocha" "request"
                                             "unorm"
                                             "errto"
                                             "async"
                                             "istanbul"
                                             "semver"
                                             "iconv")))))))
    (inputs `(("node-safer-buffer" ,node-safer-buffer-2.1.2)))
    (home-page "https://github.com/ashtuchkin/iconv-lite")
    (synopsis "Convert character encodings in pure javascript.")
    (description "Convert character encodings in pure javascript.")
    (license license:expat)))
(define-public node-unpipe-1.0.0
  (package
    (name "node-unpipe")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/unpipe/-/unpipe-1.0.0.tgz")
       (sha256
        (base32 "1dnzbqfmchls4jyvkw0wnkc09pig98y66zzsy3lizgyls435xyrd"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("istanbul" "mocha"
                                             "readable-stream")))))))
    (home-page "https://github.com/stream-utils/unpipe")
    (synopsis "Unpipe a stream from all destinations")
    (description "Unpipe a stream from all destinations")
    (license license:expat)))
(define-public node-raw-body-2.5.2
  (package
    (name "node-raw-body")
    (version "2.5.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/raw-body/-/raw-body-2.5.2.tgz")
       (sha256
        (base32 "0by4zfp9mahjnr3rbnjqrr1a4rgg4jasr7dwvkbbfxcz8b469la2"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("bluebird" "eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-markdown"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "mocha"
                                             "nyc"
                                             "readable-stream"
                                             "safe-buffer")))))))
    (inputs `(("node-unpipe" ,node-unpipe-1.0.0)
              ("node-iconv-lite" ,node-iconv-lite-0.4.24)
              ("node-http-errors" ,node-http-errors-2.0.0)
              ("node-bytes" ,node-bytes-3.1.2)))
    (home-page "https://github.com/stream-utils/raw-body#readme")
    (synopsis "Get and validate the raw body of a readable stream.")
    (description "Get and validate the raw body of a readable stream.")
    (license license:expat)))
(define-public node-co-body-6.1.0
  (package
    (name "node-co-body")
    (version "6.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/co-body/-/co-body-6.1.0.tgz")
       (sha256
        (base32 "1jdhric4mvhj2dnwr4cba4is143816b27smqxck2wxliggg5qay9"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("autod" "egg-bin"
                                             "eslint"
                                             "eslint-config-egg"
                                             "koa"
                                             "safe-qs"
                                             "should"
                                             "supertest")))))))
    (inputs `(("node-type-is" ,node-type-is-1.6.18)
              ("node-raw-body" ,node-raw-body-2.5.2)
              ("node-qs" ,node-qs-6.11.2)
              ("node-inflation" ,node-inflation-2.0.0)))
    (home-page "https://github.com/cojs/co-body#readme")
    (synopsis "request body parsing for co")
    (description "request body parsing for co")
    (license license:expat)))
(define-public node-copy-to-2.0.1
  (package
    (name "node-copy-to")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/copy-to/-/copy-to-2.0.1.tgz")
       (sha256
        (base32 "17hybn7wmzc12525rgqxx8948r3vbzvjaps3bpm7s63xzadl3v9a"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("mocha" "should")))))))
    (home-page "https://github.com/node-modules/copy-to")
    (synopsis "copy an object's properties to another object")
    (description "copy an object's properties to another object")
    (license license:expat)))
(define-public node-koa-bodyparser-4.4.1
  (package
    (name "node-koa-bodyparser")
    (version "4.4.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/koa-bodyparser/-/koa-bodyparser-4.4.1.tgz")
       (sha256
        (base32 "0zsl4qn5vx83fb77s364fpnsq12aplz5krg9wi1mm401awb7plvf"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("eslint-config-xo-lass" "husky"
                                             "koa"
                                             "mocha"
                                             "nyc"
                                             "should"
                                             "supertest"
                                             "xo")))))))
    (inputs `(("node-type-is" ,node-type-is-1.6.18)
              ("node-copy-to" ,node-copy-to-2.0.1)
              ("node-co-body" ,node-co-body-6.1.0)))
    (home-page "https://github.com/koajs/body-parser")
    (synopsis "a body parser for Koa")
    (description "a body parser for Koa")
    (license license:expat)))
(define-public node-koa-is-json-1.0.0
  (package
    (name "node-koa-is-json")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/koa-is-json/-/koa-is-json-1.0.0.tgz")
       (sha256
        (base32 "0p2krf2fww2b6icvi96vgiklw8p37zc29ql15lq7x35czi2j3841"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (home-page "https://github.com/koajs/is-json")
    (synopsis "check if a koa body should be interpreted as JSON")
    (description "check if a koa body should be interpreted as JSON")
    (license license:expat)))
(define-public node-json-stringify-safe-5.0.1
  (package
    (name "node-json-stringify-safe")
    (version "5.0.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/json-stringify-safe/-/json-stringify-safe-5.0.1.tgz")
       (sha256
        (base32 "12ljc7ipy7cprz5zxzzds20ykw6z5616763ca5zx9xmzq1jvzyxp"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("mocha" "must" "sinon")))))))
    (home-page "https://github.com/isaacs/json-stringify-safe")
    (synopsis "Like JSON.stringify, but doesn't blow up on circular refs.")
    (description "Like JSON.stringify, but doesn't blow up on circular refs.")
    (license license:isc)))
(define-public node-streaming-json-stringify-3.1.0
  (package
    (name "node-streaming-json-stringify")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/streaming-json-stringify/-/streaming-json-stringify-3.1.0.tgz")
       (sha256
        (base32 "1kqvw141mxnva2bs7rpcnzgks7c92sgjrjfkqd8wqlgqxbhcv933"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("cat-stream" "istanbul" "mocha"
                                             "sinon")))))))
    (inputs `(("node-readable-stream" ,node-readable-stream-2.3.8)
              ("node-json-stringify-safe" ,node-json-stringify-safe-5.0.1)))
    (home-page
     "https://github.com/stream-utils/streaming-json-stringify#readme")
    (synopsis "Streaming JSON.stringify()")
    (description "Streaming JSON.stringify()")
    (license license:expat)))
(define-public node-koa-json-2.0.2
  (package
    (name "node-koa-json")
    (version "2.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/koa-json/-/koa-json-2.0.2.tgz")
       (sha256
        (base32 "06s8j55xdsncnyv2vgvi9fpkkrgn23r6aig59fv3y16ii5nj2fda"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("istanbul" "mocha" "koa"
                                             "supertest")))))))
    (inputs `(("node-streaming-json-stringify" ,node-streaming-json-stringify-3.1.0)
              ("node-koa-is-json" ,node-koa-is-json-1.0.0)))
    (home-page "https://github.com/koajs/json#readme")
    (synopsis "pretty (non-compressed) json response middleware")
    (description "pretty (non-compressed) json response middleware")
    (license license:expat)))
(define-public node-is-promise-2.2.2
  (package
    (name "node-is-promise")
    (version "2.2.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/is-promise/-/is-promise-2.2.2.tgz")
       (sha256
        (base32 "1yi9kib1wsi35mm697i9pqfb0cyw233xga72bicwyf45bwc6ap1m"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("better-assert" "mocha")))))))
    (home-page "https://github.com/then/is-promise#readme")
    (synopsis "Test whether an object looks like a promises-a+ promise")
    (description "Test whether an object looks like a promises-a+ promise")
    (license license:expat)))
(define-public node-lodash-4.17.21
  (package
    (name "node-lodash")
    (version "4.17.21")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/lodash/-/lodash-4.17.21.tgz")
       (sha256
        (base32 "017qragyfl5ifajdx48lvz46wr0jc1llikgvc2fhqakhwp4pl23a"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (home-page "https://lodash.com/")
    (synopsis "Lodash modular utilities.")
    (description "Lodash modular utilities.")
    (license license:expat)))
(define-public node-pify-3.0.0
  (package
    (name "node-pify")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/pify/-/pify-3.0.0.tgz")
       (sha256
        (base32 "0g04k40h8kzpjsw4mznd9a6y74k8zp59lc9wp9fydf3wjgwx272r"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "pinkie-promise"
                                             "v8-natives" "xo")))))))
    (home-page "https://github.com/sindresorhus/pify#readme")
    (synopsis "Promisify a callback-style function")
    (description "Promisify a callback-style function")
    (license license:expat)))
(define-public node-steno-0.4.4
  (package
    (name "node-steno")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/steno/-/steno-0.4.4.tgz")
       (sha256
        (base32 "1c86i4d9z65h9q5dgvsb9qnzmsm0p86hbbkp9i4ckd1d47sxwnf1"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("after" "husky" "standard"
                                             "tap-dot" "tape")))))))
    (inputs `(("node-graceful-fs" ,node-graceful-fs-4.2.11)))
    (home-page "https://github.com/typicode/steno")
    (synopsis
     "Simple file writer with race condition prevention and atomic writing")
    (description
     "Simple file writer with race condition prevention and atomic writing")
    (license license:expat)))
(define-public node-lowdb-1.0.0
  (package
    (name "node-lowdb")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/lowdb/-/lowdb-1.0.0.tgz")
       (sha256
        (base32 "0l7hvvc7lzaab2ksc481wxjvdx6b0a3gqs5zdj2zs15g0afysg78"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("babel-cli" "babel-eslint"
                                             "babel-jest"
                                             "babel-loader"
                                             "babel-polyfill"
                                             "babel-preset-env"
                                             "babel-register"
                                             "delay"
                                             "eslint"
                                             "eslint-config-prettier"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-node"
                                             "eslint-plugin-prettier"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "husky"
                                             "jest"
                                             "lodash-id"
                                             "mv"
                                             "pkg-ok"
                                             "prettier"
                                             "ramda"
                                             "regenerator-runtime"
                                             "rimraf"
                                             "sinon"
                                             "tempfile"
                                             "webpack")))))))
    (inputs `(("node-steno" ,node-steno-0.4.4)
              ("node-pify" ,node-pify-3.0.0)
              ("node-lodash" ,node-lodash-4.17.21)
              ("node-is-promise" ,node-is-promise-2.2.2)
              ("node-graceful-fs" ,node-graceful-fs-4.2.11)))
    (home-page "https://github.com/typicode/lowdb")
    (synopsis
     "Small JSON database for Node, Electron and the browser. Powered by Lodash.")
    (description
     "Small JSON database for Node, Electron and the browser. Powered by Lodash.")
    (license license:expat)))
(define-public node-lunr-2.3.9
  (package
    (name "node-lunr")
    (version "2.3.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/lunr/-/lunr-2.3.9.tgz")
       (sha256
        (base32 "0c4hd5i3rxbchgmav86c7cdypzm6wq3hxzp7wpifv9rr8gffg1nq"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("benchmark" "chai"
                                             "eslint-plugin-spellcheck"
                                             "eslint"
                                             "jsdoc"
                                             "mocha"
                                             "mustache"
                                             "node-static"
                                             "uglify-js"
                                             "word-list")))))))
    (home-page "https://lunrjs.com")
    (synopsis "Simple full-text search in your browser.")
    (description "Simple full-text search in your browser.")
    (license license:expat)))
(define-public node-append-field-1.0.0
  (package
    (name "node-append-field")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/append-field/-/append-field-1.0.0.tgz")
       (sha256
        (base32 "1z1czif1x538ph3isl02ir0z84yjd82i4h6j6pqg7g2mmzv2zsf9"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("mocha" "standard"
                                             "testdata-w3c-json-form")))))))
    (home-page "https://github.com/LinusU/node-append-field#readme")
    (synopsis
     "A [W3C HTML JSON forms spec](http://www.w3.org/TR/html-json-forms/) compliant field appender (for lack of a better name). Useful for people implementing `application/x-www-form-urlencoded` and `multipart/form-data` parsers.")
    (description
     "A [W3C HTML JSON forms spec](http://www.w3.org/TR/html-json-forms/) compliant field appender (for lack of a better name). Useful for people implementing `application/x-www-form-urlencoded` and `multipart/form-data` parsers.")
    (license license:expat)))
(define-public node-streamsearch-1.1.0
  (package
    (name "node-streamsearch")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/streamsearch/-/streamsearch-1.1.0.tgz")
       (sha256
        (base32 "1a599azf1bf0ay86hhylkmjgxm1vaazh55pf6alj4ij68flx056r"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@mscdex/eslint-config" "eslint")))))))
    (home-page "https://github.com/mscdex/streamsearch#readme")
    (synopsis "Streaming Boyer-Moore-Horspool searching for node.js")
    (description "Streaming Boyer-Moore-Horspool searching for node.js")
    (license #f)))
(define-public node-busboy-1.6.0
  (package
    (name "node-busboy")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/busboy/-/busboy-1.6.0.tgz")
       (sha256
        (base32 "0a08av48q4kglwiigy1hqklawdfknk5y61f88v63gigjf70854w1"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@mscdex/eslint-config" "eslint")))))))
    (inputs `(("node-streamsearch" ,node-streamsearch-1.1.0)))
    (home-page "https://github.com/mscdex/busboy#readme")
    (synopsis "A streaming parser for HTML form data for node.js")
    (description "A streaming parser for HTML form data for node.js")
    (license #f)))
(define-public node-buffer-from-1.1.2
  (package
    (name "node-buffer-from")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/buffer-from/-/buffer-from-1.1.2.tgz")
       (sha256
        (base32 "0hz3cbll0m805g22c5pnwdgpi1xavmrp5q1734x4d3yakvah6aww"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("standard")))))))
    (home-page "https://github.com/LinusU/buffer-from#readme")
    (synopsis
     "A [ponyfill](https://ponyfill.com) for `Buffer.from`, uses native implementation if available.")
    (description
     "A [ponyfill](https://ponyfill.com) for `Buffer.from`, uses native implementation if available.")
    (license license:expat)))
(define-public node-core-util-is-1.0.3
  (package
    (name "node-core-util-is")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/core-util-is/-/core-util-is-1.0.3.tgz")
       (sha256
        (base32 "032dwykfbxff1q7s0kgqdkwwzmm25mlrlfqijzibbwrc3z3zsc24"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tap")))))))
    (home-page "https://github.com/isaacs/core-util-is#readme")
    (synopsis "The `util.is*` functions introduced in Node v0.12.")
    (description "The `util.is*` functions introduced in Node v0.12.")
    (license license:expat)))
(define-public node-isarray-1.0.0
  (package
    (name "node-isarray")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/isarray/-/isarray-1.0.0.tgz")
       (sha256
        (base32 "11qcjpdzigcwcprhv7nyarlzjcwf3sv5i66q75zf08jj9zqpcg72"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tape")))))))
    (home-page "https://github.com/juliangruber/isarray")
    (synopsis "Array#isArray for older browsers")
    (description "Array#isArray for older browsers")
    (license license:expat)))
(define-public node-process-nextick-args-2.0.1
  (package
    (name "node-process-nextick-args")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/process-nextick-args/-/process-nextick-args-2.0.1.tgz")
       (sha256
        (base32 "16w8m2ycy5s4ykgdfg97qxa67gfvkh6x3vdwfsncafyj4p3zhns2"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tap")))))))
    (home-page "https://github.com/calvinmetcalf/process-nextick-args")
    (synopsis "process.nextTick but always with args")
    (description "process.nextTick but always with args")
    (license license:expat)))
(define-public node-safe-buffer-5.1.2
  (package
    (name "node-safe-buffer")
    (version "5.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.1.2.tgz")
       (sha256
        (base32 "08ma0a2a9j537bxl7qd2dn6sjcdhrclpdbslr19bkbyc1z30d4p0"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("standard" "tape")))))))
    (home-page "https://github.com/feross/safe-buffer")
    (synopsis "Safer Node.js Buffer API")
    (description "Safer Node.js Buffer API")
    (license license:expat)))
(define-public node-string-decoder-1.1.1
  (package
    (name "node-string-decoder")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/string_decoder/-/string_decoder-1.1.1.tgz")
       (sha256
        (base32 "0fln2r91b8gj845j7jl76fvsp7nij13fyzvz82985yh88m1n50mg"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("babel-polyfill" "core-util-is"
                                             "inherits" "tap")))))))
    (inputs `(("node-safe-buffer" ,node-safe-buffer-5.1.2)))
    (home-page "https://github.com/nodejs/string_decoder")
    (synopsis "The string_decoder module from Node core")
    (description "The string_decoder module from Node core")
    (license license:expat)))
(define-public node-readable-stream-2.3.8
  (package
    (name "node-readable-stream")
    (version "2.3.8")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/readable-stream/-/readable-stream-2.3.8.tgz")
       (sha256
        (base32 "0cm5g4a5mfqb5im98mzv5y3dpv377bws6wlgpv5wk2pn90wn2j0n"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("assert" "babel-polyfill"
                                             "buffer"
                                             "lolex"
                                             "nyc"
                                             "tap"
                                             "tape")))))))
    (inputs `(("node-util-deprecate" ,node-util-deprecate)
              ("node-string-decoder" ,node-string-decoder-1.1.1)
              ("node-safe-buffer" ,node-safe-buffer-5.1.2)
              ("node-process-nextick-args" ,node-process-nextick-args-2.0.1)
              ("node-isarray" ,node-isarray-1.0.0)
              ("node-inherits" ,node-inherits)
              ("node-core-util-is" ,node-core-util-is-1.0.3)))
    (home-page "https://github.com/nodejs/readable-stream#readme")
    (synopsis "Streams3, a user-land copy of the stream library from Node.js")
    (description
     "Streams3, a user-land copy of the stream library from Node.js")
    (license license:expat)))
(define-public node-typedarray-0.0.6
  (package
    (name "node-typedarray")
    (version "0.0.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/typedarray/-/typedarray-0.0.6.tgz")
       (sha256
        (base32 "022101ap05mryhpyw33phwyamk1i139qqpn2rs2lq72qm5slnciz"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tape")))))))
    (home-page "https://github.com/substack/typedarray")
    (synopsis "TypedArray polyfill for old browsers")
    (description "TypedArray polyfill for old browsers")
    (license license:expat)))
(define-public node-concat-stream-1.6.2
  (package
    (name "node-concat-stream")
    (version "1.6.2")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/concat-stream/-/concat-stream-1.6.2.tgz")
       (sha256
        (base32 "1wa3gka91z4mdwi9yz2lri8lb2b1vhimkr6zckcjdj4bjxcw2iya"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tape")))))))
    (inputs `(("node-typedarray" ,node-typedarray-0.0.6)
              ("node-readable-stream" ,node-readable-stream-2.3.8)
              ("node-inherits" ,node-inherits)
              ("node-buffer-from" ,node-buffer-from-1.1.2)))
    (home-page "https://github.com/maxogden/concat-stream#readme")
    (synopsis
     "writable stream that concatenates strings or binary data and calls a callback with the result")
    (description
     "writable stream that concatenates strings or binary data and calls a callback with the result")
    (license license:expat)))
(define-public node-minimist-1.2.8
  (package
    (name "node-minimist")
    (version "1.2.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/minimist/-/minimist-1.2.8.tgz")
       (sha256
        (base32 "10yfwkrl00d8gy9z622yrklg1jax3qk38j354jfw34xk2p0pc2im"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@ljharb/eslint-config" "aud"
                                             "auto-changelog"
                                             "eslint"
                                             "in-publish"
                                             "npmignore"
                                             "nyc"
                                             "safe-publish-latest"
                                             "tape")))))))
    (home-page "https://github.com/minimistjs/minimist")
    (synopsis "parse argument options")
    (description "parse argument options")
    (license license:expat)))
(define-public node-mkdirp-0.5.6
  (package
    (name "node-mkdirp")
    (version "0.5.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/mkdirp/-/mkdirp-0.5.6.tgz")
       (sha256
        (base32 "0sdmma4bm86i69b5p1didy3cass87rb0zjv35z0xs8sb0ld2ja8v"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tap")))))))
    (inputs `(("node-minimist" ,node-minimist-1.2.8)))
    (home-page "https://github.com/substack/node-mkdirp#readme")
    (synopsis "Recursively mkdir, like `mkdir -p`")
    (description "Recursively mkdir, like `mkdir -p`")
    (license license:expat)))
(define-public node-object-assign-4.1.1
  (package
    (name "node-object-assign")
    (version "4.1.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/object-assign/-/object-assign-4.1.1.tgz")
       (sha256
        (base32 "1v999sycxcp74j2pikdhyinm2d80p2bsy4nnrrnb59rv4rm74bbq"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "lodash" "matcha" "xo")))))))
    (home-page "https://github.com/sindresorhus/object-assign#readme")
    (synopsis "ES2015 `Object.assign()` ponyfill")
    (description "ES2015 `Object.assign()` ponyfill")
    (license license:expat)))
(define-public node-media-typer-0.3.0
  (package
    (name "node-media-typer")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/media-typer/-/media-typer-0.3.0.tgz")
       (sha256
        (base32 "07vlmddn91j0bbrxr2br320dnkxw96dp7hqmvidj5ydl84adiyid"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("istanbul" "mocha" "should")))))))
    (home-page "https://github.com/jshttp/media-typer")
    (synopsis "Simple RFC 6838 media type parser and formatter")
    (description "Simple RFC 6838 media type parser and formatter")
    (license license:expat)))
(define-public node-mime-db-1.52.0
  (package
    (name "node-mime-db")
    (version "1.52.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/mime-db/-/mime-db-1.52.0.tgz")
       (sha256
        (base32 "0fwyiyqi3w03w3xwy2jhm8rsa0y9wgkc0j6q3q6mvk9asns0prxq"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("bluebird" "co"
                                             "cogent"
                                             "csv-parse"
                                             "eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-markdown"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "gnode"
                                             "media-typer"
                                             "mocha"
                                             "nyc"
                                             "raw-body"
                                             "stream-to-array")))))))
    (home-page "https://github.com/jshttp/mime-db#readme")
    (synopsis "Media Type Database")
    (description "Media Type Database")
    (license license:expat)))
(define-public node-mime-types-2.1.35
  (package
    (name "node-mime-types")
    (version "2.1.35")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/mime-types/-/mime-types-2.1.35.tgz")
       (sha256
        (base32 "1hyi043kcqyfz82w19s357klvj54f0s94d40rymbms86i74lyws9"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-markdown"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "mocha"
                                             "nyc")))))))
    (inputs `(("node-mime-db" ,node-mime-db-1.52.0)))
    (home-page "https://github.com/jshttp/mime-types#readme")
    (synopsis "The ultimate javascript content-type utility.")
    (description "The ultimate javascript content-type utility.")
    (license license:expat)))
(define-public node-type-is-1.6.18
  (package
    (name "node-type-is")
    (version "1.6.18")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/type-is/-/type-is-1.6.18.tgz")
       (sha256
        (base32 "1bn3gl9vd67cq3wl2cvq686zskl2xx6lxz5kp9w47qc06f2vbnll"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("eslint"
                                             "eslint-config-standard"
                                             "eslint-plugin-import"
                                             "eslint-plugin-markdown"
                                             "eslint-plugin-node"
                                             "eslint-plugin-promise"
                                             "eslint-plugin-standard"
                                             "mocha"
                                             "nyc")))))))
    (inputs `(("node-mime-types" ,node-mime-types-2.1.35)
              ("node-media-typer" ,node-media-typer-0.3.0)))
    (home-page "https://github.com/jshttp/type-is#readme")
    (synopsis "Infer the content-type of a request.")
    (description "Infer the content-type of a request.")
    (license license:expat)))
(define-public node-xtend-4.0.2
  (package
    (name "node-xtend")
    (version "4.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/xtend/-/xtend-4.0.2.tgz")
       (sha256
        (base32 "0j5s840a0a3mjzxixr95jpila80kbdvrxyixnmxvx6f78cfs08mx"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("tape")))))))
    (home-page "https://github.com/Raynos/xtend")
    (synopsis "extend like a boss")
    (description "extend like a boss")
    (license license:expat)))
(define-public node-multer-1.4.5-lts.1
  (package
    (name "node-multer")
    (version "1.4.5-lts.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/multer/-/multer-1.4.5-lts.1.tgz")
       (sha256
        (base32 "1p52i7wjkw69jj0fiqy2bn75y6wlfy9425sviddq9j93i8capcif"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("deep-equal" "express"
                                             "form-data"
                                             "fs-temp"
                                             "mocha"
                                             "rimraf"
                                             "standard"
                                             "testdata-w3c-json-form")))))))
    (inputs `(("node-xtend" ,node-xtend-4.0.2)
              ("node-type-is" ,node-type-is-1.6.18)
              ("node-object-assign" ,node-object-assign-4.1.1)
              ("node-mkdirp" ,node-mkdirp-0.5.6)
              ("node-concat-stream" ,node-concat-stream-1.6.2)
              ("node-busboy" ,node-busboy-1.6.0)
              ("node-append-field" ,node-append-field-1.0.0)))
    (home-page "https://github.com/expressjs/multer#readme")
    (synopsis "Middleware for handling `multipart/form-data`.")
    (description "Middleware for handling `multipart/form-data`.")
    (license license:expat)))
(define-public node-safer-buffer-2.1.2
  (package
    (name "node-safer-buffer")
    (version "2.1.2")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/safer-buffer/-/safer-buffer-2.1.2.tgz")
       (sha256
        (base32 "1cx383s7vchfac8jlg3mnb820hkgcvhcpfn9w4f0g61vmrjjz0bq"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("standard" "tape")))))))
    (home-page "https://github.com/ChALkeR/safer-buffer#readme")
    (synopsis "Modern Buffer API polyfill without footguns")
    (description "Modern Buffer API polyfill without footguns")
    (license license:expat)))
(define-public node-iconv-lite-0.6.3
  (package
    (name "node-iconv-lite")
    (version "0.6.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.6.3.tgz")
       (sha256
        (base32 "1x681ziwavjjn09j4858fl3h3xi90vf512k5zwg06kwriwafq9vi"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("async" "c8"
                                             "errto"
                                             "iconv"
                                             "mocha"
                                             "request"
                                             "semver"
                                             "unorm")))))))
    (inputs `(("node-safer-buffer" ,node-safer-buffer-2.1.2)))
    (home-page "https://github.com/ashtuchkin/iconv-lite")
    (synopsis "Convert character encodings in pure javascript.")
    (description "Convert character encodings in pure javascript.")
    (license license:expat)))
(define-public node-encoding-0.1.13
  (package
    (name "node-encoding")
    (version "0.1.13")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/encoding/-/encoding-0.1.13.tgz")
       (sha256
        (base32 "116gipr1y0hc9zvflsvd39psbbf2j62zvpnw099pqf7fl0nb5xbc"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("nodeunit")))))))
    (inputs `(("node-iconv-lite" ,node-iconv-lite-0.6.3)))
    (home-page "https://github.com/andris9/encoding#readme")
    (synopsis "Convert encodings, uses iconv-lite")
    (description "Convert encodings, uses iconv-lite")
    (license license:expat)))
(define-public node-tr46-0.0.3
  (package
    (name "node-tr46")
    (version "0.0.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/tr46/-/tr46-0.0.3.tgz")
       (sha256
        (base32 "02ia19bsjr545jlkgv35psmzzr5avic96zxw3dam78yf6bmy2jhn"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("mocha" "request")))))))
    (home-page "https://github.com/Sebmaster/tr46.js#readme")
    (synopsis "An implementation of the Unicode TR46 spec")
    (description "An implementation of the Unicode TR46 spec")
    (license license:expat)))
(define-public node-webidl-conversions-3.0.1
  (package
    (name "node-webidl-conversions")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/webidl-conversions/-/webidl-conversions-3.0.1.tgz")
       (sha256
        (base32 "1a1dwb1ga1cj2s7av9r46b4xmx11vsk5zncc0gq2qz4l815w7pz4"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("mocha")))))))
    (home-page "https://github.com/jsdom/webidl-conversions#readme")
    (synopsis
     "Implements the WebIDL algorithms for converting to and from JavaScript values")
    (description
     "Implements the WebIDL algorithms for converting to and from JavaScript values")
    (license license:bsd-2)))
(define-public node-whatwg-url-5.0.0
  (package
    (name "node-whatwg-url")
    (version "5.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/whatwg-url/-/whatwg-url-5.0.0.tgz")
       (sha256
        (base32 "1lvyrf4ry4bgl2jgpim2pkdmrbv2vb0vh0irmkp7da3kymqw97dh"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("eslint" "istanbul" "mocha"
                                             "recast" "request" "webidl2js")))))))
    (inputs `(("node-webidl-conversions" ,node-webidl-conversions-3.0.1)
              ("node-tr46" ,node-tr46-0.0.3)))
    (home-page "https://github.com/jsdom/whatwg-url#readme")
    (synopsis
     "An implementation of the WHATWG URL Standard's URL API and parsing machinery")
    (description
     "An implementation of the WHATWG URL Standard's URL API and parsing machinery")
    (license license:expat)))
(define-public node-node-fetch-2.6.12
  (package
    (name "node-node-fetch")
    (version "2.6.12")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/node-fetch/-/node-fetch-2.6.12.tgz")
       (sha256
        (base32 "0xsjzdz2nzbkzaxw0szn4km6ycflmnyx71wa1cy2wan67zh7zi00"))
       (modules '((guix build utils)))
       (snippet
        '(substitute* "package.json"
	   (("\"prepare\": \".*\"") "\"prepare\": \"\"")))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@ungap/url-search-params"
                                             "abort-controller"
                                             "abortcontroller-polyfill"
                                             "babel-core"
                                             "babel-plugin-istanbul"
                                             "babel-plugin-transform-async-generator-functions"
                                             "babel-polyfill"
                                             "babel-preset-env"
                                             "babel-register"
                                             "chai"
                                             "chai-as-promised"
                                             "chai-iterator"
                                             "chai-string"
                                             "codecov"
                                             "cross-env"
                                             "form-data"
                                             "is-builtin-module"
                                             "mocha"
                                             "nyc"
                                             "parted"
                                             "promise"
                                             "resumer"
                                             "rollup"
                                             "rollup-plugin-babel"
                                             "string-to-arraybuffer"
                                             "teeny-request"
                                             "encoding")))))))
    (inputs `(("node-whatwg-url" ,node-whatwg-url-5.0.0)
              ("node-encoding" ,node-encoding-0.1.13)))
    (home-page "https://github.com/bitinn/node-fetch")
    (synopsis "A light-weight module that brings window.fetch to node.js")
    (description "A light-weight module that brings window.fetch to node.js")
    (license license:expat)))
(define-public node-node-forge-1.3.1
  (package
    (name "node-node-forge")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/node-forge/-/node-forge-1.3.1.tgz")
       (sha256
        (base32 "11ddq9zg7gnrn2c1ml98j0p8ym0zbackwzm4rpdsy3yh1ir07pkp"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("browserify" "commander"
                                             "cross-env"
                                             "eslint"
                                             "eslint-config-digitalbazaar"
                                             "express"
                                             "karma"
                                             "karma-browserify"
                                             "karma-chrome-launcher"
                                             "karma-edge-launcher"
                                             "karma-firefox-launcher"
                                             "karma-ie-launcher"
                                             "karma-mocha"
                                             "karma-mocha-reporter"
                                             "karma-safari-launcher"
                                             "karma-sauce-launcher"
                                             "karma-sourcemap-loader"
                                             "karma-tap-reporter"
                                             "karma-webpack"
                                             "mocha"
                                             "mocha-lcov-reporter"
                                             "nodejs-websocket"
                                             "nyc"
                                             "opts"
                                             "webpack"
                                             "webpack-cli"
                                             "worker-loader")))))))
    (home-page "https://github.com/digitalbazaar/forge")
    (synopsis
     "JavaScript implementations of network transports, cryptography, ciphers, PKI, message digests, and various utilities.")
    (description
     "JavaScript implementations of network transports, cryptography, ciphers, PKI, message digests, and various utilities.")
    (license #f)))
(define-public node-define-lazy-prop-2.0.0
  (package
    (name "node-define-lazy-prop")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/define-lazy-prop/-/define-lazy-prop-2.0.0.tgz")
       (sha256
        (base32 "1rnfvih11v8lpmdykfgy461cray5vcf26xq8k81dxpph26rv2gfm"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "tsd" "xo")))))))
    (home-page "https://github.com/sindresorhus/define-lazy-prop#readme")
    (synopsis "Define a lazily evaluated property on an object")
    (description "Define a lazily evaluated property on an object")
    (license license:expat)))
(define-public node-is-docker-2.2.1
  (package
    (name "node-is-docker")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/is-docker/-/is-docker-2.2.1.tgz")
       (sha256
        (base32 "1b21xcvcb6qy2bj3m1p10swciqbl64irmfm6xghbpf1gyh0d05j8"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "sinon" "tsd" "xo")))))))
    (home-page "https://github.com/sindresorhus/is-docker#readme")
    (synopsis "Check if the process is running inside a Docker container")
    (description "Check if the process is running inside a Docker container")
    (license license:expat)))
(define-public node-is-wsl-2.2.0
  (package
    (name "node-is-wsl")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/is-wsl/-/is-wsl-2.2.0.tgz")
       (sha256
        (base32 "0f3lcm9c4a00q7jp1ic40mixbqm9zqn9qbx50b4bsgrrgxxcqycc"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("ava" "clear-module"
                                             "proxyquire" "tsd" "xo")))))))
    (inputs `(("node-is-docker" ,node-is-docker-2.2.1)))
    (home-page "https://github.com/sindresorhus/is-wsl#readme")
    (synopsis
     "Check if the process is running inside Windows Subsystem for Linux (Bash on Windows)")
    (description
     "Check if the process is running inside Windows Subsystem for Linux (Bash on Windows)")
    (license license:expat)))
(define-public node-open-8.4.2
  (package
    (name "node-open")
    (version "8.4.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/open/-/open-8.4.2.tgz")
       (sha256
        (base32 "16jc2s3qhzvz8fhf28zh5cfbhp3gd6n9ibba4nf7kjx9aa98xbhl"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@types/node" "ava" "tsd" "xo")))))))
    (inputs `(("node-is-wsl" ,node-is-wsl-2.2.0)
              ("node-is-docker" ,node-is-docker-2.2.1)
              ("node-define-lazy-prop" ,node-define-lazy-prop-2.0.0)))
    (home-page "https://github.com/sindresorhus/open#readme")
    (synopsis "Open stuff like URLs, files, executables. Cross-platform.")
    (description "Open stuff like URLs, files, executables. Cross-platform.")
    (license license:expat)))
(define-public node-papaparse-5.4.1
  (package
    (name "node-papaparse")
    (version "5.4.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/papaparse/-/papaparse-5.4.1.tgz")
       (sha256
        (base32 "1adm13d2sjp0nmcws2laiv4wnynfzqn2z4ams9444jkham1vb70l"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("chai" "connect"
                                             "eslint"
                                             "grunt"
                                             "grunt-contrib-uglify"
                                             "mocha"
                                             "mocha-headless-chrome"
                                             "open"
                                             "serve-static")))))))
    (home-page "http://papaparse.com")
    (synopsis
     "Fast and powerful CSV parser for the browser that supports web workers and streaming large files. Converts CSV to JSON and JSON to CSV.")
    (description
     "Fast and powerful CSV parser for the browser that supports web workers and streaming large files. Converts CSV to JSON and JSON to CSV.")
    (license license:expat)))
(define-public node-graceful-fs-4.2.11
  (package
    (name "node-graceful-fs")
    (version "4.2.11")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.2.11.tgz")
       (sha256
        (base32 "1709vla02prpbf34xqsvkqngvsmp5ypnljvg1pcgxrk1l553fq9r"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("import-fresh" "mkdirp" "rimraf"
                                             "tap")))))))
    (home-page "https://github.com/isaacs/node-graceful-fs#readme")
    (synopsis "A drop-in replacement for fs, making various improvements.")
    (description "A drop-in replacement for fs, making various improvements.")
    (license license:isc)))
(define-public node-retry-0.12.0
  (package
    (name "node-retry")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/retry/-/retry-0.12.0.tgz")
       (sha256
        (base32 "0a5l61f1aqn124j25m2q6m0j60mv7d9h74a8gfqnmp5ajz8wcqfz"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("fake" "istanbul" "tape")))))))
    (home-page "https://github.com/tim-kos/node-retry")
    (synopsis
     "Abstraction for exponential and custom retry strategies for failed operations.")
    (description
     "Abstraction for exponential and custom retry strategies for failed operations.")
    (license license:expat)))
(define-public node-signal-exit-3.0.7
  (package
    (name "node-signal-exit")
    (version "3.0.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/signal-exit/-/signal-exit-3.0.7.tgz")
       (sha256
        (base32 "1a10ixkiak24yy6s7p9m7c6v9jkz2fm7wxgc2l3614dbdbx275j3"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("chai" "coveralls" "nyc"
                                             "standard-version" "tap")))))))
    (home-page "https://github.com/tapjs/signal-exit")
    (synopsis "when you want to fire an event no matter how a process exits.")
    (description
     "when you want to fire an event no matter how a process exits.")
    (license license:isc)))
(define-public node-proper-lockfile-4.1.2
  (package
    (name "node-proper-lockfile")
    (version "4.1.2")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://registry.npmjs.org/proper-lockfile/-/proper-lockfile-4.1.2.tgz")
       (sha256
        (base32 "0s49g8x645nacdxwmyy0w4rgl08ba5lv73wjpgnwpbkwlm5r2y7x"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@commitlint/cli"
                                             "@commitlint/config-conventional"
                                             "@segment/clear-timeouts"
                                             "delay"
                                             "eslint"
                                             "eslint-config-moxy"
                                             "execa"
                                             "husky"
                                             "jest"
                                             "lint-staged"
                                             "mkdirp"
                                             "p-defer"
                                             "rimraf"
                                             "stable"
                                             "standard-version"
                                             "thread-sleep")))))))
    (inputs `(("node-signal-exit" ,node-signal-exit-3.0.7)
              ("node-retry" ,node-retry-0.12.0)
              ("node-graceful-fs" ,node-graceful-fs-4.2.11)))
    (home-page "https://github.com/moxystudio/node-proper-lockfile")
    (synopsis
     "A inter-process and inter-machine lockfile utility that works on a local or network file system")
    (description
     "A inter-process and inter-machine lockfile utility that works on a local or network file system")
    (license license:expat)))
(define-public node-tslib-2.6.2
  (package
    (name "node-tslib")
    (version "2.6.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/tslib/-/tslib-2.6.2.tgz")
       (sha256
        (base32 "1qnrm0dsrkmva0490nml242jg09750pqakq4lni7jas7y6nfc0b0"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (home-page "https://www.typescriptlang.org/")
    (synopsis "Runtime library for TypeScript helper functions")
    (description "Runtime library for TypeScript helper functions")
    (license license:bsd-0)))
(define-public node-rxjs-7.8.1
  (package
    (name "node-rxjs")
    (version "7.8.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/rxjs/-/rxjs-7.8.1.tgz")
       (sha256
        (base32 "0jfim4x91kgic1q55j5rki3z48pg7k4md4904d8hhzdb4mviccn5"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@angular-devkit/build-optimizer"
                                             "@angular-devkit/schematics"
                                             "@swc/core"
                                             "@swc/helpers"
                                             "@types/chai"
                                             "@types/lodash"
                                             "@types/mocha"
                                             "@types/node"
                                             "@types/shelljs"
                                             "@types/sinon"
                                             "@types/sinon-chai"
                                             "@types/source-map"
                                             "@typescript-eslint/eslint-plugin"
                                             "@typescript-eslint/parser"
                                             "babel-polyfill"
                                             "chai"
                                             "check-side-effects"
                                             "color"
                                             "colors"
                                             "cross-env"
                                             "cz-conventional-changelog"
                                             "dependency-cruiser"
                                             "escape-string-regexp"
                                             "eslint"
                                             "eslint-plugin-jasmine"
                                             "form-data"
                                             "fs-extra"
                                             "glob"
                                             "google-closure-compiler-js"
                                             "husky"
                                             "klaw-sync"
                                             "lint-staged"
                                             "lodash"
                                             "minimist"
                                             "mocha"
                                             "nodemon"
                                             "npm-run-all"
                                             "opn-cli"
                                             "platform"
                                             "prettier"
                                             "promise"
                                             "rollup"
                                             "rollup-plugin-alias"
                                             "rollup-plugin-inject"
                                             "rollup-plugin-node-resolve"
                                             "shelljs"
                                             "shx"
                                             "sinon"
                                             "sinon-chai"
                                             "source-map-support"
                                             "systemjs"
                                             "ts-node"
                                             "tslint"
                                             "tslint-config-prettier"
                                             "tslint-etc"
                                             "tslint-no-toplevel-property-access"
                                             "tslint-no-unused-expression-chai"
                                             "typescript"
                                             "validate-commit-msg"
                                             "web-streams-polyfill"
                                             "webpack")))))))
    (inputs `(("node-tslib" ,node-tslib-2.6.2)))
    (home-page "https://rxjs.dev")
    (synopsis "Reactive Extensions for modern JavaScript")
    (description "Reactive Extensions for modern JavaScript")
    (license license:asl2.0)))
(define-public node-tldts-core-6.0.15
  (package
    (name "node-tldts-core")
    (version "6.0.15")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/tldts-core/-/tldts-core-6.0.15.tgz")
       (sha256
        (base32 "0vfl490s4rrxkh6mv4d0qy7fs3wpgszz0mjncmjapbn0lpmmyqia"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@rollup/plugin-node-resolve"
                                             "@rollup/plugin-typescript"
                                             "@types/chai"
                                             "@types/mocha"
                                             "@types/node"
                                             "chai"
                                             "mocha"
                                             "nyc"
                                             "rimraf"
                                             "rollup"
                                             "rollup-plugin-sourcemaps"
                                             "typescript")))))))
    (home-page "https://github.com/remusao/tldts#readme")
    (synopsis "tldts core primitives (internal module)")
    (description "tldts core primitives (internal module)")
    (license license:expat)))
(define-public node-tldts-6.0.14
  (package
    (name "node-tldts")
    (version "6.0.14")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/tldts/-/tldts-6.0.14.tgz")
       (sha256
        (base32 "1v03d0q8bm315qv1w8sj8ma93n9xf2xp57sv2nz2abws6hlsxnbw"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("@rollup/plugin-node-resolve"
                                             "@rollup/plugin-terser"
                                             "@rollup/plugin-typescript"
                                             "@types/chai"
                                             "@types/mocha"
                                             "@types/node"
                                             "chai"
                                             "mocha"
                                             "nyc"
                                             "rimraf"
                                             "rollup"
                                             "rollup-plugin-sourcemaps"
                                             "tldts-tests"
                                             "typescript")))))))
    (inputs `(("node-tldts-core" ,node-tldts-core-6.0.15)))
    (home-page "https://github.com/remusao/tldts#readme")
    (synopsis
     "Library to work against complex domain names, subdomains and URIs.")
    (description
     "Library to work against complex domain names, subdomains and URIs.")
    (license license:expat)))
(define-public node-zxcvbn-4.4.2
  (package
    (name "node-zxcvbn")
    (version "4.4.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/zxcvbn/-/zxcvbn-4.4.2.tgz")
       (sha256
        (base32 "08nd0skfmb77229jj7bqjaqwx8sp4v5y8w4b3c739widxihbnghb"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build)
                  (add-after 'patch-dependencies 'delete-dev-dependencies
                    (lambda _
                      (delete-dependencies '("browserify" "coffee-coverage"
                                             "coffee-script"
                                             "coffeeify"
                                             "coffeetape"
                                             "exorcist"
                                             "faucet"
                                             "istanbul"
                                             "tape"
                                             "uglifyify"
                                             "watchify"
                                             "zuul")))))))
    (home-page "https://github.com/dropbox/zxcvbn#readme")
    (synopsis "realistic password strength estimation")
    (description "realistic password strength estimation")
    (license license:expat)))
(define-public node-bitwarden-cli-2023.9.0
  (package
    (name "node-bitwarden-cli")
    (version "2023.9.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://registry.npmjs.org/@bitwarden/cli/-/cli-2023.9.0.tgz")
       (sha256
        (base32 "1qxwlxqjxrhg9gskxpbisxczdr3lq4qblxfc6lq8xws2jvr9ns3s"))))
    (build-system node-build-system)
    (arguments
     '(#:tests? #f
       #:phases (modify-phases %standard-phases
                  (delete 'build))))
    (inputs `(("node-zxcvbn" ,node-zxcvbn-4.4.2)
              ("node-tldts" ,node-tldts-6.0.14)
              ("node-rxjs" ,node-rxjs-7.8.1)
              ("node-proper-lockfile" ,node-proper-lockfile-4.1.2)
              ("node-papaparse" ,node-papaparse-5.4.1)
              ("node-open" ,node-open-8.4.2)
              ("node-node-forge" ,node-node-forge-1.3.1)
              ("node-node-fetch" ,node-node-fetch-2.6.12)
              ("node-multer" ,node-multer-1.4.5-lts.1)
              ("node-lunr" ,node-lunr-2.3.9)
              ("node-lowdb" ,node-lowdb-1.0.0)
              ("node-koa-json" ,node-koa-json-2.0.2)
              ("node-koa-bodyparser" ,node-koa-bodyparser-4.4.1)
              ("node-koa" ,node-koa-2.14.2)
              ("node-jszip" ,node-jszip-3.10.1)
              ("node-jsdom" ,node-jsdom-22.1.0)
              ("node-inquirer" ,node-inquirer-8.2.6)
              ("node-https-proxy-agent" ,node-https-proxy-agent-5.0.1)
              ("node-form-data" ,node-form-data-4.0.0)
              ("node-commander" ,node-commander-7.2.0)
              ("node-chalk" ,node-chalk-4.1.2)
              ("node-browser-hrtime" ,node-browser-hrtime-1.1.8)
              ("node-big-integer" ,node-big-integer-1.6.51)
              ("node-argon2" ,node-argon2-0.31.0)
              ("node-koa-router" ,node-koa-router-12.0.0)
              ("node-koa-multer" ,node-koa-multer-3.0.2)))
    (home-page "https://bitwarden.com")
    (synopsis "A secure and free password manager for all of your devices.")
    (description
     "A secure and free password manager for all of your devices.")
    (license license:gpl3)))

node-bitwarden-cli-2023.9.0
