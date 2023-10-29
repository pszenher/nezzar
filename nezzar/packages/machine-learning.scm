(define-module (nezzar packages machine-learning)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system pyproject)

  #:use-module (gnu packages)
  #:use-module (gnu packages python))

(define-public rang
  (package
    (name "rang")
    (version "3.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/agauniyal/rang")
             (commit (string-append "v" version))))
       (file-name (string-append name "-" version))
       (sha256
	(base32
	 "0x2fp7zjjivgxblvx1j0qphn4ln6jq42x7xr757fywm3k03y7bil"))))
    (build-system cmake-build-system)
    (arguments '(#:tests? #f))
    (home-page "https://agauniyal.github.io/rang")
    (synopsis "A minimal, header-only modern C++ library for terminal goodies")
    (description "A minimal, header-only modern C++ library for terminal goodies")
    (license license:unlicense)))

(define-public dlpack
  (package
    (name "dlpack")
    (version "0.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dmlc/dlpack")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "1jmfvdrx8dn9b0ksm04ixha0jnrk35ip796qg98kfz6g7niw5ir1"))))
    (build-system cmake-build-system)
    (arguments `(#:tests? #f))
    (native-inputs
     (map specification->package
	  '("python")))
    (home-page "https://github.com/dmlc/dlpack")
    (synopsis "Common in-memory tensor structure")
    (description
     "DLPack is an open in-memory tensor structure for sharing tensors among frameworks. DLPack enables:  

@enumerate
@item Easier sharing of operators between deep learning frameworks.
@item Easier wrapping of vendor level operator implementations, allowing collaboration when introducing new devices/ops.
@item Quick swapping of backend implementations, like different version of BLAS
@end enumerate")
    (license license:asl2.0)))

(define-public tvm
  (package
    (name "tvm")
    (version "0.12.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/apache/tvm")
	     (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "0h26203sz1z7rxb12lfgzbwb9brfh61i3psjags0dqjz3wsb0s8f"))))
    (build-system cmake-build-system)
    (arguments `(#:tests? #f))
    (native-inputs
     (cons*
      dlpack
      rang
      (map specification->package
	   '("dmlc-core"
	     "libbacktrace"
	     "googletest"))))
    (home-page "https://tvm.apache.org")
    (synopsis "Open deep learning compiler stack for cpu, gpu and specialized accelerators")
    (description "Apache TVM is a compiler stack for deep learning systems. It is
designed to close the gap between the productivity-focused deep
learning frameworks, and the performance- and efficiency-focused
hardware backends. TVM works with deep learning frameworks to provide
end to end compilation to different backends.")
    (license license:asl2.0)))

