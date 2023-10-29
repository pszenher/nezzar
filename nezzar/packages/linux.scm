(define-module (nezzar packages linux)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build utils)
  #:use-module (guix build-system copy)

  #:use-module ((gnu packages linux) #:select (acpid)))

(define-public laptop-mode-tools
  (package
    (name "laptop-mode-tools")
    (version "1.74")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/rickysarraf/laptop-mode-tools.git")
	     (commit version)))
       (file-name (git-file-name name version))
       (sha256
	(base32 "0qn845a48ps3kv46pnyj2sjsjpw52a7jh7lalgk8z85cz37yzd54"))))
    (build-system copy-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
	 (add-before 'install 'set-absolute-lmt-udev-path
	   (lambda* (#:key outputs #:allow-other-keys) 
	     (substitute* "etc/rules/99-laptop-mode.rules"
	       (("lmt-udev" cmd) (string-append
				  (assoc-ref outputs "out") "/libexec/" cmd))))))
       #:install-plan
       '(("usr/lib"   "lib"      )
	 ("usr/sbin"  "sbin"     )
	 ("usr/share" "share"    )
	 ("man"       "share/man")
	 ("Documentation" ,(string-append "share/doc/" name "-" version))

	 ("etc" "etc" #:exclude (".rules" "lmt-udev"))

	 ("README.Board-Specific" "etc/laptop-mode/conf.d/board-specific/")
	 ("etc/rules/" "lib/udev/rules.d"   #:include (".rules"))
	 ("etc/rules/lmt-udev"        "libexec/")
	 
	 ("gui/lmt-config-gui"        "sbin/")
	 ("gui/lmt-config-gui-pkexec" "sbin/")
	 
	 ("gui/" "share/laptop-mode-tools/" #:include (".py"     ))
	 ("gui/" "share/applications/"      #:include (".desktop"))
	 ("gui/" "share/pixmaps/"           #:include (".svg"    )))))
    (home-page "https://rickysarraf.github.io/laptop-mode-tools/")
    (synopsis "Laptop power savings tool for Linux")
    (description
     "Laptop Mode Tools is a laptop power saving package for Linux
systems. It is the primary way to enable the Laptop Mode feature of
the Linux kernel, which lets your hard drive spin down. In addition,
it allows you to tweak a number of other power-related settings using
a simple configuration file.

Combined with acpid and CPU frequency scaling, LMT provides most users
with a complete notebook power management suite.")
    (license license:gpl2)))

laptop-mode-tools
