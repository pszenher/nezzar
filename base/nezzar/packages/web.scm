(define-module (nezzar packages web)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (gnu packages llvm))

(define-public llvm-for-wasm
  (package
    (inherit llvm-18)
    (name "llvm-for-wasm")
    ;; (source (origin
    ;;           (method git-fetch)
    ;;           (uri (git-reference
    ;;                 (url "https://github.com/RadeonOpenCompute/llvm-project.git")
    ;;                 (commit (string-append "rocm-" version))))
    ;;           (file-name (git-file-name name version))
    ;;           (sha256
    ;;            (base32
    ;;             "1kg6q6aqijjrwaznj0gr3nd01gykrnqqnk8vz8wyfifr18l9jrgx"))))
    (arguments
     (substitute-keyword-arguments (package-arguments llvm-18)
       ((#:configure-flags flags)
        #~(list
	   "-DLLVM_ENABLE_PROJECTS=clang;lld"
           "-DLLVM_TARGETS_TO_BUILD=host;WebAssembly"
	   "-DLLVM_INCLUDE_TESTS=OFF"
           ;; "-DCMAKE_SKIP_BUILD_RPATH=FALSE"
           ;; "-DCMAKE_BUILD_WITH_INSTALL_RPATH=FALSE"
           ;; "-DBUILD_SHARED_LIBS:BOOL=TRUE"
           ;; "-DLLVM_VERSION_SUFFIX="
	   ))))
    (properties `((hidden? . #t) ,@
		  (package-properties llvm-18)))))

llvm-for-wasm
