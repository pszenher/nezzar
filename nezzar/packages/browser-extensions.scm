(define-module (nezzar packages browser-extensions)
  #:use-module (srfi srfi-26)
  
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)

  #:use-module (guix build-system gnu))

(define (make-piroor-webextension-lib name commit hash license)
  (let ((full-name (string-append "webextensions-lib-" name)))
    (list
     full-name
     (origin
       (method git-fetch)
       (file-name (git-file-name (string-append "piroor" full-name) commit))
       (uri (git-reference
	     (url (string-append "https://github.com/piroor/" full-name ".git"))
	     (commit commit)))
       (sha256 (base32 hash))))))

(define piroor-webextensions-libs
  ;; <0: name> <1: commit> <2: guix hash> <3: license>
  `(("configs"
     "2ac38cbcfa43e09a9d8ec7664b5950463cbb27d0"
     "11jfyk9n6dvhpnzhczg1np582biax8rc0v2413ri6wvwaclbbxi3"
     ,license:expat)
    ("dom-updater"
     "a51e5b7c44f3b228570f35783b2db5c93f75ed97"
     "1d5i3anmcp4rdrbi4dj9cgk2l99fggswywv1nal7z8djyf6bm11m"
     ,license:expat)
    ("event-listener-manager"
     "0be78e7d08d8f6146b27e9cdbaac7d0763783467"
     "1agv667di7kqg33bi397cpyavcqnd7v05xjb81m0wrv732svz7vb"
     ,license:expat)
    ("l10n"
     "43e2af40aa4586676347583e8d0e5ace6cb96654"
     "0yd5qw1ymhg30vi2biv3h8rgysnqcj5xg5gw8czds006gmiz15yj"
     ,license:expat)
    ("menu-ui"
     "7577b9a25778cbec947d841134adda0803d137f4"
     "1n1gi1q5gh8ap39qg1na4w97xm08k583mlr60lnsafkcv3arswxl"
     ,license:expat)
    ("options"
     "b03ddb11384d6c655b8729cc4ced7b27a8a38542"
     "1g0nqmv8idy3i135f04q89mlpsqnp79s38sxqvkpc7d3g2xwzawj"
     ,license:expat)
    ("placeholder-parser"
     "4230e82ad5433479eedda9aa76d6822d76c42a04"
     "0izzjg1m5rscn6wbrndgsrl36qjzllc5ipwdjzgm21nj2lsjp85s"
     ,license:expat)
    ("rich-confirm"
     "fb089f3b49d046e1a9e96f88b8eaeeea673bdb66"
     "0rl3pkp2ghbvrxyq1xjzhibjhjcklsp4s98qx72bwq6h97s9b5ls"
     ,license:expat)
    ("tab-favicon-helper"
     "0a15d662a429939c915bab0539bd73f628f1ac42"
     "1r5kxkhm9pg0mai3sxbqflbdsfiapvj17giphn81zdjzlzjn3ban"
     ,license:mpl2.0)))

(define treestyletab
  (package
    (name "treestyletab")
    (version "3.9.17")
    (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/piroor/treestyletab.git")
		    (commit version)))
	      (file-name (git-file-name name version))
	      (sha256
	       (base32
		"1ig9rvzrqa56sfhdhmii664kxr1362rhyxc7wz1ka91ppfr129m4"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:phases
      `(modify-phases %standard-phases
	 (delete 'configure)
	 (add-after 'unpack 'disable-submodule-and-linting
	   (lambda _
	     (substitute* "webextensions/Makefile"
	       (("(xpi: )init_extlib (install_extlib) lint" _ pre suf)
		(string-append pre suf))
	       (("(install_extlib:) install_dependency" _ pre) pre))))
	 (add-before 'build 'purge-submodule-dir
	   (lambda _
	     (begin (delete-file-recursively "submodules")
		    (mkdir "submodules"))))
	 (add-before 'build 'link-submodule-origins
	   (lambda* (#:key inputs #:allow-other-keys)
	     (begin
	       (for-each (lambda (lib)
			   (display lib) (newline)
			   (when (string-prefix?
				  "webextensions-lib-"
				  (car lib))
			     (copy-recursively
			      (cdr lib) (string-append "submodules/" (car lib)))))
			 inputs)
	       (for-each make-file-writable
			 (find-files "submodules"))))))))
    (native-inputs
     `(,@(map (cut apply make-piroor-webextension-lib <>)
	      piroor-webextensions-libs)))
    (home-page "http://piro.sakura.ne.jp/xul/treestyletab/")
    (properties '((addon-id . "treestyletab@piro.sakura.ne.jp")))
    (synopsis "Tree Style Tab, Show tabs like a tree.")
    (description "Tree Style Tab is a browser extension which provides 
the ability to work with tabs as 'trees'.  New tabs opened from the
current tab are automatically organized as 'children' of the current
tab.  Such 'branches' are easily folded (collapsed) by clicking on the
arrow shown in the 'parent' tab, so you no longer need to suffer from
too many visible tabs.  If you want, you can restructure the tree via
drag and drop.")
    (license
     (list license:mpl2.0 license:mpl1.1 license:expat license:psfl))))

;;; TODO: requires node_modules folder initialized with codemirror and
;;;       codemirror-colorpicker npm packages...

treestyletab