(define-public python-tvm
  (package
    (inherit tvm)
    (name "python-tvm")
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
	  (add-after 'unpack 'chdir
	    (lambda _ (chdir "python")))
	  (add-after 'unpack 'patch-numpy-dep
	    ;; Patch incorrect numpy version restriction in
	    ;; gen_requirements.py
	    ;; 
	    ;; NOTE: only necessary if sanity-check phase is enabled,
	    ;; currently deleted due to build failure from other
	    ;; causes...
	    (lambda _
	      (substitute* "python/gen_requirements.py"
		(("\\(\"numpy\", \"<=1.23\"\\)") "(\"numpy\", \"<1.24\")"))))
	  (add-after 'chdir 'set-tvm-lib-path
	    (lambda _
              (setenv "TVM_LIBRARY_PATH"
		      #$(file-append tvm "/lib"))
	      ;; (setenv "TEST_DATA_ROOT_PATH" "/tmp/.tvm_test_data")
	      ))
	  ;; TODO: shouldn't need to delete this phase, running into
	  ;; issues w/ FS actions taking place during check b/c they
	  ;; are placed at top-level in some modules
	  ;; 
	  ;; (see p/t/c/download.py)
	  ;; 
	  (delete 'sanity-check))))
    (inputs (list tvm))
    (native-inputs (list (specification->package "git")))
    (propagated-inputs
     (map specification->package
	  '("python-numpy"
	    "python-decorator"
	    "python-attrs"
	    "python-tornado"
	    "python-scipy"
	    "python-psutil"
	    "python-cloudpickle"

	    "python-typing-extensions")))
    (synopsis "Python interface for TVM deep learning compiler stack")))

;;; TODO:
;; - inherit from tvm base equivalent when building unity
;; - add LLVM dependency, and enable at build time (needed for cpu accel)
;; - add Vulkan/gpu driver depenency, ensure detection at build time

(define-public tvm-unity
  (let ((commit "9a3bbc1d379888151b31f401a2552d1a9f1a25a4")
	(revision "0"))
    (package
      (name "tvm-unity")
      (version (git-version "0.0.0" revision commit))
      (source
       (origin
	 (method git-fetch)
	 (uri (git-reference
	       (url "https://github.com/apache/tvm")
	       (commit commit)))
	 (file-name (git-file-name name version))
	 (sha256
	  (base32
	   "15k89l22dl2ghcaapd47c2lf9zhs1lbd2k1waj03p7h2g9fmcxn3"))))
      (build-system cmake-build-system)
      (arguments `(#:tests? #f))
      (native-inputs
       (cons*
	dlpack
	rang
	(map specification->package
	     '("dmlc-core"
	       "libbacktrace"
	       "googletest"))))
      (home-page "https://tvm.apache.org")
      (synopsis "TVM compiler stack w/ experimentail Unity implementation effort")
      (description "Apache TVM is a compiler stack for deep learning systems. It is
designed to close the gap between the productivity-focused deep
learning frameworks, and the performance- and efficiency-focused
hardware backends. TVM works with deep learning frameworks to provide
end to end compilation to different backends.")
      (license license:asl2.0))))

(define-public python-tvm-unity
  (package
    (inherit tvm-unity)
    (name "python-tvm-unity")
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
	  (add-after 'unpack 'chdir
	    (lambda _ (chdir "python")))
	  ;; (add-after 'unpack 'patch-numpy-dep
	  ;;   ;; Patch incorrect numpy version restriction in
	  ;;   ;; gen_requirements.py
	  ;;   ;; 
	  ;;   ;; NOTE: only necessary if sanity-check phase is enabled,
	  ;;   ;; currently deleted due to build failure from other
	  ;;   ;; causes...
	  ;;   (lambda _
	  ;;     (substitute* "python/gen_requirements.py"
	  ;; 	(("\\(\"numpy\", \"<=1.23\"\\)") "(\"numpy\", \"<1.24\")"))))
	  (add-after 'chdir 'set-tvm-lib-path
	    (lambda _
              (setenv "TVM_LIBRARY_PATH"
		      #$(file-append tvm-unity "/lib"))
	      ;; (setenv "TEST_DATA_ROOT_PATH" "/tmp/.tvm_test_data")
	      ))
	  ;; TODO: shouldn't need to delete this phase, running into
	  ;; issues w/ FS actions taking place during check b/c they
	  ;; are placed at top-level in some modules
	  ;; 
	  ;; (see p/t/c/download.py)
	  ;; 
	  (delete 'sanity-check))))
    (inputs (list tvm-unity))
    (native-inputs (list (specification->package "git")))
    (propagated-inputs
     (map specification->package
	  '("python-numpy"
	    "python-decorator"
	    "python-attrs"
	    "python-tornado"
	    "python-scipy"
	    "python-psutil"
	    "python-cloudpickle"

	    "python-typing-extensions")))
    (synopsis "Python interface for TVM deep learning compiler stack (w/ Unity support)")))

;; (define-public
;;   (package
;;     (name "mlc-llm")
;;     (version "0.1.dev0")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/mlc-ai/mlc-llm")
;;              (commit (string-append "v" version))))
;;        (file-name (git-file-name name version))
;;        (sha256
;; 	(base32
;; 	 "1d32j4cw5ld69zk7wxyf1h0ni0crnscnk1fwm16vpjak4vcdhjfj"))))
;;     (build-system cmake-build-system)))

python-tvm-unity
