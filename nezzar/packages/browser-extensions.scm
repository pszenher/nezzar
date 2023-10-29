(define-module (nezzar packages browser-extensions)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system node)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu build chromium-extension)
  #:use-module ((gnu packages node) #:select (node)))

(define-public bitwarden-browser
  (package
    (name "bitwarden-browser")
    (version "2023.9.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/bitwarden/clients.git")
	     (commit (string-append "browser-v" version))))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "0yvnp3zc2ajnn2ndgfq1q1rmrfjk017fag2nnnps1qd1m7bf7n5k"))))
    (native-inputs (list node))
    (build-system node-build-system)
    (home-page "https://github.com/bitwarden/clients")
    (synopsis "The Bitwarden browser extension is written using the Web Extension API and Angular.")
    (description "The Bitwarden browser extension is written using the Web Extension API and Angular.")
    (license license:gpl3)))

bitwarden-browser
