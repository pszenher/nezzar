(define-module (nezzar packages ruby)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system ruby)
  #:use-module ((guix licenses) #:prefix license:)

  #:use-module (gnu packages ruby))

(define-public ruby-licensee
  (package
    (name "ruby-licensee")
    (version "9.17.1")
    (source
     (origin
       (method url-fetch)
       (uri (rubygems-uri "licensee" version))
       (sha256
        (base32 "16h8yhk4z2wk2lc0l0m7z2pbbk6mfljhy6hp11dx6lw8dp325q0b"))))
    (build-system ruby-build-system)
    (propagated-inputs (list ruby-dotenv ruby-octokit ruby-reverse-markdown
                             ruby-rugged ruby-thor))
    (arguments '(#:tests? #f))		; tests use rspec
    (synopsis "A Ruby Gem to detect under what license a project is distributed.")
    (description
     "Licensee automates the process of reading LICENSE files and compares their
contents to known licenses using a fancy maths.")
    (home-page "https://github.com/benbalter/licensee")
    (license license:expat)))
