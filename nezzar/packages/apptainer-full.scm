(use-modules (guix packages)
	     (guix git-download)
	     (guix build-system go)
	     ((guix licenses) #:prefix license:))

(package
  (name "go-github-com-netflix-go-expect")
  (version "0.0.0-20220104043353-73e0943537d2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Netflix/go-expect")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0zkvhnc4ii6ygvcsj54ng0kql26rnny7l3hy1w61g88mxjsww1b9"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/Netflix/go-expect"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-creack-pty"
      ,go-github-com-creack-pty)))
  (home-page
   "https://github.com/Netflix/go-expect")
  (synopsis "go-expect")
  (description
   "Package expect provides an expect-like interface to automate control of\napplications.  It is unlike expect in that it does not spawn or manage process\nlifecycle.  This package only focuses on expecting output and sending input\nthrough it's psuedoterminal.")
  (license license:asl2.0))
(package
  (name "go-github-com-adigunhammedolalekan-registry-auth")
  (version "0.0.0-20200730122110-8cde180a3a60")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/adigunhammedolalekan/registry-auth")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0855a5c0ifi6q2ghb6gax0kwwra5j7pd2lplq4wp8r83dnv4vwj0"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/adigunhammedolalekan/registry-auth"))
  (propagated-inputs
   `(("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-gorilla-mux"
      ,go-github-com-gorilla-mux)
     ("go-github-com-docker-libtrust"
      ,go-github-com-docker-libtrust)
     ("go-github-com-docker-distribution"
      ,go-github-com-docker-distribution)))
  (home-page
   "https://github.com/adigunhammedolalekan/registry-auth")
  (synopsis "registry-auth")
  (description
   "a package to implements docker registry token authentication server as described\nhere\n[https://github.com/docker/distribution/blob/1b9ab303a477ded9bdd3fc97e9119fa8f9e58fca/docs/spec/auth/index.md]")
  (license license:expat))
(package
  (name "go-github-com-apptainer-container-key-client")
  (version "0.8.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/apptainer/container-key-client")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0q7ds2i7m72wy894ankm5cf5vnn2krmrhhsj07p6chqi6fdpmcgg"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/apptainer/container-key-client"))
  (propagated-inputs
   `(("go-github-com-sylabs-json-resp"
      ,go-github-com-sylabs-json-resp)))
  (home-page
   "https://github.com/apptainer/container-key-client")
  (synopsis "Container Key Client")
  (description
   "This project provides a Go client to Apptainer for key storage and retrieval\nusing the HKP protocol.  Forked from\n@url{https://github.com/sylabs/scs-key-client,sylabs/scs-key-client}.")
  (license license:bsd-3))
(package
  (name "go-github-com-apptainer-container-library-client")
  (version "1.3.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/apptainer/container-library-client")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0w9vcn7zzvdbxbca959cc9418iysnbs1s7pv46mr3cvpg3ln3a2d"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/apptainer/container-library-client"))
  (propagated-inputs
   `(("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-github-com-sylabs-json-resp"
      ,go-github-com-sylabs-json-resp)
     ("go-github-com-go-log-log"
      ,go-github-com-go-log-log)
     ("go-github-com-blang-semver-v4"
      ,go-github-com-blang-semver-v4)))
  (home-page
   "https://github.com/apptainer/container-library-client")
  (synopsis "Container Library Client")
  (description
   "This project provides a Go client to Apptainer for the container library.\nForked from\n@url{https://github.com/sylabs/scs-library-client,sylabs/scs-library-client}.")
  (license license:bsd-3))
(package
  (name "go-github-com-go-git-go-git-fixtures-v4")
  (version "4.3.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-git/go-git-fixtures")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1d6qs2mzbhz95aflpjh6ijywvb4ys73jvk2v30mickax3gmm2vlw"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/go-git/go-git-fixtures/v4"))
  (propagated-inputs
   `(("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-go-git-go-billy-v5"
      ,go-github-com-go-git-go-billy-v5)))
  (home-page
   "https://github.com/go-git/go-git-fixtures")
  (synopsis "go-git-fixtures")
  (description
   "git repository fixtures used by @url{https://github.com/go-git/go-git,go-git}")
  (license license:asl2.0))
(package
  (name "go-github-com-go-git-go-git-v5")
  (version "5.4.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-git/go-git")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "08kdknkrh9qks8qykmd1hmc573cb6qbb4b10f57k3kik4ygq2frj"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-git/go-git/v5"))
  (propagated-inputs
   `(("go-gopkg-in-warnings-v0"
      ,go-gopkg-in-warnings-v0)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-xanzy-ssh-agent"
      ,go-github-com-xanzy-ssh-agent)
     ("go-github-com-sergi-go-diff"
      ,go-github-com-sergi-go-diff)
     ("go-github-com-mitchellh-go-homedir"
      ,go-github-com-mitchellh-go-homedir)
     ("go-github-com-kevinburke-ssh-config"
      ,go-github-com-kevinburke-ssh-config)
     ("go-github-com-jessevdk-go-flags"
      ,go-github-com-jessevdk-go-flags)
     ("go-github-com-jbenet-go-context"
      ,go-github-com-jbenet-go-context)
     ("go-github-com-imdario-mergo"
      ,go-github-com-imdario-mergo)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-go-git-go-git-fixtures-v4"
      ,go-github-com-go-git-go-git-fixtures-v4)
     ("go-github-com-go-git-go-billy-v5"
      ,go-github-com-go-git-go-billy-v5)
     ("go-github-com-go-git-gcfg"
      ,go-github-com-go-git-gcfg)
     ("go-github-com-gliderlabs-ssh"
      ,go-github-com-gliderlabs-ssh)
     ("go-github-com-flynn-go-shlex"
      ,go-github-com-flynn-go-shlex)
     ("go-github-com-emirpasic-gods"
      ,go-github-com-emirpasic-gods)
     ("go-github-com-armon-go-socks5"
      ,go-github-com-armon-go-socks5)
     ("go-github-com-anmitsu-go-shlex"
      ,go-github-com-anmitsu-go-shlex)
     ("go-github-com-acomagu-bufpipe"
      ,go-github-com-acomagu-bufpipe)
     ("go-github-com-protonmail-go-crypto"
      ,go-github-com-protonmail-go-crypto)
     ("go-github-com-microsoft-go-winio"
      ,go-github-com-microsoft-go-winio)))
  (home-page "https://github.com/go-git/go-git")
  (synopsis "Project Status")
  (description
   "This package provides a highly extensible git implementation in pure Go.")
  (license license:asl2.0))
(package
  (name "go-github-com-matryer-is")
  (version "1.4.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/matryer/is")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0bs452ba2qh2a9ir7r8ixpf2slc6vpyg0041v9kn5c0d1zbb5wsc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/matryer/is"))
  (home-page "https://github.com/matryer/is")
  (synopsis "is")
  (description
   "Package is provides a lightweight extension to the standard library's testing\ncapabilities.")
  (license license:expat))
(package
  (name "go-github-com-acomagu-bufpipe")
  (version "1.0.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/acomagu/bufpipe")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1a74sh8g3wmigxx2i0jcpysd46509ll4fw626wfzwrlrbbd1z144"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/acomagu/bufpipe"))
  (propagated-inputs
   `(("go-github-com-matryer-is"
      ,go-github-com-matryer-is)))
  (home-page "https://github.com/acomagu/bufpipe")
  (synopsis #f)
  (description #f)
  (license #f))
(package
  (name "go-github-com-go-git-go-billy-v5")
  (version "5.3.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-git/go-billy")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0x5z649f47lwsqw8578a5hvgjaxp0zz6cg184s0n68xdqhza3m2i"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-git/go-billy/v5"))
  (propagated-inputs
   `(("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-niemeyer-pretty"
      ,go-github-com-niemeyer-pretty)
     ("go-github-com-kr-text" ,go-github-com-kr-text)))
  (home-page "https://github.com/go-git/go-billy")
  (synopsis "go-billy")
  (description
   "The missing interface filesystem abstraction for Go.  Billy implements an\ninterface based on the @code{os} standard library, allowing to develop\napplications without dependency on the underlying storage.  Makes it virtually\nfree to implement mocks and testing over filesystem operations.")
  (license license:asl2.0))
(package
  (name "go-github-com-apptainer-sif-v2")
  (version "2.7.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/apptainer/sif")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1k105l1hf4d7klf7g56hqwzd75kxk0j253r76s4vw8cm35yf6j7n"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/apptainer/sif/v2"))
  (propagated-inputs
   `(("go-gopkg-in-warnings-v0"
      ,go-gopkg-in-warnings-v0)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-xanzy-ssh-agent"
      ,go-github-com-xanzy-ssh-agent)
     ("go-github-com-sergi-go-diff"
      ,go-github-com-sergi-go-diff)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-mitchellh-go-homedir"
      ,go-github-com-mitchellh-go-homedir)
     ("go-github-com-kevinburke-ssh-config"
      ,go-github-com-kevinburke-ssh-config)
     ("go-github-com-jbenet-go-context"
      ,go-github-com-jbenet-go-context)
     ("go-github-com-inconshreveable-mousetrap"
      ,go-github-com-inconshreveable-mousetrap)
     ("go-github-com-imdario-mergo"
      ,go-github-com-imdario-mergo)
     ("go-github-com-hashicorp-errwrap"
      ,go-github-com-hashicorp-errwrap)
     ("go-github-com-go-git-go-billy-v5"
      ,go-github-com-go-git-go-billy-v5)
     ("go-github-com-go-git-gcfg"
      ,go-github-com-go-git-gcfg)
     ("go-github-com-emirpasic-gods"
      ,go-github-com-emirpasic-gods)
     ("go-github-com-acomagu-bufpipe"
      ,go-github-com-acomagu-bufpipe)
     ("go-github-com-microsoft-go-winio"
      ,go-github-com-microsoft-go-winio)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-sebdah-goldie-v2"
      ,go-github-com-sebdah-goldie-v2)
     ("go-github-com-hashicorp-go-multierror"
      ,go-github-com-hashicorp-go-multierror)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-go-git-go-git-v5"
      ,go-github-com-go-git-go-git-v5)
     ("go-github-com-blang-semver-v4"
      ,go-github-com-blang-semver-v4)
     ("go-github-com-protonmail-go-crypto"
      ,go-github-com-protonmail-go-crypto)))
  (home-page "https://github.com/apptainer/sif")
  (synopsis "The Singularity Image Format (SIF)")
  (description
   "This module contains an open source implementation of the Singularity Image\nFormat (SIF) that makes it easy to create complete and encapsulated container\nenvironments stored in a single file.")
  (license license:bsd-3))
(package
  (name "go-github-com-manifoldco-promptui")
  (version "0.9.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/manifoldco/promptui")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1nnlj1ahwq4ar5gbvxg8dqjl1wl5r8mhcm0bixg1c4wiihz8xv8m"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/manifoldco/promptui"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-chzyer-test"
      ,go-github-com-chzyer-test)
     ("go-github-com-chzyer-readline"
      ,go-github-com-chzyer-readline)
     ("go-github-com-chzyer-logex"
      ,go-github-com-chzyer-logex)))
  (home-page
   "https://github.com/manifoldco/promptui")
  (synopsis "promptui")
  (description
   "Package promptui is a library providing a simple interface to create\ncommand-line prompts for go.  It can be easily integrated into spf13/cobra,\nurfave/cli or any cli go application.")
  (license license:bsd-3))
(package
  (name "go-github-com-ostreedev-ostree-go")
  (version "0.0.0-20210805093236-719684c64e4f")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ostreedev/ostree-go")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "039pf8fdjlnma02m5ymj92m3j5w9pr950qkc7977lw2bjmw95g69"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/ostreedev/ostree-go"))
  (home-page
   "https://github.com/ostreedev/ostree-go")
  (synopsis "OSTree-Go")
  (description
   "Go bindings for OSTree.  Find out more about OSTree\n@url{https://github.com/ostreedev/ostree,here}")
  (license license:isc))
(package
  (name "go-github-com-protonmail-go-crypto")
  (version "0.0.0-20220824120805-4b6e5c587895")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ProtonMail/go-crypto")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1ih16krilgd9nsnvzyfszc1wfzcprm0rd0bgl7ccnhlz6vhmcz1x"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/ProtonMail/go-crypto"))
  (propagated-inputs
   `(("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-cloudflare-circl"
      ,go-github-com-cloudflare-circl)))
  (home-page
   "https://github.com/ProtonMail/go-crypto")
  (synopsis #f)
  (description
   "This module is backwards compatible with x/crypto/openpgp, so you can simply\nreplace all imports of @code{golang.org/x/crypto/openpgp} with\n@code{github.com/ProtonMail/go-crypto/openpgp}.")
  (license license:bsd-3))
(package
  (name "go-github-com-sebdah-goldie-v2")
  (version "2.5.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/sebdah/goldie")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "12gji9p6b6zlkisbd3ww103zwd5chlwkb6h5dppfrmgxim84n5n0"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/sebdah/goldie/v2"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-sergi-go-diff"
      ,go-github-com-sergi-go-diff)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)))
  (home-page "https://github.com/sebdah/goldie")
  (synopsis "goldie - Golden test utility for Go")
  (description
   "Package goldie provides test assertions based on golden files.  It's typically\nused for testing responses with larger data bodies.")
  (license license:expat))
(package
  (name "go-github-com-bwesterb-go-ristretto")
  (version "1.2.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/bwesterb/go-ristretto")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0rca79cl5fdvvhii40scvkymvxhsr8qh4cahbqqiqcflzj3pqzc8"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/bwesterb/go-ristretto"))
  (home-page
   "https://github.com/bwesterb/go-ristretto")
  (synopsis "go-ristretto")
  (description
   "Pure Go implementation of the Ristretto prime-order group built from the Edwards\ncurve Edwards25519.")
  (license license:expat))
(package
  (name "go-github-com-cloudflare-circl")
  (version "1.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/cloudflare/circl")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0m40zgap689ayialwn5av7awiannlxbcj7n9ijaymfc89wikhf8v"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/cloudflare/circl"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-bwesterb-go-ristretto"
      ,go-github-com-bwesterb-go-ristretto)))
  (home-page "https://github.com/cloudflare/circl")
  (synopsis "CIRCL")
  (description
   "Package circl provides a collection of cryptographic primitives.  The goal of\nthis module is to be used as a tool for experimental deployment of cryptographic\nalgorithms targeting Post-Quantum (PQ) and Elliptic Curve Cryptography (ECC).")
  (license license:bsd-3))
(package
  (name "go-github-com-sylabs-sif-v2")
  (version "2.8.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/sylabs/sif")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0k0xc62vhgmfffq7vvxfrlshin2vkllj3l7la4ylix1xwfgdlshv"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/sylabs/sif/v2"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-sergi-go-diff"
      ,go-github-com-sergi-go-diff)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-inconshreveable-mousetrap"
      ,go-github-com-inconshreveable-mousetrap)
     ("go-github-com-cloudflare-circl"
      ,go-github-com-cloudflare-circl)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-sebdah-goldie-v2"
      ,go-github-com-sebdah-goldie-v2)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-protonmail-go-crypto"
      ,go-github-com-protonmail-go-crypto)))
  (home-page "https://github.com/sylabs/sif")
  (synopsis "The Singularity Image Format (SIF)")
  (description
   "This module contains an open source implementation of the Singularity Image\nFormat (SIF) that makes it easy to create complete and encapsulated container\nenvironments stored in a single file.")
  (license license:bsd-3))
(package
  (name "go-github-com-14rcole-gopopulate")
  (version "0.0.0-20180821133914-b175b219e774")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/14rcole/gopopulate")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0rrrwsmjvkswn3mrdm03q53sl6r9y00galv83lcm7b789m9a6abf"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/14rcole/gopopulate"))
  (home-page
   "https://github.com/14rcole/gopopulate")
  (synopsis "gopopulate")
  (description #f)
  (license license:expat))
(package
  (name "go-github-com-containers-image-v5")
  (version "5.22.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containers/image")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0b1p2nsy0j8bjjv4y0z3laasld9vp1lw3q9ibi57bgk06n08fvis"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/containers/image/v5"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-square-go-jose-v2"
      ,go-gopkg-in-square-go-jose-v2)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-go-mozilla-org-pkcs7"
      ,go-go-mozilla-org-pkcs7)
     ("go-github-com-xeipuuv-gojsonreference"
      ,go-github-com-xeipuuv-gojsonreference)
     ("go-github-com-xeipuuv-gojsonpointer"
      ,go-github-com-xeipuuv-gojsonpointer)
     ("go-github-com-titanous-rocacheck"
      ,go-github-com-titanous-rocacheck)
     ("go-github-com-tchap-go-patricia"
      ,go-github-com-tchap-go-patricia)
     ("go-github-com-syndtr-gocapability"
      ,go-github-com-syndtr-gocapability)
     ("go-github-com-stefanberger-go-pkcs11uri"
      ,go-github-com-stefanberger-go-pkcs11uri)
     ("go-github-com-rivo-uniseg"
      ,go-github-com-rivo-uniseg)
     ("go-github-com-prometheus-procfs"
      ,go-github-com-prometheus-procfs)
     ("go-github-com-prometheus-common"
      ,go-github-com-prometheus-common)
     ("go-github-com-prometheus-client-model"
      ,go-github-com-prometheus-client-model)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-opencontainers-runtime-spec"
      ,go-github-com-opencontainers-runtime-spec)
     ("go-github-com-opencontainers-runc"
      ,go-github-com-opencontainers-runc)
     ("go-github-com-modern-go-reflect2"
      ,go-github-com-modern-go-reflect2)
     ("go-github-com-modern-go-concurrent"
      ,go-github-com-modern-go-concurrent)
     ("go-github-com-moby-sys-mountinfo"
      ,go-github-com-moby-sys-mountinfo)
     ("go-github-com-mistifyio-go-zfs"
      ,go-github-com-mistifyio-go-zfs)
     ("go-github-com-miekg-pkcs11"
      ,go-github-com-miekg-pkcs11)
     ("go-github-com-matttproud-golang-protobuf-extensions"
      ,go-github-com-matttproud-golang-protobuf-extensions)
     ("go-github-com-mattn-go-shellwords"
      ,go-github-com-mattn-go-shellwords)
     ("go-github-com-mattn-go-runewidth"
      ,go-github-com-mattn-go-runewidth)
     ("go-github-com-letsencrypt-boulder"
      ,go-github-com-letsencrypt-boulder)
     ("go-github-com-json-iterator-go"
      ,go-github-com-json-iterator-go)
     ("go-github-com-hashicorp-errwrap"
      ,go-github-com-hashicorp-errwrap)
     ("go-github-com-gorilla-mux"
      ,go-github-com-gorilla-mux)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-google-go-intervals"
      ,go-github-com-google-go-intervals)
     ("go-github-com-google-go-containerregistry"
      ,go-github-com-google-go-containerregistry)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-docker-libtrust"
      ,go-github-com-docker-libtrust)
     ("go-github-com-docker-go-units"
      ,go-github-com-docker-go-units)
     ("go-github-com-docker-go-metrics"
      ,go-github-com-docker-go-metrics)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-cyphar-filepath-securejoin"
      ,go-github-com-cyphar-filepath-securejoin)
     ("go-github-com-containerd-stargz-snapshotter-estargz"
      ,go-github-com-containerd-stargz-snapshotter-estargz)
     ("go-github-com-containerd-cgroups"
      ,go-github-com-containerd-cgroups)
     ("go-github-com-chzyer-readline"
      ,go-github-com-chzyer-readline)
     ("go-github-com-cespare-xxhash-v2"
      ,go-github-com-cespare-xxhash-v2)
     ("go-github-com-beorn7-perks"
      ,go-github-com-beorn7-perks)
     ("go-github-com-acarl005-stripansi"
      ,go-github-com-acarl005-stripansi)
     ("go-github-com-vividcortex-ewma"
      ,go-github-com-vividcortex-ewma)
     ("go-github-com-microsoft-hcsshim"
      ,go-github-com-microsoft-hcsshim)
     ("go-github-com-microsoft-go-winio"
      ,go-github-com-microsoft-go-winio)
     ("go-github-com-14rcole-gopopulate"
      ,go-github-com-14rcole-gopopulate)
     ("go-golang-org-x-term" ,go-golang-org-x-term)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-go-etcd-io-bbolt" ,go-go-etcd-io-bbolt)
     ("go-github-com-xeipuuv-gojsonschema"
      ,go-github-com-xeipuuv-gojsonschema)
     ("go-github-com-vbauerster-mpb-v7"
      ,go-github-com-vbauerster-mpb-v7)
     ("go-github-com-vbatts-tar-split"
      ,go-github-com-vbatts-tar-split)
     ("go-github-com-ulikunitz-xz"
      ,go-github-com-ulikunitz-xz)
     ("go-github-com-theupdateframework-go-tuf"
      ,go-github-com-theupdateframework-go-tuf)
     ("go-github-com-sylabs-sif-v2"
      ,go-github-com-sylabs-sif-v2)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-sigstore-sigstore"
      ,go-github-com-sigstore-sigstore)
     ("go-github-com-proglottis-gpgme"
      ,go-github-com-proglottis-gpgme)
     ("go-github-com-ostreedev-ostree-go"
      ,go-github-com-ostreedev-ostree-go)
     ("go-github-com-opencontainers-selinux"
      ,go-github-com-opencontainers-selinux)
     ("go-github-com-opencontainers-image-spec"
      ,go-github-com-opencontainers-image-spec)
     ("go-github-com-opencontainers-go-digest"
      ,go-github-com-opencontainers-go-digest)
     ("go-github-com-manifoldco-promptui"
      ,go-github-com-manifoldco-promptui)
     ("go-github-com-klauspost-pgzip"
      ,go-github-com-klauspost-pgzip)
     ("go-github-com-klauspost-compress"
      ,go-github-com-klauspost-compress)
     ("go-github-com-imdario-mergo"
      ,go-github-com-imdario-mergo)
     ("go-github-com-hashicorp-go-multierror"
      ,go-github-com-hashicorp-go-multierror)
     ("go-github-com-ghodss-yaml"
      ,go-github-com-ghodss-yaml)
     ("go-github-com-docker-go-connections"
      ,go-github-com-docker-go-connections)
     ("go-github-com-docker-docker-credential-helpers"
      ,go-github-com-docker-docker-credential-helpers)
     ("go-github-com-docker-docker"
      ,go-github-com-docker-docker)
     ("go-github-com-docker-distribution"
      ,go-github-com-docker-distribution)
     ("go-github-com-containers-storage"
      ,go-github-com-containers-storage)
     ("go-github-com-containers-ocicrypt"
      ,go-github-com-containers-ocicrypt)
     ("go-github-com-containers-libtrust"
      ,go-github-com-containers-libtrust)
     ("go-github-com-burntsushi-toml"
      ,go-github-com-burntsushi-toml)))
  (home-page "https://github.com/containers/image")
  (synopsis "")
  (description
   "The package image provides libraries and commands to interact with container\nimages.")
  (license license:asl2.0))
(package
  (name "go-github-com-go-log-log")
  (version "0.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-log/log")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1idnqv4yvkmdh3wcsgvhcpak9z6ix8dsifdjq5kfbbnskdq5rmvg"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-log/log"))
  (home-page "https://github.com/go-log/log")
  (synopsis "Log")
  (description
   "Package log provides a log interface")
  (license license:expat))
(package
  (name "go-github-com-gosimple-slug")
  (version "1.12.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gosimple/slug")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "15gk6hdd8kjfl0srlf3gnjq34m64as1s6pjv7paaxd1zvrcml46y"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gosimple/slug"))
  (propagated-inputs
   `(("go-github-com-gosimple-unidecode"
      ,go-github-com-gosimple-unidecode)))
  (home-page "https://github.com/gosimple/slug")
  (synopsis "slug")
  (description
   "Package slug generate slug from unicode string, URL-friendly slugify with\nmultiple languages support.")
  (license license:mpl2.0))
(package
  (name "go-github-com-apex-logs")
  (version "1.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/apex/logs")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0dm4bqwnjlb5xgpym3qwmn3gxr05p29fjd6i8vdbc34cj6lyc35h"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/apex/logs"))
  (propagated-inputs
   `(("go-github-com-tj-assert"
      ,go-github-com-tj-assert)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page "https://github.com/apex/logs")
  (synopsis "Example")
  (description
   "Go client for @url{https://apex.sh/logs/,Apex Logs}.")
  (license license:expat))
(package
  (name "go-github-com-aphistic-golf")
  (version "0.0.0-20180712155816-02c07f170c5a")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aphistic/golf")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1qixab9bb29wqbr4nc5j3g25hq1j7am93f181rkj7a4qacncx763"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/aphistic/golf"))
  (home-page "https://github.com/aphistic/golf")
  (synopsis "golf")
  (description
   "This package provides logging capabilities using the GELF\n(@url{https://www.graylog.org/resources/gelf-2/,https://www.graylog.org/resources/gelf-2/})\nlog format")
  (license license:expat))
(package
  (name "go-github-com-aphistic-sweet")
  (version "0.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aphistic/sweet")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1irr6gdy2dj6ysla84rhk2lhn8i00yzn0gq6q7mqpx3rka5lxrv2"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/aphistic/sweet"))
  (propagated-inputs
   `(("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-sergi-go-diff"
      ,go-github-com-sergi-go-diff)
     ("go-github-com-onsi-gomega"
      ,go-github-com-onsi-gomega)
     ("go-github-com-mgutz-ansi"
      ,go-github-com-mgutz-ansi)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)))
  (home-page "https://github.com/aphistic/sweet")
  (synopsis "sweet")
  (description
   "Sweet is a pluggable test runner capable of hooking into standard Go tests.  It\nattempts to provide access to the standard Go test tool as close as possible\nwhile adding support for test suites and plugins that can hook into test results\nto add additional functionality.")
  (license license:expat))
(package
  (name "go-github-com-aybabtme-rgbterm")
  (version "0.0.0-20170906152045-cc83f3b3ce59")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aybabtme/rgbterm")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0wvmxvjn64968ikvnxrflb1x8rlcwzpfl53fzbxff2axbx9lq50q"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/aybabtme/rgbterm"))
  (home-page "https://github.com/aybabtme/rgbterm")
  (synopsis "RGB terminal")
  (description
   "Package rgbterm colorizes bytes and strings using RGB colors, for a full range\nof pretty terminal strings.")
  (license (license:non-copyleft "file://LICENSE")))
(package
  (name "go-github-com-smartystreets-go-aws-auth")
  (version "0.0.0-20180515143844-0c1422d1fdb9")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/smarty-archives/go-aws-auth")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0krfdpgn3gfii1z9fi8ydfw0wwfqyvp6w3rji7w92m528zkjl93d"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/smartystreets/go-aws-auth"))
  (home-page
   "https://github.com/smartystreets/go-aws-auth")
  (synopsis "go-aws-auth")
  (description
   "Package awsauth implements AWS request signing using Signed Signature Version 2,\nSigned Signature Version 3, and Signed Signature Version 4.  Supports S3 and\nSTS.")
  (license license:expat))
(package
  (name "go-github-com-smartystreets-gunit")
  (version "1.4.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/smartystreets/gunit")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "12f9b15qf7qvnbbpc3lzz9vsyddwmw8nq7a2wamwh9k7g6gh3x8j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/smartystreets/gunit"))
  (home-page
   "https://github.com/smartystreets/gunit")
  (synopsis "gunit")
  (description
   "Package gunit provides \"testing\" package hooks and convenience functions for\nwriting tests in an xUnit style.  See the README file and the examples folder\nfor examples.")
  (license license:expat))
(package
  (name "go-github-com-tj-go-buffer")
  (version "1.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/tj/go-buffer")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0xs8dz8m5qy1n80qcpalvfzdjxdr7djmagmhp7mm87rmjkwn05lk"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/tj/go-buffer"))
  (propagated-inputs
   `(("go-github-com-tj-assert"
      ,go-github-com-tj-assert)))
  (home-page "https://github.com/tj/go-buffer")
  (synopsis "Buffer")
  (description
   "Package buffer provides a generic buffer or batching mechanism for flushing\nentries at a given size or interval, useful for cases such as batching log\nevents.")
  (license license:expat))
(package
  (name "go-github-com-tj-go-elastic")
  (version "0.0.0-20171221160941-36157cbbebc2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/tj/go-elastic")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1r94vc4hbfvqvjz74n4mvsw4dy3vbyzlivb90kyn8vn76a4wqk69"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/tj/go-elastic"))
  (home-page "https://github.com/tj/go-elastic")
  (synopsis "go-elastic")
  (description
   "Package elastic provides an Elasticsearch client with AWS sigv4 support.")
  (license license:expat))
(package
  (name "go-github-com-tj-go-kinesis")
  (version "0.0.0-20171128231115-08b17f58cb1b")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/tj/go-kinesis")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "108c6p5j6rhhc2cnc2v5368yfsw73y6lzlvz02vpvvjph8rhmld4"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/tj/go-kinesis"))
  (home-page "https://github.com/tj/go-kinesis")
  (synopsis "go-kinesis")
  (description
   "Package kinesis implements a batch producer built on top of the official AWS\nSDK.")
  (license license:expat))
(package
  (name "go-github-com-tj-go-spin")
  (version "1.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/tj/go-spin")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "11xr67991m5pwsy1dira3iwd0sr55vmn1cyjwmlqziw4bwpym64s"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/tj/go-spin"))
  (home-page "https://github.com/tj/go-spin")
  (synopsis #f)
  (description #f)
  (license #f))
(package
  (name "go-github-com-apex-log")
  (version "1.9.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/apex/log")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1ibqkncnb8wcwilg2kyfyl5541g69rg551iy6m61q6iwdn5vfhi2"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/apex/log"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-tj-go-spin"
      ,go-github-com-tj-go-spin)
     ("go-github-com-tj-go-kinesis"
      ,go-github-com-tj-go-kinesis)
     ("go-github-com-tj-go-elastic"
      ,go-github-com-tj-go-elastic)
     ("go-github-com-tj-go-buffer"
      ,go-github-com-tj-go-buffer)
     ("go-github-com-tj-assert"
      ,go-github-com-tj-assert)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-smartystreets-gunit"
      ,go-github-com-smartystreets-gunit)
     ("go-github-com-smartystreets-go-aws-auth"
      ,go-github-com-smartystreets-go-aws-auth)
     ("go-github-com-rogpeppe-fastuuid"
      ,go-github-com-rogpeppe-fastuuid)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)
     ("go-github-com-jpillora-backoff"
      ,go-github-com-jpillora-backoff)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-go-logfmt-logfmt"
      ,go-github-com-go-logfmt-logfmt)
     ("go-github-com-fatih-color"
      ,go-github-com-fatih-color)
     ("go-github-com-aybabtme-rgbterm"
      ,go-github-com-aybabtme-rgbterm)
     ("go-github-com-aws-aws-sdk-go"
      ,go-github-com-aws-aws-sdk-go)
     ("go-github-com-aphistic-sweet"
      ,go-github-com-aphistic-sweet)
     ("go-github-com-aphistic-golf"
      ,go-github-com-aphistic-golf)
     ("go-github-com-apex-logs"
      ,go-github-com-apex-logs)))
  (home-page "https://github.com/apex/log")
  (synopsis "Handlers")
  (description
   "Package log implements a simple structured logging API designed with few\nassumptions.  Designed for centralized logging solutions such as Kinesis which\nrequire encoding and decoding before fanning-out to handlers.")
  (license license:expat))
(package
  (name "go-github-com-tj-assert")
  (version "0.0.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/tj/assert")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1j5swk3fjq1h5fpqkipddz2ccnbidr7qrpm5dpdaflg9q5jnc673"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/tj/assert"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)))
  (home-page "https://github.com/tj/assert")
  (synopsis "assert")
  (description
   "Package assert implements the same assertions as the `assert` package but stops\ntest execution when a test fails.")
  (license license:expat))
(package
  (name "go-github-com-opencontainers-umoci")
  (version "0.4.7")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/opencontainers/umoci")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0in8kyi4jprvbm3zsl3risbjj8b0ma62yl3rq8rcvcgypx0mn7d4"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/opencontainers/umoci"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-vbatts-go-mtree"
      ,go-github-com-vbatts-go-mtree)
     ("go-github-com-urfave-cli"
      ,go-github-com-urfave-cli)
     ("go-github-com-tj-assert"
      ,go-github-com-tj-assert)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-rootless-containers-proto"
      ,go-github-com-rootless-containers-proto)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-opencontainers-runtime-spec"
      ,go-github-com-opencontainers-runtime-spec)
     ("go-github-com-opencontainers-runc"
      ,go-github-com-opencontainers-runc)
     ("go-github-com-opencontainers-image-spec"
      ,go-github-com-opencontainers-image-spec)
     ("go-github-com-opencontainers-go-digest"
      ,go-github-com-opencontainers-go-digest)
     ("go-github-com-niemeyer-pretty"
      ,go-github-com-niemeyer-pretty)
     ("go-github-com-mohae-deepcopy"
      ,go-github-com-mohae-deepcopy)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-kr-text" ,go-github-com-kr-text)
     ("go-github-com-klauspost-pgzip"
      ,go-github-com-klauspost-pgzip)
     ("go-github-com-klauspost-compress"
      ,go-github-com-klauspost-compress)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-docker-go-units"
      ,go-github-com-docker-go-units)
     ("go-github-com-cyphar-filepath-securejoin"
      ,go-github-com-cyphar-filepath-securejoin)
     ("go-github-com-cpuguy83-go-md2man-v2"
      ,go-github-com-cpuguy83-go-md2man-v2)
     ("go-github-com-apex-log"
      ,go-github-com-apex-log)
     ("go-github-com-adamkorcz-go-fuzz-headers"
      ,go-github-com-adamkorcz-go-fuzz-headers)))
  (home-page
   "https://github.com/opencontainers/umoci")
  (synopsis "Install")
  (description
   "@strong{u}moci @strong{m}odifies @strong{O}pen @strong{C}ontainer\n@strong{i}mages.")
  (license license:asl2.0))
(package
  (name "go-github-com-opencontainers-runtime-tools")
  (version "0.9.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/opencontainers/runtime-tools")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1pli3jb1rq9lkzzz83f7jw788vijg7x6ly3vgasdlwri7kiph1sa"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/opencontainers/runtime-tools"))
  (home-page
   "https://github.com/opencontainers/runtime-tools")
  (synopsis "oci-runtime-tool")
  (description
   "oci-runtime-tool is a collection of tools for working with the\n@url{https://github.com/opencontainers/runtime-spec,OCI runtime specification}.\nTo build from source code, runtime-tools requires Go 1.10.x or above.")
  (license license:asl2.0))
(package
  (name "go-github-com-seccomp-containers-golang")
  (version "0.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/seccomp/containers-golang")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0clrwdnmr131a65h66br57bsnr17i1s3kq9cc7ljrdaym57y6cfz"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/seccomp/containers-golang"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-xeipuuv-gojsonschema"
      ,go-github-com-xeipuuv-gojsonschema)
     ("go-github-com-syndtr-gocapability"
      ,go-github-com-syndtr-gocapability)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-seccomp-libseccomp-golang"
      ,go-github-com-seccomp-libseccomp-golang)
     ("go-github-com-opencontainers-selinux"
      ,go-github-com-opencontainers-selinux)
     ("go-github-com-opencontainers-runtime-tools"
      ,go-github-com-opencontainers-runtime-tools)
     ("go-github-com-opencontainers-runtime-spec"
      ,go-github-com-opencontainers-runtime-spec)
     ("go-github-com-hashicorp-go-multierror"
      ,go-github-com-hashicorp-go-multierror)
     ("go-github-com-blang-semver"
      ,go-github-com-blang-semver)))
  (home-page
   "https://github.com/seccomp/containers-golang")
  (synopsis "containers-golang")
  (description
   "@code{containers-golang} is a set of Go libraries used by container runtimes to\ngenerate and load seccomp mappings into the kernel.")
  (license license:asl2.0))
(package
  (name "go-github-com-sylabs-json-resp")
  (version "0.8.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/sylabs/json-resp")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1yqlyyrlx3r9hjh94syw51ji763bkf4wh266s5q1vz5iqqzxijnq"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/sylabs/json-resp"))
  (home-page "https://github.com/sylabs/json-resp")
  (synopsis "JSON Response")
  (description
   "The @code{json-resp} package contains a small set of functions that are used to\nmarshall and unmarshall response data and errors in JSON format.")
  (license license:bsd-3))
(package
  (name "go-github-com-vbauerster-mpb-v7")
  (version "7.5.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/vbauerster/mpb")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0z4q2f77vffxb43aijnj3j9ykaywd74k7f7w3ik5nlbzlrvbk3lb"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/vbauerster/mpb/v7"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-mattn-go-runewidth"
      ,go-github-com-mattn-go-runewidth)
     ("go-github-com-acarl005-stripansi"
      ,go-github-com-acarl005-stripansi)
     ("go-github-com-vividcortex-ewma"
      ,go-github-com-vividcortex-ewma)))
  (home-page "https://github.com/vbauerster/mpb")
  (synopsis "Multi Progress Bar")
  (description
   "Package mpb is a library for rendering progress bars in terminal applications.")
  (license license:unlicense))
(package
  (name "go-mvdan-cc-editorconfig")
  (version "0.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/mvdan/editorconfig")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1rav1rp8pi921gsffqr2wjdhbr12w81g31yv6iw4yb1zyh726qqg"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "mvdan.cc/editorconfig"))
  (home-page "https://mvdan.cc/editorconfig")
  (synopsis "editorconfig")
  (description
   "Package editorconfig allows parsing and using EditorConfig files, as defined in\n@url{https://editorconfig.org/,https://editorconfig.org/}.")
  (license license:bsd-3))
(package
  (name "go-gopkg-in-errgo-v2")
  (version "2.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gopkg.in/errgo.v2")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "065mbihiy7q67wnql0bzl9y1kkvck5ivra68254zbih52jxwrgr2"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "gopkg.in/errgo.v2"
     #:unpack-path
     "gopkg.in/errgo.v2"))
  (propagated-inputs
   `(("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)))
  (home-page "https://gopkg.in/errgo.v2")
  (synopsis #f)
  (description
   "Package errgo provides some primitives for error creation and handling.")
  (license license:bsd-3))
(package
  (name "go-mvdan-cc-sh-v3")
  (version "3.5.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/mvdan/sh")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "09piikb12jhda36crjqcfhrgkr3m7w4lzbn3sjb7q0kl920lmwzx"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "mvdan.cc/sh/v3"
     #:unpack-path
     "mvdan.cc/sh/v3"))
  (propagated-inputs
   `(("go-gopkg-in-errgo-v2" ,go-gopkg-in-errgo-v2)
     ("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-github-com-kr-text" ,go-github-com-kr-text)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)
     ("go-mvdan-cc-editorconfig"
      ,go-mvdan-cc-editorconfig)
     ("go-golang-org-x-term" ,go-golang-org-x-term)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-github-com-rogpeppe-go-internal"
      ,go-github-com-rogpeppe-go-internal)
     ("go-github-com-pkg-diff"
      ,go-github-com-pkg-diff)
     ("go-github-com-google-renameio"
      ,go-github-com-google-renameio)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-frankban-quicktest"
      ,go-github-com-frankban-quicktest)
     ("go-github-com-creack-pty"
      ,go-github-com-creack-pty)))
  (home-page "https://mvdan.cc/sh/v3")
  (synopsis "sh")
  (description
   "This package provides a shell parser, formatter, and interpreter.  Supports\n@url{https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html,POSIX\nShell}, @url{https://www.gnu.org/software/bash/,Bash}, and\n@url{http://www.mirbsd.org/mksh.htm,mksh}.  Requires Go 1.17 or later.")
  (license license:bsd-3))
(package
  (name "go-github-com-uber-jaeger-client-go")
  (version "2.30.0+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jaegertracing/jaeger-client-go")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0nm4mi23bvk84418gkpl2wmijij4bnb082f5zv4ivrvcrp9lhkx3"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/uber/jaeger-client-go"))
  (home-page
   "https://github.com/uber/jaeger-client-go")
  (synopsis "🛑 This library is being deprecated!")
  (description
   "Package jaeger implements an OpenTracing\n(@url{http://opentracing.io,http://opentracing.io}) Tracer.")
  (license license:asl2.0))
(package
  (name "go-github-com-uber-jaeger-lib")
  (version "2.4.1+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jaegertracing/jaeger-lib")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "15871xzc7qs00yy5bv1gzdv4xlfws68bhb70m4k5p5n41060ppj0"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/uber/jaeger-lib"))
  (home-page "https://github.com/uber/jaeger-lib")
  (synopsis "jaeger-lib")
  (description
   "Package jaegerlib is a set of utilities shared by Jaeger backend and Jaeger Go\nClient.")
  (license license:asl2.0))
(package
  (name "go-github-com-denverdino-aliyungo")
  (version "0.0.0-20220905031958-589a058e1592")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/denverdino/aliyungo")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1ck0nmwkpxqfgifi71ispzhzfxi5d9j5ndhy0hgzfnn3kswwklfc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/denverdino/aliyungo"))
  (propagated-inputs
   `(("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-go-uber-org-atomic" ,go-go-uber-org-atomic)
     ("go-github-com-uber-jaeger-lib"
      ,go-github-com-uber-jaeger-lib)
     ("go-github-com-uber-jaeger-client-go"
      ,go-github-com-uber-jaeger-client-go)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-opentracing-opentracing-go"
      ,go-github-com-opentracing-opentracing-go)
     ("go-github-com-magiconair-properties"
      ,go-github-com-magiconair-properties)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)))
  (home-page
   "https://github.com/denverdino/aliyungo")
  (synopsis "AliyunGo: Go SDK for Aliyun Services")
  (description
   "This is an unofficial Go SDK for Aliyun services.  You are welcome for\ncontribution.")
  (license license:asl2.0))
(package
  (name "go-google-golang-org-cloud")
  (version "0.104.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1alcp8zmlx8jcb7d2qiqrcpyiljfn36702c3r3c6mhp6v34ax1h7"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "google.golang.org/cloud"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-googleapis-go-type-adapters"
      ,go-github-com-googleapis-go-type-adapters)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-iam"
      ,go-cloud-google-com-go-iam)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-google-martian-v3"
      ,go-github-com-google-martian-v3)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-cloud-google-com-go-storage"
      ,go-cloud-google-com-go-storage)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)))
  (home-page "https://google.golang.org/cloud")
  (synopsis "Google Cloud Client Libraries for Go")
  (description
   "Package cloud is the root of the packages used to access Google Cloud Services.\nSee\n@url{https://godoc.org/cloud.google.com/go,https://godoc.org/cloud.google.com/go}\nfor a full list of sub-packages.")
  (license license:asl2.0))
(package
  (name "go-github-com-bitly-go-simplejson")
  (version "0.5.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/bitly/go-simplejson")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0n9f9dz1jn1jx86d48569nznpjn9fmq3knn7r65xpy7jhih284jj"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/bitly/go-simplejson"))
  (home-page
   "https://github.com/bitly/go-simplejson")
  (synopsis "go-simplejson")
  (description
   "a Go package to interact with arbitrary JSON")
  (license license:expat))
(package
  (name "go-github-com-mitchellh-osext")
  (version "0.0.0-20151018003038-5e2d6d41470f")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/mitchellh/osext")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0j635c1cx7crs5wlirlk713l36x70pnlmqrzd3x3bjgnjg194jrk"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/mitchellh/osext"))
  (home-page "https://github.com/mitchellh/osext")
  (synopsis "osext")
  (description
   "Extensions to the standard \"os\" package.")
  (license license:zlib))
(package
  (name "go-github-com-distribution-distribution-v3")
  (version "3.0.0-20220907155224-78b9c98c5c31")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/distribution/distribution")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0033mmq2cvwxhmnarpx8viqfarglqkqy8xwnsswxj17dbkdd6j9i"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/distribution/distribution/v3"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-yvasiyarov-newrelic-platform-go"
      ,go-github-com-yvasiyarov-newrelic-platform-go)
     ("go-github-com-yvasiyarov-go-metrics"
      ,go-github-com-yvasiyarov-go-metrics)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-prometheus-procfs"
      ,go-github-com-prometheus-procfs)
     ("go-github-com-prometheus-common"
      ,go-github-com-prometheus-common)
     ("go-github-com-prometheus-client-model"
      ,go-github-com-prometheus-client-model)
     ("go-github-com-mitchellh-osext"
      ,go-github-com-mitchellh-osext)
     ("go-github-com-matttproud-golang-protobuf-extensions"
      ,go-github-com-matttproud-golang-protobuf-extensions)
     ("go-github-com-kr-text" ,go-github-com-kr-text)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)
     ("go-github-com-jmespath-go-jmespath"
      ,go-github-com-jmespath-go-jmespath)
     ("go-github-com-inconshreveable-mousetrap"
      ,go-github-com-inconshreveable-mousetrap)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-github-com-golang-jwt-jwt-v4"
      ,go-github-com-golang-jwt-jwt-v4)
     ("go-github-com-gofrs-uuid"
      ,go-github-com-gofrs-uuid)
     ("go-github-com-felixge-httpsnoop"
      ,go-github-com-felixge-httpsnoop)
     ("go-github-com-dnaeon-go-vcr"
      ,go-github-com-dnaeon-go-vcr)
     ("go-github-com-cespare-xxhash-v2"
      ,go-github-com-cespare-xxhash-v2)
     ("go-github-com-bugsnag-panicwrap"
      ,go-github-com-bugsnag-panicwrap)
     ("go-github-com-bugsnag-osext"
      ,go-github-com-bugsnag-osext)
     ("go-github-com-bitly-go-simplejson"
      ,go-github-com-bitly-go-simplejson)
     ("go-github-com-beorn7-perks"
      ,go-github-com-beorn7-perks)
     ("go-github-com-azure-go-autorest-tracing"
      ,go-github-com-azure-go-autorest-tracing)
     ("go-github-com-azure-go-autorest-logger"
      ,go-github-com-azure-go-autorest-logger)
     ("go-github-com-azure-go-autorest-autorest-to"
      ,go-github-com-azure-go-autorest-autorest-to)
     ("go-github-com-azure-go-autorest-autorest-date"
      ,go-github-com-azure-go-autorest-autorest-date)
     ("go-github-com-azure-go-autorest-autorest-adal"
      ,go-github-com-azure-go-autorest-autorest-adal)
     ("go-github-com-azure-go-autorest-autorest"
      ,go-github-com-azure-go-autorest-autorest)
     ("go-github-com-azure-go-autorest"
      ,go-github-com-azure-go-autorest)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-google-golang-org-cloud"
      ,go-google-golang-org-cloud)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-yvasiyarov-gorelic"
      ,go-github-com-yvasiyarov-gorelic)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-opencontainers-image-spec"
      ,go-github-com-opencontainers-image-spec)
     ("go-github-com-opencontainers-go-digest"
      ,go-github-com-opencontainers-go-digest)
     ("go-github-com-ncw-swift"
      ,go-github-com-ncw-swift)
     ("go-github-com-mitchellh-mapstructure"
      ,go-github-com-mitchellh-mapstructure)
     ("go-github-com-hashicorp-golang-lru"
      ,go-github-com-hashicorp-golang-lru)
     ("go-github-com-gorilla-mux"
      ,go-github-com-gorilla-mux)
     ("go-github-com-gorilla-handlers"
      ,go-github-com-gorilla-handlers)
     ("go-github-com-gomodule-redigo"
      ,go-github-com-gomodule-redigo)
     ("go-github-com-docker-libtrust"
      ,go-github-com-docker-libtrust)
     ("go-github-com-docker-go-metrics"
      ,go-github-com-docker-go-metrics)
     ("go-github-com-docker-go-events"
      ,go-github-com-docker-go-events)
     ("go-github-com-denverdino-aliyungo"
      ,go-github-com-denverdino-aliyungo)
     ("go-github-com-bugsnag-bugsnag-go"
      ,go-github-com-bugsnag-bugsnag-go)
     ("go-github-com-bshuster-repo-logrus-logstash-hook"
      ,go-github-com-bshuster-repo-logrus-logstash-hook)
     ("go-github-com-aws-aws-sdk-go"
      ,go-github-com-aws-aws-sdk-go)
     ("go-github-com-shopify-logrus-bugsnag"
      ,go-github-com-shopify-logrus-bugsnag)
     ("go-github-com-azure-azure-sdk-for-go"
      ,go-github-com-azure-azure-sdk-for-go)))
  (home-page
   "https://github.com/distribution/distribution")
  (synopsis "Distribution")
  (description
   "Package distribution will define the interfaces for the components of docker\ndistribution.  The goal is to allow users to reliably package, ship and store\ncontent related to docker images.")
  (license license:asl2.0))
(package
  (name "go-github-com-phayes-freeport")
  (version "0.0.0-20220201140144-74d24b5ae9f5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/phayes/freeport")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0q6kdy4vxdvdyy04kkg15131xn2x7v9xqqgpz5b24hdza30bfa7s"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/phayes/freeport"))
  (home-page "https://github.com/phayes/freeport")
  (synopsis "FreePort")
  (description
   "Get a free open TCP port that is ready to use.")
  (license license:bsd-3))
(package
  (name "go-github-com-shopify-logrus-bugsnag")
  (version "0.0.0-20171204204709-577dee27f20d")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Shopify/logrus-bugsnag")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1l3yahk77vzgmjs7baf8g14sv33jj04rw73iind4wayg40lfgrp8"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/Shopify/logrus-bugsnag"))
  (home-page
   "https://github.com/Shopify/logrus-bugsnag")
  (synopsis "logrus-bugsnag")
  (description
   "logrus-bugsnag is a hook that allows\n@url{https://github.com/sirupsen/logrus,Logrus} to interface with\n@url{https://bugsnag.com,Bugsnag}.")
  (license license:expat))
(package
  (name "go-github-com-bshuster-repo-logrus-logstash-hook")
  (version "1.0.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/bshuster-repo/logrus-logstash-hook")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0wcqcg8s1nfpd1pd0z0il3ysfmapqqmsgzcca68gm9nq5gl04ijg"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/bshuster-repo/logrus-logstash-hook"))
  (propagated-inputs
   `(("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-bshuster-repo-logrus-logstash-hook"
      ,go-github-com-bshuster-repo-logrus-logstash-hook)))
  (home-page
   "https://github.com/bshuster-repo/logrus-logstash-hook")
  (synopsis "Logstash hook for logrus")
  (description
   "Use this hook to send the logs to\n@url{https://www.elastic.co/products/logstash,Logstash}.")
  (license license:expat))
(package
  (name "go-github-com-bugsnag-osext")
  (version "0.0.0-20130617224835-0dd3f918b21b")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/bugsnag/osext")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "02pczqml6p1mnfdrygm3rs02g0r65qx8v1bi3x24dx8wv9dr5y23"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/bugsnag/osext"))
  (home-page "https://github.com/bugsnag/osext")
  (synopsis #f)
  (description
   "Extensions to the standard \"os\" package.")
  (license license:zlib))
(package
  (name "go-github-com-yvasiyarov-go-metrics")
  (version "0.0.0-20150112132944-c25f46c4b940")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/yvasiyarov/go-metrics")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0p1hx4ml4gzgyj8n0fg5lv8bq092zwg00n59lq8v8sphjc1h8i8d"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/yvasiyarov/go-metrics"))
  (home-page
   "https://github.com/yvasiyarov/go-metrics")
  (synopsis "go-metrics")
  (description
   "Go port of Coda Hale's Metrics library")
  (license license:bsd-2))
(package
  (name "go-github-com-yvasiyarov-gorelic")
  (version "0.0.7")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/yvasiyarov/gorelic")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "06b28k7i0sdcia9bh5554ph1aa961qgihdsnc3fvgy8wdyrwc56c"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/yvasiyarov/gorelic"))
  (home-page
   "https://github.com/yvasiyarov/gorelic")
  (synopsis "GoRelic is deprecated in favour of")
  (description
   "Package gorelic is an New Relic agent implementation for Go runtime.  It collect\na lot of metrics about Go scheduler, garbage collector and memory allocator and\nsend them to NewRelic.")
  (license license:bsd-2))
(package
  (name "go-github-com-yvasiyarov-newrelic-platform-go")
  (version "0.0.0-20160601141957-9c099fbc30e9")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/yvasiyarov/newrelic_platform_go")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0n6jap27qc7b7c37ck1gv9biq5nfl7y06jk0cqgc517yfnb4f07x"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/yvasiyarov/newrelic_platform_go"))
  (home-page
   "https://github.com/yvasiyarov/newrelic_platform_go")
  (synopsis
   "New Relic Platform Agent SDK for Go(golang)")
  (description
   "Package newrelic_platform_go is New Relic Platform Agent SDK for Go language.")
  (license license:bsd-2))
(package
  (name "go-oras-land-oras-go")
  (version "1.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/oras-project/oras-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "004fh9hs8r24glkqc8fl6zq8gn49f540gs33qz86xk53v9bkr3y3"))))
  (build-system go-build-system)
  (arguments '(#:import-path "oras.land/oras-go"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-yvasiyarov-newrelic-platform-go"
      ,go-github-com-yvasiyarov-newrelic-platform-go)
     ("go-github-com-yvasiyarov-gorelic"
      ,go-github-com-yvasiyarov-gorelic)
     ("go-github-com-yvasiyarov-go-metrics"
      ,go-github-com-yvasiyarov-go-metrics)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-prometheus-procfs"
      ,go-github-com-prometheus-procfs)
     ("go-github-com-prometheus-common"
      ,go-github-com-prometheus-common)
     ("go-github-com-prometheus-client-model"
      ,go-github-com-prometheus-client-model)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-morikuni-aec"
      ,go-github-com-morikuni-aec)
     ("go-github-com-moby-term"
      ,go-github-com-moby-term)
     ("go-github-com-moby-locker"
      ,go-github-com-moby-locker)
     ("go-github-com-matttproud-golang-protobuf-extensions"
      ,go-github-com-matttproud-golang-protobuf-extensions)
     ("go-github-com-klauspost-compress"
      ,go-github-com-klauspost-compress)
     ("go-github-com-inconshreveable-mousetrap"
      ,go-github-com-inconshreveable-mousetrap)
     ("go-github-com-gorilla-mux"
      ,go-github-com-gorilla-mux)
     ("go-github-com-gorilla-handlers"
      ,go-github-com-gorilla-handlers)
     ("go-github-com-gomodule-redigo"
      ,go-github-com-gomodule-redigo)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-felixge-httpsnoop"
      ,go-github-com-felixge-httpsnoop)
     ("go-github-com-docker-libtrust"
      ,go-github-com-docker-libtrust)
     ("go-github-com-docker-go-units"
      ,go-github-com-docker-go-units)
     ("go-github-com-docker-go-metrics"
      ,go-github-com-docker-go-metrics)
     ("go-github-com-docker-go-events"
      ,go-github-com-docker-go-events)
     ("go-github-com-docker-docker-credential-helpers"
      ,go-github-com-docker-docker-credential-helpers)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-cespare-xxhash-v2"
      ,go-github-com-cespare-xxhash-v2)
     ("go-github-com-bugsnag-panicwrap"
      ,go-github-com-bugsnag-panicwrap)
     ("go-github-com-bugsnag-osext"
      ,go-github-com-bugsnag-osext)
     ("go-github-com-bugsnag-bugsnag-go"
      ,go-github-com-bugsnag-bugsnag-go)
     ("go-github-com-bshuster-repo-logrus-logstash-hook"
      ,go-github-com-bshuster-repo-logrus-logstash-hook)
     ("go-github-com-beorn7-perks"
      ,go-github-com-beorn7-perks)
     ("go-github-com-shopify-logrus-bugsnag"
      ,go-github-com-shopify-logrus-bugsnag)
     ("go-github-com-azure-go-ansiterm"
      ,go-github-com-azure-go-ansiterm)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-phayes-freeport"
      ,go-github-com-phayes-freeport)
     ("go-github-com-opencontainers-image-spec"
      ,go-github-com-opencontainers-image-spec)
     ("go-github-com-opencontainers-go-digest"
      ,go-github-com-opencontainers-go-digest)
     ("go-github-com-docker-go-connections"
      ,go-github-com-docker-go-connections)
     ("go-github-com-docker-docker"
      ,go-github-com-docker-docker)
     ("go-github-com-docker-distribution"
      ,go-github-com-docker-distribution)
     ("go-github-com-docker-cli"
      ,go-github-com-docker-cli)
     ("go-github-com-distribution-distribution-v3"
      ,go-github-com-distribution-distribution-v3)
     ("go-github-com-containerd-containerd"
      ,go-github-com-containerd-containerd)))
  (home-page "https://oras.land/oras-go")
  (synopsis "ORAS Go library")
  (description
   "Documentation for the ORAS Go library is located on the project website:\n@url{https://oras.land/client_libraries/go/,oras.land/client_libraries/go}")
  (license license:asl2.0))
(package
  (name "go-github-com-adamkorcz-go-fuzz-headers")
  (version "0.0.0-20210319161527-f761c2329661")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/AdamKorcz/go-fuzz-headers")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "043a8lialk5kmxy2g5ka1pss8k71d42y4g0ikkv0ls8kgvxw3cc6"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/AdamKorcz/go-fuzz-headers"))
  (home-page
   "https://github.com/AdamKorcz/go-fuzz-headers")
  (synopsis #f)
  (description #f)
  (license #f))
(package
  (name "go-github-com-acarl005-stripansi")
  (version "0.0.0-20180116102854-5a71ef0e047d")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/acarl005/stripansi")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "02sxiishdixm791jqbkmhdcvc712l0fb8rqmibxzgc61h0qs6rs3"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/acarl005/stripansi"))
  (home-page
   "https://github.com/acarl005/stripansi")
  (synopsis "Strip ANSI")
  (description
   "This Go package removes ANSI escape codes from strings.")
  (license license:expat))
(package
  (name "go-github-com-bugsnag-bugsnag-go")
  (version "2.1.2+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/bugsnag/bugsnag-go")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "15j4lwivpkz7jr60mx6cjmrn83lhn06n2bmjjsrd6p7f42pr3nq0"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/bugsnag/bugsnag-go"))
  (home-page
   "https://github.com/bugsnag/bugsnag-go")
  (synopsis "Bugsnag error reporter for Go")
  (description
   "Package bugsnag captures errors in real-time and reports them to Bugsnag\n(@url{http://bugsnag.com,http://bugsnag.com}).")
  (license license:expat))
(package
  (name "go-github-com-bugsnag-panicwrap")
  (version "1.3.4")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/bugsnag/panicwrap")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1h0l1bk8znjm74cxsxxdija08b15ivd3p91d6zzp5gjw8b1jbksf"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/bugsnag/panicwrap"))
  (home-page
   "https://github.com/bugsnag/panicwrap")
  (synopsis "panicwrap")
  (description
   "The panicwrap package provides functions for capturing and handling panics in\nyour application.  It does this by re-executing the running application and\nmonitoring stderr for any panics.  At the same time, stdout/stderr/etc.  are set\nto the same values so that data is shuttled through properly, making the\nexistence of panicwrap mostly transparent.")
  (license license:expat))
(package
  (name "go-github-com-containers-libtrust")
  (version "0.0.0-20200511145503-9c3a6c22cd9a")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containers/libtrust")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "138cpp11a7mlk390wciz7l706qx342r8mv87602awd3y7ia5q6qg"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/containers/libtrust"))
  (home-page
   "https://github.com/containers/libtrust")
  (synopsis "libtrust")
  (description
   "Package libtrust provides an interface for managing authentication and\nauthorization using public key cryptography.  Authentication is handled using\nthe identity attached to the public key and verified through TLS x509\ncertificates, a key challenge, or signature.  Authorization and access control\nis managed through a trust graph distributed between both remote trust servers\nand locally cached and managed data.")
  (license license:asl2.0))
(package
  (name "go-github-com-google-go-intervals")
  (version "0.0.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/google/go-intervals")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0v9i46g1vdbyinagj94jvaibw4bpgh2l9f9p5268wg6msf761jm9"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/google/go-intervals"))
  (home-page
   "https://github.com/google/go-intervals")
  (synopsis "go-intervals")
  (description
   "go-intervals is a library for performing set operations on 1-dimensional\nintervals, such as time ranges.")
  (license license:asl2.0))
(package
  (name "go-github-com-mistifyio-go-zfs-v3")
  (version "3.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/mistifyio/go-zfs")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1jbbf9n044rymy4hs09y4c0kdh1p8r9sxfwrd54rsfk4z9ypnws3"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/mistifyio/go-zfs/v3"))
  (propagated-inputs
   `(("go-github-com-google-uuid"
      ,go-github-com-google-uuid)))
  (home-page "https://github.com/mistifyio/go-zfs")
  (synopsis "Go Wrapper for ZFS")
  (description
   "Package zfs provides wrappers around the ZFS command line tools.")
  (license license:asl2.0))
(package
  (name "go-gotest-tools")
  (version "1.4.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gotestyourself/gotest.tools")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0ykgj2rpi3yha9rd23abx2885rm72jarhpgw1hkasmrb9i7j6nqk"))))
  (build-system go-build-system)
  (arguments '(#:import-path "gotest.tools"))
  (home-page "https://gotest.tools")
  (synopsis "gotest.tools")
  (description
   "Package gotesttools is a collection of packages to augment `testing` and support\ncommon patterns.")
  (license license:asl2.0))
(package
  (name "go-github-com-containers-storage")
  (version "1.43.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containers/storage")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0kn00kb89xhw05zbywj1jwdm060dbngsnrajiw2fz0qj5bsqc8z7"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/containers/storage"))
  (propagated-inputs
   `(("go-gotest-tools" ,go-gotest-tools)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-vbatts-tar-split"
      ,go-github-com-vbatts-tar-split)
     ("go-github-com-ulikunitz-xz"
      ,go-github-com-ulikunitz-xz)
     ("go-github-com-tchap-go-patricia"
      ,go-github-com-tchap-go-patricia)
     ("go-github-com-syndtr-gocapability"
      ,go-github-com-syndtr-gocapability)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-opencontainers-selinux"
      ,go-github-com-opencontainers-selinux)
     ("go-github-com-opencontainers-runtime-spec"
      ,go-github-com-opencontainers-runtime-spec)
     ("go-github-com-opencontainers-runc"
      ,go-github-com-opencontainers-runc)
     ("go-github-com-opencontainers-go-digest"
      ,go-github-com-opencontainers-go-digest)
     ("go-github-com-moby-sys-mountinfo"
      ,go-github-com-moby-sys-mountinfo)
     ("go-github-com-mistifyio-go-zfs-v3"
      ,go-github-com-mistifyio-go-zfs-v3)
     ("go-github-com-mattn-go-shellwords"
      ,go-github-com-mattn-go-shellwords)
     ("go-github-com-klauspost-pgzip"
      ,go-github-com-klauspost-pgzip)
     ("go-github-com-klauspost-compress"
      ,go-github-com-klauspost-compress)
     ("go-github-com-json-iterator-go"
      ,go-github-com-json-iterator-go)
     ("go-github-com-hashicorp-go-multierror"
      ,go-github-com-hashicorp-go-multierror)
     ("go-github-com-google-go-intervals"
      ,go-github-com-google-go-intervals)
     ("go-github-com-docker-go-units"
      ,go-github-com-docker-go-units)
     ("go-github-com-cyphar-filepath-securejoin"
      ,go-github-com-cyphar-filepath-securejoin)
     ("go-github-com-containerd-stargz-snapshotter-estargz"
      ,go-github-com-containerd-stargz-snapshotter-estargz)
     ("go-github-com-microsoft-hcsshim"
      ,go-github-com-microsoft-hcsshim)
     ("go-github-com-microsoft-go-winio"
      ,go-github-com-microsoft-go-winio)
     ("go-github-com-burntsushi-toml"
      ,go-github-com-burntsushi-toml)))
  (home-page
   "https://github.com/containers/storage")
  (synopsis #f)
  (description
   "@code{storage} is a Go library which aims to provide methods for storing\nfilesystem layers, container images, and containers.  A\n@code{containers-storage} CLI wrapper is also included for manual and scripting\nuse.")
  (license license:asl2.0))
(package
  (name "go-github-com-docker-libtrust")
  (version "0.0.0-20160708172513-aabc10ec26b7")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/docker/libtrust")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1lwslbggzc2b0c4wxl5pn6i2nfgz5jz8f7s7vnid9mrlsk59h7s1"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/docker/libtrust"))
  (home-page "https://github.com/docker/libtrust")
  (synopsis "libtrust")
  (description
   "Package libtrust provides an interface for managing authentication and\nauthorization using public key cryptography.  Authentication is handled using\nthe identity attached to the public key and verified through TLS x509\ncertificates, a key challenge, or signature.  Authorization and access control\nis managed through a trust graph distributed between both remote trust servers\nand locally cached and managed data.")
  (license license:asl2.0))
(package
  (name "go-github-com-garyburd-redigo")
  (version "1.6.4")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/garyburd/redigo")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0xq1r7149z358g1dra2dwgmdlk8ynk89bkdgf9y4xx9vyddlaw08"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/garyburd/redigo"))
  (home-page "https://github.com/garyburd/redigo")
  (synopsis #f)
  (description
   "Future development of Redigo is at\n@url{https://github.com/gomodule/redigo,github.com/gomodule/redigo}.  Please\nsubmit issues at gomodule/redigo.  The repository at github.com/garyburd/redigo\nis a read-only snapshot.")
  (license license:asl2.0))
(package
  (name "go-github-com-gosimple-unidecode")
  (version "1.0.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gosimple/unidecode")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1dxdddn744l0s1lr006s2a4k02w6qx8j3k31c7sfflh7wvwzcdzx"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gosimple/unidecode"))
  (home-page
   "https://github.com/gosimple/unidecode")
  (synopsis "unidecode")
  (description
   "Package unidecode implements a unicode transliterator which replaces non-ASCII\ncharacters with their ASCII approximations.")
  (license license:asl2.0))
(package
  (name "go-github-com-klauspost-pgzip")
  (version "1.2.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/klauspost/pgzip")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0m66jcsz27076qvi5qzagzlbyd1sdzh6kbf1njj0sswx86026rx3"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/klauspost/pgzip"))
  (home-page "https://github.com/klauspost/pgzip")
  (synopsis "pgzip")
  (description
   "Package pgzip implements reading and writing of gzip format compressed files, as\nspecified in @url{https://rfc-editor.org/rfc/rfc1952.html,RFC 1952}.")
  (license license:expat))
(package
  (name "go-github-com-proglottis-gpgme")
  (version "0.1.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/proglottis/gpgme")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "11z6pwiw77av983w2ai5h741f8mz3rnn4g1n07cwpvj44f385k5n"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/proglottis/gpgme"))
  (home-page "https://github.com/proglottis/gpgme")
  (synopsis "GPGME (golang)")
  (description
   "Package gpgme provides a Go wrapper for the GPGME library")
  (license license:bsd-3))
(package
  (name "go-github-com-rootless-containers-proto")
  (version "0.1.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/rootless-containers/proto")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0a2q0a429wl4h29brvlxpc7g1vdyz5m4xzasjgbdcxa1ww2dcppx"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/rootless-containers/proto"))
  (home-page
   "https://github.com/rootless-containers/proto")
  (synopsis #f)
  (description
   "This project contains the\n@url{https://developers.google.com/protocol-buffers/,protobuf} definition of the\n@code{user.rootlesscontainers} extended attribute.  The main purpose of this\nattribute is to allow for a interoperable and standardised way of emulating\npersistent syscalls in a @url{https://rootlesscontaine.rs/,rootless container}\n(syscalls such as @code{chown(2)} which would ordinarily fail).")
  (license license:asl2.0))
(package
  (name "go-github-com-aws-aws-sdk-go-v2-service-kms")
  (version "1.18.11")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit
            (string-append "service/kms/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lyqchcph8yfkldcd5pxmk70wqrspp5wgx03fn6xi643w1l2hm5j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/aws/aws-sdk-go-v2/service/kms"
     #:unpack-path
     "github.com/aws/aws-sdk-go-v2"))
  (propagated-inputs
   `(("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis #f)
  (description
   "Package kms provides the API client, operations, and parameter types for AWS Key\nManagement Service.")
  (license license:asl2.0))
(package
  (name "go-github-com-coreos-go-oidc-v3")
  (version "3.4.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/coreos/go-oidc")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0hy9ywlr1mp33lnv5jv6k3ms3r4l0213gk4hd3lpm55d3bpxnxgh"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/coreos/go-oidc/v3"))
  (propagated-inputs
   `(("go-gopkg-in-square-go-jose-v2"
      ,go-gopkg-in-square-go-jose-v2)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)))
  (home-page "https://github.com/coreos/go-oidc")
  (synopsis "go-oidc")
  (description
   "There were two breaking changes made to the v3 branch.  The import path has\nchanged from:")
  (license license:asl2.0))
(package
  (name "go-github-com-ysmood-got")
  (version "0.31.6")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ysmood/got")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0n50k1mijlrkhp4ljxncrcdfqxzdhflra5iy214528fi4m3v8lsi"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/ysmood/got"))
  (home-page "https://github.com/ysmood/got")
  (synopsis "Overview")
  (description
   "Package got is an enjoyable golang test framework.")
  (license license:expat))
(package
  (name "go-github-com-go-rod-rod")
  (version "0.111.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-rod/rod")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0qfgiq2g5yn7qf7hwq2g763wn49954wqad1gwm4kr0z7ccl4gvdg"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-rod/rod"))
  (propagated-inputs
   `(("go-github-com-ysmood-leakless"
      ,go-github-com-ysmood-leakless)
     ("go-github-com-ysmood-gson"
      ,go-github-com-ysmood-gson)
     ("go-github-com-ysmood-gotrace"
      ,go-github-com-ysmood-gotrace)
     ("go-github-com-ysmood-got"
      ,go-github-com-ysmood-got)
     ("go-github-com-ysmood-goob"
      ,go-github-com-ysmood-goob)))
  (home-page "https://github.com/go-rod/rod")
  (synopsis "Overview")
  (description
   "Package rod is a high-level driver directly based on DevTools Protocol.")
  (license license:expat))
(package
  (name "go-github-com-hashicorp-vault-api")
  (version "1.8.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/vault")
           (commit (string-append "api/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0ckgz8zyj4hgyazxjdcqnxjc15sqd1pbvfh48gzphzxrwgsy2kgb"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/hashicorp/vault/api"
     #:unpack-path
     "github.com/hashicorp/vault"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-go-uber-org-atomic" ,go-go-uber-org-atomic)
     ("go-github-com-ryanuber-go-glob"
      ,go-github-com-ryanuber-go-glob)
     ("go-github-com-pierrec-lz4"
      ,go-github-com-pierrec-lz4)
     ("go-github-com-oklog-run"
      ,go-github-com-oklog-run)
     ("go-github-com-mitchellh-reflectwalk"
      ,go-github-com-mitchellh-reflectwalk)
     ("go-github-com-mitchellh-go-testing-interface"
      ,go-github-com-mitchellh-go-testing-interface)
     ("go-github-com-mitchellh-go-homedir"
      ,go-github-com-mitchellh-go-homedir)
     ("go-github-com-mitchellh-copystructure"
      ,go-github-com-mitchellh-copystructure)
     ("go-github-com-mattn-go-isatty"
      ,go-github-com-mattn-go-isatty)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-hashicorp-yamux"
      ,go-github-com-hashicorp-yamux)
     ("go-github-com-hashicorp-golang-lru"
      ,go-github-com-hashicorp-golang-lru)
     ("go-github-com-hashicorp-go-version"
      ,go-github-com-hashicorp-go-version)
     ("go-github-com-hashicorp-go-uuid"
      ,go-github-com-hashicorp-go-uuid)
     ("go-github-com-hashicorp-go-sockaddr"
      ,go-github-com-hashicorp-go-sockaddr)
     ("go-github-com-hashicorp-go-secure-stdlib-strutil"
      ,go-github-com-hashicorp-go-secure-stdlib-strutil)
     ("go-github-com-hashicorp-go-secure-stdlib-mlock"
      ,go-github-com-hashicorp-go-secure-stdlib-mlock)
     ("go-github-com-hashicorp-go-plugin"
      ,go-github-com-hashicorp-go-plugin)
     ("go-github-com-hashicorp-go-immutable-radix"
      ,go-github-com-hashicorp-go-immutable-radix)
     ("go-github-com-golang-snappy"
      ,go-github-com-golang-snappy)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-frankban-quicktest"
      ,go-github-com-frankban-quicktest)
     ("go-github-com-fatih-color"
      ,go-github-com-fatih-color)
     ("go-github-com-armon-go-radix"
      ,go-github-com-armon-go-radix)
     ("go-github-com-armon-go-metrics"
      ,go-github-com-armon-go-metrics)
     ("go-gopkg-in-square-go-jose-v2"
      ,go-gopkg-in-square-go-jose-v2)
     ("go-golang-org-x-time" ,go-golang-org-x-time)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-mitchellh-mapstructure"
      ,go-github-com-mitchellh-mapstructure)
     ("go-github-com-hashicorp-hcl"
      ,go-github-com-hashicorp-hcl)
     ("go-github-com-hashicorp-go-secure-stdlib-parseutil"
      ,go-github-com-hashicorp-go-secure-stdlib-parseutil)
     ("go-github-com-hashicorp-go-rootcerts"
      ,go-github-com-hashicorp-go-rootcerts)
     ("go-github-com-hashicorp-go-retryablehttp"
      ,go-github-com-hashicorp-go-retryablehttp)
     ("go-github-com-hashicorp-go-multierror"
      ,go-github-com-hashicorp-go-multierror)
     ("go-github-com-hashicorp-go-hclog"
      ,go-github-com-hashicorp-go-hclog)
     ("go-github-com-hashicorp-go-cleanhttp"
      ,go-github-com-hashicorp-go-cleanhttp)
     ("go-github-com-hashicorp-errwrap"
      ,go-github-com-hashicorp-errwrap)
     ("go-github-com-go-test-deep"
      ,go-github-com-go-test-deep)
     ("go-github-com-cenkalti-backoff-v3"
      ,go-github-com-cenkalti-backoff-v3)))
  (home-page "https://github.com/hashicorp/vault")
  (synopsis "Vault API")
  (description
   "This provides the @code{github.com/hashicorp/vault/api} package which contains\ncode useful for interacting with a Vault server.")
  (license license:mpl2.0))
(package
  (name "go-github-com-jellydator-ttlcache-v2")
  (version "2.11.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jellydator/ttlcache")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "19f4lq91rgmqr14hwqqas7kr47g775llaa9sgf4hdvzsncafz73v"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/jellydator/ttlcache/v2"))
  (propagated-inputs
   `(("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-lint" ,go-golang-org-x-lint)
     ("go-go-uber-org-goleak" ,go-go-uber-org-goleak)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)))
  (home-page
   "https://github.com/jellydator/ttlcache")
  (synopsis
   "TTLCache - an in-memory cache with expiration")
  (description
   "TTLCache is a simple key/value cache in golang with the following functions:")
  (license license:expat))
(package
  (name "go-github-com-beeker1121-goque")
  (version "1.0.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/beeker1121/goque")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0hdgbd42451zpq0arjmwz7l1nyadcxs94w81c95bhb6jwrivm0f9"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/beeker1121/goque"))
  (home-page "https://github.com/beeker1121/goque")
  (synopsis "Goque")
  (description
   "Package goque provides embedded, disk-based implementations of stack, queue, and\npriority queue data structures.")
  (license license:expat))
(package
  (name "go-github-com-eggsampler-acme-v3")
  (version "3.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/eggsampler/acme")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "12bihibv2v0yh1gs12dx25nkmfszv62bk1dp36p8jf4x2j7jjfdi"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/eggsampler/acme/v3"))
  (home-page "https://github.com/eggsampler/acme")
  (synopsis "eggsampler/acme")
  (description
   "@code{eggsampler/acme} is a Go client library implementation for\n@url{https://tools.ietf.org/html/rfc8555,RFC8555} (previously ACME v2).  This\nlibrary can be used with the @url{https://letsencrypt.org/,Let's Encrypt}\nCertificate Authority (CA), but also other ACME compliant CA's such as\n@url{https://zerossl.com/,ZeroSSL}.")
  (license license:expat))
(package
  (name "go-github-com-a8m-expect")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/a8m/expect")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0pqz699j9pidsvp7p88knar8h6z5vphm9fylypv3dq5snfivdcwh"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/a8m/expect"))
  (home-page "https://github.com/a8m/expect")
  (synopsis #f)
  (description #f)
  (license #f))
(package
  (name "go-github-com-nelsam-hel-v2")
  (version "2.3.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/nelsam/hel")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1sbmpcjhd3r4l8rmk4wmvjhc6ivxp4ci29k7b6wvz5fp9yb9bkb1"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/nelsam/hel/v2"))
  (propagated-inputs
   `(("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-poy-onpar"
      ,go-github-com-poy-onpar)
     ("go-github-com-a8m-expect"
      ,go-github-com-a8m-expect)))
  (home-page "https://github.com/nelsam/hel")
  (synopsis "Hel")
  (description
   "Package main implements the hel command.")
  (license license:unlicense))
(package
  (name "go-github-com-poy-onpar")
  (version "1.1.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/poy/onpar")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1f2qswsil6qfg1z83sxq3w0k90hjhbmshamjx6kkn36bkaf817lz"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/poy/onpar"))
  (propagated-inputs
   `(("go-github-com-nelsam-hel-v2"
      ,go-github-com-nelsam-hel-v2)
     ("go-github-com-fatih-color"
      ,go-github-com-fatih-color)))
  (home-page "https://github.com/poy/onpar")
  (synopsis "onpar")
  (description "Parallel testing framework for Go")
  (license license:expat))
(package
  (name "go-github-com-ziutek-mymysql")
  (version "1.5.4")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ziutek/mymysql")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "172s7sv5bgc40x81k18hypf9c4n8hn9v5w5zwyr4mi5prbavqcci"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/ziutek/mymysql"))
  (home-page "https://github.com/ziutek/mymysql")
  (synopsis "MyMySQL v1.5.4 (2015-01-08)")
  (description
   "Sorry for my poor English.  If you can help with improving the English in this\ndocumentation, please contact me.")
  (license license:bsd-3))
(package
  (name "go-github-com-go-gorp-gorp-v3")
  (version "3.0.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-gorp/gorp")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1dk304fkqqkq4q2n9cmnbwssry16c965gqpxh1s2wr9gg19zb81x"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-gorp/gorp/v3"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-github-com-ziutek-mymysql"
      ,go-github-com-ziutek-mymysql)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-poy-onpar"
      ,go-github-com-poy-onpar)
     ("go-github-com-mattn-go-sqlite3"
      ,go-github-com-mattn-go-sqlite3)
     ("go-github-com-lib-pq" ,go-github-com-lib-pq)
     ("go-github-com-go-sql-driver-mysql"
      ,go-github-com-go-sql-driver-mysql)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)))
  (home-page "https://github.com/go-gorp/gorp")
  (synopsis "Go Relational Persistence")
  (description
   "Package gorp provides a simple way to marshal Go structs to and from SQL\ndatabases.  It uses the database/sql package, and should work with any compliant\ndatabase/sql driver.")
  (license license:expat))
(package
  (name "go-bitbucket-org-creachadair-shell")
  (version "0.0.7")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://bitbucket.org/creachadair/shell")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "03vl9xsk14k84jcf3br91d5hy81y9g0d7jqk181sfndspn6v7l7j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "bitbucket.org/creachadair/shell"))
  (propagated-inputs
   `(("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)))
  (home-page
   "https://bitbucket.org/creachadair/shell")
  (synopsis "shell")
  (description
   "Package shell supports splitting and joining of shell command strings.")
  (license license:bsd-3))
(package
  (name "go-cloud-google-com-go-spanner")
  (version "1.39.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "spanner/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0h9g45ac8pmaj5nsdwfhafglm79wnf2mcrjhyghsnxl2d2b5r24f"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/spanner"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-github-com-envoyproxy-protoc-gen-validate"
      ,go-github-com-envoyproxy-protoc-gen-validate)
     ("go-github-com-envoyproxy-go-control-plane"
      ,go-github-com-envoyproxy-go-control-plane)
     ("go-github-com-cncf-xds-go"
      ,go-github-com-cncf-xds-go)
     ("go-github-com-cncf-udpa-go"
      ,go-github-com-cncf-udpa-go)
     ("go-github-com-cespare-xxhash-v2"
      ,go-github-com-cespare-xxhash-v2)
     ("go-github-com-census-instrumentation-opencensus-proto"
      ,go-github-com-census-instrumentation-opencensus-proto)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page "https://cloud.google.com/go/spanner")
  (synopsis "Cloud Spanner")
  (description
   "Package spanner provides a client for reading and writing to Cloud Spanner\ndatabases.  See the packages under admin for clients that operate on databases\nand instances.")
  (license license:asl2.0))
(package
  (name "go-github-com-rakyll-embedmd")
  (version "0.0.0-20171029212350-c8060a0752a2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/rakyll/embedmd")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "06fp14qv7z6axmmnygd6llmwfq36zspzr6rsbniziin2bpjlggf6"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/rakyll/embedmd"))
  (home-page "https://github.com/rakyll/embedmd")
  (synopsis "embedmd")
  (description "embedmd")
  (license license:asl2.0))
(package
  (name "go-contrib-go-opencensus-io-exporter-stackdriver")
  (version "0.13.14")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/census-ecosystem/opencensus-go-exporter-stackdriver")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0iap2j4sfzbf25xhc0fd6xgsh24mnwlwhqqdg9znxvs5jrsr3rgf"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "contrib.go.opencensus.io/exporter/stackdriver"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-mod" ,go-golang-org-x-mod)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-jmespath-go-jmespath"
      ,go-github-com-jmespath-go-jmespath)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-github-com-burntsushi-toml"
      ,go-github-com-burntsushi-toml)
     ("go-honnef-co-go-tools" ,go-honnef-co-go-tools)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-lint" ,go-golang-org-x-lint)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-rakyll-embedmd"
      ,go-github-com-rakyll-embedmd)
     ("go-github-com-prometheus-prometheus"
      ,go-github-com-prometheus-prometheus)
     ("go-github-com-jstemmer-go-junit-report"
      ,go-github-com-jstemmer-go-junit-report)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-census-instrumentation-opencensus-proto"
      ,go-github-com-census-instrumentation-opencensus-proto)
     ("go-github-com-aws-aws-sdk-go"
      ,go-github-com-aws-aws-sdk-go)
     ("go-cloud-google-com-go-trace"
      ,go-cloud-google-com-go-trace)
     ("go-cloud-google-com-go-monitoring"
      ,go-cloud-google-com-go-monitoring)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)))
  (home-page
   "https://contrib.go.opencensus.io/exporter/stackdriver")
  (synopsis "OpenCensus Go Stackdriver")
  (description
   "Package stackdriver contains the OpenCensus exporters for Stackdriver Monitoring\nand Stackdriver Tracing.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-datastore")
  (version "1.8.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "datastore/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1m1724r6g83mcc9fkii0zy00sxdqaa0gpvrd0yplvmxis2dkq6sg"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/datastore"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/datastore")
  (synopsis "Cloud Datastore")
  (description
   "Package datastore provides a client for Google Cloud Datastore.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-kms")
  (version "1.4.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "kms/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1qcdyvamdg4l9947xnysl27nwp1js1yqfi996ly3psy3ykcgsgdc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/kms"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-cloud-google-com-go-iam"
      ,go-cloud-google-com-go-iam)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page "https://cloud.google.com/go/kms")
  (synopsis
   "Cloud Key Management Service (KMS) API")
  (description
   "Go Client Library for Cloud Key Management Service (KMS) API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-pubsub")
  (version "1.25.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "pubsub/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1w1j8s8hbi13g4kqy7bqm9vvmcqm6ba4igflsiyjgl03d860p2nh"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/pubsub"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-golang-org-x-time" ,go-golang-org-x-time)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-cloud-google-com-go-kms"
      ,go-cloud-google-com-go-kms)
     ("go-cloud-google-com-go-iam"
      ,go-cloud-google-com-go-iam)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page "https://cloud.google.com/go/pubsub")
  (synopsis "Cloud Pub/Sub")
  (description
   "Package pubsub provides an easy way to publish and receive Google Cloud Pub/Sub\nmessages, hiding the details of the underlying server RPCs.  Google Cloud\nPub/Sub is a many-to-many, asynchronous messaging system that decouples senders\nand receivers.")
  (license license:asl2.0))
(package
  (name "go-github-com-linkedin-goavro")
  (version "1.0.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/linkedin/goavro")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "09xrxy4vw2b11rnc0d80wamkbsp857lawxrxrnwihshzp5wnk1ll"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/linkedin/goavro"))
  (home-page "https://github.com/linkedin/goavro")
  (synopsis "goavro")
  (description
   "Package goavro is a library that encodes and decodes Avro data.")
  (license license:asl2.0))
(package
  (name "go-github-com-nightlyone-lockfile")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/nightlyone/lockfile")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "092r6gv27khplc3srg2ai7214hnvpms6klnsl66x49mspq10b7l5"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/nightlyone/lockfile"))
  (home-page
   "https://github.com/nightlyone/lockfile")
  (synopsis "lockfile")
  (description
   "Package lockfile handles pid file based locking.  While a sync.Mutex helps\nagainst concurrency issues within a single process, this package is designed to\nhelp against concurrency issues between cooperating processes or serializing\nmultiple invocations of the same process.  You can also combine sync.Mutex with\nLockfile in order to serialize an action between different goroutines in a\nsingle program and also multiple invocations of this program.")
  (license license:expat))
(package
  (name "go-github-com-go-gorp-gorp")
  (version "2.2.0+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-gorp/gorp")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1hanl3kzhx3piqqlclwfrzaghjblihh0ili35ma3q1y3lz6f9i5q"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-gorp/gorp"))
  (home-page "https://github.com/go-gorp/gorp")
  (synopsis "Go Relational Persistence")
  (description
   "Package gorp provides a simple way to marshal Go structs to and from SQL\ndatabases.  It uses the database/sql package, and should work with any compliant\ndatabase/sql driver.")
  (license license:expat))
(package
  (name "go-github-com-proullon-ramsql")
  (version "0.0.0-20220719091513-bf3c20043516")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/proullon/ramsql")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0bz92qk2qzv1cmcc5qjnl7r7vh51zgbxchpbn8xqibzy6al6ymr6"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/proullon/ramsql"))
  (propagated-inputs
   `(("go-github-com-lib-pq" ,go-github-com-lib-pq)
     ("go-github-com-go-gorp-gorp"
      ,go-github-com-go-gorp-gorp)))
  (home-page "https://github.com/proullon/ramsql")
  (synopsis "RamSQL")
  (description
   "RamSQL has been written to be used in your project's test suite.")
  (license license:bsd-3))
(package
  (name "go-github-com-go-redis-redis-v8")
  (version "8.11.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-redis/redis")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0a126m4k8mjavxxyqwmhkyvh54sn113l85mx5zmjph6hlnwzn9cm"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-redis/redis/v8"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-tomb-v1" ,go-gopkg-in-tomb-v1)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-nxadm-tail"
      ,go-github-com-nxadm-tail)
     ("go-github-com-fsnotify-fsnotify"
      ,go-github-com-fsnotify-fsnotify)
     ("go-github-com-onsi-gomega"
      ,go-github-com-onsi-gomega)
     ("go-github-com-onsi-ginkgo"
      ,go-github-com-onsi-ginkgo)
     ("go-github-com-dgryski-go-rendezvous"
      ,go-github-com-dgryski-go-rendezvous)
     ("go-github-com-cespare-xxhash-v2"
      ,go-github-com-cespare-xxhash-v2)))
  (home-page "https://github.com/go-redis/redis")
  (synopsis "Redis client for Go")
  (description
   "Package redis implements a Redis client.")
  (license license:bsd-2))
(package
  (name "go-github-com-dnephin-pflag")
  (version "1.0.7")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/dnephin/pflag")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1d3aakwpwdbq3lqpk5kdqlr0h7maqxnpsbrd2022xwd93fxyxcq0"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/dnephin/pflag"))
  (home-page "https://github.com/dnephin/pflag")
  (synopsis #f)
  (description
   "Package pflag is a drop-in replacement for Go's flag package, implementing\nPOSIX/GNU-style --flags.")
  (license license:bsd-3))
(package
  (name "go-github-com-google-shlex")
  (version "0.0.0-20191202100458-e7afc7fbc510")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/google/shlex")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "14z8hqyik910wk2qwnzgz8mjsmiamxa0pj55ahbv0jx6j3dgvzfm"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/google/shlex"))
  (home-page "https://github.com/google/shlex")
  (synopsis #f)
  (description
   "Package shlex implements a simple lexer which splits input in to tokens using\nshell-style rules for quoting and commenting.")
  (license license:asl2.0))
(package
  (name "go-gotest-tools-gotestsum")
  (version "1.8.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gotestyourself/gotestsum")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0piv2lxh6b1zxha4ii1s7s8c47xr5fn351ykbbjvjf4338bzk506"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "gotest.tools/gotestsum"))
  (propagated-inputs
   `(("go-gotest-tools-v3" ,go-gotest-tools-v3)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-term" ,go-golang-org-x-term)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-google-shlex"
      ,go-github-com-google-shlex)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-fsnotify-fsnotify"
      ,go-github-com-fsnotify-fsnotify)
     ("go-github-com-fatih-color"
      ,go-github-com-fatih-color)
     ("go-github-com-dnephin-pflag"
      ,go-github-com-dnephin-pflag)))
  (home-page "https://gotest.tools/gotestsum")
  (synopsis "gotestsum")
  (description
   "@code{gotestsum} runs tests using @code{go test -json}, prints formatted test\noutput, and a summary of the test run.  It is designed to work well for both\nlocal development, and for automation like CI.")
  (license license:asl2.0))
(package
  (name "go-github-com-testcontainers-testcontainers-go")
  (version "0.14.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/testcontainers/testcontainers-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1zxr2r2w8ykamvca9g9yi11cklq6cxal47rg4ymk11b0sps2bw7a"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/testcontainers/testcontainers-go"))
  (propagated-inputs
   `(("go-gotest-tools-v3" ,go-gotest-tools-v3)
     ("go-gotest-tools-gotestsum"
      ,go-gotest-tools-gotestsum)
     ("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-opencontainers-runc"
      ,go-github-com-opencontainers-runc)
     ("go-github-com-opencontainers-image-spec"
      ,go-github-com-opencontainers-image-spec)
     ("go-github-com-moby-term"
      ,go-github-com-moby-term)
     ("go-github-com-moby-sys-mount"
      ,go-github-com-moby-sys-mount)
     ("go-github-com-magiconair-properties"
      ,go-github-com-magiconair-properties)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-go-sql-driver-mysql"
      ,go-github-com-go-sql-driver-mysql)
     ("go-github-com-go-redis-redis-v8"
      ,go-github-com-go-redis-redis-v8)
     ("go-github-com-docker-go-units"
      ,go-github-com-docker-go-units)
     ("go-github-com-docker-go-connections"
      ,go-github-com-docker-go-connections)
     ("go-github-com-docker-docker"
      ,go-github-com-docker-docker)
     ("go-github-com-docker-distribution"
      ,go-github-com-docker-distribution)
     ("go-github-com-containerd-continuity"
      ,go-github-com-containerd-continuity)
     ("go-github-com-containerd-containerd"
      ,go-github-com-containerd-containerd)
     ("go-github-com-containerd-cgroups"
      ,go-github-com-containerd-cgroups)
     ("go-github-com-cenkalti-backoff-v4"
      ,go-github-com-cenkalti-backoff-v4)))
  (home-page
   "https://github.com/testcontainers/testcontainers-go")
  (synopsis "Documentation")
  (description
   "Testcontainers-Go is a Go package that makes it simple to create and clean up\ncontainer-based dependencies for automated integration/smoke tests.  The clean,\neasy-to-use API enables developers to programmatically define containers that\nshould be run as part of a test and clean up those resources when the test is\ndone.")
  (license license:expat))
(package
  (name "go-github-com-mattn-go-ieproxy")
  (version "0.0.9")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/mattn/go-ieproxy")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0b26jnkjkjnjvwq1fyyv2gvj1smr9jyj7msdzc8sisyd5n196sw6"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/mattn/go-ieproxy"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)))
  (home-page "https://github.com/mattn/go-ieproxy")
  (synopsis "ieproxy")
  (description
   "Package ieproxy is a utility to retrieve the proxy parameters (especially of\nInternet Explorer on windows)")
  (license license:expat))
(package
  (name "go-github-com-azure-azure-pipeline-go")
  (version "0.2.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Azure/azure-pipeline-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "154qwr7v1q2wjp263jhkvrygi728q568zc930h3fxp75v32laqwb"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/Azure/azure-pipeline-go"))
  (propagated-inputs
   `(("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-mattn-go-ieproxy"
      ,go-github-com-mattn-go-ieproxy)))
  (home-page
   "https://github.com/Azure/azure-pipeline-go")
  (synopsis "Contributing")
  (description
   "This project welcomes contributions and suggestions.  Most contributions require\nyou to agree to a Contributor License Agreement (CLA) declaring that you have\nthe right to, and actually do, grant us the rights to use your contribution.\nFor details, visit @url{https://cla.microsoft.com,https://cla.microsoft.com}.")
  (license license:expat))
(package
  (name "go-github-com-azure-azure-sdk-for-go-sdk-azcore")
  (version "1.1.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Azure/azure-sdk-for-go")
           (commit
            (string-append "sdk/azcore/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "05122nq295c1a7j32c7b8v340wag2nsdicxizjw7p9lx6qmdi4n3"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/Azure/azure-sdk-for-go/sdk/azcore"
     #:unpack-path
     "github.com/Azure/azure-sdk-for-go"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-azure-azure-sdk-for-go-sdk-internal"
      ,go-github-com-azure-azure-sdk-for-go-sdk-internal)))
  (home-page
   "https://github.com/Azure/azure-sdk-for-go")
  (synopsis "Azure Core Client Module for Go")
  (description
   "Package azcore implements an HTTP request/response middleware pipeline used by\nAzure SDK clients.")
  (license license:expat))
(package
  (name "go-github-com-azure-azure-sdk-for-go-sdk-azidentity")
  (version "1.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Azure/azure-sdk-for-go")
           (commit
            (string-append "sdk/azidentity/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1kia50lbp9fsz2pplf405jpyvdbzi6w8x954bprizyyv7f80xgxa"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/Azure/azure-sdk-for-go/sdk/azidentity"
     #:unpack-path
     "github.com/Azure/azure-sdk-for-go"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-pkg-browser"
      ,go-github-com-pkg-browser)
     ("go-github-com-kylelemons-godebug"
      ,go-github-com-kylelemons-godebug)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-golang-jwt-jwt"
      ,go-github-com-golang-jwt-jwt)
     ("go-github-com-dnaeon-go-vcr"
      ,go-github-com-dnaeon-go-vcr)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-golang-jwt-jwt-v4"
      ,go-github-com-golang-jwt-jwt-v4)
     ("go-github-com-azuread-microsoft-authentication-library-for-go"
      ,go-github-com-azuread-microsoft-authentication-library-for-go)
     ("go-github-com-azure-azure-sdk-for-go-sdk-internal"
      ,go-github-com-azure-azure-sdk-for-go-sdk-internal)
     ("go-github-com-azure-azure-sdk-for-go-sdk-azcore"
      ,go-github-com-azure-azure-sdk-for-go-sdk-azcore)))
  (home-page
   "https://github.com/Azure/azure-sdk-for-go")
  (synopsis "Azure Identity Client Module for Go")
  (description
   "The Azure Identity module provides Azure Active Directory (Azure AD) token\nauthentication support across the Azure SDK.  It includes a set of\n@code{TokenCredential} implementations, which can be used with Azure SDK clients\nsupporting token authentication.")
  (license license:expat))
(package
  (name "go-github-com-azure-azure-sdk-for-go-sdk-internal")
  (version "1.0.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Azure/azure-sdk-for-go")
           (commit
            (string-append "sdk/internal/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "06b3l4ali5m1dx7gk2d2rsdha8l6k57gsaphmwfmmcqa2gihh86g"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/Azure/azure-sdk-for-go/sdk/internal"
     #:unpack-path
     "github.com/Azure/azure-sdk-for-go"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-dnaeon-go-vcr"
      ,go-github-com-dnaeon-go-vcr)))
  (home-page
   "https://github.com/Azure/azure-sdk-for-go")
  (synopsis "Azure.Core Internal Module for Go")
  (description
   "internal contains content for Azure SDK developers.")
  (license license:expat))
(package
  (name "go-github-com-azuread-microsoft-authentication-library-for-go")
  (version "0.7.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/AzureAD/microsoft-authentication-library-for-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1v2p8xn291j3fszcvl3p0nj3i0pwhqbaa1v0brnnv7mhimyx6km3"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/AzureAD/microsoft-authentication-library-for-go"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-pkg-browser"
      ,go-github-com-pkg-browser)
     ("go-github-com-montanaflynn-stats"
      ,go-github-com-montanaflynn-stats)
     ("go-github-com-kylelemons-godebug"
      ,go-github-com-kylelemons-godebug)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-golang-jwt-jwt-v4"
      ,go-github-com-golang-jwt-jwt-v4)))
  (home-page
   "https://github.com/AzureAD/microsoft-authentication-library-for-go")
  (synopsis
   "Microsoft Authentication Library (MSAL) for Go")
  (description
   "The Microsoft Authentication Library (MSAL) for Go is part of the\n@url{https://aka.ms/aaddevv2,Microsoft identity platform for developers}\n(formerly named Azure AD) v2.0.  It allows you to sign in users or apps with\nMicrosoft identities\n(@url{https://azure.microsoft.com/services/active-directory/,Azure AD} and\n@url{https://account.microsoft.com,Microsoft Accounts}) and obtain tokens to\ncall Microsoft APIs such as @url{https://graph.microsoft.io/,Microsoft Graph} or\nyour own APIs registered with the Microsoft identity platform.  It is built\nusing industry standard OAuth2 and OpenID Connect protocols.")
  (license license:expat))
(package
  (name "go-github-com-azure-azure-sdk-for-go-sdk-storage-azblob")
  (version "0.4.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Azure/azure-sdk-for-go")
           (commit
            (string-append "sdk/storage/azblob/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0g1gnxhrc85yzz2gvas96i5yqk7350s2igziqqp03gv70zk5ifpj"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/Azure/azure-sdk-for-go/sdk/storage/azblob"
     #:unpack-path
     "github.com/Azure/azure-sdk-for-go"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-pkg-browser"
      ,go-github-com-pkg-browser)
     ("go-github-com-kylelemons-godebug"
      ,go-github-com-kylelemons-godebug)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-golang-jwt-jwt"
      ,go-github-com-golang-jwt-jwt)
     ("go-github-com-dnaeon-go-vcr"
      ,go-github-com-dnaeon-go-vcr)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-azuread-microsoft-authentication-library-for-go"
      ,go-github-com-azuread-microsoft-authentication-library-for-go)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-azure-azure-sdk-for-go-sdk-internal"
      ,go-github-com-azure-azure-sdk-for-go-sdk-internal)
     ("go-github-com-azure-azure-sdk-for-go-sdk-azidentity"
      ,go-github-com-azure-azure-sdk-for-go-sdk-azidentity)
     ("go-github-com-azure-azure-sdk-for-go-sdk-azcore"
      ,go-github-com-azure-azure-sdk-for-go-sdk-azcore)))
  (home-page
   "https://github.com/Azure/azure-sdk-for-go")
  (synopsis "Azure Blob Storage SDK for Go")
  (description
   "The Microsoft Azure Storage SDK for Go allows you to build applications that\ntakes advantage of Azure's scalable cloud storage.  This is the new beta client\nmodule for Azure Blob Storage, which follows our\n@url{https://azure.github.io/azure-sdk/golang_introduction.html,Azure SDK Design\nGuidelines for Go} and replaces the previous beta\n@url{https://github.com/azure/azure-storage-blob-go,azblob package}.")
  (license license:expat))
(package
  (name "go-github-com-aws-aws-sdk-go-v2-config")
  (version "1.17.7")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit (string-append "config/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lyqchcph8yfkldcd5pxmk70wqrspp5wgx03fn6xi643w1l2hm5j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/aws/aws-sdk-go-v2/config"
     #:unpack-path
     "github.com/aws/aws-sdk-go-v2"))
  (propagated-inputs
   `(("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis #f)
  (description
   "Package config provides utilities for loading configuration from multiple\nsources that can be used to configure the SDK's API clients, and utilities.")
  (license license:asl2.0))
(package
  (name "go-github-com-aws-aws-sdk-go-v2-feature-s3-manager")
  (version "1.11.33")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit
            (string-append "feature/s3/manager/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lyqchcph8yfkldcd5pxmk70wqrspp5wgx03fn6xi643w1l2hm5j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/aws/aws-sdk-go-v2/feature/s3/manager"
     #:unpack-path
     "github.com/aws/aws-sdk-go-v2"))
  (propagated-inputs
   `(("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis #f)
  (description
   "Package manager provides utilities to upload and download objects from S3\nconcurrently.  Helpful for when working with large objects.")
  (license license:asl2.0))
(package
  (name "go-github-com-aws-aws-sdk-go-v2-service-s3")
  (version "1.27.11")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit
            (string-append "service/s3/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lyqchcph8yfkldcd5pxmk70wqrspp5wgx03fn6xi643w1l2hm5j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/aws/aws-sdk-go-v2/service/s3"
     #:unpack-path
     "github.com/aws/aws-sdk-go-v2"))
  (propagated-inputs
   `(("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis #f)
  (description
   "Package s3 provides the API client, operations, and parameter types for Amazon\nSimple Storage Service.")
  (license license:asl2.0))
(package
  (name "go-github-com-colinmarc-hdfs-v2")
  (version "2.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/colinmarc/hdfs")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "08dnvbfcq06qq6rw6h5kkxmsj06ndsxk6qklm7qnfy54wf2h7332"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/colinmarc/hdfs/v2"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-jcmturner-rpc-v2"
      ,go-github-com-jcmturner-rpc-v2)
     ("go-github-com-jcmturner-goidentity-v6"
      ,go-github-com-jcmturner-goidentity-v6)
     ("go-github-com-jcmturner-gofork"
      ,go-github-com-jcmturner-gofork)
     ("go-github-com-jcmturner-dnsutils-v2"
      ,go-github-com-jcmturner-dnsutils-v2)
     ("go-github-com-jcmturner-aescts-v2"
      ,go-github-com-jcmturner-aescts-v2)
     ("go-github-com-hashicorp-go-uuid"
      ,go-github-com-hashicorp-go-uuid)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-pborman-getopt"
      ,go-github-com-pborman-getopt)
     ("go-github-com-jcmturner-gokrb5-v8"
      ,go-github-com-jcmturner-gokrb5-v8)))
  (home-page "https://github.com/colinmarc/hdfs")
  (synopsis "HDFS for Go")
  (description
   "Package hdfs provides a native, idiomatic interface to HDFS.  Where possible, it\nmimics the functionality and signatures of the standard `os` package.")
  (license license:expat))
(package
  (name "go-github-com-ncw-swift")
  (version "1.0.53")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ncw/swift")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0xcyf8463h6420ajma6bf0h312fgyivppfzhplk8z3dynd98nsfn"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/ncw/swift"))
  (home-page "https://github.com/ncw/swift")
  (synopsis "Swift")
  (description
   "Package swift provides an easy to use interface to Swift / Openstack Object\nStorage / Rackspace Cloud Files")
  (license license:expat))
(package
  (name "go-github-com-xitongsys-parquet-go")
  (version "1.6.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/xitongsys/parquet-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1lx8r5jz18m7g9n07aqwbwn3m3y44h3g8ijams7cz5m2zp32sqr5"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/xitongsys/parquet-go"))
  (propagated-inputs
   `(("go-github-com-xitongsys-parquet-go-source"
      ,go-github-com-xitongsys-parquet-go-source)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-pierrec-lz4-v4"
      ,go-github-com-pierrec-lz4-v4)
     ("go-github-com-klauspost-compress"
      ,go-github-com-klauspost-compress)
     ("go-github-com-golang-snappy"
      ,go-github-com-golang-snappy)
     ("go-github-com-aws-aws-sdk-go"
      ,go-github-com-aws-aws-sdk-go)
     ("go-github-com-apache-thrift"
      ,go-github-com-apache-thrift)
     ("go-github-com-apache-arrow-go-arrow"
      ,go-github-com-apache-arrow-go-arrow)))
  (home-page
   "https://github.com/xitongsys/parquet-go")
  (synopsis "parquet-go")
  (description
   "parquet-go is a pure-go implementation of reading and writing the parquet format\nfile.")
  (license license:asl2.0))
(package
  (name "go-github-com-xitongsys-parquet-go-source")
  (version "0.0.0-20220723234337-052319f3f36b")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/xitongsys/parquet-go-source")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "05m9jmwkhfnbah9fqm9hmd2npcjj93k0ds74j42hh7x7cdh62gn9"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/xitongsys/parquet-go-source"))
  (propagated-inputs
   `(("go-github-com-xitongsys-parquet-go"
      ,go-github-com-xitongsys-parquet-go)
     ("go-github-com-spf13-afero"
      ,go-github-com-spf13-afero)
     ("go-github-com-ncw-swift"
      ,go-github-com-ncw-swift)
     ("go-github-com-golang-mock"
      ,go-github-com-golang-mock)
     ("go-github-com-colinmarc-hdfs-v2"
      ,go-github-com-colinmarc-hdfs-v2)
     ("go-github-com-aws-aws-sdk-go-v2-service-s3"
      ,go-github-com-aws-aws-sdk-go-v2-service-s3)
     ("go-github-com-aws-aws-sdk-go-v2-feature-s3-manager"
      ,go-github-com-aws-aws-sdk-go-v2-feature-s3-manager)
     ("go-github-com-aws-aws-sdk-go-v2-config"
      ,go-github-com-aws-aws-sdk-go-v2-config)
     ("go-github-com-aws-aws-sdk-go-v2"
      ,go-github-com-aws-aws-sdk-go-v2)
     ("go-github-com-aws-aws-sdk-go"
      ,go-github-com-aws-aws-sdk-go)
     ("go-github-com-azure-azure-sdk-for-go-sdk-storage-azblob"
      ,go-github-com-azure-azure-sdk-for-go-sdk-storage-azblob)
     ("go-github-com-azure-azure-sdk-for-go-sdk-azidentity"
      ,go-github-com-azure-azure-sdk-for-go-sdk-azidentity)
     ("go-github-com-azure-azure-sdk-for-go-sdk-azcore"
      ,go-github-com-azure-azure-sdk-for-go-sdk-azcore)
     ("go-github-com-azure-azure-pipeline-go"
      ,go-github-com-azure-azure-pipeline-go)
     ("go-cloud-google-com-go-storage"
      ,go-cloud-google-com-go-storage)))
  (home-page
   "https://github.com/xitongsys/parquet-go-source")
  (synopsis "parquet-go-source")
  (description
   "parquet-go-source is a source provider for parquet-go.  Your source must\nimplement ParquetFile interface:")
  (license license:asl2.0))
(package
  (name "go-github-com-rogpeppe-clock")
  (version "0.0.0-20190514195947-2896927a307a")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/rogpeppe/clock")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "14lniymm87b6ar8ikyacv0805vx6kk72fqnq95rpq6pfxys544cg"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/rogpeppe/clock"))
  (propagated-inputs
   `(("go-github-com-frankban-quicktest"
      ,go-github-com-frankban-quicktest)))
  (home-page "https://github.com/rogpeppe/clock")
  (synopsis "clock")
  (description
   "An interface definition for a fully defined clock.")
  (license license:lgpl3))
(package
  (name "go-gopkg-in-retry-v1")
  (version "1.0.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gopkg.in/retry.v1")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0wnif9y19zca1ijl4d5ss2zyrchvr7rf0421xkmyqf1wl1qqizch"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "gopkg.in/retry.v1"
     #:unpack-path
     "gopkg.in/retry.v1"))
  (propagated-inputs
   `(("go-github-com-rogpeppe-clock"
      ,go-github-com-rogpeppe-clock)
     ("go-github-com-frankban-quicktest"
      ,go-github-com-frankban-quicktest)))
  (home-page "https://gopkg.in/retry.v1")
  (synopsis "retry")
  (description
   "Package retry implements flexible retry loops, including support for channel\ncancellation, mocked time, and composable retry strategies including exponential\nbackoff with jitter.")
  (license license:lgpl3))
(package
  (name "go-github-com-google-flatbuffers")
  (version "22.9.24+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/google/flatbuffers")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1vycd1641id476qhmkrgdfiisxx7n2zn54p3r6nva6dm0bd58lc8"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/google/flatbuffers"))
  (home-page
   "https://github.com/google/flatbuffers")
  (synopsis "FlatBuffers")
  (description
   "@strong{FlatBuffers} is a cross platform serialization library architected for\nmaximum memory efficiency.  It allows you to directly access serialized data\nwithout parsing/unpacking it first, while still having great forwards/backwards\ncompatibility.")
  (license license:asl2.0))
(package
  (name "go-github-com-apache-arrow-go-arrow")
  (version "0.0.0-20211112161151-bc219186db40")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/apache/arrow")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "03nh7c0i3y9rkkzw428knalkrlpb8syr459i00mwp072ijn8v4hx"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/apache/arrow/go/arrow"
     #:unpack-path
     "github.com/apache/arrow"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-gonum-org-v1-gonum" ,go-gonum-org-v1-gonum)
     ("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-exp" ,go-golang-org-x-exp)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-pierrec-lz4-v4"
      ,go-github-com-pierrec-lz4-v4)
     ("go-github-com-klauspost-compress"
      ,go-github-com-klauspost-compress)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-google-flatbuffers"
      ,go-github-com-google-flatbuffers)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)))
  (home-page "https://github.com/apache/arrow")
  (synopsis #f)
  (description
   "Package arrow provides an implementation of Apache Arrow.")
  (license license:asl2.0))
(package
  (name "go-github-com-apache-thrift")
  (version "0.17.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/apache/thrift")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "13xwbdibjvdfq2vbzrp8lwnpbj9syizx2ldjizbzaa6imjmz1k35"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/apache/thrift"))
  (propagated-inputs
   `(("go-github-com-golang-mock"
      ,go-github-com-golang-mock)))
  (home-page "https://github.com/apache/thrift")
  (synopsis "Apache Thrift")
  (description
   "Thrift is a lightweight, language-independent software stack for point-to-point\nRPC implementation.  Thrift provides clean abstractions and implementations for\ndata transport, data serialization, and application level processing.  The code\ngeneration system takes a simple definition language as input and generates code\nacross programming languages that uses the abstracted stack to build\ninteroperable RPC clients and servers.")
  (license license:asl2.0))
(package
  (name "go-github-com-adalogics-go-fuzz-headers")
  (version "0.0.0-20220903154154-e8044f6e4c72")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/AdaLogics/go-fuzz-headers")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "033wh71ci8abh9dbabsnyp0y2d2lbzmca4ijmkmkvs9fccbf2hrf"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/AdaLogics/go-fuzz-headers"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-kr-text" ,go-github-com-kr-text)
     ("go-github-com-cyphar-filepath-securejoin"
      ,go-github-com-cyphar-filepath-securejoin)))
  (home-page
   "https://github.com/AdaLogics/go-fuzz-headers")
  (synopsis "go-fuzz-headers")
  (description
   "This repository contains various helper functions for go fuzzing.  It is mostly\nused in combination with @url{https://github.com/dvyukov/go-fuzz,go-fuzz}, but\ncompatibility with fuzzing in the standard library will also be supported.  Any\ncoverage guided fuzzing engine that provides an array or slice of bytes can be\nused with go-fuzz-headers.")
  (license license:asl2.0))
(package
  (name "go-github-com-containerd-aufs")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containerd/aufs")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0jyyyf6sr910m602axmp4h4j1l2n680cpp60z09pvprz55zi4ba0"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/containerd/aufs"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-containerd-continuity"
      ,go-github-com-containerd-continuity)
     ("go-github-com-containerd-containerd"
      ,go-github-com-containerd-containerd)))
  (home-page "https://github.com/containerd/aufs")
  (synopsis "aufs snapshotter")
  (description
   "AUFS implementation of the snapshot interface for containerd.")
  (license license:asl2.0))
(package
  (name "go-github-com-containerd-btrfs")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containerd/btrfs")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1yf38gg41y1v12m0cl81r9q7d13170a4npzqxhbz7qn32zr23kzn"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/containerd/btrfs"))
  (propagated-inputs
   `(("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)))
  (home-page "https://github.com/containerd/btrfs")
  (synopsis "go-btrfs")
  (description
   "Package btrfs provides bindings for working with btrfs partitions from Go.")
  (license license:asl2.0))
(package
  (name "go-github-com-containerd-fifo")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containerd/fifo")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1l6jy9b4mjcj7pbz1n79zmipni1dz60rf5n66vn5p2ggavbq7h1q"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/containerd/fifo"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)))
  (home-page "https://github.com/containerd/fifo")
  (synopsis "fifo")
  (description
   "Go package for handling fifos in a sane way.")
  (license license:asl2.0))
(package
  (name "go-github-com-containerd-go-cni")
  (version "1.1.7")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containerd/go-cni")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1hwgqcnf77w0b93qrmilbsrq467g9i7hclxjcz6gq7kj0jfc32cd"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/containerd/go-cni"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-github-com-stretchr-objx"
      ,go-github-com-stretchr-objx)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-containernetworking-cni"
      ,go-github-com-containernetworking-cni)))
  (home-page
   "https://github.com/containerd/go-cni")
  (synopsis "go-cni")
  (description
   "This package provides a generic CNI library to provide APIs for CNI plugin\ninteractions.  The library provides APIs to:")
  (license license:asl2.0))
(package
  (name "go-github-com-containerd-imgcrypt")
  (version "1.1.6")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containerd/imgcrypt")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "119knzryyygm010bjhj4kf5fingmr19yhhp84hjv50xj15vk3nna"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/containerd/imgcrypt"))
  (propagated-inputs
   `(("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-github-com-urfave-cli"
      ,go-github-com-urfave-cli)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-opencontainers-runtime-spec"
      ,go-github-com-opencontainers-runtime-spec)
     ("go-github-com-opencontainers-image-spec"
      ,go-github-com-opencontainers-image-spec)
     ("go-github-com-opencontainers-go-digest"
      ,go-github-com-opencontainers-go-digest)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-containers-ocicrypt"
      ,go-github-com-containers-ocicrypt)
     ("go-github-com-containerd-typeurl"
      ,go-github-com-containerd-typeurl)
     ("go-github-com-containerd-go-cni"
      ,go-github-com-containerd-go-cni)
     ("go-github-com-containerd-containerd"
      ,go-github-com-containerd-containerd)
     ("go-github-com-containerd-console"
      ,go-github-com-containerd-console)
     ("go-github-com-microsoft-hcsshim"
      ,go-github-com-microsoft-hcsshim)
     ("go-github-com-microsoft-go-winio"
      ,go-github-com-microsoft-go-winio)))
  (home-page
   "https://github.com/containerd/imgcrypt")
  (synopsis
   "imgcrypt image encryption library and command line tool")
  (description
   "Project @code{imgcrypt} is a non-core subproject of containerd.")
  (license license:asl2.0))
(package
  (name "go-github-com-containerd-nri")
  (version "0.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containerd/nri")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0hqji5qa0n0fdyv9sjdl7mv3bb4fnq9i79pdzlw6m1nigrnb18qp"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/containerd/nri"))
  (propagated-inputs
   `(("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-containerd-containerd"
      ,go-github-com-containerd-containerd)))
  (home-page "https://github.com/containerd/nri")
  (synopsis "nri - Node Resource Interface")
  (description
   "This project is a WIP for a new, CNI like, interface for managing resources on a\nnode for Pods and Containers.")
  (license license:asl2.0))
(package
  (name "go-github-com-containerd-continuity")
  (version "0.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containerd/continuity")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0xha4q4zcljgy4ms7v605xwvxc6drncr7vwbzfgl6kaviq45qfs1"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/containerd/continuity"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-opencontainers-go-digest"
      ,go-github-com-opencontainers-go-digest)
     ("go-github-com-microsoft-go-winio"
      ,go-github-com-microsoft-go-winio)))
  (home-page
   "https://github.com/containerd/continuity")
  (synopsis "continuity")
  (description
   "This package provides a transport-agnostic, filesystem metadata manifest system")
  (license license:asl2.0))
(package
  (name "go-github-com-containerd-zfs")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containerd/zfs")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "10shqmcdxlxxi90kwgs5cljz12589yz5cm78aimv9m4cgwiv3wl3"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/containerd/zfs"))
  (propagated-inputs
   `(("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-mistifyio-go-zfs"
      ,go-github-com-mistifyio-go-zfs)
     ("go-github-com-containerd-continuity"
      ,go-github-com-containerd-continuity)
     ("go-github-com-containerd-containerd"
      ,go-github-com-containerd-containerd)))
  (home-page "https://github.com/containerd/zfs")
  (synopsis "ZFS snapshotter plugin")
  (description
   "ZFS snapshotter plugin for containerd.")
  (license license:asl2.0))
(package
  (name "go-github-com-containerd-go-runc")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containerd/go-runc")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0xk30dzzxmd83bnfyilplizlxh1pg1gqz2jrq9wz9rqqkxazc03n"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/containerd/go-runc"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-opencontainers-runtime-spec"
      ,go-github-com-opencontainers-runtime-spec)
     ("go-github-com-containerd-console"
      ,go-github-com-containerd-console)))
  (home-page
   "https://github.com/containerd/go-runc")
  (synopsis "go-runc")
  (description
   "This is a package for consuming the\n@url{https://github.com/opencontainers/runc,runc} binary in your Go\napplications.  It tries to expose all the settings and features of the runc CLI.\n If there is something missing then add it, its opensource!")
  (license license:asl2.0))
(package
  (name "go-github-com-containerd-ttrpc")
  (version "1.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containerd/ttrpc")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "13grp3ivmkdyhwpzhnva2w4lv035c4i1m0a2bdci4z44mif86gns"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/containerd/ttrpc"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-prometheus-procfs"
      ,go-github-com-prometheus-procfs)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)))
  (home-page "https://github.com/containerd/ttrpc")
  (synopsis "ttrpc")
  (description "GRPC for low-memory environments.")
  (license license:asl2.0))
(package
  (name "go-github-com-containerd-typeurl")
  (version "1.0.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containerd/typeurl")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0wvfxlxgkln11d9s6rxay965c715bnpk203klbsq8m8qpjqrz620"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/containerd/typeurl"))
  (propagated-inputs
   `(("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)))
  (home-page
   "https://github.com/containerd/typeurl")
  (synopsis "typeurl")
  (description
   "This package provides a Go package for managing the registration, marshaling,\nand unmarshaling of encoded types.")
  (license license:asl2.0))
(package
  (name "go-github-com-containerd-stargz-snapshotter-estargz")
  (version "0.12.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containerd/stargz-snapshotter")
           (commit (string-append "estargz/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1iy1l3kam3sqkf04l6w3svca8ijwljpb1i2f632v9vzzf607zjs4"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/containerd/stargz-snapshotter/estargz"
     #:unpack-path
     "github.com/containerd/stargz-snapshotter"))
  (propagated-inputs
   `(("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-github-com-vbatts-tar-split"
      ,go-github-com-vbatts-tar-split)
     ("go-github-com-opencontainers-go-digest"
      ,go-github-com-opencontainers-go-digest)
     ("go-github-com-klauspost-compress"
      ,go-github-com-klauspost-compress)))
  (home-page
   "https://github.com/containerd/stargz-snapshotter")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-github-com-docker-cli")
  (version "20.10.18+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/docker/cli")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0arp0vmcy74jw67hra832nh0vzpp5x436dxa5bxlpga4y72kl9h3"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/docker/cli"))
  (home-page "https://github.com/docker/cli")
  (synopsis "docker/cli")
  (description
   "This repository is the home of the cli used in the Docker CE and Docker EE\nproducts.")
  (license license:asl2.0))
(package
  (name "go-github-com-danieljoos-wincred")
  (version "1.1.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/danieljoos/wincred")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1arcb0l6ipha7ydlb9rbig1phhd824m1n2qi7a16bgkn1mz2ay9n"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/danieljoos/wincred"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page
   "https://github.com/danieljoos/wincred")
  (synopsis "wincred")
  (description
   "Package wincred provides primitives for accessing the Windows Credentials\nManagement API.  This includes functions for retrieval, listing and storage of\ncredentials as well as Go structures for convenient access to the credential\ndata.")
  (license license:expat))
(package
  (name "go-github-com-docker-docker-credential-helpers")
  (version "0.7.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/docker/docker-credential-helpers")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "06pj8w606dl1al1zdwyz7ijn32gr0j3c95kqjw0cxwkwsypddl1a"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/docker/docker-credential-helpers"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-danieljoos-wincred"
      ,go-github-com-danieljoos-wincred)))
  (home-page
   "https://github.com/docker/docker-credential-helpers")
  (synopsis "Introduction")
  (description
   "docker-credential-helpers is a suite of programs to use native stores to keep\nDocker credentials safe.")
  (license license:expat))
(package
  (name "go-github-com-google-go-containerregistry")
  (version "0.11.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/google/go-containerregistry")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0csrn4838wf72l43ihiayp8bh7v40gb9zc2s2vjjf3x1j2a6sbpl"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/google/go-containerregistry"))
  (propagated-inputs
   `(("go-gotest-tools-v3" ,go-gotest-tools-v3)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-time" ,go-golang-org-x-time)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-mod" ,go-golang-org-x-mod)
     ("go-github-com-vbatts-tar-split"
      ,go-github-com-vbatts-tar-split)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-russross-blackfriday-v2"
      ,go-github-com-russross-blackfriday-v2)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-morikuni-aec"
      ,go-github-com-morikuni-aec)
     ("go-github-com-moby-term"
      ,go-github-com-moby-term)
     ("go-github-com-klauspost-compress"
      ,go-github-com-klauspost-compress)
     ("go-github-com-inconshreveable-mousetrap"
      ,go-github-com-inconshreveable-mousetrap)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-docker-go-units"
      ,go-github-com-docker-go-units)
     ("go-github-com-docker-go-connections"
      ,go-github-com-docker-go-connections)
     ("go-github-com-docker-docker-credential-helpers"
      ,go-github-com-docker-docker-credential-helpers)
     ("go-github-com-cpuguy83-go-md2man-v2"
      ,go-github-com-cpuguy83-go-md2man-v2)
     ("go-github-com-microsoft-go-winio"
      ,go-github-com-microsoft-go-winio)
     ("go-github-com-azure-go-ansiterm"
      ,go-github-com-azure-go-ansiterm)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-opencontainers-image-spec"
      ,go-github-com-opencontainers-image-spec)
     ("go-github-com-opencontainers-go-digest"
      ,go-github-com-opencontainers-go-digest)
     ("go-github-com-mitchellh-go-homedir"
      ,go-github-com-mitchellh-go-homedir)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-docker-docker"
      ,go-github-com-docker-docker)
     ("go-github-com-docker-distribution"
      ,go-github-com-docker-distribution)
     ("go-github-com-docker-cli"
      ,go-github-com-docker-cli)
     ("go-github-com-containerd-stargz-snapshotter-estargz"
      ,go-github-com-containerd-stargz-snapshotter-estargz)))
  (home-page
   "https://github.com/google/go-containerregistry")
  (synopsis "go-containerregistry")
  (description
   "This is a golang library for working with container registries.  It's largely\nbased on the @url{https://github.com/google/containerregistry,Python library of\nthe same name}.")
  (license license:asl2.0))
(package
  (name "go-github-com-linuxkit-virtsock")
  (version "0.0.0-20220523201153-1a23e78aa7a2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/linuxkit/virtsock")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "014ni3fir85il4cg0fx0xbvgd3pdxmviq65b04cw8clly051i4lm"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/linuxkit/virtsock"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)))
  (home-page
   "https://github.com/linuxkit/virtsock")
  (synopsis "Organisation")
  (description
   "This repository contains Go bindings and sample code for\n@url{https://msdn.microsoft.com/en-us/virtualization/hyperv_on_windows/develop/make_mgmt_service,Hyper-V\nsockets} and @url{http://stefanha.github.io/virtio/,virtio sockets}(VSOCK).")
  (license license:asl2.0))
(package
  (name "go-github-com-microsoft-hcsshim")
  (version "0.9.4")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/microsoft/hcsshim")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1i0ab8p1bq58df3lzk5w1wza8fkyl85m5ah8r2ds6mq3sgxy4siz"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/Microsoft/hcsshim"))
  (propagated-inputs
   `(("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-go-etcd-io-bbolt" ,go-go-etcd-io-bbolt)
     ("go-github-com-vishvananda-netns"
      ,go-github-com-vishvananda-netns)
     ("go-github-com-vishvananda-netlink"
      ,go-github-com-vishvananda-netlink)
     ("go-github-com-urfave-cli"
      ,go-github-com-urfave-cli)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-opencontainers-runtime-spec"
      ,go-github-com-opencontainers-runtime-spec)
     ("go-github-com-opencontainers-runc"
      ,go-github-com-opencontainers-runc)
     ("go-github-com-mattn-go-shellwords"
      ,go-github-com-mattn-go-shellwords)
     ("go-github-com-linuxkit-virtsock"
      ,go-github-com-linuxkit-virtsock)
     ("go-github-com-google-go-containerregistry"
      ,go-github-com-google-go-containerregistry)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-mock"
      ,go-github-com-golang-mock)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-containerd-typeurl"
      ,go-github-com-containerd-typeurl)
     ("go-github-com-containerd-ttrpc"
      ,go-github-com-containerd-ttrpc)
     ("go-github-com-containerd-go-runc"
      ,go-github-com-containerd-go-runc)
     ("go-github-com-containerd-containerd"
      ,go-github-com-containerd-containerd)
     ("go-github-com-containerd-console"
      ,go-github-com-containerd-console)
     ("go-github-com-containerd-cgroups"
      ,go-github-com-containerd-cgroups)
     ("go-github-com-cenkalti-backoff-v4"
      ,go-github-com-cenkalti-backoff-v4)
     ("go-github-com-microsoft-go-winio"
      ,go-github-com-microsoft-go-winio)
     ("go-github-com-burntsushi-toml"
      ,go-github-com-burntsushi-toml)))
  (home-page
   "https://github.com/Microsoft/hcsshim")
  (synopsis "hcsshim")
  (description
   "This package contains the Golang interface for using the Windows\n@url{https://techcommunity.microsoft.com/t5/containers/introducing-the-host-compute-service-hcs/ba-p/382332,Host\nCompute Service} (HCS) to launch and manage\n@url{https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/,Windows\nContainers}.  It also contains other helpers and functions for managing Windows\nContainers such as the Golang interface for the Host Network Service (HNS), as\nwell as code for the\n@url{https://github.com/Microsoft/hcsshim/blob/v0.9.4/internal/guest/README.md,guest\nagent} (commonly referred to as the GCS or Guest Compute Service in the\ncodebase) used to support running Linux Hyper-V containers.")
  (license license:expat))
(package
  (name "go-github-com-alexflint-go-filemutex")
  (version "1.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/alexflint/go-filemutex")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0spb7s1f6vrhpcw3ix4x0cl79kyryak153lj0xax4y67zyma4y3l"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/alexflint/go-filemutex"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page
   "https://github.com/alexflint/go-filemutex")
  (synopsis "FileMutex")
  (description
   "FileMutex is similar to @code{sync.RWMutex}, but also synchronizes across\nprocesses.  On Linux, OSX, and other POSIX systems it uses the flock system\ncall.  On windows it uses the LockFileEx and UnlockFileEx system calls.")
  (license license:expat))
(package
  (name "go-github-com-coreos-go-iptables")
  (version "0.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/coreos/go-iptables")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "14q1k7fsaq5vd613cbzr2fby9yvxnx3j6bwf3a4h1bk013nmappl"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/coreos/go-iptables"))
  (home-page
   "https://github.com/coreos/go-iptables")
  (synopsis "go-iptables")
  (description "Go bindings for iptables utility.")
  (license license:asl2.0))
(package
  (name "go-github-com-d2g-dhcp4")
  (version "0.0.0-20170904100407-a1d1b6c41b1c")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/d2g/dhcp4")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "191hzw6yqzkm042h6miyycq3g0zrhqjhhpl27f8vhwzp4wanasiz"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/d2g/dhcp4"))
  (home-page "https://github.com/d2g/dhcp4")
  (synopsis
   "DHCP4 - A DHCP library written in Go.")
  (description
   "Warning: This library is still being developed.  Function calls will change.")
  (license license:bsd-3))
(package
  (name "go-github-com-d2g-dhcp4client")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/d2g/dhcp4client")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1n4qrn7xsgvnshmddq56hr8g2si5vfmxi0wnp0w71lmdfsxvvx0q"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/d2g/dhcp4client"))
  (home-page "https://github.com/d2g/dhcp4client")
  (synopsis "dhcp4client")
  (description "DHCP Client")
  (license license:mpl2.0))
(package
  (name "go-github-com-d2g-dhcp4server")
  (version "0.0.0-20181031114812-7d4a0a7f59a5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/d2g/dhcp4server")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "03ibq32flr74pxfly1yca9qicb6f15xgl159jjg3svgnzfjpblwl"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/d2g/dhcp4server"))
  (home-page "https://github.com/d2g/dhcp4server")
  (synopsis "dhcp4server")
  (description "DHCP Server")
  (license license:mpl2.0))
(package
  (name "go-github-com-networkplumbing-go-nft")
  (version "0.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/networkplumbing/go-nft")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1v0760240y85flxf8skav6nnx281v02yxrr1lb6xyc3yjcg4ga2c"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/networkplumbing/go-nft"))
  (propagated-inputs
   `(("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page
   "https://github.com/networkplumbing/go-nft")
  (synopsis "go-nft")
  (description "Go bindings for nft utility.")
  (license license:asl2.0))
(package
  (name "go-github-com-safchain-ethtool")
  (version "0.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/safchain/ethtool")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0951lggvf64wrbcbkixa1k9cw85rdh46r51f2kcfzwgllylpmy0x"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/safchain/ethtool"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
  (home-page "https://github.com/safchain/ethtool")
  (synopsis "ethtool go package")
  (description
   "Package ethtool  aims to provide a library giving a simple access to the Linux\nSIOCETHTOOL ioctl operations.  It can be used to retrieve informations from a\nnetwork device like statistics, driver related informations or even the peer of\na VETH interface.")
  (license license:asl2.0))
(package
  (name "go-github-com-containerd-cgroups")
  (version "1.0.4")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containerd/cgroups")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1b570cgrknglag812kr4f8q4ca68pii4s6567kks5pz0vhy9f1im"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/containerd/cgroups"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-go-uber-org-goleak" ,go-go-uber-org-goleak)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-opencontainers-runtime-spec"
      ,go-github-com-opencontainers-runtime-spec)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-godbus-dbus-v5"
      ,go-github-com-godbus-dbus-v5)
     ("go-github-com-docker-go-units"
      ,go-github-com-docker-go-units)
     ("go-github-com-coreos-go-systemd-v22"
      ,go-github-com-coreos-go-systemd-v22)
     ("go-github-com-cilium-ebpf"
      ,go-github-com-cilium-ebpf)))
  (home-page
   "https://github.com/containerd/cgroups")
  (synopsis "cgroups")
  (description
   "Go package for creating, managing, inspecting, and destroying cgroups.  The\nresources format for settings on the cgroup uses the OCI runtime-spec found\n@url{https://github.com/opencontainers/runtime-spec,here}.")
  (license license:asl2.0))
(package
  (name "go-github-com-containernetworking-plugins")
  (version "1.1.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containernetworking/plugins")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0i3qpbz4li5sgm65jxpb1phi25lr3z2pjr48iw03qvb8xr6adlr3"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/containernetworking/plugins"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-tomb-v1" ,go-gopkg-in-tomb-v1)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-vishvananda-netns"
      ,go-github-com-vishvananda-netns)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-nxadm-tail"
      ,go-github-com-nxadm-tail)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-fsnotify-fsnotify"
      ,go-github-com-fsnotify-fsnotify)
     ("go-github-com-containerd-cgroups"
      ,go-github-com-containerd-cgroups)
     ("go-github-com-microsoft-go-winio"
      ,go-github-com-microsoft-go-winio)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-vishvananda-netlink"
      ,go-github-com-vishvananda-netlink)
     ("go-github-com-safchain-ethtool"
      ,go-github-com-safchain-ethtool)
     ("go-github-com-onsi-gomega"
      ,go-github-com-onsi-gomega)
     ("go-github-com-onsi-ginkgo"
      ,go-github-com-onsi-ginkgo)
     ("go-github-com-networkplumbing-go-nft"
      ,go-github-com-networkplumbing-go-nft)
     ("go-github-com-mattn-go-shellwords"
      ,go-github-com-mattn-go-shellwords)
     ("go-github-com-godbus-dbus-v5"
      ,go-github-com-godbus-dbus-v5)
     ("go-github-com-d2g-dhcp4server"
      ,go-github-com-d2g-dhcp4server)
     ("go-github-com-d2g-dhcp4client"
      ,go-github-com-d2g-dhcp4client)
     ("go-github-com-d2g-dhcp4"
      ,go-github-com-d2g-dhcp4)
     ("go-github-com-coreos-go-systemd-v22"
      ,go-github-com-coreos-go-systemd-v22)
     ("go-github-com-coreos-go-iptables"
      ,go-github-com-coreos-go-iptables)
     ("go-github-com-containernetworking-cni"
      ,go-github-com-containernetworking-cni)
     ("go-github-com-buger-jsonparser"
      ,go-github-com-buger-jsonparser)
     ("go-github-com-alexflint-go-filemutex"
      ,go-github-com-alexflint-go-filemutex)
     ("go-github-com-microsoft-hcsshim"
      ,go-github-com-microsoft-hcsshim)))
  (home-page
   "https://github.com/containernetworking/plugins")
  (synopsis "Plugins")
  (description
   "Some CNI network plugins, maintained by the containernetworking team.  For more\ninformation, see the @url{https://www.cni.dev,CNI website}.")
  (license license:asl2.0))
(package
  (name "go-github-com-docker-go-events")
  (version "0.0.0-20190806004212-e31b211e4f1c")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/docker/go-events")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "09gm4z43g23isbklabnsnfb87bwf8kjdgvvyi3vfjq2bqdjdg7cl"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/docker/go-events"))
  (home-page "https://github.com/docker/go-events")
  (synopsis "Docker Events Package")
  (description
   "The Docker @code{events} package implements a composable event distribution\npackage for Go.")
  (license license:asl2.0))
(package
  (name "go-github-com-docker-go-metrics")
  (version "0.0.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/docker/go-metrics")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1b6f1889chmwlsgrqxylnks2jic16j2dqhsdd1dvaklk48ky95ga"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/docker/go-metrics"))
  (propagated-inputs
   `(("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)))
  (home-page
   "https://github.com/docker/go-metrics")
  (synopsis "go-metrics")
  (description
   "This package is small wrapper around the prometheus go client to help enforce\nconvention and best practices for metrics collection in Docker projects.")
  (license
   (list license:asl2.0 license:cc-by-sa4.0)))
(package
  (name "go-github-com-intel-goresctrl")
  (version "0.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/intel/goresctrl")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1cs0ang1ilxff8bx8wg3y0338nszlksrdf59kjf86wwak0x6vyxq"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/intel/goresctrl"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-inf-v0" ,go-gopkg-in-inf-v0)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-github-com-prometheus-procfs"
      ,go-github-com-prometheus-procfs)
     ("go-github-com-prometheus-common"
      ,go-github-com-prometheus-common)
     ("go-github-com-prometheus-client-model"
      ,go-github-com-prometheus-client-model)
     ("go-github-com-matttproud-golang-protobuf-extensions"
      ,go-github-com-matttproud-golang-protobuf-extensions)
     ("go-github-com-hashicorp-errwrap"
      ,go-github-com-hashicorp-errwrap)
     ("go-github-com-google-gofuzz"
      ,go-github-com-google-gofuzz)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-cespare-xxhash-v2"
      ,go-github-com-cespare-xxhash-v2)
     ("go-github-com-beorn7-perks"
      ,go-github-com-beorn7-perks)
     ("go-sigs-k8s-io-yaml" ,go-sigs-k8s-io-yaml)
     ("go-k8s-io-apimachinery"
      ,go-k8s-io-apimachinery)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-opencontainers-runtime-spec"
      ,go-github-com-opencontainers-runtime-spec)
     ("go-github-com-hashicorp-go-multierror"
      ,go-github-com-hashicorp-go-multierror)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)))
  (home-page "https://github.com/intel/goresctrl")
  (synopsis "Go Resource Control")
  (description
   "The goresctrl library provides Go interface to manage following resources.")
  (license license:asl2.0))
(package
  (name "go-github-com-moby-locker")
  (version "1.0.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/moby/locker")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "07rc2c6h35f9mcy81jp382a030f6xmcifi9n5jnlayybfwxmpjir"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/moby/locker"))
  (home-page "https://github.com/moby/locker")
  (synopsis "Locker")
  (description
   "Package locker provides a mechanism for creating finer-grained locking to help\nfree up more global locks to handle other tasks.")
  (license license:asl2.0))
(package
  (name "go-github-com-moby-sys-signal")
  (version "0.7.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/moby/sys")
           (commit (string-append "signal/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "12fkpiivxgs8j79rz0285gfqhfd83k86z4q5pb87hy2iqjjliyay"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/moby/sys/signal"
     #:unpack-path
     "github.com/moby/sys"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
  (home-page "https://github.com/moby/sys")
  (synopsis #f)
  (description
   "Package signal provides helper functions for dealing with signals across various\noperating systems.")
  (license license:asl2.0))
(package
  (name "go-github-com-moby-sys-symlink")
  (version "0.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/moby/sys")
           (commit (string-append "symlink/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1awh8wfl9d3k4fbjdpdjv6ydqy94ygal1rp968ba6yg4rj8nw90a"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/moby/sys/symlink"
     #:unpack-path
     "github.com/moby/sys"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
  (home-page "https://github.com/moby/sys")
  (synopsis #f)
  (description
   "Package symlink implements EvalSymlinksInScope which is an extension of\nfilepath.EvalSymlinks, as well as a Windows long-path aware version of\nfilepath.EvalSymlinks from the Go standard library\n(@url{https://golang.org/pkg/path/filepath,https://golang.org/pkg/path/filepath}).")
  (license license:asl2.0))
(package
  (name "go-github-com-tchap-go-patricia")
  (version "1.0.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/tchap/go-patricia")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1w3vpv4rnb0z3vyz045fhrdiz9n0z2s54s08gc2bna4hnwk1x10n"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/tchap/go-patricia"))
  (home-page
   "https://github.com/tchap/go-patricia")
  (synopsis "go-patricia")
  (description
   "@strong{Documentation}:\n@url{http://godoc.org/github.com/tchap/go-patricia/patricia,GoDoc} @strong{Test\nCoverage}: @url{https://coveralls.io/r/tchap/go-patricia,(img (@ (src\nhttps://coveralls.io/repos/tchap/go-patricia/badge.png) (alt CoverageStatus)))}")
  (license license:expat))
(package
  (name "go-github-com-coreos-go-oidc")
  (version "2.2.1+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/coreos/go-oidc")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "11m6slbpi33ynffml7812piq4anhjlf1qszjlsf26f5y7x3qh8n5"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/coreos/go-oidc"))
  (home-page "https://github.com/coreos/go-oidc")
  (synopsis "go-oidc")
  (description
   "Package oidc implements OpenID Connect client logic for the golang.org/x/oauth2\npackage.")
  (license license:asl2.0))
(package
  (name "go-sigs-k8s-io-apiserver-network-proxy-konnectivity-client")
  (version "0.0.33")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/kubernetes-sigs/apiserver-network-proxy")
           (commit
            (string-append
             "konnectivity-client/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1afcdy5ba71l7gd2yij8x0pc4xkmayz3bj0jqgrcxig3capwd0zh"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "sigs.k8s.io/apiserver-network-proxy/konnectivity-client"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-lint" ,go-golang-org-x-lint)
     ("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)
     ("go-k8s-io-klog-v2" ,go-k8s-io-klog-v2)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-go-uber-org-goleak" ,go-go-uber-org-goleak)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)))
  (home-page
   "https://sigs.k8s.io/apiserver-network-proxy/konnectivity-client")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-github-com-pquerna-cachecontrol")
  (version "0.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/pquerna/cachecontrol")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1ds4wgk6hm1sd6037dww5zm59syzs7vrdzh9q5x78s1lfrznsi3k"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/pquerna/cachecontrol"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page
   "https://github.com/pquerna/cachecontrol")
  (synopsis
   "cachecontrol: HTTP Caching Parser and Interpretation")
  (description
   "Package cachecontrol implements the logic for HTTP Caching")
  (license license:asl2.0))
(package
  (name "go-k8s-io-apiserver")
  (version "0.25.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/kubernetes/apiserver")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lb9sfhswg5lif16zxxq9piq9xg0a10wp1cdln4p63g5q0yhfj8x"))))
  (build-system go-build-system)
  (arguments '(#:import-path "k8s.io/apiserver"))
  (propagated-inputs
   `(("go-k8s-io-component-base"
      ,go-k8s-io-component-base)
     ("go-k8s-io-client-go" ,go-k8s-io-client-go)
     ("go-k8s-io-apimachinery"
      ,go-k8s-io-apimachinery)
     ("go-k8s-io-api" ,go-k8s-io-api)
     ("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-inf-v0" ,go-gopkg-in-inf-v0)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-time" ,go-golang-org-x-time)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-term" ,go-golang-org-x-term)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-go-uber-org-multierr"
      ,go-go-uber-org-multierr)
     ("go-go-uber-org-atomic" ,go-go-uber-org-atomic)
     ("go-go-opentelemetry-io-proto-otlp"
      ,go-go-opentelemetry-io-proto-otlp)
     ("go-go-opentelemetry-io-otel-sdk-metric"
      ,go-go-opentelemetry-io-otel-sdk-metric)
     ("go-go-opentelemetry-io-otel-sdk-export-metric"
      ,go-go-opentelemetry-io-otel-sdk-export-metric)
     ("go-go-opentelemetry-io-otel-metric"
      ,go-go-opentelemetry-io-otel-metric)
     ("go-go-opentelemetry-io-contrib"
      ,go-go-opentelemetry-io-contrib)
     ("go-go-etcd-io-etcd-raft-v3"
      ,go-go-etcd-io-etcd-raft-v3)
     ("go-go-etcd-io-etcd-pkg-v3"
      ,go-go-etcd-io-etcd-pkg-v3)
     ("go-go-etcd-io-etcd-client-v2"
      ,go-go-etcd-io-etcd-client-v2)
     ("go-go-etcd-io-bbolt" ,go-go-etcd-io-bbolt)
     ("go-github-com-xiang90-probing"
      ,go-github-com-xiang90-probing)
     ("go-github-com-tmc-grpc-websocket-proxy"
      ,go-github-com-tmc-grpc-websocket-proxy)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-spf13-afero"
      ,go-github-com-spf13-afero)
     ("go-github-com-soheilhy-cmux"
      ,go-github-com-soheilhy-cmux)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-prometheus-procfs"
      ,go-github-com-prometheus-procfs)
     ("go-github-com-prometheus-common"
      ,go-github-com-prometheus-common)
     ("go-github-com-prometheus-client-model"
      ,go-github-com-prometheus-client-model)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-pquerna-cachecontrol"
      ,go-github-com-pquerna-cachecontrol)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-modern-go-reflect2"
      ,go-github-com-modern-go-reflect2)
     ("go-github-com-modern-go-concurrent"
      ,go-github-com-modern-go-concurrent)
     ("go-github-com-matttproud-golang-protobuf-extensions"
      ,go-github-com-matttproud-golang-protobuf-extensions)
     ("go-github-com-mailru-easyjson"
      ,go-github-com-mailru-easyjson)
     ("go-github-com-json-iterator-go"
      ,go-github-com-json-iterator-go)
     ("go-github-com-josharian-intern"
      ,go-github-com-josharian-intern)
     ("go-github-com-jonboulle-clockwork"
      ,go-github-com-jonboulle-clockwork)
     ("go-github-com-inconshreveable-mousetrap"
      ,go-github-com-inconshreveable-mousetrap)
     ("go-github-com-imdario-mergo"
      ,go-github-com-imdario-mergo)
     ("go-github-com-grpc-ecosystem-grpc-gateway"
      ,go-github-com-grpc-ecosystem-grpc-gateway)
     ("go-github-com-grpc-ecosystem-go-grpc-middleware"
      ,go-github-com-grpc-ecosystem-go-grpc-middleware)
     ("go-github-com-gorilla-websocket"
      ,go-github-com-gorilla-websocket)
     ("go-github-com-google-btree"
      ,go-github-com-google-btree)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-github-com-go-openapi-swag"
      ,go-github-com-go-openapi-swag)
     ("go-github-com-go-openapi-jsonreference"
      ,go-github-com-go-openapi-jsonreference)
     ("go-github-com-go-openapi-jsonpointer"
      ,go-github-com-go-openapi-jsonpointer)
     ("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)
     ("go-github-com-form3tech-oss-jwt-go"
      ,go-github-com-form3tech-oss-jwt-go)
     ("go-github-com-felixge-httpsnoop"
      ,go-github-com-felixge-httpsnoop)
     ("go-github-com-dustin-go-humanize"
      ,go-github-com-dustin-go-humanize)
     ("go-github-com-coreos-go-semver"
      ,go-github-com-coreos-go-semver)
     ("go-github-com-cespare-xxhash-v2"
      ,go-github-com-cespare-xxhash-v2)
     ("go-github-com-blang-semver-v4"
      ,go-github-com-blang-semver-v4)
     ("go-github-com-beorn7-perks"
      ,go-github-com-beorn7-perks)
     ("go-github-com-puerkitobio-urlesc"
      ,go-github-com-puerkitobio-urlesc)
     ("go-github-com-puerkitobio-purell"
      ,go-github-com-puerkitobio-purell)
     ("go-github-com-nytimes-gziphandler"
      ,go-github-com-nytimes-gziphandler)
     ("go-sigs-k8s-io-yaml" ,go-sigs-k8s-io-yaml)
     ("go-sigs-k8s-io-structured-merge-diff-v4"
      ,go-sigs-k8s-io-structured-merge-diff-v4)
     ("go-sigs-k8s-io-json" ,go-sigs-k8s-io-json)
     ("go-sigs-k8s-io-apiserver-network-proxy-konnectivity-client"
      ,go-sigs-k8s-io-apiserver-network-proxy-konnectivity-client)
     ("go-k8s-io-utils" ,go-k8s-io-utils)
     ("go-k8s-io-kube-openapi"
      ,go-k8s-io-kube-openapi)
     ("go-k8s-io-klog-v2" ,go-k8s-io-klog-v2)
     ("go-gopkg-in-square-go-jose-v2"
      ,go-gopkg-in-square-go-jose-v2)
     ("go-gopkg-in-natefinch-lumberjack-v2"
      ,go-gopkg-in-natefinch-lumberjack-v2)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-go-uber-org-zap" ,go-go-uber-org-zap)
     ("go-go-opentelemetry-io-otel-trace"
      ,go-go-opentelemetry-io-otel-trace)
     ("go-go-opentelemetry-io-otel-sdk"
      ,go-go-opentelemetry-io-otel-sdk)
     ("go-go-opentelemetry-io-otel-exporters-otlp"
      ,go-go-opentelemetry-io-otel-exporters-otlp)
     ("go-go-opentelemetry-io-otel"
      ,go-go-opentelemetry-io-otel)
     ("go-go-opentelemetry-io-contrib-instrumentation-net-http-otelhttp"
      ,go-go-opentelemetry-io-contrib-instrumentation-net-http-otelhttp)
     ("go-go-opentelemetry-io-contrib-instrumentation-google-golang-org-grpc-otelgrpc"
      ,go-go-opentelemetry-io-contrib-instrumentation-google-golang-org-grpc-otelgrpc)
     ("go-go-etcd-io-etcd-server-v3"
      ,go-go-etcd-io-etcd-server-v3)
     ("go-go-etcd-io-etcd-client-v3"
      ,go-go-etcd-io-etcd-client-v3)
     ("go-go-etcd-io-etcd-client-pkg-v3"
      ,go-go-etcd-io-etcd-client-pkg-v3)
     ("go-go-etcd-io-etcd-api-v3"
      ,go-go-etcd-io-etcd-api-v3)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-munnerz-goautoneg"
      ,go-github-com-munnerz-goautoneg)
     ("go-github-com-grpc-ecosystem-go-grpc-prometheus"
      ,go-github-com-grpc-ecosystem-go-grpc-prometheus)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-google-gofuzz"
      ,go-github-com-google-gofuzz)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-google-gnostic"
      ,go-github-com-google-gnostic)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-fsnotify-fsnotify"
      ,go-github-com-fsnotify-fsnotify)
     ("go-github-com-evanphx-json-patch"
      ,go-github-com-evanphx-json-patch)
     ("go-github-com-emicklei-go-restful-v3"
      ,go-github-com-emicklei-go-restful-v3)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-coreos-go-systemd-v22"
      ,go-github-com-coreos-go-systemd-v22)
     ("go-github-com-coreos-go-oidc"
      ,go-github-com-coreos-go-oidc)))
  (home-page "https://k8s.io/apiserver")
  (synopsis "apiserver")
  (description
   "Generic library for building a Kubernetes aggregated API server.")
  (license license:asl2.0))
(package
  (name "go-github-com-blang-semver-v4")
  (version "4.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/blang/semver")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "14h9ys4n4kx9cbj42lkdf4i5k3nkll6sd62jcvl7cs565v6fiknz"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/blang/semver/v4"))
  (home-page "https://github.com/blang/semver")
  (synopsis #f)
  (description #f)
  (license license:expat))
(package
  (name "go-github-com-go-logr-zapr")
  (version "1.2.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-logr/zapr")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0qq8bqfwhidkrlm08lccdvw8wgn1k0w87zmn4bd82k8nm6vch9r4"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-logr/zapr"))
  (propagated-inputs
   `(("go-go-uber-org-zap" ,go-go-uber-org-zap)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)))
  (home-page "https://github.com/go-logr/zapr")
  (synopsis "Zapr ⚡")
  (description
   "Package zapr defines an implementation of the github.com/go-logr/logr interfaces\nbuilt on top of Zap (go.uber.org/zap).")
  (license license:asl2.0))
(package
  (name "go-k8s-io-component-base")
  (version "0.25.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/kubernetes/component-base")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1d7lznjms10i4gkhhzrj4gs0vdmpb7scfx57vvvdd4klxmrjxzq4"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "k8s.io/component-base"))
  (propagated-inputs
   `(("go-k8s-io-client-go" ,go-k8s-io-client-go)
     ("go-k8s-io-apimachinery"
      ,go-k8s-io-apimachinery)
     ("go-k8s-io-api" ,go-k8s-io-api)
     ("go-sigs-k8s-io-yaml" ,go-sigs-k8s-io-yaml)
     ("go-sigs-k8s-io-structured-merge-diff-v4"
      ,go-sigs-k8s-io-structured-merge-diff-v4)
     ("go-k8s-io-kube-openapi"
      ,go-k8s-io-kube-openapi)
     ("go-gotest-tools-v3" ,go-gotest-tools-v3)
     ("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-inf-v0" ,go-gopkg-in-inf-v0)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-time" ,go-golang-org-x-time)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-term" ,go-golang-org-x-term)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-lint" ,go-golang-org-x-lint)
     ("go-go-uber-org-multierr"
      ,go-go-uber-org-multierr)
     ("go-go-uber-org-atomic" ,go-go-uber-org-atomic)
     ("go-go-opentelemetry-io-proto-otlp"
      ,go-go-opentelemetry-io-proto-otlp)
     ("go-go-opentelemetry-io-otel-sdk-metric"
      ,go-go-opentelemetry-io-otel-sdk-metric)
     ("go-go-opentelemetry-io-otel-sdk-export-metric"
      ,go-go-opentelemetry-io-otel-sdk-export-metric)
     ("go-go-opentelemetry-io-otel-metric"
      ,go-go-opentelemetry-io-otel-metric)
     ("go-go-opentelemetry-io-contrib"
      ,go-go-opentelemetry-io-contrib)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-munnerz-goautoneg"
      ,go-github-com-munnerz-goautoneg)
     ("go-github-com-modern-go-reflect2"
      ,go-github-com-modern-go-reflect2)
     ("go-github-com-modern-go-concurrent"
      ,go-github-com-modern-go-concurrent)
     ("go-github-com-matttproud-golang-protobuf-extensions"
      ,go-github-com-matttproud-golang-protobuf-extensions)
     ("go-github-com-mailru-easyjson"
      ,go-github-com-mailru-easyjson)
     ("go-github-com-json-iterator-go"
      ,go-github-com-json-iterator-go)
     ("go-github-com-josharian-intern"
      ,go-github-com-josharian-intern)
     ("go-github-com-inconshreveable-mousetrap"
      ,go-github-com-inconshreveable-mousetrap)
     ("go-github-com-grpc-ecosystem-grpc-gateway"
      ,go-github-com-grpc-ecosystem-grpc-gateway)
     ("go-github-com-google-gofuzz"
      ,go-github-com-google-gofuzz)
     ("go-github-com-google-gnostic"
      ,go-github-com-google-gnostic)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-go-openapi-swag"
      ,go-github-com-go-openapi-swag)
     ("go-github-com-go-openapi-jsonreference"
      ,go-github-com-go-openapi-jsonreference)
     ("go-github-com-go-openapi-jsonpointer"
      ,go-github-com-go-openapi-jsonpointer)
     ("go-github-com-felixge-httpsnoop"
      ,go-github-com-felixge-httpsnoop)
     ("go-github-com-emicklei-go-restful-v3"
      ,go-github-com-emicklei-go-restful-v3)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-cespare-xxhash-v2"
      ,go-github-com-cespare-xxhash-v2)
     ("go-github-com-beorn7-perks"
      ,go-github-com-beorn7-perks)
     ("go-github-com-puerkitobio-urlesc"
      ,go-github-com-puerkitobio-urlesc)
     ("go-github-com-puerkitobio-purell"
      ,go-github-com-puerkitobio-purell)
     ("go-github-com-azure-go-ansiterm"
      ,go-github-com-azure-go-ansiterm)
     ("go-sigs-k8s-io-json" ,go-sigs-k8s-io-json)
     ("go-k8s-io-utils" ,go-k8s-io-utils)
     ("go-k8s-io-klog-v2" ,go-k8s-io-klog-v2)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-go-uber-org-zap" ,go-go-uber-org-zap)
     ("go-go-opentelemetry-io-otel-trace"
      ,go-go-opentelemetry-io-otel-trace)
     ("go-go-opentelemetry-io-otel-sdk"
      ,go-go-opentelemetry-io-otel-sdk)
     ("go-go-opentelemetry-io-otel-exporters-otlp"
      ,go-go-opentelemetry-io-otel-exporters-otlp)
     ("go-go-opentelemetry-io-otel"
      ,go-go-opentelemetry-io-otel)
     ("go-go-opentelemetry-io-contrib-instrumentation-net-http-otelhttp"
      ,go-go-opentelemetry-io-contrib-instrumentation-net-http-otelhttp)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-prometheus-procfs"
      ,go-github-com-prometheus-procfs)
     ("go-github-com-prometheus-common"
      ,go-github-com-prometheus-common)
     ("go-github-com-prometheus-client-model"
      ,go-github-com-prometheus-client-model)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-moby-term"
      ,go-github-com-moby-term)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-go-logr-zapr"
      ,go-github-com-go-logr-zapr)
     ("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)
     ("go-github-com-blang-semver-v4"
      ,go-github-com-blang-semver-v4)))
  (home-page "https://k8s.io/component-base")
  (synopsis "component-base")
  (description
   "Implement KEP 32:\n@url{https://github.com/kubernetes/enhancements/blob/master/keps/sig-cluster-lifecycle/wgs/783-component-base/README.md,https://github.com/kubernetes/enhancements/blob/master/keps/sig-cluster-lifecycle/wgs/783-component-base/README.md}")
  (license license:asl2.0))
(package
  (name "go-k8s-io-cri-api")
  (version "0.25.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/kubernetes/cri-api")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0dg3wm6v1zpxdaryv7ywssm18h35cxg3v4fassv1cjzs1sb81gba"))))
  (build-system go-build-system)
  (arguments '(#:import-path "k8s.io/cri-api"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-niemeyer-pretty"
      ,go-github-com-niemeyer-pretty)
     ("go-github-com-kr-text" ,go-github-com-kr-text)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)))
  (home-page "https://k8s.io/cri-api")
  (synopsis "Purpose")
  (description
   "This repository contains the definitions for the Container Runtime Interface\n(CRI).  CRI is a plugin interface which enables kubelet to use a wide variety of\ncontainer runtimes, without the need to recompile.  CRI consists of a protocol\nbuffers and gRPC API.  Read more about CRI API at\n@url{https://kubernetes.io/docs/concepts/architecture/cri/,kubernetes docs}.")
  (license license:asl2.0))
(package
  (name "go-github-com-containernetworking-cni")
  (version "1.1.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containernetworking/cni")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0s5msv5ss4vi9ysrvf75j108y7lwn3p4w7xhszd17fxai9xdbdw3"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/containernetworking/cni"))
  (propagated-inputs
   `(("go-github-com-onsi-gomega"
      ,go-github-com-onsi-gomega)
     ("go-github-com-onsi-ginkgo-v2"
      ,go-github-com-onsi-ginkgo-v2)))
  (home-page
   "https://github.com/containernetworking/cni")
  (synopsis
   "CNI - the Container Network Interface")
  (description
   "CNI (), a @url{https://cncf.io,Cloud Native Computing Foundation} project,\nconsists of a specification and libraries for writing plugins to configure\nnetwork interfaces in Linux containers, along with a number of supported\nplugins.  CNI concerns itself only with network connectivity of containers and\nremoving allocated resources when the container is deleted.  Because of this\nfocus, CNI has a wide range of support and the specification is simple to\nimplement.")
  (license license:asl2.0))
(package
  (name "go-github-com-containers-ocicrypt")
  (version "1.1.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containers/ocicrypt")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1b2jg2dd94b5faaxxap7v2q607h8n233prgbx6myxq2iqn1r2cg9"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/containers/ocicrypt"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-square-go-jose-v2"
      ,go-gopkg-in-square-go-jose-v2)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-golang-org-x-term" ,go-golang-org-x-term)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-go-mozilla-org-pkcs7"
      ,go-go-mozilla-org-pkcs7)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-stefanberger-go-pkcs11uri"
      ,go-github-com-stefanberger-go-pkcs11uri)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-opencontainers-image-spec"
      ,go-github-com-opencontainers-image-spec)
     ("go-github-com-opencontainers-go-digest"
      ,go-github-com-opencontainers-go-digest)
     ("go-github-com-miekg-pkcs11"
      ,go-github-com-miekg-pkcs11)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)))
  (home-page
   "https://github.com/containers/ocicrypt")
  (synopsis "OCIcrypt Library")
  (description
   "The @code{ocicrypt} library is the OCI image spec implementation of container\nimage encryption.  More details of the spec can be seen in the\n@url{https://github.com/opencontainers/image-spec/pull/775,OCI repository}.  The\npurpose of this library is to encode spec structures and consts in code, as well\nas provide a consistent implementation of image encryption across container\nruntimes and build tools.")
  (license license:asl2.0))
(package
  (name "go-github-com-mistifyio-go-zfs")
  (version "2.1.1+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/mistifyio/go-zfs")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1k2dnrmd3zgjm7ag779mbgbxj344yyk4mq3bdn9jy7hphfpqyrgp"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/mistifyio/go-zfs"))
  (home-page "https://github.com/mistifyio/go-zfs")
  (synopsis "Go Wrapper for ZFS")
  (description
   "Package zfs provides wrappers around the ZFS command line tools.")
  (license license:asl2.0))
(package
  (name "go-github-com-gogo-googleapis")
  (version "1.4.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gogo/googleapis")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "094znmiswmz8d4b6k7il655gvjrwvraacln0n0lzv5kskbzhlmfi"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gogo/googleapis"))
  (propagated-inputs
   `(("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)))
  (home-page "https://github.com/gogo/googleapis")
  (synopsis
   "Google APIs generated by gogoprotobuf")
  (description
   "The @url{https://github.com/gogo/grpc-example,grpc-example} includes an example\nusage of this repository.")
  (license license:asl2.0))
(package
  (name "go-github-com-containerd-containerd")
  (version "1.6.8")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/containerd/containerd")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0cf5ddhgdwqk9ls60jwngsbvbnmv0hhqkk4jpya9x16qqxsk6slh"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/containerd/containerd"))
  (propagated-inputs
   `(("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-github-com-urfave-cli"
      ,go-github-com-urfave-cli)
     ("go-github-com-gogo-googleapis"
      ,go-github-com-gogo-googleapis)
     ("go-sigs-k8s-io-yaml" ,go-sigs-k8s-io-yaml)
     ("go-sigs-k8s-io-structured-merge-diff-v4"
      ,go-sigs-k8s-io-structured-merge-diff-v4)
     ("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-square-go-jose-v2"
      ,go-gopkg-in-square-go-jose-v2)
     ("go-gopkg-in-inf-v0" ,go-gopkg-in-inf-v0)
     ("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-golang-org-x-time" ,go-golang-org-x-time)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-term" ,go-golang-org-x-term)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-go-opentelemetry-io-proto-otlp"
      ,go-go-opentelemetry-io-proto-otlp)
     ("go-go-opentelemetry-io-otel-exporters-otlp-internal-retry"
      ,go-go-opentelemetry-io-otel-exporters-otlp-internal-retry)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-go-mozilla-org-pkcs7"
      ,go-go-mozilla-org-pkcs7)
     ("go-github-com-vishvananda-netns"
      ,go-github-com-vishvananda-netns)
     ("go-github-com-stefanberger-go-pkcs11uri"
      ,go-github-com-stefanberger-go-pkcs11uri)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-shurcool-sanitized-anchor-name"
      ,go-github-com-shurcool-sanitized-anchor-name)
     ("go-github-com-russross-blackfriday-v2"
      ,go-github-com-russross-blackfriday-v2)
     ("go-github-com-prometheus-procfs"
      ,go-github-com-prometheus-procfs)
     ("go-github-com-prometheus-common"
      ,go-github-com-prometheus-common)
     ("go-github-com-prometheus-client-model"
      ,go-github-com-prometheus-client-model)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-modern-go-reflect2"
      ,go-github-com-modern-go-reflect2)
     ("go-github-com-modern-go-concurrent"
      ,go-github-com-modern-go-concurrent)
     ("go-github-com-moby-spdystream"
      ,go-github-com-moby-spdystream)
     ("go-github-com-mistifyio-go-zfs"
      ,go-github-com-mistifyio-go-zfs)
     ("go-github-com-miekg-pkcs11"
      ,go-github-com-miekg-pkcs11)
     ("go-github-com-matttproud-golang-protobuf-extensions"
      ,go-github-com-matttproud-golang-protobuf-extensions)
     ("go-github-com-json-iterator-go"
      ,go-github-com-json-iterator-go)
     ("go-github-com-hashicorp-errwrap"
      ,go-github-com-hashicorp-errwrap)
     ("go-github-com-grpc-ecosystem-grpc-gateway"
      ,go-github-com-grpc-ecosystem-grpc-gateway)
     ("go-github-com-google-gofuzz"
      ,go-github-com-google-gofuzz)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-github-com-godbus-dbus-v5"
      ,go-github-com-godbus-dbus-v5)
     ("go-github-com-go-logr-stdr"
      ,go-github-com-go-logr-stdr)
     ("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)
     ("go-github-com-cpuguy83-go-md2man-v2"
      ,go-github-com-cpuguy83-go-md2man-v2)
     ("go-github-com-containers-ocicrypt"
      ,go-github-com-containers-ocicrypt)
     ("go-github-com-containernetworking-cni"
      ,go-github-com-containernetworking-cni)
     ("go-github-com-cilium-ebpf"
      ,go-github-com-cilium-ebpf)
     ("go-github-com-cespare-xxhash-v2"
      ,go-github-com-cespare-xxhash-v2)
     ("go-github-com-cenkalti-backoff-v4"
      ,go-github-com-cenkalti-backoff-v4)
     ("go-github-com-blang-semver"
      ,go-github-com-blang-semver)
     ("go-github-com-beorn7-perks"
      ,go-github-com-beorn7-perks)
     ("go-k8s-io-utils" ,go-k8s-io-utils)
     ("go-k8s-io-klog-v2" ,go-k8s-io-klog-v2)
     ("go-k8s-io-cri-api" ,go-k8s-io-cri-api)
     ("go-k8s-io-component-base"
      ,go-k8s-io-component-base)
     ("go-k8s-io-client-go" ,go-k8s-io-client-go)
     ("go-k8s-io-apiserver" ,go-k8s-io-apiserver)
     ("go-k8s-io-apimachinery"
      ,go-k8s-io-apimachinery)
     ("go-k8s-io-api" ,go-k8s-io-api)
     ("go-gotest-tools-v3" ,go-gotest-tools-v3)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opentelemetry-io-otel-trace"
      ,go-go-opentelemetry-io-otel-trace)
     ("go-go-opentelemetry-io-otel-sdk"
      ,go-go-opentelemetry-io-otel-sdk)
     ("go-go-opentelemetry-io-otel-exporters-otlp-otlptrace-otlptracehttp"
      ,go-go-opentelemetry-io-otel-exporters-otlp-otlptrace-otlptracehttp)
     ("go-go-opentelemetry-io-otel-exporters-otlp-otlptrace-otlptracegrpc"
      ,go-go-opentelemetry-io-otel-exporters-otlp-otlptrace-otlptracegrpc)
     ("go-go-opentelemetry-io-otel-exporters-otlp-otlptrace"
      ,go-go-opentelemetry-io-otel-exporters-otlp-otlptrace)
     ("go-go-opentelemetry-io-otel"
      ,go-go-opentelemetry-io-otel)
     ("go-go-opentelemetry-io-contrib-instrumentation-google-golang-org-grpc-otelgrpc"
      ,go-go-opentelemetry-io-contrib-instrumentation-google-golang-org-grpc-otelgrpc)
     ("go-go-etcd-io-bbolt" ,go-go-etcd-io-bbolt)
     ("go-github-com-vishvananda-netlink"
      ,go-github-com-vishvananda-netlink)
     ("go-github-com-tchap-go-patricia"
      ,go-github-com-tchap-go-patricia)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-pelletier-go-toml"
      ,go-github-com-pelletier-go-toml)
     ("go-github-com-opencontainers-selinux"
      ,go-github-com-opencontainers-selinux)
     ("go-github-com-opencontainers-runtime-spec"
      ,go-github-com-opencontainers-runtime-spec)
     ("go-github-com-opencontainers-runc"
      ,go-github-com-opencontainers-runc)
     ("go-github-com-opencontainers-image-spec"
      ,go-github-com-opencontainers-image-spec)
     ("go-github-com-opencontainers-go-digest"
      ,go-github-com-opencontainers-go-digest)
     ("go-github-com-moby-sys-symlink"
      ,go-github-com-moby-sys-symlink)
     ("go-github-com-moby-sys-signal"
      ,go-github-com-moby-sys-signal)
     ("go-github-com-moby-sys-mountinfo"
      ,go-github-com-moby-sys-mountinfo)
     ("go-github-com-moby-locker"
      ,go-github-com-moby-locker)
     ("go-github-com-klauspost-compress"
      ,go-github-com-klauspost-compress)
     ("go-github-com-intel-goresctrl"
      ,go-github-com-intel-goresctrl)
     ("go-github-com-imdario-mergo"
      ,go-github-com-imdario-mergo)
     ("go-github-com-hashicorp-go-multierror"
      ,go-github-com-hashicorp-go-multierror)
     ("go-github-com-grpc-ecosystem-go-grpc-prometheus"
      ,go-github-com-grpc-ecosystem-go-grpc-prometheus)
     ("go-github-com-grpc-ecosystem-go-grpc-middleware"
      ,go-github-com-grpc-ecosystem-go-grpc-middleware)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-fsnotify-fsnotify"
      ,go-github-com-fsnotify-fsnotify)
     ("go-github-com-emicklei-go-restful"
      ,go-github-com-emicklei-go-restful)
     ("go-github-com-docker-go-units"
      ,go-github-com-docker-go-units)
     ("go-github-com-docker-go-metrics"
      ,go-github-com-docker-go-metrics)
     ("go-github-com-docker-go-events"
      ,go-github-com-docker-go-events)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-coreos-go-systemd-v22"
      ,go-github-com-coreos-go-systemd-v22)
     ("go-github-com-containernetworking-plugins"
      ,go-github-com-containernetworking-plugins)
     ("go-github-com-containerd-zfs"
      ,go-github-com-containerd-zfs)
     ("go-github-com-containerd-typeurl"
      ,go-github-com-containerd-typeurl)
     ("go-github-com-containerd-ttrpc"
      ,go-github-com-containerd-ttrpc)
     ("go-github-com-containerd-nri"
      ,go-github-com-containerd-nri)
     ("go-github-com-containerd-imgcrypt"
      ,go-github-com-containerd-imgcrypt)
     ("go-github-com-containerd-go-runc"
      ,go-github-com-containerd-go-runc)
     ("go-github-com-containerd-go-cni"
      ,go-github-com-containerd-go-cni)
     ("go-github-com-containerd-fifo"
      ,go-github-com-containerd-fifo)
     ("go-github-com-containerd-continuity"
      ,go-github-com-containerd-continuity)
     ("go-github-com-containerd-console"
      ,go-github-com-containerd-console)
     ("go-github-com-containerd-cgroups"
      ,go-github-com-containerd-cgroups)
     ("go-github-com-containerd-btrfs"
      ,go-github-com-containerd-btrfs)
     ("go-github-com-containerd-aufs"
      ,go-github-com-containerd-aufs)
     ("go-github-com-microsoft-hcsshim"
      ,go-github-com-microsoft-hcsshim)
     ("go-github-com-microsoft-go-winio"
      ,go-github-com-microsoft-go-winio)
     ("go-github-com-adalogics-go-fuzz-headers"
      ,go-github-com-adalogics-go-fuzz-headers)))
  (home-page
   "https://github.com/containerd/containerd")
  (synopsis "Now Recruiting")
  (description
   "containerd is an industry-standard container runtime with an emphasis on\nsimplicity, robustness and portability.  It is available as a daemon for Linux\nand Windows, which can manage the complete container lifecycle of its host\nsystem: image transfer and storage, container execution and supervision,\nlow-level storage and network attachments, etc.")
  (license license:asl2.0))
(package
  (name "go-github-com-moby-sys-mount")
  (version "0.3.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/moby/sys")
           (commit (string-append "mount/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "161dv3wwbh8zs2acfahzjmypb44aajd0dazh27fihn95h2kfzz6w"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/moby/sys/mount"
     #:unpack-path
     "github.com/moby/sys"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-moby-sys-mountinfo"
      ,go-github-com-moby-sys-mountinfo)))
  (home-page "https://github.com/moby/sys")
  (synopsis #f)
  (description
   "Package mount provides a set of functions to mount and unmount mounts.")
  (license license:asl2.0))
(package
  (name "go-github-com-checkpoint-restore-go-criu-v5")
  (version "5.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/checkpoint-restore/go-criu")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1as25kq17bpipb06idl5xld4l5lj1yq8pzymv0vdijwf681fl83w"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/checkpoint-restore/go-criu/v5"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)))
  (home-page
   "https://github.com/checkpoint-restore/go-criu")
  (synopsis "go-criu -- Go bindings for CRIU")
  (description
   "This repository provides Go bindings for @url{https://criu.org/,CRIU}.  The code\nis based on the Go-based PHaul implementation from the CRIU repository.  For\neasier inclusion into other Go projects the CRIU Go bindings have been moved to\nthis repository.")
  (license license:asl2.0))
(package
  (name "go-github-com-cilium-ebpf")
  (version "0.9.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/cilium/ebpf")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1qvs3ywgfvys7yxxr039vwn56vi4n5h72qjff12x3yl5rpwpj89j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/cilium/ebpf"))
  (propagated-inputs
   `(("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-github-com-rogpeppe-go-internal"
      ,go-github-com-rogpeppe-go-internal)
     ("go-github-com-kr-text" ,go-github-com-kr-text)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-frankban-quicktest"
      ,go-github-com-frankban-quicktest)))
  (home-page "https://github.com/cilium/ebpf")
  (synopsis "eBPF")
  (description
   "Package ebpf is a toolkit for working with eBPF programs.")
  (license license:expat))
(package
  (name "go-github-com-cyphar-filepath-securejoin")
  (version "0.2.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/cyphar/filepath-securejoin")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0w03d8hslwfhcnfqck21agzs7y0sc6gpwfz53md8fv26ishwxppy"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/cyphar/filepath-securejoin"))
  (home-page
   "https://github.com/cyphar/filepath-securejoin")
  (synopsis #f)
  (description
   "Package securejoin is an implementation of the hopefully-soon-to-be-included\nSecureJoin helper that is meant to be part of the \"path/filepath\" package.  The\npurpose of this project is to provide a PoC implementation to make the\nSecureJoin proposal\n(@url{https://github.com/golang/go/issues/20126,https://github.com/golang/go/issues/20126})\nmore tangible.")
  (license license:bsd-3))
(package
  (name "go-github-com-moby-sys-mountinfo")
  (version "0.6.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/moby/sys")
           (commit (string-append "mountinfo/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0f4368vgz7fmm2fsdh4w9fnlzl3qbsmkj9nnm811s0l451pa8pqx"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/moby/sys/mountinfo"
     #:unpack-path
     "github.com/moby/sys"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
  (home-page "https://github.com/moby/sys")
  (synopsis #f)
  (description
   "Package mountinfo provides a set of functions to retrieve information about OS\nmounts.")
  (license license:asl2.0))
(package
  (name "go-github-com-mrunalp-fileutils")
  (version "0.5.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/mrunalp/fileutils")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1zrs959gf4zgi6ijwkdn4dcqk0svfblpaikkqy63q30rqz4swm0x"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/mrunalp/fileutils"))
  (home-page
   "https://github.com/mrunalp/fileutils")
  (synopsis "fileutils")
  (description
   "Collection of utilities for file manipulation in golang")
  (license license:asl2.0))
(package
  (name "go-github-com-opencontainers-runtime-spec")
  (version "1.0.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/opencontainers/runtime-spec")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "19w981vcmd5lp2hy0630x6ayb8zz17n2vxqm2py5mg945xflcizg"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/opencontainers/runtime-spec"))
  (home-page
   "https://github.com/opencontainers/runtime-spec")
  (synopsis
   "Open Container Initiative Runtime Specification")
  (description
   "The @url{https://www.opencontainers.org,Open Container Initiative} develops\nspecifications for standards on Operating System process and application\ncontainers.")
  (license license:asl2.0))
(package
  (name "go-github-com-opencontainers-selinux")
  (version "1.10.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/opencontainers/selinux")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "110lbm38zficvf56432fc6d6jz83xnr4br6wk15h6p6dvx8rq7nx"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/opencontainers/selinux"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
  (home-page
   "https://github.com/opencontainers/selinux")
  (synopsis "selinux")
  (description
   "Common SELinux package used across the container ecosystem.")
  (license license:asl2.0))
(package
  (name "go-github-com-seccomp-libseccomp-golang")
  (version "0.10.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/seccomp/libseccomp-golang")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "16vgk20iwr1rcgxcg18mpm3l9bb9ci3f8fzc48q1m47imjhsqqz9"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/seccomp/libseccomp-golang"))
  (home-page
   "https://github.com/seccomp/libseccomp-golang")
  (synopsis #f)
  (description
   "Package seccomp provides bindings for libseccomp, a library wrapping the Linux\nseccomp syscall.  Seccomp enables an application to restrict system call use for\nitself and its children.")
  (license license:bsd-2))
(package
  (name "go-github-com-opencontainers-runc")
  (version "1.1.4")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/opencontainers/runc")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1l2ds6ya5yrkgcb7z7nahx13a1kbdab5mz43vdvsdyjrdlfhks52"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/opencontainers/runc"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-vishvananda-netlink"
      ,go-github-com-vishvananda-netlink)
     ("go-github-com-urfave-cli"
      ,go-github-com-urfave-cli)
     ("go-github-com-syndtr-gocapability"
      ,go-github-com-syndtr-gocapability)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-seccomp-libseccomp-golang"
      ,go-github-com-seccomp-libseccomp-golang)
     ("go-github-com-opencontainers-selinux"
      ,go-github-com-opencontainers-selinux)
     ("go-github-com-opencontainers-runtime-spec"
      ,go-github-com-opencontainers-runtime-spec)
     ("go-github-com-mrunalp-fileutils"
      ,go-github-com-mrunalp-fileutils)
     ("go-github-com-moby-sys-mountinfo"
      ,go-github-com-moby-sys-mountinfo)
     ("go-github-com-godbus-dbus-v5"
      ,go-github-com-godbus-dbus-v5)
     ("go-github-com-docker-go-units"
      ,go-github-com-docker-go-units)
     ("go-github-com-cyphar-filepath-securejoin"
      ,go-github-com-cyphar-filepath-securejoin)
     ("go-github-com-coreos-go-systemd-v22"
      ,go-github-com-coreos-go-systemd-v22)
     ("go-github-com-containerd-console"
      ,go-github-com-containerd-console)
     ("go-github-com-cilium-ebpf"
      ,go-github-com-cilium-ebpf)
     ("go-github-com-checkpoint-restore-go-criu-v5"
      ,go-github-com-checkpoint-restore-go-criu-v5)))
  (home-page
   "https://github.com/opencontainers/runc")
  (synopsis "runc")
  (description
   "@code{runc} is a CLI tool for spawning and running containers on Linux according\nto the OCI specification.")
  (license license:asl2.0))
(package
  (name "go-gopkg-in-linkedin-goavro-v1")
  (version "1.0.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gopkg.in/linkedin/goavro.v1")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "09xrxy4vw2b11rnc0d80wamkbsp857lawxrxrnwihshzp5wnk1ll"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "gopkg.in/linkedin/goavro.v1"
     #:unpack-path
     "gopkg.in/linkedin/goavro.v1"))
  (home-page "https://gopkg.in/linkedin/goavro.v1")
  (synopsis "goavro")
  (description
   "Package goavro is a library that encodes and decodes of Avro data.  It provides\nan interface to encode data directly to io.Writer streams, and to decode data\nfrom io.Reader streams.  Goavro fully adheres to version 1.7.7 of the Avro\nspecification and data encoding.")
  (license license:asl2.0))
(package
  (name "go-github-com-apache-beam-sdks-v2")
  (version "2.41.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/apache/beam")
           (commit (string-append "sdks/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "16pfdg29jpjxcpbr1vpvnx62jjhwxbnyq0zv3gh7whs1wqdxg9di"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/apache/beam/sdks/v2"
     #:unpack-path
     "github.com/apache/beam"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-linkedin-goavro-v1"
      ,go-gopkg-in-linkedin-goavro-v1)
     ("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-pierrec-lz4-v4"
      ,go-github-com-pierrec-lz4-v4)
     ("go-github-com-opencontainers-runc"
      ,go-github-com-opencontainers-runc)
     ("go-github-com-opencontainers-image-spec"
      ,go-github-com-opencontainers-image-spec)
     ("go-github-com-opencontainers-go-digest"
      ,go-github-com-opencontainers-go-digest)
     ("go-github-com-morikuni-aec"
      ,go-github-com-morikuni-aec)
     ("go-github-com-moby-term"
      ,go-github-com-moby-term)
     ("go-github-com-moby-sys-mountinfo"
      ,go-github-com-moby-sys-mountinfo)
     ("go-github-com-moby-sys-mount"
      ,go-github-com-moby-sys-mount)
     ("go-github-com-magiconair-properties"
      ,go-github-com-magiconair-properties)
     ("go-github-com-kr-text" ,go-github-com-kr-text)
     ("go-github-com-klauspost-compress"
      ,go-github-com-klauspost-compress)
     ("go-github-com-inconshreveable-mousetrap"
      ,go-github-com-inconshreveable-mousetrap)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-golang-snappy"
      ,go-github-com-golang-snappy)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-docker-go-units"
      ,go-github-com-docker-go-units)
     ("go-github-com-docker-docker"
      ,go-github-com-docker-docker)
     ("go-github-com-docker-distribution"
      ,go-github-com-docker-distribution)
     ("go-github-com-containerd-containerd"
      ,go-github-com-containerd-containerd)
     ("go-github-com-containerd-cgroups"
      ,go-github-com-containerd-cgroups)
     ("go-github-com-cenkalti-backoff-v4"
      ,go-github-com-cenkalti-backoff-v4)
     ("go-github-com-apache-thrift"
      ,go-github-com-apache-thrift)
     ("go-github-com-apache-arrow-go-arrow"
      ,go-github-com-apache-arrow-go-arrow)
     ("go-github-com-microsoft-hcsshim"
      ,go-github-com-microsoft-hcsshim)
     ("go-github-com-microsoft-go-winio"
      ,go-github-com-microsoft-go-winio)
     ("go-github-com-azure-go-ansiterm"
      ,go-github-com-azure-go-ansiterm)
     ("go-cloud-google-com-go-iam"
      ,go-cloud-google-com-go-iam)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-retry-v1" ,go-gopkg-in-retry-v1)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-xitongsys-parquet-go-source"
      ,go-github-com-xitongsys-parquet-go-source)
     ("go-github-com-xitongsys-parquet-go"
      ,go-github-com-xitongsys-parquet-go)
     ("go-github-com-testcontainers-testcontainers-go"
      ,go-github-com-testcontainers-testcontainers-go)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-proullon-ramsql"
      ,go-github-com-proullon-ramsql)
     ("go-github-com-nightlyone-lockfile"
      ,go-github-com-nightlyone-lockfile)
     ("go-github-com-linkedin-goavro"
      ,go-github-com-linkedin-goavro)
     ("go-github-com-lib-pq" ,go-github-com-lib-pq)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-go-sql-driver-mysql"
      ,go-github-com-go-sql-driver-mysql)
     ("go-github-com-docker-go-connections"
      ,go-github-com-docker-go-connections)
     ("go-cloud-google-com-go-storage"
      ,go-cloud-google-com-go-storage)
     ("go-cloud-google-com-go-pubsub"
      ,go-cloud-google-com-go-pubsub)
     ("go-cloud-google-com-go-datastore"
      ,go-cloud-google-com-go-datastore)
     ("go-cloud-google-com-go-bigquery"
      ,go-cloud-google-com-go-bigquery)))
  (home-page "https://github.com/apache/beam")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-github-com-fullstorydev-grpcurl")
  (version "1.8.7")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/fullstorydev/grpcurl")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1w8p376219imwkyn7jjh2f4nyfcq5jgx9gahvr527x1k97ijhxfk"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/fullstorydev/grpcurl"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-github-com-jhump-protoreflect"
      ,go-github-com-jhump-protoreflect)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://github.com/fullstorydev/grpcurl")
  (synopsis "gRPCurl")
  (description
   "Package grpcurl provides the core functionality exposed by the grpcurl command,\nfor dynamically connecting to a server, using the reflection service to inspect\nthe server, and invoking RPCs.  The grpcurl command-line tool constructs a\nDescriptorSource, based on the command-line parameters, and supplies an\nInvocationEventHandler to supply request data (which can come from command-line\nargs or the process's stdin) and to log the events (to the process's stdout).")
  (license license:expat))
(package
  (name "go-github-com-go-redis-redis")
  (version "6.15.9+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-redis/redis")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1y13zhv4isf28bq249pz9dp08rb8amyfp2gdbfah09zcmlhjsaki"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-redis/redis"))
  (home-page "https://github.com/go-redis/redis")
  (synopsis "Redis client for Golang")
  (description
   "Package redis implements a Redis client.")
  (license license:bsd-2))
(package
  (name "go-github-com-jstemmer-go-junit-report")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jstemmer/go-junit-report")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1x5qaicf7840l0jws26072abl6hqfzjn2pn2im0l9b4q97s7si7w"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/jstemmer/go-junit-report"))
  (home-page
   "https://github.com/jstemmer/go-junit-report")
  (synopsis "go-junit-report")
  (description
   "go-junit-report is a tool that converts\n@url{https://pkg.go.dev/cmd/go#hdr-Test_packages,(code go test)} output to an\nXML report, suitable for applications that expect JUnit-style XML reports (e.g.\n@url{http://jenkins-ci.org,Jenkins}).")
  (license license:expat))
(package
  (name "go-github-com-google-go-replayers-httpreplay")
  (version "1.1.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/google/go-replayers")
           (commit
            (string-append "httpreplay/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "16kqw8ya89mjy3xri323q6mybh6paaxhy47l508h72dcln9dlp2m"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/google/go-replayers/httpreplay"
     #:unpack-path
     "github.com/google/go-replayers"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-mod" ,go-golang-org-x-mod)
     ("go-golang-org-x-lint" ,go-golang-org-x-lint)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-jstemmer-go-junit-report"
      ,go-github-com-jstemmer-go-junit-report)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-github-com-google-martian-v3"
      ,go-github-com-google-martian-v3)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-cloud-google-com-go-storage"
      ,go-cloud-google-com-go-storage)))
  (home-page
   "https://github.com/google/go-replayers")
  (synopsis #f)
  (description
   "Package httpreplay provides an API for recording and replaying traffic from\nHTTP-based clients.")
  (license license:asl2.0))
(package
  (name "go-github-com-google-go-licenses")
  (version "1.4.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/google/go-licenses")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0fzp95si47438wayn5m1ij25jbxw25z2zjkwfp43xv17vhihg0ac"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/google/go-licenses"))
  (propagated-inputs
   `(("go-k8s-io-klog-v2" ,go-k8s-io-klog-v2)
     ("go-gopkg-in-src-d-go-git-v4"
      ,go-gopkg-in-src-d-go-git-v4)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-mod" ,go-golang-org-x-mod)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-sergi-go-diff"
      ,go-github-com-sergi-go-diff)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-otiai10-copy"
      ,go-github-com-otiai10-copy)
     ("go-github-com-niemeyer-pretty"
      ,go-github-com-niemeyer-pretty)
     ("go-github-com-kr-text" ,go-github-com-kr-text)
     ("go-github-com-google-licenseclassifier"
      ,go-github-com-google-licenseclassifier)
     ("go-github-com-google-go-replayers-httpreplay"
      ,go-github-com-google-go-replayers-httpreplay)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-iam"
      ,go-cloud-google-com-go-iam)))
  (home-page
   "https://github.com/google/go-licenses")
  (synopsis "Licenses tool")
  (description
   "@code{go-licenses} analyzes the dependency tree of a Go package/binary.  It can\noutput a report on the libraries used and under what license they can be used.\nIt can also collect all of the license documents, copyright notices and source\ncode into a directory in order to comply with license terms on redistribution.")
  (license license:asl2.0))
(package
  (name "go-github-com-aokoli-goutils")
  (version "1.1.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Masterminds/goutils")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "09m4mbcdlv9ng3xcrmjlxi0niavby52y9nl2jhjnbx1xxpjw0jrh"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/aokoli/goutils"))
  (home-page "https://github.com/aokoli/goutils")
  (synopsis "GoUtils")
  (description
   "Package goutils provides utility functions to manipulate strings in various\nways.  The code snippets below show examples of how to use goutils.  Some\nfunctions return errors while others do not, so usage would vary as a result.")
  (license license:asl2.0))
(package
  (name "go-github-com-pseudomuto-protoc-gen-doc")
  (version "1.5.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/pseudomuto/protoc-gen-doc")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "15hgrw6966jhs65svx09mcn3w6v2jl593yb6wjm03a9hc3mqvl6p"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/pseudomuto/protoc-gen-doc"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-pseudomuto-protokit"
      ,go-github-com-pseudomuto-protokit)
     ("go-github-com-mwitkow-go-proto-validators"
      ,go-github-com-mwitkow-go-proto-validators)
     ("go-github-com-imdario-mergo"
      ,go-github-com-imdario-mergo)
     ("go-github-com-huandu-xstrings"
      ,go-github-com-huandu-xstrings)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-envoyproxy-protoc-gen-validate"
      ,go-github-com-envoyproxy-protoc-gen-validate)
     ("go-github-com-aokoli-goutils"
      ,go-github-com-aokoli-goutils)
     ("go-github-com-masterminds-sprig"
      ,go-github-com-masterminds-sprig)
     ("go-github-com-masterminds-semver"
      ,go-github-com-masterminds-semver)))
  (home-page
   "https://github.com/pseudomuto/protoc-gen-doc")
  (synopsis "protoc-gen-doc")
  (description
   "Package gendoc is a protoc plugin for generating documentation from your proto\nfiles.")
  (license license:expat))
(package
  (name "go-go-etcd-io-etcd-server-v3")
  (version "3.5.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/etcd-io/etcd")
           (commit (string-append "server/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0d6zja2s2cw6jprldcq1nxghvbwfr5168n29yyyr9m9biiwilpap"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.etcd.io/etcd/server/v3"
     #:unpack-path
     "go.etcd.io/etcd/server/v3"))
  (propagated-inputs
   `(("go-sigs-k8s-io-yaml" ,go-sigs-k8s-io-yaml)
     ("go-gopkg-in-natefinch-lumberjack-v2"
      ,go-gopkg-in-natefinch-lumberjack-v2)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-time" ,go-golang-org-x-time)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-go-uber-org-zap" ,go-go-uber-org-zap)
     ("go-go-uber-org-multierr"
      ,go-go-uber-org-multierr)
     ("go-go-opentelemetry-io-otel-sdk"
      ,go-go-opentelemetry-io-otel-sdk)
     ("go-go-opentelemetry-io-otel-exporters-otlp-otlptrace-otlptracegrpc"
      ,go-go-opentelemetry-io-otel-exporters-otlp-otlptrace-otlptracegrpc)
     ("go-go-opentelemetry-io-otel"
      ,go-go-opentelemetry-io-otel)
     ("go-go-opentelemetry-io-contrib-instrumentation-google-golang-org-grpc-otelgrpc"
      ,go-go-opentelemetry-io-contrib-instrumentation-google-golang-org-grpc-otelgrpc)
     ("go-go-etcd-io-bbolt" ,go-go-etcd-io-bbolt)
     ("go-github-com-xiang90-probing"
      ,go-github-com-xiang90-probing)
     ("go-github-com-tmc-grpc-websocket-proxy"
      ,go-github-com-tmc-grpc-websocket-proxy)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-soheilhy-cmux"
      ,go-github-com-soheilhy-cmux)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-prometheus-client-model"
      ,go-github-com-prometheus-client-model)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-kr-text" ,go-github-com-kr-text)
     ("go-github-com-jonboulle-clockwork"
      ,go-github-com-jonboulle-clockwork)
     ("go-github-com-grpc-ecosystem-grpc-gateway"
      ,go-github-com-grpc-ecosystem-grpc-gateway)
     ("go-github-com-grpc-ecosystem-go-grpc-prometheus"
      ,go-github-com-grpc-ecosystem-go-grpc-prometheus)
     ("go-github-com-grpc-ecosystem-go-grpc-middleware"
      ,go-github-com-grpc-ecosystem-go-grpc-middleware)
     ("go-github-com-google-btree"
      ,go-github-com-google-btree)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-form3tech-oss-jwt-go"
      ,go-github-com-form3tech-oss-jwt-go)
     ("go-github-com-dustin-go-humanize"
      ,go-github-com-dustin-go-humanize)
     ("go-github-com-coreos-go-systemd-v22"
      ,go-github-com-coreos-go-systemd-v22)
     ("go-github-com-coreos-go-semver"
      ,go-github-com-coreos-go-semver)))
  (home-page "https://go.etcd.io/etcd/server/v3")
  (synopsis #f)
  (description
   "Package main is a simple wrapper of the real etcd entrypoint package (located at\ngo.etcd.io/etcd/etcdmain) to ensure that etcd is still \"go getable\"; e.g. `go\nget go.etcd.io/etcd` works as expected and builds a binary in $GOBIN/etcd")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-monitoring")
  (version "1.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "monitoring/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0xv69m3vf2f6y4yaxigl7d32xh0s0sjypkvz9w9riaj10f2gvavq"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/monitoring"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/monitoring")
  (synopsis "Cloud Monitoring API")
  (description
   "Go Client Library for Cloud Monitoring API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-trace")
  (version "1.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "trace/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1qcdyvamdg4l9947xnysl27nwp1js1yqfi996ly3psy3ykcgsgdc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/trace"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page "https://cloud.google.com/go/trace")
  (synopsis "Stackdriver Trace API")
  (description
   "Go Client Library for Stackdriver Trace API.")
  (license license:asl2.0))
(package
  (name "go-github-com-benbjohnson-clock")
  (version "1.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/benbjohnson/clock")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1q2sbggx1hn2xnsk01wa5v189s868kqk3402n4vaykv9j8wjksgj"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/benbjohnson/clock"))
  (home-page
   "https://github.com/benbjohnson/clock")
  (synopsis "clock")
  (description
   "Clock is a small library for mocking time in Go.  It provides an interface\naround the standard library's\n@url{https://pkg.go.dev/github.com/benbjohnson/clock,(code time)} package so\nthat the application can use the realtime clock while tests can use the mock\nclock.")
  (license license:expat))
(package
  (name "go-github-com-form3tech-oss-jwt-go")
  (version "3.2.5+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/form3tech-oss/jwt-go")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1x31syqcb8w7qdfsilz3bbl6kxrirnzndil3y7bfp9ad6qqxdshf"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/form3tech-oss/jwt-go"))
  (home-page
   "https://github.com/form3tech-oss/jwt-go")
  (synopsis "jwt-go")
  (description
   "Package jwt is a Go implementation of JSON Web Tokens:\n@url{http://self-issued.info/docs/draft-jones-json-web-token.html,http://self-issued.info/docs/draft-jones-json-web-token.html}")
  (license license:expat))
(package
  (name "go-github-com-google-licenseclassifier-v2")
  (version "2.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/google/licenseclassifier")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1sn2r0hd1j2pid96wy4jrxzzqx4wrsrvn9nlschksm5lqmgj3vwg"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/google/licenseclassifier/v2"))
  (propagated-inputs
   `(("go-github-com-sergi-go-diff"
      ,go-github-com-sergi-go-diff)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)))
  (home-page
   "https://github.com/google/licenseclassifier")
  (synopsis "License Classifier v2")
  (description
   "Package classifier provides the implementation of the v2 license classifier.")
  (license license:asl2.0))
(package
  (name "go-github-com-google-licenseclassifier")
  (version "0.0.0-20220916170611-e6a9bb99b5a6")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/google/licenseclassifier")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1sn2r0hd1j2pid96wy4jrxzzqx4wrsrvn9nlschksm5lqmgj3vwg"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/google/licenseclassifier"))
  (propagated-inputs
   `(("go-github-com-sergi-go-diff"
      ,go-github-com-sergi-go-diff)
     ("go-github-com-google-licenseclassifier-v2"
      ,go-github-com-google-licenseclassifier-v2)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)))
  (home-page
   "https://github.com/google/licenseclassifier")
  (synopsis "License Classifier")
  (description
   "Package licenseclassifier provides methods to identify the open source license\nthat most closely matches an unknown license.")
  (license license:asl2.0))
(package
  (name "go-github-com-mwitkow-go-proto-validators")
  (version "0.3.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/mwitkow/go-proto-validators")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0flr9964jz4bgzhjpcc54niiy6zg1skf8f8x7bcp2qvbwshxwb44"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/mwitkow/go-proto-validators"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)))
  (home-page
   "https://github.com/mwitkow/go-proto-validators")
  (synopsis "Golang ProtoBuf Validator Compiler")
  (description
   "This package provides a @code{protoc} plugin that generates @code{Validate()\nerror} functions on Go proto @code{struct}s based on field options inside\n@code{.proto} files.  The validation functions are code-generated and thus don't\nsuffer on performance from tag-based reflection on deeply-nested messages.")
  (license license:asl2.0))
(package
  (name "go-github-com-otiai10-curr")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/otiai10/curr")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0fpw20adq2wff7l4c87zaavj9jra4d64a8bbjixiiv3bbarim987"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/otiai10/curr"))
  (propagated-inputs
   `(("go-github-com-otiai10-mint"
      ,go-github-com-otiai10-mint)))
  (home-page "https://github.com/otiai10/curr")
  (synopsis "curr")
  (description
   "Current file and dir privider for Golang.")
  (license license:expat))
(package
  (name "go-github-com-otiai10-mint")
  (version "1.4.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/otiai10/mint")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0kf3baz1pb775p5ah33y7r46gici490hwbcsc3z0pzljjww9ckc6"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/otiai10/mint"))
  (propagated-inputs
   `(("go-github-com-otiai10-curr"
      ,go-github-com-otiai10-curr)))
  (home-page "https://github.com/otiai10/mint")
  (synopsis "mint")
  (description
   "The very minimum assertion for Go.")
  (license license:expat))
(package
  (name "go-github-com-otiai10-copy")
  (version "1.7.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/otiai10/copy")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1szv4fyyminl1yjylnhn8724f34f3pm9ax6m24rafjz7fkmisr0m"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/otiai10/copy"))
  (propagated-inputs
   `(("go-github-com-otiai10-mint"
      ,go-github-com-otiai10-mint)))
  (home-page "https://github.com/otiai10/copy")
  (synopsis "copy")
  (description
   "@code{copy} copies directories recursively.")
  (license license:expat))
(package
  (name "go-github-com-azure-azure-sdk-for-go")
  (version "66.0.0+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Azure/azure-sdk-for-go")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "19fj0blbvv2xd5arfzivrs0yqfcvj9ziik1kysjgx0mw25p8wbsv"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/Azure/azure-sdk-for-go"))
  (home-page
   "https://github.com/Azure/azure-sdk-for-go")
  (synopsis "Azure SDK for Go")
  (description
   "Package sdk provides Go packages for managing and using Azure services.")
  (license license:expat))
(package
  (name "go-github-com-dennwc-varint")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/dennwc/varint")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0w6fnh7i55155cv55cjdqq436zb2y08rglxvz58vv67bb4hj7dkk"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/dennwc/varint"))
  (home-page "https://github.com/dennwc/varint")
  (synopsis "varint")
  (description
   "This package provides an optimized implementation of protobuf's varint\nencoding/decoding.  It has no dependencies.")
  (license license:expat))
(package
  (name "go-github-com-dgryski-go-sip13")
  (version "0.0.0-20200911182023-62edffca9245")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/dgryski/go-sip13")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1khikfkqy7pj93d14zq0bvr6amfdkagxwgm8pf52glzqx2bxsaq7"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/dgryski/go-sip13"))
  (home-page "https://github.com/dgryski/go-sip13")
  (synopsis #f)
  (description #f)
  (license license:expat))
(package
  (name "go-github-com-digitalocean-godo")
  (version "1.86.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/digitalocean/godo")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1jhldynph2k46vrdm49rs18gdx9f57ldb8sd8fnv4qplpzf93v11"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/digitalocean/godo"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-google-go-querystring"
      ,go-github-com-google-go-querystring)))
  (home-page
   "https://github.com/digitalocean/godo")
  (synopsis "Godo")
  (description
   "Package godo is the DigitalOcean API v2 client for Go.")
  (license (license:non-copyleft "file://LICENSE.txt")))
(package
  (name "go-github-com-docker-docker")
  (version "20.10.18+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/moby/moby")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1j8qwqca4hj9zpfvv5q88gydlkgj2s5lqhpw9x6z2i3gjpl3lh3k"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/docker/docker"))
  (home-page "https://github.com/docker/docker")
  (synopsis "The Moby Project")
  (description
   "Moby is an open-source project created by Docker to enable and accelerate\nsoftware containerization.")
  (license license:asl2.0))
(package
  (name "go-github-com-gophercloud-gophercloud")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gophercloud/gophercloud")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1jdgkfsk541xc436xl26xqz34l0vrghi9x3kahddkzkhwlkbfsml"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/gophercloud/gophercloud"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)))
  (home-page
   "https://github.com/gophercloud/gophercloud")
  (synopsis "Gophercloud: an OpenStack SDK for Go")
  (description
   "Package gophercloud provides a multi-vendor interface to OpenStack-compatible\nclouds.  The library has a three-level hierarchy: providers, services, and\nresources.")
  (license license:asl2.0))
(package
  (name "go-github-com-grafana-regexp")
  (version "0.0.0-20220304095617-2e8d9baf4ac2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/grafana/regexp")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0kfv0v8nf6sfnnlw6imcvrjdam4qrm4f8idns50p5c3mmdpig6jg"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/grafana/regexp"))
  (home-page "https://github.com/grafana/regexp")
  (synopsis "Grafana Go regexp package")
  (description
   "Package regexp implements regular expression search.")
  (license license:bsd-3))
(package
  (name "go-github-com-shoenig-test")
  (version "0.4.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/shoenig/test")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0rwn3m5dn3k6jw3vj727nvaxf5014bbvark4ph5rwg8k38f5a48g"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/shoenig/test"))
  (propagated-inputs
   `(("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)))
  (home-page "https://github.com/shoenig/test")
  (synopsis "test")
  (description
   "Package test provides a modern generic testing assertions library.")
  (license license:mpl2.0))
(package
  (name "go-github-com-hashicorp-nomad-api")
  (version "0.0.0-20220928214538-0eb711925ec0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/nomad")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "08yib4hnihbi7myrwqhmiyvhnlj7yfspxfqr5zq1alrvk3fpysiy"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/hashicorp/nomad/api"
     #:unpack-path
     "github.com/hashicorp/nomad"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-github-com-rogpeppe-go-internal"
      ,go-github-com-rogpeppe-go-internal)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-mitchellh-go-homedir"
      ,go-github-com-mitchellh-go-homedir)
     ("go-github-com-kr-text" ,go-github-com-kr-text)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-shoenig-test"
      ,go-github-com-shoenig-test)
     ("go-github-com-mitchellh-mapstructure"
      ,go-github-com-mitchellh-mapstructure)
     ("go-github-com-mitchellh-go-testing-interface"
      ,go-github-com-mitchellh-go-testing-interface)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)
     ("go-github-com-hashicorp-go-rootcerts"
      ,go-github-com-hashicorp-go-rootcerts)
     ("go-github-com-hashicorp-go-cleanhttp"
      ,go-github-com-hashicorp-go-cleanhttp)
     ("go-github-com-hashicorp-cronexpr"
      ,go-github-com-hashicorp-cronexpr)
     ("go-github-com-gorilla-websocket"
      ,go-github-com-gorilla-websocket)
     ("go-github-com-docker-go-units"
      ,go-github-com-docker-go-units)))
  (home-page "https://github.com/hashicorp/nomad")
  (synopsis #f)
  (description #f)
  (license license:mpl2.0))
(package
  (name "go-github-com-hetznercloud-hcloud-go")
  (version "1.35.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hetznercloud/hcloud-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0ws7sz0xq0kmcsdyfhyz8dwvabjyn7q7xb2zv5k5krxl5chz20ms"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/hetznercloud/hcloud-go"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-prometheus-procfs"
      ,go-github-com-prometheus-procfs)
     ("go-github-com-prometheus-common"
      ,go-github-com-prometheus-common)
     ("go-github-com-prometheus-client-model"
      ,go-github-com-prometheus-client-model)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-matttproud-golang-protobuf-extensions"
      ,go-github-com-matttproud-golang-protobuf-extensions)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-cespare-xxhash-v2"
      ,go-github-com-cespare-xxhash-v2)
     ("go-github-com-beorn7-perks"
      ,go-github-com-beorn7-perks)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)))
  (home-page
   "https://github.com/hetznercloud/hcloud-go")
  (synopsis
   "hcloud: A Go library for the Hetzner Cloud API")
  (description
   "Package hcloud is a library for the Hetzner Cloud API.")
  (license license:expat))
(package
  (name "go-github-com-ionos-cloud-sdk-go-v6")
  (version "6.1.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ionos-cloud/sdk-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1ldsszaqlgyap4kqfx777x52m0akwgc3plf2c0p9jb28z3fiv60p"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/ionos-cloud/sdk-go/v6"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)))
  (home-page
   "https://github.com/ionos-cloud/sdk-go")
  (synopsis "Go API client for ionoscloud")
  (description
   "IONOS Enterprise-grade Infrastructure as a Service (IaaS) solutions can be\nmanaged through the Cloud API, in addition or as an alternative to the \"Data\nCenter Designer\" (DCD) browser-based tool.")
  (license license:asl2.0))
(package
  (name "go-github-com-kolo-xmlrpc")
  (version "0.0.0-20220921171641-a4b6fa1dd06b")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/kolo/xmlrpc")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0nhcnqycdc52k4ymdd4g2chcimsnvr86m0yx13ws91qxs5pgs9d2"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/kolo/xmlrpc"))
  (propagated-inputs
   `(("go-golang-org-x-text" ,go-golang-org-x-text)))
  (home-page "https://github.com/kolo/xmlrpc")
  (synopsis "Overview")
  (description
   "xmlrpc is an implementation of client side part of XMLRPC protocol in Go\nlanguage.")
  (license license:expat))
(package
  (name "go-github-com-linode-linodego")
  (version "1.9.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/linode/linodego")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1d06m80pl0v7gy3a1ml13gnb0gffrwh8d2vif28gx0q11ylp7ad4"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/linode/linodego"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-gopkg-in-ini-v1" ,go-gopkg-in-ini-v1)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-go-resty-resty-v2"
      ,go-github-com-go-resty-resty-v2)))
  (home-page "https://github.com/linode/linodego")
  (synopsis "linodego")
  (description
   "Go client for @url{https://developers.linode.com/api/v4,Linode REST v4 API}")
  (license license:expat))
(package
  (name "go-github-com-mwitkow-go-conntrack")
  (version "0.0.0-20190716064945-2f068394615f")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/mwitkow/go-conntrack")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0ymjmy12ks7smgwmrwsa5kf07d9w5kpk1dn650azlzr61b561aw7"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/mwitkow/go-conntrack"))
  (home-page
   "https://github.com/mwitkow/go-conntrack")
  (synopsis
   "Go tracing and monitoring (Prometheus) for")
  (description
   "@url{https://prometheus.io/,Prometheus} monitoring and\n@url{https://godoc.org/golang.org/x/net/trace#EventLog,(code x/net/trace)}\ntracing wrappers @code{net.Conn}, both inbound (@code{net.Listener}) and\noutbound (@code{net.Dialer}).")
  (license license:asl2.0))
(package
  (name "go-github-com-go-openapi-runtime")
  (version "0.24.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-openapi/runtime")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1lsv1zqylh1qfyhfnf87hh734f27znkks2sy0mz3ky6apja9911l"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-openapi/runtime"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-mongodb-org-mongo-driver"
      ,go-go-mongodb-org-mongo-driver)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-opentracing-opentracing-go"
      ,go-github-com-opentracing-opentracing-go)
     ("go-github-com-mitchellh-mapstructure"
      ,go-github-com-mitchellh-mapstructure)
     ("go-github-com-mailru-easyjson"
      ,go-github-com-mailru-easyjson)
     ("go-github-com-go-stack-stack"
      ,go-github-com-go-stack-stack)
     ("go-github-com-go-openapi-validate"
      ,go-github-com-go-openapi-validate)
     ("go-github-com-go-openapi-swag"
      ,go-github-com-go-openapi-swag)
     ("go-github-com-go-openapi-strfmt"
      ,go-github-com-go-openapi-strfmt)
     ("go-github-com-go-openapi-spec"
      ,go-github-com-go-openapi-spec)
     ("go-github-com-go-openapi-loads"
      ,go-github-com-go-openapi-loads)
     ("go-github-com-go-openapi-errors"
      ,go-github-com-go-openapi-errors)
     ("go-github-com-go-openapi-analysis"
      ,go-github-com-go-openapi-analysis)
     ("go-github-com-docker-go-units"
      ,go-github-com-docker-go-units)
     ("go-github-com-asaskevich-govalidator"
      ,go-github-com-asaskevich-govalidator)))
  (home-page
   "https://github.com/go-openapi/runtime")
  (synopsis "runtime")
  (description
   "The runtime component for use in codegeneration or as untyped usage.")
  (license license:asl2.0))
(package
  (name "go-github-com-xlab-treeprint")
  (version "1.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/xlab/treeprint")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "172hcg6316ghvin9cqgidg7kdf960mzbqlrg0gk759pkbqsi3bcy"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/xlab/treeprint"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page "https://github.com/xlab/treeprint")
  (synopsis "treeprint")
  (description
   "Package treeprint provides a simple ASCII tree composing tool.")
  (license license:expat))
(package
  (name "go-github-com-goccy-go-yaml")
  (version "1.9.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/goccy/go-yaml")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1vk7d9kgwmcnar6916pxj6hazv37f8a6pk7q9np9f250wkm6cfjd"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/goccy/go-yaml"))
  (propagated-inputs
   `(("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-go-playground-validator-v10"
      ,go-github-com-go-playground-validator-v10)
     ("go-github-com-fatih-color"
      ,go-github-com-fatih-color)))
  (home-page "https://github.com/goccy/go-yaml")
  (synopsis "YAML support for the Go language")
  (description
   "As of this writing, there already exists a de facto standard library for YAML\nprocessing for Go:\n@url{https://github.com/go-yaml/yaml,https://github.com/go-yaml/yaml}.  However\nwe feel that some features are lacking, namely:")
  (license license:expat))
(package
  (name "go-gopkg-in-telebot-v3")
  (version "3.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gopkg.in/telebot.v3")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "16pis2145f7ilqswgpjh3x463m0fm4n4nq8p3sizyd4hzrjgl9ac"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "gopkg.in/telebot.v3"
     #:unpack-path
     "gopkg.in/telebot.v3"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-spf13-cast"
      ,go-github-com-spf13-cast)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-goccy-go-yaml"
      ,go-github-com-goccy-go-yaml)
     ("go-github-com-fatih-color"
      ,go-github-com-fatih-color)))
  (home-page "https://gopkg.in/telebot.v3")
  (synopsis "Telebot")
  (description
   "Package telebot is a framework for Telegram bots.")
  (license license:expat))
(package
  (name "go-github-com-prometheus-alertmanager")
  (version "0.24.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/prometheus/alertmanager")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0k0zmknky63i590agcwcb7hbh0gzl10fw7hpl1zjizgx039q9046"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/prometheus/alertmanager"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-telebot-v3"
      ,go-gopkg-in-telebot-v3)
     ("go-gopkg-in-alecthomas-kingpin-v2"
      ,go-gopkg-in-alecthomas-kingpin-v2)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-mod" ,go-golang-org-x-mod)
     ("go-go-uber-org-atomic" ,go-go-uber-org-atomic)
     ("go-github-com-xlab-treeprint"
      ,go-github-com-xlab-treeprint)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-shurcool-vfsgen"
      ,go-github-com-shurcool-vfsgen)
     ("go-github-com-shurcool-httpfs"
      ,go-github-com-shurcool-httpfs)
     ("go-github-com-rs-cors" ,go-github-com-rs-cors)
     ("go-github-com-prometheus-exporter-toolkit"
      ,go-github-com-prometheus-exporter-toolkit)
     ("go-github-com-prometheus-common-sigv4"
      ,go-github-com-prometheus-common-sigv4)
     ("go-github-com-prometheus-common"
      ,go-github-com-prometheus-common)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-oklog-ulid"
      ,go-github-com-oklog-ulid)
     ("go-github-com-oklog-run"
      ,go-github-com-oklog-run)
     ("go-github-com-matttproud-golang-protobuf-extensions"
      ,go-github-com-matttproud-golang-protobuf-extensions)
     ("go-github-com-kylelemons-godebug"
      ,go-github-com-kylelemons-godebug)
     ("go-github-com-jessevdk-go-flags"
      ,go-github-com-jessevdk-go-flags)
     ("go-github-com-hashicorp-memberlist"
      ,go-github-com-hashicorp-memberlist)
     ("go-github-com-hashicorp-golang-lru"
      ,go-github-com-hashicorp-golang-lru)
     ("go-github-com-hashicorp-go-sockaddr"
      ,go-github-com-hashicorp-go-sockaddr)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-gofrs-uuid"
      ,go-github-com-gofrs-uuid)
     ("go-github-com-go-openapi-validate"
      ,go-github-com-go-openapi-validate)
     ("go-github-com-go-openapi-swag"
      ,go-github-com-go-openapi-swag)
     ("go-github-com-go-openapi-strfmt"
      ,go-github-com-go-openapi-strfmt)
     ("go-github-com-go-openapi-spec"
      ,go-github-com-go-openapi-spec)
     ("go-github-com-go-openapi-runtime"
      ,go-github-com-go-openapi-runtime)
     ("go-github-com-go-openapi-loads"
      ,go-github-com-go-openapi-loads)
     ("go-github-com-go-openapi-errors"
      ,go-github-com-go-openapi-errors)
     ("go-github-com-go-kit-log"
      ,go-github-com-go-kit-log)
     ("go-github-com-cespare-xxhash-v2"
      ,go-github-com-cespare-xxhash-v2)
     ("go-github-com-cenkalti-backoff-v4"
      ,go-github-com-cenkalti-backoff-v4)
     ("go-github-com-aws-aws-sdk-go"
      ,go-github-com-aws-aws-sdk-go)
     ("go-github-com-alecthomas-units"
      ,go-github-com-alecthomas-units)))
  (home-page
   "https://github.com/prometheus/alertmanager")
  (synopsis "Alertmanager")
  (description
   "The Alertmanager handles alerts sent by client applications such as the\nPrometheus server.  It takes care of deduplicating, grouping, and routing them\nto the correct receiver integrations such as email, PagerDuty, or OpsGenie.  It\nalso takes care of silencing and inhibition of alerts.")
  (license license:asl2.0))
(package
  (name "go-github-com-prometheus-common-assets")
  (version "0.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/prometheus/common")
           (commit (string-append "assets/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0r7sym4yaysbkc5anyypl57v9ay0a1flq00j85j7lcficl2scwrs"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/prometheus/common/assets"
     #:unpack-path
     "github.com/prometheus/common"))
  (home-page
   "https://github.com/prometheus/common")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-github-com-prometheus-common-sigv4")
  (version "0.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/prometheus/common")
           (commit (string-append "sigv4/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "08sdhxryl1jpy829qki8k2jy773xhrbr9wsk997pxhbbvl634gvb"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/prometheus/common/sigv4"
     #:unpack-path
     "github.com/prometheus/common"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-prometheus-common"
      ,go-github-com-prometheus-common)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-aws-aws-sdk-go"
      ,go-github-com-aws-aws-sdk-go)))
  (home-page
   "https://github.com/prometheus/common")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-github-com-prometheus-exporter-toolkit")
  (version "0.7.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/prometheus/exporter-toolkit")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "082di72cyj34wjjhi5ji59bjabdy897faji07v7qm20a4f7csdbs"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/prometheus/exporter-toolkit"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-alecthomas-kingpin-v2"
      ,go-gopkg-in-alecthomas-kingpin-v2)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-prometheus-common"
      ,go-github-com-prometheus-common)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-go-kit-log"
      ,go-github-com-go-kit-log)))
  (home-page
   "https://github.com/prometheus/exporter-toolkit")
  (synopsis "Prometheus Exporter Toolkit")
  (description
   "This is a @url{http://golang.org,Go} library for\n@url{http://prometheus.io,Prometheus}\n@url{https://prometheus.io/docs/introduction/glossary/#exporter,exporters}.")
  (license license:asl2.0))
(package
  (name "go-github-com-modocache-gover")
  (version "0.0.0-20171022184752-b58185e213c5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/sozorogami/gover")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1w7pzqh8ljacpxhwq9f4s4ax908dgl22qfxyrx51mblylwzvm6va"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/modocache/gover"))
  (home-page "https://github.com/modocache/gover")
  (synopsis "gover")
  (description "Usage: gover [root] [out]")
  (license license:asl2.0))
(package
  (name "go-github-com-dnaeon-go-vcr")
  (version "1.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/dnaeon/go-vcr")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1aw8s3aljhw9vpzcf8m64r5yv5g0j09dky30shzxvpjwpl5yxhir"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/dnaeon/go-vcr"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-github-com-modocache-gover"
      ,go-github-com-modocache-gover)))
  (home-page "https://github.com/dnaeon/go-vcr")
  (synopsis "go-vcr")
  (description
   "@code{go-vcr} simplifies testing by recording your HTTP interactions and\nreplaying them in future runs in order to provide fast, deterministic and\naccurate testing of your code.")
  (license license:bsd-2))
(package
  (name "go-github-com-scaleway-scaleway-sdk-go")
  (version "1.0.0-beta.9")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/scaleway/scaleway-sdk-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1v0425ayz262hxa49hrkp2pmpig623ffp4pzmaxck6bwkj8cah1y"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/scaleway/scaleway-sdk-go"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-github-com-dnaeon-go-vcr"
      ,go-github-com-dnaeon-go-vcr)))
  (home-page
   "https://github.com/scaleway/scaleway-sdk-go")
  (synopsis "Scaleway GO SDK")
  (description
   "Package scalewaysdkgo is the Scaleway API SDK for Go.")
  (license license:asl2.0))
(package
  (name "go-github-com-vultr-govultr-v2")
  (version "2.17.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/vultr/govultr")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0crl56lx2djxwgp784hzis7invyxmw6xy32p713ch95qafrddi61"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/vultr/govultr/v2"))
  (propagated-inputs
   `(("go-github-com-hashicorp-go-cleanhttp"
      ,go-github-com-hashicorp-go-cleanhttp)
     ("go-github-com-hashicorp-go-retryablehttp"
      ,go-github-com-hashicorp-go-retryablehttp)
     ("go-github-com-google-go-querystring"
      ,go-github-com-google-go-querystring)))
  (home-page "https://github.com/vultr/govultr")
  (synopsis "GoVultr")
  (description
   "The official Vultr Go client - GoVultr allows you to interact with the Vultr V2\nAPI.")
  (license license:expat))
(package
  (name "go-go-opentelemetry-io-contrib-instrumentation-net-http-otelhttp")
  (version "0.36.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/open-telemetry/opentelemetry-go-contrib")
           (commit
            (string-append
             "instrumentation/net/http/otelhttp/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1lfznjrksj5m3hnvn9xdg4l0pm4sfya3fw2rqjawh8q2r487pa6d"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-go-logr-stdr"
      ,go-github-com-go-logr-stdr)
     ("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-go-opentelemetry-io-otel-trace"
      ,go-go-opentelemetry-io-otel-trace)
     ("go-go-opentelemetry-io-otel-metric"
      ,go-go-opentelemetry-io-otel-metric)
     ("go-go-opentelemetry-io-otel"
      ,go-go-opentelemetry-io-otel)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-felixge-httpsnoop"
      ,go-github-com-felixge-httpsnoop)))
  (home-page
   "https://go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp")
  (synopsis #f)
  (description
   "Package otelhttp provides an http.Handler and functions that are intended to be\nused to add tracing by wrapping existing handlers (with Handler) and routes\nWithRouteTag.")
  (license license:asl2.0))
(package
  (name "go-go-opentelemetry-io-otel-exporters-otlp-otlptrace")
  (version "1.10.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/open-telemetry/opentelemetry-go")
           (commit
            (string-append
             "exporters/otlp/otlptrace/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0kyd2y1x1zygkhzc8glrclvcaks4hzigan1mzy9cwrkbzx8kc0kr"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.opentelemetry.io/otel/exporters/otlp/otlptrace"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-grpc-ecosystem-grpc-gateway-v2"
      ,go-github-com-grpc-ecosystem-grpc-gateway-v2)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-go-logr-stdr"
      ,go-github-com-go-logr-stdr)
     ("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-cenkalti-backoff-v4"
      ,go-github-com-cenkalti-backoff-v4)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-go-opentelemetry-io-proto-otlp"
      ,go-go-opentelemetry-io-proto-otlp)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)))
  (home-page
   "https://go.opentelemetry.io/otel/exporters/otlp/otlptrace")
  (synopsis "OpenTelemetry-Go OTLP Span Exporter")
  (description
   "@url{https://github.com/open-telemetry/opentelemetry-specification/blob/v1.5.0/specification/protocol/exporter.md,OpenTelemetry\nProtocol Exporter} implementation.")
  (license license:asl2.0))
(package
  (name "go-go-opentelemetry-io-otel-exporters-otlp-otlptrace-otlptracegrpc")
  (version "1.10.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/open-telemetry/opentelemetry-go")
           (commit
            (string-append
             "exporters/otlp/otlptrace/otlptracegrpc/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0kyd2y1x1zygkhzc8glrclvcaks4hzigan1mzy9cwrkbzx8kc0kr"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-grpc-ecosystem-grpc-gateway-v2"
      ,go-github-com-grpc-ecosystem-grpc-gateway-v2)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-go-logr-stdr"
      ,go-github-com-go-logr-stdr)
     ("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-cenkalti-backoff-v4"
      ,go-github-com-cenkalti-backoff-v4)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-go-uber-org-goleak" ,go-go-uber-org-goleak)
     ("go-go-opentelemetry-io-proto-otlp"
      ,go-go-opentelemetry-io-proto-otlp)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page
   "https://go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-go-opentelemetry-io-otel-exporters-otlp-otlptrace-otlptracehttp")
  (version "1.10.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/open-telemetry/opentelemetry-go")
           (commit
            (string-append
             "exporters/otlp/otlptrace/otlptracehttp/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0kyd2y1x1zygkhzc8glrclvcaks4hzigan1mzy9cwrkbzx8kc0kr"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-grpc-ecosystem-grpc-gateway-v2"
      ,go-github-com-grpc-ecosystem-grpc-gateway-v2)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-go-logr-stdr"
      ,go-github-com-go-logr-stdr)
     ("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-cenkalti-backoff-v4"
      ,go-github-com-cenkalti-backoff-v4)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-go-opentelemetry-io-proto-otlp"
      ,go-go-opentelemetry-io-proto-otlp)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page
   "https://go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp")
  (synopsis #f)
  (description
   "Package otlptracehttp a client that sends traces to the collector using HTTP\nwith binary protobuf payloads.")
  (license license:asl2.0))
(package
  (name "go-github-com-gregjones-httpcache")
  (version "0.0.0-20190611155906-901d90724c79")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gregjones/httpcache")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "05r0xq51vfb55di11m7iv19341d73f7in33vq1ihcqs1nffdwiq0"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gregjones/httpcache"))
  (home-page
   "https://github.com/gregjones/httpcache")
  (synopsis "httpcache")
  (description
   "Package httpcache provides a http.RoundTripper implementation that works as a\nmostly RFC-compliant cache for http responses.")
  (license license:expat))
(package
  (name "go-github-com-peterbourgon-diskv")
  (version "2.0.1+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/peterbourgon/diskv")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1mxpa5aad08x30qcbffzk80g9540wvbca4blc1r2qyzl65b8929b"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/peterbourgon/diskv"))
  (home-page
   "https://github.com/peterbourgon/diskv")
  (synopsis "What is diskv?")
  (description
   "Diskv (disk-vee) is a simple, persistent key-value store written in the Go\nlanguage.  It starts with an incredibly simple API for storing arbitrary data on\na filesystem by key, and builds several layers of performance-enhancing\nabstraction on top.  The end result is a conceptually simple, but highly\nperformant, disk-backed storage system.")
  (license license:expat))
(package
  (name "go-k8s-io-api")
  (version "0.25.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/kubernetes/api")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "06yw2wky356pgzqrsq0idhmlrzq8sw81jq8vnbrd4ga8rffa4j5p"))))
  (build-system go-build-system)
  (arguments '(#:import-path "k8s.io/api"))
  (propagated-inputs
   `(("go-k8s-io-apimachinery"
      ,go-k8s-io-apimachinery)
     ("go-sigs-k8s-io-yaml" ,go-sigs-k8s-io-yaml)
     ("go-sigs-k8s-io-structured-merge-diff-v4"
      ,go-sigs-k8s-io-structured-merge-diff-v4)
     ("go-sigs-k8s-io-json" ,go-sigs-k8s-io-json)
     ("go-k8s-io-utils" ,go-k8s-io-utils)
     ("go-k8s-io-klog-v2" ,go-k8s-io-klog-v2)
     ("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-inf-v0" ,go-gopkg-in-inf-v0)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-modern-go-reflect2"
      ,go-github-com-modern-go-reflect2)
     ("go-github-com-modern-go-concurrent"
      ,go-github-com-modern-go-concurrent)
     ("go-github-com-json-iterator-go"
      ,go-github-com-json-iterator-go)
     ("go-github-com-google-gofuzz"
      ,go-github-com-google-gofuzz)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)))
  (home-page "https://k8s.io/api")
  (synopsis "api")
  (description
   "Schema of the external API types that are served by the Kubernetes API server.")
  (license license:asl2.0))
(package
  (name "go-github-com-rogpeppe-go-charset")
  (version "0.0.0-20190617161244-0dc95cdf6f31")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/rogpeppe/go-charset")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0da0q9j6c98ra29i1jrlw2jdfrm046s4rs9qchh1l4jjrpq6bicr"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/rogpeppe/go-charset"))
  (home-page
   "https://github.com/rogpeppe/go-charset")
  (synopsis
   "THIS PACKAGE IS NO LONGER MAINTAINED.")
  (description
   "Use\n@url{https://godoc.org/golang.org/x/text/transform,golang.org/x/text/transform}\ninstead.")
  (license license:bsd-2))
(package
  (name "go-github-com-elazarl-goproxy-ext")
  (version "0.0.0-20220901064549-fbd10ff4f5a1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/elazarl/goproxy")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "05xqg2x7z71abvfk0l1y820pzhdhh91ym8ypninpbvx3f1gzb6fh"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/elazarl/goproxy/ext"
     #:unpack-path
     "github.com/elazarl/goproxy"))
  (propagated-inputs
   `(("go-github-com-rogpeppe-go-charset"
      ,go-github-com-rogpeppe-go-charset)))
  (home-page "https://github.com/elazarl/goproxy")
  (synopsis #f)
  (description #f)
  (license license:bsd-3))
(package
  (name "go-github-com-elazarl-goproxy")
  (version "0.0.0-20220901064549-fbd10ff4f5a1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/elazarl/goproxy")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "05xqg2x7z71abvfk0l1y820pzhdhh91ym8ypninpbvx3f1gzb6fh"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/elazarl/goproxy"))
  (propagated-inputs
   `(("go-github-com-elazarl-goproxy-ext"
      ,go-github-com-elazarl-goproxy-ext)))
  (home-page "https://github.com/elazarl/goproxy")
  (synopsis "Introduction")
  (description
   "Taken from $GOROOT/src/pkg/net/http/chunked needed to write https responses to\nclient.")
  (license license:bsd-3))
(package
  (name "go-github-com-moby-spdystream")
  (version "0.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/moby/spdystream")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1p4vk251hsv7cf86qgv1ds104cyxs6ibdxlkbcdb3ayfxqsh5n1p"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/moby/spdystream"))
  (propagated-inputs
   `(("go-github-com-gorilla-websocket"
      ,go-github-com-gorilla-websocket)))
  (home-page "https://github.com/moby/spdystream")
  (synopsis "SpdyStream")
  (description
   "This package provides a multiplexed stream library using spdy")
  (license license:asl2.0))
(package
  (name "go-github-com-mxk-go-flowrate")
  (version "0.0.0-20140419014527-cca7078d478f")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/mxk/go-flowrate")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0zqs39923ja0yypdmiqk6x8pgmfs3ms5x5sl1dqv9z6zyx2xy541"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/mxk/go-flowrate"))
  (home-page "https://github.com/mxk/go-flowrate")
  (synopsis #f)
  (description #f)
  (license license:bsd-3))
(package
  (name "go-k8s-io-apimachinery")
  (version "0.25.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/kubernetes/apimachinery")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1p741l9mx02ck27yc0ba5cwvc9b0dqfkqiqp00p03665znd7c2nc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "k8s.io/apimachinery"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-onsi-gomega"
      ,go-github-com-onsi-gomega)
     ("go-github-com-onsi-ginkgo-v2"
      ,go-github-com-onsi-ginkgo-v2)
     ("go-github-com-niemeyer-pretty"
      ,go-github-com-niemeyer-pretty)
     ("go-github-com-modern-go-reflect2"
      ,go-github-com-modern-go-reflect2)
     ("go-github-com-modern-go-concurrent"
      ,go-github-com-modern-go-concurrent)
     ("go-github-com-kr-text" ,go-github-com-kr-text)
     ("go-github-com-json-iterator-go"
      ,go-github-com-json-iterator-go)
     ("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)
     ("go-sigs-k8s-io-yaml" ,go-sigs-k8s-io-yaml)
     ("go-sigs-k8s-io-structured-merge-diff-v4"
      ,go-sigs-k8s-io-structured-merge-diff-v4)
     ("go-sigs-k8s-io-json" ,go-sigs-k8s-io-json)
     ("go-k8s-io-utils" ,go-k8s-io-utils)
     ("go-k8s-io-kube-openapi"
      ,go-k8s-io-kube-openapi)
     ("go-k8s-io-klog-v2" ,go-k8s-io-klog-v2)
     ("go-gopkg-in-inf-v0" ,go-gopkg-in-inf-v0)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-mxk-go-flowrate"
      ,go-github-com-mxk-go-flowrate)
     ("go-github-com-moby-spdystream"
      ,go-github-com-moby-spdystream)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-google-gofuzz"
      ,go-github-com-google-gofuzz)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-google-gnostic"
      ,go-github-com-google-gnostic)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-evanphx-json-patch"
      ,go-github-com-evanphx-json-patch)
     ("go-github-com-elazarl-goproxy"
      ,go-github-com-elazarl-goproxy)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-armon-go-socks5"
      ,go-github-com-armon-go-socks5)))
  (home-page "https://k8s.io/apimachinery")
  (synopsis "apimachinery")
  (description
   "Scheme, typing, encoding, decoding, and conversion packages for Kubernetes and\nKubernetes-like API objects.")
  (license license:asl2.0))
(package
  (name "go-k8s-io-client-go")
  (version "0.25.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/kubernetes/client-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0wjyyyihp7n5hj77h68lmn2sbmdnz1js67manhn10spzr34vcncz"))))
  (build-system go-build-system)
  (arguments '(#:import-path "k8s.io/client-go"))
  (propagated-inputs
   `(("go-k8s-io-apimachinery"
      ,go-k8s-io-apimachinery)
     ("go-k8s-io-api" ,go-k8s-io-api)
     ("go-sigs-k8s-io-json" ,go-sigs-k8s-io-json)
     ("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-inf-v0" ,go-gopkg-in-inf-v0)
     ("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-munnerz-goautoneg"
      ,go-github-com-munnerz-goautoneg)
     ("go-github-com-modern-go-reflect2"
      ,go-github-com-modern-go-reflect2)
     ("go-github-com-modern-go-concurrent"
      ,go-github-com-modern-go-concurrent)
     ("go-github-com-moby-spdystream"
      ,go-github-com-moby-spdystream)
     ("go-github-com-mailru-easyjson"
      ,go-github-com-mailru-easyjson)
     ("go-github-com-json-iterator-go"
      ,go-github-com-json-iterator-go)
     ("go-github-com-josharian-intern"
      ,go-github-com-josharian-intern)
     ("go-github-com-google-btree"
      ,go-github-com-google-btree)
     ("go-github-com-golang-jwt-jwt-v4"
      ,go-github-com-golang-jwt-jwt-v4)
     ("go-github-com-go-openapi-swag"
      ,go-github-com-go-openapi-swag)
     ("go-github-com-go-openapi-jsonreference"
      ,go-github-com-go-openapi-jsonreference)
     ("go-github-com-go-openapi-jsonpointer"
      ,go-github-com-go-openapi-jsonpointer)
     ("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)
     ("go-github-com-emicklei-go-restful-v3"
      ,go-github-com-emicklei-go-restful-v3)
     ("go-github-com-puerkitobio-urlesc"
      ,go-github-com-puerkitobio-urlesc)
     ("go-github-com-puerkitobio-purell"
      ,go-github-com-puerkitobio-purell)
     ("go-github-com-azure-go-autorest-tracing"
      ,go-github-com-azure-go-autorest-tracing)
     ("go-github-com-azure-go-autorest-logger"
      ,go-github-com-azure-go-autorest-logger)
     ("go-github-com-azure-go-autorest-autorest-date"
      ,go-github-com-azure-go-autorest-autorest-date)
     ("go-github-com-azure-go-autorest"
      ,go-github-com-azure-go-autorest)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)
     ("go-sigs-k8s-io-yaml" ,go-sigs-k8s-io-yaml)
     ("go-sigs-k8s-io-structured-merge-diff-v4"
      ,go-sigs-k8s-io-structured-merge-diff-v4)
     ("go-k8s-io-utils" ,go-k8s-io-utils)
     ("go-k8s-io-kube-openapi"
      ,go-k8s-io-kube-openapi)
     ("go-k8s-io-klog-v2" ,go-k8s-io-klog-v2)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-golang-org-x-time" ,go-golang-org-x-time)
     ("go-golang-org-x-term" ,go-golang-org-x-term)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-peterbourgon-diskv"
      ,go-github-com-peterbourgon-diskv)
     ("go-github-com-imdario-mergo"
      ,go-github-com-imdario-mergo)
     ("go-github-com-gregjones-httpcache"
      ,go-github-com-gregjones-httpcache)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-google-gofuzz"
      ,go-github-com-google-gofuzz)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-google-gnostic"
      ,go-github-com-google-gnostic)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-evanphx-json-patch"
      ,go-github-com-evanphx-json-patch)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-azure-go-autorest-autorest-adal"
      ,go-github-com-azure-go-autorest-autorest-adal)
     ("go-github-com-azure-go-autorest-autorest"
      ,go-github-com-azure-go-autorest-autorest)))
  (home-page "https://k8s.io/client-go")
  (synopsis "client-go")
  (description
   "Go clients for talking to a @url{http://kubernetes.io/,kubernetes} cluster.")
  (license license:asl2.0))
(package
  (name "go-github-com-azure-go-autorest-autorest-to")
  (version "0.4.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Azure/go-autorest")
           (commit
            (string-append "autorest/to/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "08594gzj6lmparpqddzp8d7h2647r0jqwgy3lmz9visihklxddiy"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/Azure/go-autorest/autorest/to"
     #:unpack-path
     "github.com/Azure/go-autorest"))
  (propagated-inputs
   `(("go-github-com-azure-go-autorest"
      ,go-github-com-azure-go-autorest)))
  (home-page
   "https://github.com/Azure/go-autorest")
  (synopsis #f)
  (description
   "Package to provides helpers to ease working with pointer values of marshalled\nstructures.")
  (license license:asl2.0))
(package
  (name "go-github-com-microsoft-go-winio")
  (version "0.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/microsoft/go-winio")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1lcnz98bj2bkjlqwqgamdzr96v6fg7wagy3n1v7kvfazfsyh03ad"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/Microsoft/go-winio"))
  (propagated-inputs
   `(("go-golang-org-x-mod" ,go-golang-org-x-mod)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)))
  (home-page
   "https://github.com/Microsoft/go-winio")
  (synopsis "go-winio")
  (description
   "This package provides utilities for efficiently performing Win32 IO operations\nin Go.  Currently, this package is provides support for genreal IO and\nmanagement of")
  (license license:expat))
(package
  (name "go-github-com-evanphx-json-patch")
  (version "0.5.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/evanphx/json-patch")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "00sib9ba8j1h1n3r1cxx48zn8hs6sxwnrh78p6wbs28wcpz8nqxi"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/evanphx/json-patch"))
  (propagated-inputs
   `(("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-jessevdk-go-flags"
      ,go-github-com-jessevdk-go-flags)))
  (home-page
   "https://github.com/evanphx/json-patch")
  (synopsis "JSON-Patch")
  (description
   "@code{jsonpatch} is a library which provides functionality for both applying\n@url{http://tools.ietf.org/html/rfc6902,RFC6902 JSON patches} against documents,\nas well as for calculating & applying\n@url{https://tools.ietf.org/html/rfc7396,RFC7396 JSON merge patches}.")
  (license license:bsd-3))
(package
  (name "go-github-com-go-openapi-analysis")
  (version "0.21.4")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-openapi/analysis")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0pflr99k0val10733gcdmicxa308jhn610nj7sx6z06mg8nzyr4c"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-openapi/analysis"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-mitchellh-mapstructure"
      ,go-github-com-mitchellh-mapstructure)
     ("go-github-com-go-openapi-swag"
      ,go-github-com-go-openapi-swag)
     ("go-github-com-go-openapi-strfmt"
      ,go-github-com-go-openapi-strfmt)
     ("go-github-com-go-openapi-spec"
      ,go-github-com-go-openapi-spec)
     ("go-github-com-go-openapi-jsonpointer"
      ,go-github-com-go-openapi-jsonpointer)))
  (home-page
   "https://github.com/go-openapi/analysis")
  (synopsis "OpenAPI initiative analysis")
  (description
   "Package analysis provides methods to work with a Swagger specification document\nfrom package go-openapi/spec.")
  (license license:asl2.0))
(package
  (name "go-github-com-go-openapi-loads")
  (version "0.21.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-openapi/loads")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "19w3kpc2zm0v0ldzz4sc85my1klylm6c53d2k2y87mkp2s8cpc03"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-openapi/loads"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-go-openapi-swag"
      ,go-github-com-go-openapi-swag)
     ("go-github-com-go-openapi-spec"
      ,go-github-com-go-openapi-spec)
     ("go-github-com-go-openapi-analysis"
      ,go-github-com-go-openapi-analysis)))
  (home-page "https://github.com/go-openapi/loads")
  (synopsis "Loads OAI specs")
  (description
   "Package loads provides document loading methods for swagger (OAI)\nspecifications.")
  (license license:asl2.0))
(package
  (name "go-github-com-go-openapi-spec")
  (version "0.20.7")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-openapi/spec")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0n2gwa5xia3d7854ccrvi9k1lnhvq8ljy6k3piirxgj2icn8asik"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-openapi/spec"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-go-openapi-swag"
      ,go-github-com-go-openapi-swag)
     ("go-github-com-go-openapi-jsonreference"
      ,go-github-com-go-openapi-jsonreference)
     ("go-github-com-go-openapi-jsonpointer"
      ,go-github-com-go-openapi-jsonpointer)))
  (home-page "https://github.com/go-openapi/spec")
  (synopsis "OAI object model")
  (description
   "The object model for OpenAPI specification documents.")
  (license license:asl2.0))
(package
  (name "go-github-com-go-openapi-errors")
  (version "0.20.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-openapi/errors")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lff7c7xympg3g8kzc2wn9iqr9qmv7mi8lqp1lxav8vlwbvrjyxs"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-openapi/errors"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-niemeyer-pretty"
      ,go-github-com-niemeyer-pretty)
     ("go-github-com-kr-text" ,go-github-com-kr-text)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)))
  (home-page
   "https://github.com/go-openapi/errors")
  (synopsis "OpenAPI errors")
  (description
   "Package errors provides an Error interface and several concrete types\nimplementing this interface to manage API errors and JSON-schema validation\nerrors.")
  (license license:asl2.0))
(package
  (name "go-github-com-oklog-ulid")
  (version "1.3.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/oklog/ulid")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0hybwyid820n80axrk863k2py93hbqlq6hxhf84ppmz0qd0ys0gq"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/oklog/ulid"))
  (home-page "https://github.com/oklog/ulid")
  (synopsis
   "Universally Unique Lexicographically Sortable Identifier")
  (description
   "This package provides a Go port of\n@url{https://github.com/alizain/ulid,alizain/ulid} with binary format\nimplemented.")
  (license license:asl2.0))
(package
  (name "go-github-com-go-openapi-strfmt")
  (version "0.21.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-openapi/strfmt")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1ch6xbl9rrxpp0mqq68phq4mrmwxvsv4nf4vn0agdjph9i005cls"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-openapi/strfmt"))
  (propagated-inputs
   `(("go-go-mongodb-org-mongo-driver"
      ,go-go-mongodb-org-mongo-driver)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-oklog-ulid"
      ,go-github-com-oklog-ulid)
     ("go-github-com-mitchellh-mapstructure"
      ,go-github-com-mitchellh-mapstructure)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-go-openapi-errors"
      ,go-github-com-go-openapi-errors)
     ("go-github-com-asaskevich-govalidator"
      ,go-github-com-asaskevich-govalidator)))
  (home-page
   "https://github.com/go-openapi/strfmt")
  (synopsis "Strfmt")
  (description
   "Package strfmt contains custom string formats")
  (license license:asl2.0))
(package
  (name "go-github-com-go-openapi-validate")
  (version "0.22.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-openapi/validate")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1fnyjpj58mx2s3j4wynpaimx9ngicw7f2nl0jxbxni6zdynwz0m9"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-openapi/validate"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-go-openapi-swag"
      ,go-github-com-go-openapi-swag)
     ("go-github-com-go-openapi-strfmt"
      ,go-github-com-go-openapi-strfmt)
     ("go-github-com-go-openapi-spec"
      ,go-github-com-go-openapi-spec)
     ("go-github-com-go-openapi-loads"
      ,go-github-com-go-openapi-loads)
     ("go-github-com-go-openapi-jsonpointer"
      ,go-github-com-go-openapi-jsonpointer)
     ("go-github-com-go-openapi-errors"
      ,go-github-com-go-openapi-errors)
     ("go-github-com-go-openapi-analysis"
      ,go-github-com-go-openapi-analysis)))
  (home-page
   "https://github.com/go-openapi/validate")
  (synopsis "Validation helpers")
  (description
   "Package validate provides methods to validate a swagger specification, as well\nas tools to validate data against their schema.")
  (license license:asl2.0))
(package
  (name "go-github-com-go-resty-resty-v2")
  (version "2.7.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-resty/resty")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0ac293jsh71qg9sdxf6sizcakrmza0qabrw6x7mpsia2h8pxlf5x"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-resty/resty/v2"))
  (propagated-inputs
   `(("go-golang-org-x-net" ,go-golang-org-x-net)))
  (home-page "https://github.com/go-resty/resty")
  (synopsis "News")
  (description
   "Package resty provides Simple HTTP and REST client library for Go.")
  (license license:expat))
(package
  (name "go-github-com-hashicorp-cronexpr")
  (version "1.1.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/cronexpr")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1j1faznspsp8h7hprivc2d1r331pdp50n8a9x39sslh3k0vnjysb"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/hashicorp/cronexpr"))
  (home-page
   "https://github.com/hashicorp/cronexpr")
  (synopsis #f)
  (description #f)
  (license #f))
(package
  (name "go-github-com-azure-go-ansiterm")
  (version "0.0.0-20210617225240-d185dfc1b5a1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Azure/go-ansiterm")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1y54b1fx80qlyvv2915xrryb9vcc8nnbsdkxszhxjg8bcg85ps5c"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/Azure/go-ansiterm"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
  (home-page
   "https://github.com/Azure/go-ansiterm")
  (synopsis "go-ansiterm")
  (description
   "This is a cross platform Ansi Terminal Emulation library.  It reads a stream of\nAnsi characters and produces the appropriate function calls.  The results of the\nfunction calls are platform dependent.")
  (license license:expat))
(package
  (name "go-github-com-moby-term")
  (version "0.0.0-20220808134915-39b0c02b01ae")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/moby/term")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0gkkm6mdywiyza373bl4xqchhnbslhxg7himb8slzr5qz9d140if"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/moby/term"))
  (propagated-inputs
   `(("go-gotest-tools-v3" ,go-gotest-tools-v3)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-creack-pty"
      ,go-github-com-creack-pty)
     ("go-github-com-azure-go-ansiterm"
      ,go-github-com-azure-go-ansiterm)))
  (home-page "https://github.com/moby/term")
  (synopsis
   "term - utilities for dealing with terminals")
  (description
   "Package term provides structures and helper functions to work with terminal\n(state, sizes).")
  (license license:asl2.0))
(package
  (name "go-github-com-morikuni-aec")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/morikuni/aec")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1qaqh0lk9wrqgff0yrxnbznvmwyhdxy3g9b2hjpazp5bw4nj0dp7"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/morikuni/aec"))
  (home-page "https://github.com/morikuni/aec")
  (synopsis "aec")
  (description "Go wrapper for ANSI escape code.")
  (license license:expat))
(package
  (name "go-github-com-montanaflynn-stats")
  (version "0.6.6")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/montanaflynn/stats")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0r0ad2275saw79kgh3ywafii8f6rja2z6mzm9izs11k2lvkqpz6z"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/montanaflynn/stats"))
  (home-page
   "https://github.com/montanaflynn/stats")
  (synopsis "Stats - Golang Statistics Package")
  (description
   "Package stats is a well tested and comprehensive statistics library package with\nno dependencies.")
  (license license:expat))
(package
  (name "go-github-com-tidwall-pretty")
  (version "1.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/tidwall/pretty")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "11zi5hxb75yapgxq67r4lmv8n910iqmw7994ig1fy4gnr4d51i3s"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/tidwall/pretty"))
  (home-page "https://github.com/tidwall/pretty")
  (synopsis "Pretty")
  (description
   "Pretty is a Go package that provides @url{#readme-performance,fast} methods for\nformatting JSON for human readability, or to compact JSON for smaller payloads.")
  (license license:expat))
(package
  (name "go-github-com-youmark-pkcs8")
  (version "0.0.0-20201027041543-1326539a0a0a")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/youmark/pkcs8")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1bk20x279iiafxh39v75hrmxncbkmw17603g8xw5b59cqzzpnrmv"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/youmark/pkcs8"))
  (propagated-inputs
   `(("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)))
  (home-page "https://github.com/youmark/pkcs8")
  (synopsis "pkcs8")
  (description
   "Package pkcs8 implements functions to parse and convert private keys in PKCS#8\nformat, as defined in RFC5208 and RFC5958")
  (license license:expat))
(package
  (name "go-go-mongodb-org-mongo-driver")
  (version "1.10.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/mongodb/mongo-go-driver")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1z9bcjpw52y0sxldyj91rmyqfxvrxibimvwdjm53qsc9phqnzv9y"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "go.mongodb.org/mongo-driver"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-youmark-pkcs8"
      ,go-github-com-youmark-pkcs8)
     ("go-github-com-xdg-go-stringprep"
      ,go-github-com-xdg-go-stringprep)
     ("go-github-com-xdg-go-scram"
      ,go-github-com-xdg-go-scram)
     ("go-github-com-tidwall-pretty"
      ,go-github-com-tidwall-pretty)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-montanaflynn-stats"
      ,go-github-com-montanaflynn-stats)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)
     ("go-github-com-klauspost-compress"
      ,go-github-com-klauspost-compress)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-snappy"
      ,go-github-com-golang-snappy)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)))
  (home-page "https://go.mongodb.org/mongo-driver")
  (synopsis "MongoDB Go Driver")
  (description
   "The MongoDB supported driver for Go.")
  (license license:asl2.0))
(package
  (name "go-go-opentelemetry-io-otel-exporters-otlp-internal-retry")
  (version "1.10.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/open-telemetry/opentelemetry-go")
           (commit
            (string-append
             "exporters/otlp/internal/retry/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0kyd2y1x1zygkhzc8glrclvcaks4hzigan1mzy9cwrkbzx8kc0kr"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.opentelemetry.io/otel/exporters/otlp/internal/retry"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-cenkalti-backoff-v4"
      ,go-github-com-cenkalti-backoff-v4)))
  (home-page
   "https://go.opentelemetry.io/otel/exporters/otlp/internal/retry")
  (synopsis #f)
  (description
   "Package retry provides request retry functionality that can perform configurable\nexponential backoff for transient errors and honor any explicit throttle\nresponses received.")
  (license license:asl2.0))
(package
  (name "go-gopkg-in-inf-v0")
  (version "0.9.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gopkg.in/inf.v0")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "00k5iqjcp371fllqxncv7jkf80hn1zww92zm78cclbcn4ybigkng"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "gopkg.in/inf.v0"
     #:unpack-path
     "gopkg.in/inf.v0"))
  (home-page "https://gopkg.in/inf.v0")
  (synopsis #f)
  (description
   "Package inf (type inf.Dec) implements \"infinite-precision\" decimal arithmetic.\n\"Infinite precision\" describes two characteristics: practically unlimited\nprecision for decimal number representation and no support for calculating with\nany specific fixed precision.  (Although there is no practical limit on\nprecision, inf.Dec can only represent finite decimals.)")
  (license license:bsd-3))
(package
  (name "go-gotest-tools-v3")
  (version "3.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gotestyourself/gotest.tools")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1g53x6fcd5lp8siczs6jlalkxqgj3s3g6cc2rhsqyigvpsj656cs"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "gotest.tools/v3"
     #:unpack-path
     "gotest.tools/v3"))
  (propagated-inputs
   `(("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)))
  (home-page "https://gotest.tools/v3")
  (synopsis "gotest.tools")
  (description
   "Package gotesttools is a collection of packages to augment `testing` and support\ncommon patterns.")
  (license license:asl2.0))
(package
  (name "go-github-com-nytimes-gziphandler")
  (version "1.1.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/nytimes/gziphandler")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0rhrjlw220hnymzfccm0yir3pc9dpj7h3gwzhzq2cbsb3hhsqvyy"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/NYTimes/gziphandler"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page
   "https://github.com/NYTimes/gziphandler")
  (synopsis "Gzip Handler")
  (description
   "This is a tiny Go package which wraps HTTP handlers to transparently gzip the\nresponse body, for clients which support it.  Although it's usually simpler to\nleave that to a reverse proxy (like nginx or Varnish), this package is useful\nwhen that's undesirable.")
  (license license:asl2.0))
(package
  (name "go-github-com-asaskevich-govalidator")
  (version "0.0.0-20210307081110-f21760c49a8d")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/asaskevich/govalidator")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0aab1pym5c6di8vidynp6ly5j4kcqv6lp2737gw0a07zng0nn8lw"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/asaskevich/govalidator"))
  (home-page
   "https://github.com/asaskevich/govalidator")
  (synopsis "govalidator")
  (description
   "Package govalidator is package of validators and sanitizers for strings, structs\nand collections.")
  (license license:expat))
(package
  (name "go-github-com-emicklei-go-restful-v3")
  (version "3.9.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/emicklei/go-restful")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1ckdzaxw77n6gvbq8ks8dhrymvg9hhvy19lvg3z3n62jdijdj6a9"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/emicklei/go-restful/v3"))
  (home-page
   "https://github.com/emicklei/go-restful")
  (synopsis "go-restful")
  (description
   "Package restful , a lean package for creating REST-style WebServices without\nmagic.")
  (license license:expat))
(package
  (name "go-github-com-go-openapi-jsonreference")
  (version "0.20.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-openapi/jsonreference")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0scw8hfyxwwn61shm42406fmsi33mbsazrwc62wr0lgbrhaw1li3"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/go-openapi/jsonreference"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-go-openapi-jsonpointer"
      ,go-github-com-go-openapi-jsonpointer)))
  (home-page
   "https://github.com/go-openapi/jsonreference")
  (synopsis "gojsonreference")
  (description
   "@url{https://raw.githubusercontent.com/go-openapi/jsonreference/master/LICENSE,(img\n(@ (src http://img.shields.io/badge/license-Apache%20v2-orange.svg) (alt\nlicense)))} @url{http://godoc.org/github.com/go-openapi/jsonreference,(img (@\n(src https://godoc.org/github.com/go-openapi/jsonreference?status.svg=) (alt\nGoDoc)))} An implementation of JSON Reference - Go language")
  (license license:asl2.0))
(package
  (name "go-github-com-docopt-docopt-go")
  (version "0.0.0-20180111231733-ee0de3bc6815")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/docopt/docopt.go")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0hlra7rmi5pmd7d93rv56ahiy4qkgmq8a6mz0jpadvbi5qh8lq6j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/docopt/docopt-go"))
  (home-page "https://github.com/docopt/docopt-go")
  (synopsis "docopt-go")
  (description
   "Package docopt parses command-line arguments based on a help message.")
  (license license:expat))
(package
  (name "go-github-com-buger-jsonparser")
  (version "1.1.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/buger/jsonparser")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0qv2lsh2biwxn927941gqiv5pqg7n4v58j0i536pjp7pr17pq7dp"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/buger/jsonparser"))
  (home-page "https://github.com/buger/jsonparser")
  (synopsis
   "Alternative JSON parser for Go (10x times faster standard library)")
  (description
   "It does not require you to know the structure of the payload (eg.  create\nstructs), and allows accessing fields by providing the path to them.  It is up\nto @strong{10 times faster} than standard @code{encoding/json} package\n(depending on payload size and usage), @strong{allocates no memory}.  See\nbenchmarks below.")
  (license license:expat))
(package
  (name "go-github-com-flowstack-go-jsonschema")
  (version "0.1.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/flowstack/go-jsonschema")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "04rba9cf6y9bgnfpkbx2idqhbj8hvp7y2lppf1niy62mznw4wjxj"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/flowstack/go-jsonschema"))
  (propagated-inputs
   `(("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-xeipuuv-gojsonschema"
      ,go-github-com-xeipuuv-gojsonschema)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-buger-jsonparser"
      ,go-github-com-buger-jsonparser)))
  (home-page
   "https://github.com/flowstack/go-jsonschema")
  (synopsis "go-jsonschema")
  (description
   "Go JSON Schema parser and validator")
  (license license:expat))
(package
  (name "go-github-com-stoewer-go-strcase")
  (version "1.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/stoewer/go-strcase")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1c7p6r9xr763x5alfcf6k2pd9d2phwbapq6lyc5f01a33rrh9ksm"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/stoewer/go-strcase"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page
   "https://github.com/stoewer/go-strcase")
  (synopsis "")
  (description
   "Package strcase converts between different kinds of naming formats such as camel\ncase (CamelCase), snake case (snake_case) or kebab case (kebab-case).  The\npackage is designed to work only with strings consisting of standard ASCII\nletters.  Unicode is currently not supported.")
  (license license:expat))
(package
  (name "go-github-com-google-gnostic")
  (version "0.6.9")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/google/gnostic")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "04xhncmdywv4xh7h61ld4xm41210336dh4vqwyrilk1gmlv3i3xg"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/google/gnostic"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-github-com-stoewer-go-strcase"
      ,go-github-com-stoewer-go-strcase)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-flowstack-go-jsonschema"
      ,go-github-com-flowstack-go-jsonschema)
     ("go-github-com-docopt-docopt-go"
      ,go-github-com-docopt-docopt-go)))
  (home-page "https://github.com/google/gnostic")
  (synopsis "⨁ gnostic")
  (description
   "Gnostic is a tool for building better REST APIs through knowledge.")
  (license license:asl2.0))
(package
  (name "go-github-com-munnerz-goautoneg")
  (version "0.0.0-20191010083416-a7dc8b61c822")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/munnerz/goautoneg")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1m4v6bw6yf1g0kvpc46isjp0qfhx2y8gnvlnyjf637jy64613mgg"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/munnerz/goautoneg"))
  (home-page
   "https://github.com/munnerz/goautoneg")
  (synopsis #f)
  (description #f)
  (license license:bsd-3))
(package
  (name "go-k8s-io-gengo")
  (version "0.0.0-20220913193501-391367153a38")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/kubernetes/gengo")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0wsk47f1k7gi7m1ckyi84vg6s5h1nxccla3h05b3smx7xa82lvgx"))))
  (build-system go-build-system)
  (arguments '(#:import-path "k8s.io/gengo"))
  (propagated-inputs
   `(("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-sigs-k8s-io-yaml" ,go-sigs-k8s-io-yaml)
     ("go-k8s-io-klog-v2" ,go-k8s-io-klog-v2)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)
     ("go-github-com-google-gofuzz"
      ,go-github-com-google-gofuzz)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)))
  (home-page "https://k8s.io/gengo")
  (synopsis "gengo")
  (description
   "This package provides a package for generating things based on go files.  This\nmechanism was first used in\n@url{https://github.com/kubernetes/kubernetes/tree/master/staging/src/k8s.io/code-generator,Kubernetes\ncode-generator} and is split out here for ease of reuse and maintainability.")
  (license license:asl2.0))
(package
  (name "go-github-com-puerkitobio-purell")
  (version "1.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/PuerkitoBio/purell")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "07ydfmv3rq3bkynyncndf8g1qqzvd6m6gq14d19s8djayygwvwmw"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/PuerkitoBio/purell"))
  (propagated-inputs
   `(("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-net" ,go-golang-org-x-net)))
  (home-page
   "https://github.com/PuerkitoBio/purell")
  (synopsis "Purell")
  (description
   "Package purell offers URL normalization as described on the wikipedia page:\n@url{http://en.wikipedia.org/wiki/URL_normalization,http://en.wikipedia.org/wiki/URL_normalization}")
  (license license:bsd-3))
(package
  (name "go-github-com-puerkitobio-urlesc")
  (version "0.0.0-20170810143723-de5bf2ad4578")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/PuerkitoBio/urlesc")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0n0srpqwbaan1wrhh2b7ysz543pjs1xw2rghvqyffg9l0g8kzgcw"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/PuerkitoBio/urlesc"))
  (home-page
   "https://github.com/PuerkitoBio/urlesc")
  (synopsis "urlesc")
  (description
   "Package urlesc implements query escaping as per\n@url{https://rfc-editor.org/rfc/rfc3986.html,RFC 3986}.  It contains some parts\nof the net/url package, modified so as to allow some reserved characters\nincorrectly escaped by net/url.  See\n@url{https://github.com/golang/go/issues/5684,https://github.com/golang/go/issues/5684}")
  (license license:bsd-3))
(package
  (name "go-github-com-go-openapi-swag")
  (version "0.22.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-openapi/swag")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "03mzyhr491sxd6129i5n300waj2qr9ncnb743g2qcikxrc28ahc9"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-openapi/swag"))
  (propagated-inputs
   `(("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-kr-text" ,go-github-com-kr-text)
     ("go-github-com-josharian-intern"
      ,go-github-com-josharian-intern)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-mailru-easyjson"
      ,go-github-com-mailru-easyjson)))
  (home-page "https://github.com/go-openapi/swag")
  (synopsis "Swag")
  (description
   "Package swag contains a bunch of helper functions for go-openapi and go-swagger\nprojects.")
  (license license:asl2.0))
(package
  (name "go-github-com-go-openapi-jsonpointer")
  (version "0.19.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-openapi/jsonpointer")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0azic9nfwywlz4qxvacyi4g668fbbrkcyv15bag02yfcsi8szg5c"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/go-openapi/jsonpointer"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-mailru-easyjson"
      ,go-github-com-mailru-easyjson)
     ("go-github-com-go-openapi-swag"
      ,go-github-com-go-openapi-swag)))
  (home-page
   "https://github.com/go-openapi/jsonpointer")
  (synopsis "gojsonpointer")
  (description
   "@url{https://raw.githubusercontent.com/go-openapi/jsonpointer/master/LICENSE,(img\n(@ (src http://img.shields.io/badge/license-Apache%20v2-orange.svg) (alt\nlicense)))} @url{http://godoc.org/github.com/go-openapi/jsonpointer,(img (@ (src\nhttps://godoc.org/github.com/go-openapi/jsonpointer?status.svg=) (alt GoDoc)))}\nAn implementation of JSON Pointer - Go language")
  (license license:asl2.0))
(package
  (name "go-github-com-josharian-intern")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/josharian/intern")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1za48ppvwd5vg8vv25ldmwz1biwpb3p6qhf8vazhsfdg9m07951c"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/josharian/intern"))
  (home-page "https://github.com/josharian/intern")
  (synopsis #f)
  (description
   "Package intern interns strings.  Interning is best effort only.  Interned\nstrings may be removed automatically at any time without notification.  All\nfunctions may be called concurrently with themselves and each other.")
  (license license:expat))
(package
  (name "go-github-com-mailru-easyjson")
  (version "0.7.7")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/mailru/easyjson")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0clifkvvy8f45rv3cdyv58dglzagyvfcqb63wl6rij30c5j2pzc1"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/mailru/easyjson"))
  (propagated-inputs
   `(("go-github-com-josharian-intern"
      ,go-github-com-josharian-intern)))
  (home-page "https://github.com/mailru/easyjson")
  (synopsis "easyjson")
  (description
   "Package easyjson contains marshaler/unmarshaler interfaces and helper functions.")
  (license license:expat))
(package
  (name "go-k8s-io-kube-openapi")
  (version "0.0.0-20220928191237-829ce0c27909")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/kubernetes/kube-openapi")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1mv2ks8rbrpfgg0fqy2l0jsvrr9ja7bpwxx7hmj9qbri6jwcllq3"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "k8s.io/kube-openapi"))
  (propagated-inputs
   `(("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-mod" ,go-golang-org-x-mod)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-modern-go-reflect2"
      ,go-github-com-modern-go-reflect2)
     ("go-github-com-modern-go-concurrent"
      ,go-github-com-modern-go-concurrent)
     ("go-github-com-mailru-easyjson"
      ,go-github-com-mailru-easyjson)
     ("go-github-com-json-iterator-go"
      ,go-github-com-json-iterator-go)
     ("go-github-com-go-openapi-jsonpointer"
      ,go-github-com-go-openapi-jsonpointer)
     ("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-puerkitobio-urlesc"
      ,go-github-com-puerkitobio-urlesc)
     ("go-github-com-puerkitobio-purell"
      ,go-github-com-puerkitobio-purell)
     ("go-sigs-k8s-io-yaml" ,go-sigs-k8s-io-yaml)
     ("go-sigs-k8s-io-structured-merge-diff-v4"
      ,go-sigs-k8s-io-structured-merge-diff-v4)
     ("go-k8s-io-utils" ,go-k8s-io-utils)
     ("go-k8s-io-klog-v2" ,go-k8s-io-klog-v2)
     ("go-k8s-io-gengo" ,go-k8s-io-gengo)
     ("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-onsi-gomega"
      ,go-github-com-onsi-gomega)
     ("go-github-com-onsi-ginkgo-v2"
      ,go-github-com-onsi-ginkgo-v2)
     ("go-github-com-munnerz-goautoneg"
      ,go-github-com-munnerz-goautoneg)
     ("go-github-com-mitchellh-mapstructure"
      ,go-github-com-mitchellh-mapstructure)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-google-gofuzz"
      ,go-github-com-google-gofuzz)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-google-gnostic"
      ,go-github-com-google-gnostic)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-go-openapi-swag"
      ,go-github-com-go-openapi-swag)
     ("go-github-com-go-openapi-jsonreference"
      ,go-github-com-go-openapi-jsonreference)
     ("go-github-com-emicklei-go-restful-v3"
      ,go-github-com-emicklei-go-restful-v3)
     ("go-github-com-asaskevich-govalidator"
      ,go-github-com-asaskevich-govalidator)
     ("go-github-com-nytimes-gziphandler"
      ,go-github-com-nytimes-gziphandler)))
  (home-page "https://k8s.io/kube-openapi")
  (synopsis "Kube OpenAPI")
  (description
   "This repo is the home for Kubernetes OpenAPI discovery spec generation.  The\ngoal is to support a subset of OpenAPI features to satisfy kubernetes use-cases\nbut implement that subset with little to no assumption about the structure of\nthe code or routes.  Thus, there should be no kubernetes specific code in this\nrepo.")
  (license license:asl2.0))
(package
  (name "go-k8s-io-klog-v2")
  (version "2.80.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/kubernetes/klog")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1n2mrznznh9byl0q0rq5fpdxx8q85xfmwyfidsnqybrpylzcs46p"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "k8s.io/klog/v2"
     #:unpack-path
     "k8s.io/klog/v2"))
  (propagated-inputs
   `(("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)))
  (home-page "https://k8s.io/klog/v2")
  (synopsis "klog")
  (description
   "Package klog implements logging analogous to the Google-internal C++\nINFO/ERROR/V setup.  It provides functions Info, Warning, Error, Fatal, plus\nformatting variants such as Infof.  It also provides V-style logging controlled\nby the -v and -vmodule=file=2 flags.")
  (license license:asl2.0))
(package
  (name "go-k8s-io-utils")
  (version "0.0.0-20220922133306-665eaaec4324")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/kubernetes/utils")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1klh43cfly7m29agi74cfynbv7qh0qvv6l9xhimyiwz06j7lwp9c"))))
  (build-system go-build-system)
  (arguments '(#:import-path "k8s.io/utils"))
  (propagated-inputs
   `(("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)
     ("go-k8s-io-klog-v2" ,go-k8s-io-klog-v2)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)))
  (home-page "https://k8s.io/utils")
  (synopsis "Utils")
  (description
   "This package provides a set of Go libraries that provide low-level,\nkubernetes-independent packages supplementing the\n@url{https://golang.org/pkg/#stdlib,Go standard libs}.")
  (license license:asl2.0))
(package
  (name "go-sigs-k8s-io-json")
  (version "0.0.0-20220713155537-f223a00ba0e2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/kubernetes-sigs/json")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1ykph9nqks2xif0fffpp5nbzp4r3c5pvgi1wrnwn7lxp1718g4jm"))))
  (build-system go-build-system)
  (arguments '(#:import-path "sigs.k8s.io/json"))
  (home-page "https://sigs.k8s.io/json")
  (synopsis "sigs.k8s.io/json")
  (description
   "This library is a subproject of\n@url{https://github.com/kubernetes/community/tree/master/sig-api-machinery#json,sig-api-machinery}.\nIt provides case-sensitive, integer-preserving JSON unmarshaling functions based\non @code{encoding/json} @code{Unmarshal()}.")
  (license license:asl2.0))
(package
  (name "go-sigs-k8s-io-structured-merge-diff-v4")
  (version "4.2.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/kubernetes-sigs/structured-merge-diff")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "02db3a0ln64fv8s7lis7jnsprphxbr33cspxb0kdw9l9zy8dg45k"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "sigs.k8s.io/structured-merge-diff/v4"
     #:unpack-path
     "sigs.k8s.io/structured-merge-diff/v4"))
  (propagated-inputs
   `(("go-github-com-modern-go-concurrent"
      ,go-github-com-modern-go-concurrent)
     ("go-github-com-json-iterator-go"
      ,go-github-com-json-iterator-go)
     ("go-github-com-google-gofuzz"
      ,go-github-com-google-gofuzz)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)))
  (home-page
   "https://sigs.k8s.io/structured-merge-diff/v4")
  (synopsis "Structured Merge and Diff")
  (description
   "This repo contains code which implements the Kubernetes \"apply\" operation.")
  (license license:asl2.0))
(package
  (name "go-github-com-simonpasquier-klog-gokit")
  (version "0.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/simonpasquier/klog-gokit")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "061hxp1x7akgfdg9iy4kk5528rzq70cq7pj8azygf4149i7nsssk"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/simonpasquier/klog-gokit"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-go-kit-kit"
      ,go-github-com-go-kit-kit)))
  (home-page
   "https://github.com/simonpasquier/klog-gokit")
  (synopsis "klog-gokit")
  (description
   "This package is a replacement for\n@url{https://github.com/kubernetes/klog,k8s.io/klog} in projects that use the\n@url{https://godoc.org/github.com/go-kit/kit/log,go-kit logger}.")
  (license license:asl2.0))
(package
  (name "go-github-com-simonpasquier-klog-gokit-v3")
  (version "3.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/simonpasquier/klog-gokit")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1cvq8zh91n8g5lwc08g6nw69hmaqyd30k44k4gr3zbgnyv23bi6w"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/simonpasquier/klog-gokit/v3"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-go-kit-log"
      ,go-github-com-go-kit-log)))
  (home-page
   "https://github.com/simonpasquier/klog-gokit")
  (synopsis "klog-gokit")
  (description
   "This package is a replacement for\n@url{https://github.com/kubernetes/klog,k8s.io/klog/v2} in projects that use the\n@url{https://pkg.go.dev/github.com/go-kit/log,github.com/go-kit/log} module for\nlogging.")
  (license license:asl2.0))
(package
  (name "go-github-com-prometheus-prometheus")
  (version "0.38.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/prometheus/prometheus")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0q9kb100l39g5bwikz7s8i5qzhscb6n32yi087052vpf33gr1kg6"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/prometheus/prometheus"))
  (propagated-inputs
   `(("go-github-com-simonpasquier-klog-gokit-v3"
      ,go-github-com-simonpasquier-klog-gokit-v3)
     ("go-github-com-simonpasquier-klog-gokit"
      ,go-github-com-simonpasquier-klog-gokit)
     ("go-sigs-k8s-io-yaml" ,go-sigs-k8s-io-yaml)
     ("go-sigs-k8s-io-structured-merge-diff-v4"
      ,go-sigs-k8s-io-structured-merge-diff-v4)
     ("go-sigs-k8s-io-json" ,go-sigs-k8s-io-json)
     ("go-k8s-io-utils" ,go-k8s-io-utils)
     ("go-k8s-io-kube-openapi"
      ,go-k8s-io-kube-openapi)
     ("go-gotest-tools-v3" ,go-gotest-tools-v3)
     ("go-gopkg-in-ini-v1" ,go-gopkg-in-ini-v1)
     ("go-gopkg-in-inf-v0" ,go-gopkg-in-inf-v0)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-term" ,go-golang-org-x-term)
     ("go-golang-org-x-mod" ,go-golang-org-x-mod)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-go-opentelemetry-io-proto-otlp"
      ,go-go-opentelemetry-io-proto-otlp)
     ("go-go-opentelemetry-io-otel-metric"
      ,go-go-opentelemetry-io-otel-metric)
     ("go-go-opentelemetry-io-otel-exporters-otlp-internal-retry"
      ,go-go-opentelemetry-io-otel-exporters-otlp-internal-retry)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-go-mongodb-org-mongo-driver"
      ,go-go-mongodb-org-mongo-driver)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-prometheus-procfs"
      ,go-github-com-prometheus-procfs)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-opencontainers-image-spec"
      ,go-github-com-opencontainers-image-spec)
     ("go-github-com-opencontainers-go-digest"
      ,go-github-com-opencontainers-go-digest)
     ("go-github-com-onsi-gomega"
      ,go-github-com-onsi-gomega)
     ("go-github-com-onsi-ginkgo"
      ,go-github-com-onsi-ginkgo)
     ("go-github-com-munnerz-goautoneg"
      ,go-github-com-munnerz-goautoneg)
     ("go-github-com-morikuni-aec"
      ,go-github-com-morikuni-aec)
     ("go-github-com-modern-go-reflect2"
      ,go-github-com-modern-go-reflect2)
     ("go-github-com-modern-go-concurrent"
      ,go-github-com-modern-go-concurrent)
     ("go-github-com-moby-term"
      ,go-github-com-moby-term)
     ("go-github-com-mitchellh-mapstructure"
      ,go-github-com-mitchellh-mapstructure)
     ("go-github-com-mitchellh-go-homedir"
      ,go-github-com-mitchellh-go-homedir)
     ("go-github-com-matttproud-golang-protobuf-extensions"
      ,go-github-com-matttproud-golang-protobuf-extensions)
     ("go-github-com-mattn-go-isatty"
      ,go-github-com-mattn-go-isatty)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-mailru-easyjson"
      ,go-github-com-mailru-easyjson)
     ("go-github-com-julienschmidt-httprouter"
      ,go-github-com-julienschmidt-httprouter)
     ("go-github-com-jpillora-backoff"
      ,go-github-com-jpillora-backoff)
     ("go-github-com-josharian-intern"
      ,go-github-com-josharian-intern)
     ("go-github-com-jmespath-go-jmespath"
      ,go-github-com-jmespath-go-jmespath)
     ("go-github-com-imdario-mergo"
      ,go-github-com-imdario-mergo)
     ("go-github-com-hashicorp-serf"
      ,go-github-com-hashicorp-serf)
     ("go-github-com-hashicorp-golang-lru"
      ,go-github-com-hashicorp-golang-lru)
     ("go-github-com-hashicorp-go-rootcerts"
      ,go-github-com-hashicorp-go-rootcerts)
     ("go-github-com-hashicorp-go-retryablehttp"
      ,go-github-com-hashicorp-go-retryablehttp)
     ("go-github-com-hashicorp-go-immutable-radix"
      ,go-github-com-hashicorp-go-immutable-radix)
     ("go-github-com-hashicorp-go-hclog"
      ,go-github-com-hashicorp-go-hclog)
     ("go-github-com-hashicorp-go-cleanhttp"
      ,go-github-com-hashicorp-go-cleanhttp)
     ("go-github-com-hashicorp-cronexpr"
      ,go-github-com-hashicorp-cronexpr)
     ("go-github-com-grpc-ecosystem-grpc-gateway-v2"
      ,go-github-com-grpc-ecosystem-grpc-gateway-v2)
     ("go-github-com-gorilla-websocket"
      ,go-github-com-gorilla-websocket)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-google-gofuzz"
      ,go-github-com-google-gofuzz)
     ("go-github-com-google-go-querystring"
      ,go-github-com-google-go-querystring)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-google-gnostic"
      ,go-github-com-google-gnostic)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-github-com-golang-glog"
      ,go-github-com-golang-glog)
     ("go-github-com-golang-jwt-jwt-v4"
      ,go-github-com-golang-jwt-jwt-v4)
     ("go-github-com-go-resty-resty-v2"
      ,go-github-com-go-resty-resty-v2)
     ("go-github-com-go-openapi-validate"
      ,go-github-com-go-openapi-validate)
     ("go-github-com-go-openapi-swag"
      ,go-github-com-go-openapi-swag)
     ("go-github-com-go-openapi-spec"
      ,go-github-com-go-openapi-spec)
     ("go-github-com-go-openapi-loads"
      ,go-github-com-go-openapi-loads)
     ("go-github-com-go-openapi-jsonreference"
      ,go-github-com-go-openapi-jsonreference)
     ("go-github-com-go-openapi-jsonpointer"
      ,go-github-com-go-openapi-jsonpointer)
     ("go-github-com-go-openapi-errors"
      ,go-github-com-go-openapi-errors)
     ("go-github-com-go-openapi-analysis"
      ,go-github-com-go-openapi-analysis)
     ("go-github-com-go-logr-stdr"
      ,go-github-com-go-logr-stdr)
     ("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)
     ("go-github-com-go-kit-kit"
      ,go-github-com-go-kit-kit)
     ("go-github-com-ghodss-yaml"
      ,go-github-com-ghodss-yaml)
     ("go-github-com-felixge-httpsnoop"
      ,go-github-com-felixge-httpsnoop)
     ("go-github-com-fatih-color"
      ,go-github-com-fatih-color)
     ("go-github-com-evanphx-json-patch"
      ,go-github-com-evanphx-json-patch)
     ("go-github-com-emicklei-go-restful"
      ,go-github-com-emicklei-go-restful)
     ("go-github-com-docker-go-units"
      ,go-github-com-docker-go-units)
     ("go-github-com-docker-go-connections"
      ,go-github-com-docker-go-connections)
     ("go-github-com-docker-distribution"
      ,go-github-com-docker-distribution)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-cncf-xds-go"
      ,go-github-com-cncf-xds-go)
     ("go-github-com-cenkalti-backoff-v4"
      ,go-github-com-cenkalti-backoff-v4)
     ("go-github-com-beorn7-perks"
      ,go-github-com-beorn7-perks)
     ("go-github-com-asaskevich-govalidator"
      ,go-github-com-asaskevich-govalidator)
     ("go-github-com-armon-go-metrics"
      ,go-github-com-armon-go-metrics)
     ("go-github-com-alecthomas-template"
      ,go-github-com-alecthomas-template)
     ("go-github-com-puerkitobio-urlesc"
      ,go-github-com-puerkitobio-urlesc)
     ("go-github-com-puerkitobio-purell"
      ,go-github-com-puerkitobio-purell)
     ("go-github-com-microsoft-go-winio"
      ,go-github-com-microsoft-go-winio)
     ("go-github-com-azure-go-autorest-tracing"
      ,go-github-com-azure-go-autorest-tracing)
     ("go-github-com-azure-go-autorest-logger"
      ,go-github-com-azure-go-autorest-logger)
     ("go-github-com-azure-go-autorest-autorest-validation"
      ,go-github-com-azure-go-autorest-autorest-validation)
     ("go-github-com-azure-go-autorest-autorest-to"
      ,go-github-com-azure-go-autorest-autorest-to)
     ("go-github-com-azure-go-autorest-autorest-date"
      ,go-github-com-azure-go-autorest-autorest-date)
     ("go-github-com-azure-go-autorest"
      ,go-github-com-azure-go-autorest)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-k8s-io-client-go" ,go-k8s-io-client-go)
     ("go-k8s-io-apimachinery"
      ,go-k8s-io-apimachinery)
     ("go-k8s-io-api" ,go-k8s-io-api)
     ("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-alecthomas-kingpin-v2"
      ,go-gopkg-in-alecthomas-kingpin-v2)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-time" ,go-golang-org-x-time)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-uber-org-goleak" ,go-go-uber-org-goleak)
     ("go-go-uber-org-automaxprocs"
      ,go-go-uber-org-automaxprocs)
     ("go-go-uber-org-atomic" ,go-go-uber-org-atomic)
     ("go-go-opentelemetry-io-otel-trace"
      ,go-go-opentelemetry-io-otel-trace)
     ("go-go-opentelemetry-io-otel-sdk"
      ,go-go-opentelemetry-io-otel-sdk)
     ("go-go-opentelemetry-io-otel-exporters-otlp-otlptrace-otlptracehttp"
      ,go-go-opentelemetry-io-otel-exporters-otlp-otlptrace-otlptracehttp)
     ("go-go-opentelemetry-io-otel-exporters-otlp-otlptrace-otlptracegrpc"
      ,go-go-opentelemetry-io-otel-exporters-otlp-otlptrace-otlptracegrpc)
     ("go-go-opentelemetry-io-otel-exporters-otlp-otlptrace"
      ,go-go-opentelemetry-io-otel-exporters-otlp-otlptrace)
     ("go-go-opentelemetry-io-otel"
      ,go-go-opentelemetry-io-otel)
     ("go-go-opentelemetry-io-contrib-instrumentation-net-http-otelhttp"
      ,go-go-opentelemetry-io-contrib-instrumentation-net-http-otelhttp)
     ("go-github-com-vultr-govultr-v2"
      ,go-github-com-vultr-govultr-v2)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-shurcool-httpfs"
      ,go-github-com-shurcool-httpfs)
     ("go-github-com-scaleway-scaleway-sdk-go"
      ,go-github-com-scaleway-scaleway-sdk-go)
     ("go-github-com-prometheus-exporter-toolkit"
      ,go-github-com-prometheus-exporter-toolkit)
     ("go-github-com-prometheus-common-sigv4"
      ,go-github-com-prometheus-common-sigv4)
     ("go-github-com-prometheus-common-assets"
      ,go-github-com-prometheus-common-assets)
     ("go-github-com-prometheus-common"
      ,go-github-com-prometheus-common)
     ("go-github-com-prometheus-client-model"
      ,go-github-com-prometheus-client-model)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-prometheus-alertmanager"
      ,go-github-com-prometheus-alertmanager)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-oklog-ulid"
      ,go-github-com-oklog-ulid)
     ("go-github-com-oklog-run"
      ,go-github-com-oklog-run)
     ("go-github-com-mwitkow-go-conntrack"
      ,go-github-com-mwitkow-go-conntrack)
     ("go-github-com-miekg-dns"
      ,go-github-com-miekg-dns)
     ("go-github-com-linode-linodego"
      ,go-github-com-linode-linodego)
     ("go-github-com-kolo-xmlrpc"
      ,go-github-com-kolo-xmlrpc)
     ("go-github-com-json-iterator-go"
      ,go-github-com-json-iterator-go)
     ("go-github-com-ionos-cloud-sdk-go-v6"
      ,go-github-com-ionos-cloud-sdk-go-v6)
     ("go-github-com-hetznercloud-hcloud-go"
      ,go-github-com-hetznercloud-hcloud-go)
     ("go-github-com-hashicorp-nomad-api"
      ,go-github-com-hashicorp-nomad-api)
     ("go-github-com-hashicorp-consul-api"
      ,go-github-com-hashicorp-consul-api)
     ("go-github-com-grpc-ecosystem-grpc-gateway"
      ,go-github-com-grpc-ecosystem-grpc-gateway)
     ("go-github-com-grafana-regexp"
      ,go-github-com-grafana-regexp)
     ("go-github-com-gophercloud-gophercloud"
      ,go-github-com-gophercloud-gophercloud)
     ("go-github-com-google-pprof"
      ,go-github-com-google-pprof)
     ("go-github-com-golang-snappy"
      ,go-github-com-golang-snappy)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-go-zookeeper-zk"
      ,go-github-com-go-zookeeper-zk)
     ("go-github-com-go-openapi-strfmt"
      ,go-github-com-go-openapi-strfmt)
     ("go-github-com-go-logfmt-logfmt"
      ,go-github-com-go-logfmt-logfmt)
     ("go-github-com-go-kit-log"
      ,go-github-com-go-kit-log)
     ("go-github-com-fsnotify-fsnotify"
      ,go-github-com-fsnotify-fsnotify)
     ("go-github-com-envoyproxy-protoc-gen-validate"
      ,go-github-com-envoyproxy-protoc-gen-validate)
     ("go-github-com-envoyproxy-go-control-plane"
      ,go-github-com-envoyproxy-go-control-plane)
     ("go-github-com-edsrzf-mmap-go"
      ,go-github-com-edsrzf-mmap-go)
     ("go-github-com-docker-docker"
      ,go-github-com-docker-docker)
     ("go-github-com-digitalocean-godo"
      ,go-github-com-digitalocean-godo)
     ("go-github-com-dgryski-go-sip13"
      ,go-github-com-dgryski-go-sip13)
     ("go-github-com-dennwc-varint"
      ,go-github-com-dennwc-varint)
     ("go-github-com-cespare-xxhash-v2"
      ,go-github-com-cespare-xxhash-v2)
     ("go-github-com-aws-aws-sdk-go"
      ,go-github-com-aws-aws-sdk-go)
     ("go-github-com-alecthomas-units"
      ,go-github-com-alecthomas-units)
     ("go-github-com-azure-go-autorest-autorest-adal"
      ,go-github-com-azure-go-autorest-autorest-adal)
     ("go-github-com-azure-go-autorest-autorest"
      ,go-github-com-azure-go-autorest-autorest)
     ("go-github-com-azure-azure-sdk-for-go"
      ,go-github-com-azure-azure-sdk-for-go)))
  (home-page
   "https://github.com/prometheus/prometheus")
  (synopsis "Prometheus")
  (description
   "Visit @url{https://prometheus.io,prometheus.io} for the full documentation,\nexamples and guides.")
  (license license:asl2.0))
(package
  (name "go-github-com-pseudomuto-protokit")
  (version "0.2.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/pseudomuto/protokit")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1lrd5h4hdy7sp9vpr272zk6z4fsrlsmqfwm3wx983k0ifnhgxgs6"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/pseudomuto/protokit"))
  (propagated-inputs
   `(("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)))
  (home-page
   "https://github.com/pseudomuto/protokit")
  (synopsis "protokit")
  (description
   "Package protokit is a library that makes it easy to create your own protoc\nplugins.  It has excellent test coverage, and saves you so much time!")
  (license license:expat))
(package
  (name "go-github-com-tmc-grpc-websocket-proxy")
  (version "0.0.0-20220101234140-673ab2c3ae75")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/tmc/grpc-websocket-proxy")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0299q3njcs6smrac6734xfjslpvwvsc8jyh5fq5849cdlp5a8290"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/tmc/grpc-websocket-proxy"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-gorilla-websocket"
      ,go-github-com-gorilla-websocket)))
  (home-page
   "https://github.com/tmc/grpc-websocket-proxy")
  (synopsis "grpc-websocket-proxy")
  (description
   "Wrap your grpc-gateway mux with this helper to expose streaming endpoints over\nwebsockets.")
  (license license:expat))
(package
  (name "go-github-com-xiang90-probing")
  (version "0.0.0-20190116061207-43a291ad63a2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/xiang90/probing")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1z22ms16j5j42775mf31isanwx2pwr1d8wqw8006dczjv36qnz5i"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/xiang90/probing"))
  (home-page "https://github.com/xiang90/probing")
  (synopsis "Getting Started")
  (description
   "We first need to serve the probing HTTP handler.")
  (license license:expat))
(package
  (name "go-go-etcd-io-etcd-etcdutl-v3")
  (version "3.5.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/etcd-io/etcd")
           (commit (string-append "etcdutl/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0d6zja2s2cw6jprldcq1nxghvbwfr5168n29yyyr9m9biiwilpap"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.etcd.io/etcd/etcdutl/v3"
     #:unpack-path
     "go.etcd.io/etcd/etcdutl/v3"))
  (propagated-inputs
   `(("go-go-uber-org-zap" ,go-go-uber-org-zap)
     ("go-go-etcd-io-bbolt" ,go-go-etcd-io-bbolt)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-olekukonko-tablewriter"
      ,go-github-com-olekukonko-tablewriter)
     ("go-github-com-dustin-go-humanize"
      ,go-github-com-dustin-go-humanize)))
  (home-page "https://go.etcd.io/etcd/etcdutl/v3")
  (synopsis "etcdutl")
  (description
   "Package etcdutl contains the main entry point for the etcdutl.")
  (license license:asl2.0))
(package
  (name "go-go-etcd-io-etcd-pkg-v3")
  (version "3.5.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/etcd-io/etcd")
           (commit (string-append "pkg/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0d6zja2s2cw6jprldcq1nxghvbwfr5168n29yyyr9m9biiwilpap"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.etcd.io/etcd/pkg/v3"
     #:unpack-path
     "go.etcd.io/etcd/pkg/v3"))
  (propagated-inputs
   `(("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-go-uber-org-zap" ,go-go-uber-org-zap)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-dustin-go-humanize"
      ,go-github-com-dustin-go-humanize)
     ("go-github-com-creack-pty"
      ,go-github-com-creack-pty)))
  (home-page "https://go.etcd.io/etcd/pkg/v3")
  (synopsis #f)
  (description
   "pkg/ is a collection of utility packages used by etcd without being specific to\netcd itself.  A package belongs here only if it could possibly be moved out into\nits own repository in the future.")
  (license license:asl2.0))
(package
  (name "go-github-com-cockroachdb-datadriven")
  (version "1.0.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/cockroachdb/datadriven")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1h2dhm4g1n8ny71lm495l5l842lwq320la0q8b8zmr4w3s5nyk09"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/cockroachdb/datadriven"))
  (propagated-inputs
   `(("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)))
  (home-page
   "https://github.com/cockroachdb/datadriven")
  (synopsis "Data-Driven Tests for Go")
  (description
   "This repository implements an extension of\n@url{https://github.com/golang/go/wiki/TableDrivenTests,Table-Driven Testing}.\nInstead of building and iterating over a table in the test code, the input is\nfurther separated into files (or inline strings).  For certain classes of tests,\nthis can significantly reduce the friction involved in writing and reading these\ntests.")
  (license license:asl2.0))
(package
  (name "go-go-etcd-io-etcd-raft-v3")
  (version "3.5.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/etcd-io/etcd")
           (commit (string-append "raft/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0d6zja2s2cw6jprldcq1nxghvbwfr5168n29yyyr9m9biiwilpap"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.etcd.io/etcd/raft/v3"
     #:unpack-path
     "go.etcd.io/etcd/raft/v3"))
  (propagated-inputs
   `(("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-cockroachdb-datadriven"
      ,go-github-com-cockroachdb-datadriven)
     ("go-github-com-certifi-gocertifi"
      ,go-github-com-certifi-gocertifi)))
  (home-page "https://go.etcd.io/etcd/raft/v3")
  (synopsis "Raft library")
  (description
   "Package raft sends and receives messages in the Protocol Buffer format defined\nin the raftpb package.")
  (license license:asl2.0))
(package
  (name "go-github-com-etcd-io-gofail")
  (version "0.0.0-20220826035847-d0d2a96a6ef0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/etcd-io/gofail")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "00npay8g4z5n2n5adxbh0p3hy7fmc1cljgnqn4nbyp82vl6h4j85"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/etcd-io/gofail"))
  (home-page "https://github.com/etcd-io/gofail")
  (synopsis "gofail")
  (description
   "gofail is a tool for enabling/disabling failpoints in go code.")
  (license license:asl2.0))
(package
  (name "go-github-com-vividcortex-gohistogram")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/VividCortex/gohistogram")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1ykpvrkri3mzc0z77kdva93ylh0bqg7jq3i024r3iv0i6bwx3rnf"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/VividCortex/gohistogram"))
  (home-page
   "https://github.com/VividCortex/gohistogram")
  (synopsis "gohistogram - Histograms in Go")
  (description
   "Package gohistogram contains implementations of weighted and exponential\nhistograms.")
  (license license:expat))
(package
  (name "go-github-com-afex-hystrix-go")
  (version "0.0.0-20180502004556-fa1af6a1f4f5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/afex/hystrix-go")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0zlj0330j816flvwvis4d4vv1gigpxlghph7awbc9jb7ggf2qssn"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/afex/hystrix-go"))
  (home-page "https://github.com/afex/hystrix-go")
  (synopsis "hystrix-go")
  (description
   "@url{https://github.com/Netflix/Hystrix,Hystrix} is a great project from\nNetflix.")
  (license license:expat))
(package
  (name "go-github-com-aws-aws-sdk-go-v2")
  (version "1.16.16")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lyqchcph8yfkldcd5pxmk70wqrspp5wgx03fn6xi643w1l2hm5j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/aws/aws-sdk-go-v2"))
  (propagated-inputs
   `(("go-github-com-jmespath-go-jmespath"
      ,go-github-com-jmespath-go-jmespath)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis "AWS SDK for Go v2")
  (description
   "Package sdk is the official AWS SDK v2 for the Go programming language.")
  (license license:asl2.0))
(package
  (name "go-github-com-aws-aws-sdk-go-v2-service-cloudwatch")
  (version "1.21.6")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit
            (string-append "service/cloudwatch/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lyqchcph8yfkldcd5pxmk70wqrspp5wgx03fn6xi643w1l2hm5j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/aws/aws-sdk-go-v2/service/cloudwatch"
     #:unpack-path
     "github.com/aws/aws-sdk-go-v2"))
  (propagated-inputs
   `(("go-github-com-jmespath-go-jmespath"
      ,go-github-com-jmespath-go-jmespath)
     ("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis #f)
  (description
   "Package cloudwatch provides the API client, operations, and parameter types for\nAmazon CloudWatch.")
  (license license:asl2.0))
(package
  (name "go-github-com-golang-mock")
  (version "1.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/golang/mock")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1hara8j0x431njjhqxfrg1png7xa1gbrpwza6ya4mwlx76hppap4"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/golang/mock"))
  (propagated-inputs
   `(("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-mod" ,go-golang-org-x-mod)))
  (home-page "https://github.com/golang/mock")
  (synopsis "gomock")
  (description
   "gomock is a mocking framework for the @url{http://golang.org/,Go programming\nlanguage}.  It integrates well with Go's built-in @code{testing} package, but\ncan be used in other contexts too.")
  (license license:asl2.0))
(package
  (name "go-github-com-casbin-casbin-v2")
  (version "2.55.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/casbin/casbin")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0ka3ls423zkgicyrz63lan6yyqs7c5sagi62biwsgh1msjljb1mi"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/casbin/casbin/v2"))
  (propagated-inputs
   `(("go-github-com-golang-mock"
      ,go-github-com-golang-mock)
     ("go-github-com-knetic-govaluate"
      ,go-github-com-knetic-govaluate)))
  (home-page "https://github.com/casbin/casbin")
  (synopsis "Casbin")
  (description
   "💖 @url{https://casdoor.org/,(strong Looking for an open-source identity and\naccess management solution like Okta, Auth0, Keycloak ? Learn more about:\nCasdoor)}")
  (license license:asl2.0))
(package
  (name "go-github-com-go-zookeeper-zk")
  (version "1.0.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-zookeeper/zk")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "04mpdkdn0gzhcs0w075kasxkahqqskdf3lcbvs37ryyb7wnw9k7i"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-zookeeper/zk"))
  (home-page "https://github.com/go-zookeeper/zk")
  (synopsis "Native Go Zookeeper Client Library")
  (description
   "Package zk is a native Go client library for the ZooKeeper orchestration\nservice.")
  (license license:bsd-3))
(package
  (name "go-github-com-hashicorp-consul-sdk")
  (version "0.11.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/consul")
           (commit (string-append "sdk/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0ar558rjrdnq437fkl17hln2cxffxmb4ymzvg73rll1xfir33p8f"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/hashicorp/consul/sdk"
     #:unpack-path
     "github.com/hashicorp/consul"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-mattn-go-isatty"
      ,go-github-com-mattn-go-isatty)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)
     ("go-github-com-hashicorp-go-uuid"
      ,go-github-com-hashicorp-go-uuid)
     ("go-github-com-hashicorp-go-hclog"
      ,go-github-com-hashicorp-go-hclog)
     ("go-github-com-hashicorp-go-cleanhttp"
      ,go-github-com-hashicorp-go-cleanhttp)
     ("go-github-com-fatih-color"
      ,go-github-com-fatih-color)))
  (home-page "https://github.com/hashicorp/consul")
  (synopsis "Internal SDK")
  (description
   "Please note that this folder, while public, is not meant for new consumers of\nthese libraries; this should currently be considered an internal, not external,\nSDK.  It is public due to existing needs from other HashiCorp software.  The\ntags in this folder will stay at the 0.x.y level; accordingly users should\nexpect that things can move around, disappear, or change API at any time.")
  (license license:mpl2.0))
(package
  (name "go-github-com-hashicorp-consul-api")
  (version "1.15.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/consul")
           (commit (string-append "api/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1kgz21z7i1mg1j9v13lr2hqsw60x4x5im20zfqph6x6rrr83kyjd"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/hashicorp/consul/api"
     #:unpack-path
     "github.com/hashicorp/consul"))
  (propagated-inputs
   `(("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-mitchellh-mapstructure"
      ,go-github-com-mitchellh-mapstructure)
     ("go-github-com-kr-text" ,go-github-com-kr-text)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)
     ("go-github-com-hashicorp-serf"
      ,go-github-com-hashicorp-serf)
     ("go-github-com-hashicorp-memberlist"
      ,go-github-com-hashicorp-memberlist)
     ("go-github-com-hashicorp-golang-lru"
      ,go-github-com-hashicorp-golang-lru)
     ("go-github-com-hashicorp-go-uuid"
      ,go-github-com-hashicorp-go-uuid)
     ("go-github-com-hashicorp-go-sockaddr"
      ,go-github-com-hashicorp-go-sockaddr)
     ("go-github-com-hashicorp-go-rootcerts"
      ,go-github-com-hashicorp-go-rootcerts)
     ("go-github-com-hashicorp-go-multierror"
      ,go-github-com-hashicorp-go-multierror)
     ("go-github-com-hashicorp-go-msgpack"
      ,go-github-com-hashicorp-go-msgpack)
     ("go-github-com-hashicorp-go-immutable-radix"
      ,go-github-com-hashicorp-go-immutable-radix)
     ("go-github-com-hashicorp-go-hclog"
      ,go-github-com-hashicorp-go-hclog)
     ("go-github-com-hashicorp-go-cleanhttp"
      ,go-github-com-hashicorp-go-cleanhttp)
     ("go-github-com-hashicorp-consul-sdk"
      ,go-github-com-hashicorp-consul-sdk)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-google-btree"
      ,go-github-com-google-btree)
     ("go-github-com-armon-go-metrics"
      ,go-github-com-armon-go-metrics)))
  (home-page "https://github.com/hashicorp/consul")
  (synopsis "Consul API client")
  (description
   "This package provides the @code{api} package which attempts to provide\nprogrammatic access to the full Consul API.")
  (license license:mpl2.0))
(package
  (name "go-github-com-franela-goblin")
  (version "0.0.0-20211003143422-0a4f594942bf")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/franela/goblin")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "06mdnw8wk8mxaapfqlz86jf4qgzg6j77875bmraasf8il48ap0b5"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/franela/goblin"))
  (home-page "https://github.com/franela/goblin")
  (synopsis "Goblin")
  (description
   "This package provides a @url{http://mochajs.org/,Mocha} like BDD testing\nframework written in Go that requires no additional dependencies.  Requires no\nextensive documentation nor complicated steps to get it running.")
  (license license:expat))
(package
  (name "go-github-com-neelance-astrewrite")
  (version "0.0.0-20160511093645-99348263ae86")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/neelance/astrewrite")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "07527807p8q6h05iq4qy0xrlcmwyzj76gpk0yqf71yaj447mz24v"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/neelance/astrewrite"))
  (home-page
   "https://github.com/neelance/astrewrite")
  (synopsis #f)
  (description #f)
  (license license:bsd-2))
(package
  (name "go-github-com-neelance-sourcemap")
  (version "0.0.0-20200213170602-2833bce08e4c")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/neelance/sourcemap")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "05ymjg1z9phf0wp4w058kvf13bmn4skv67chb3r04z69in8y8jih"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/neelance/sourcemap"))
  (home-page
   "https://github.com/neelance/sourcemap")
  (synopsis #f)
  (description #f)
  (license license:bsd-2))
(package
  (name "go-github-com-shurcool-go")
  (version "0.0.0-20200502201357-93f07166e636")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/shurcooL/go")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0wgwlhsgx1c2v650xvf099hgrd4av18gfb0kha09klmsh0p0hc5r"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/shurcooL/go"))
  (home-page "https://github.com/shurcooL/go")
  (synopsis "go")
  (description "Common Go code.")
  (license license:expat))
(package
  (name "go-github-com-shurcool-httpfs")
  (version "0.0.0-20190707220628-8d4bc4ba7749")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/shurcooL/httpfs")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0qjkbjnp86kjr7r0xjwp39blnk1ggkzy6zm3xphr5dpin4jkgfa1"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/shurcooL/httpfs"))
  (home-page "https://github.com/shurcooL/httpfs")
  (synopsis "httpfs")
  (description
   "Collection of Go packages for working with the\n@url{https://godoc.org/net/http#FileSystem,(code http.FileSystem)} interface.")
  (license license:expat))
(package
  (name "go-github-com-inconshreveable-mousetrap")
  (version "1.0.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/inconshreveable/mousetrap")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0a6xj24s53wh78937rri9nvwc8aqn3xf0h5fc33hn01hp2jgscv5"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/inconshreveable/mousetrap"))
  (home-page
   "https://github.com/inconshreveable/mousetrap")
  (synopsis "mousetrap")
  (description
   "mousetrap is a tiny library that answers a single question.")
  (license license:asl2.0))
(package
  (name "go-github-com-shurcool-vfsgen")
  (version "0.0.0-20200824052919-0d455de96546")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/shurcooL/vfsgen")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0md1vgaq95x1jmxpnsfv6s9xf3v8gqi7lcl7mkxpf6274rf1n2pk"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/shurcooL/vfsgen"))
  (home-page "https://github.com/shurcooL/vfsgen")
  (synopsis "vfsgen")
  (description
   "Package vfsgen takes an http.FileSystem (likely at `go generate` time) and\ngenerates Go code that statically implements the provided http.FileSystem.")
  (license license:expat))
(package
  (name "go-github-com-gopherjs-gopherjs")
  (version "1.17.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gopherjs/gopherjs")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1dg22b3pw0g3g0a84fmzl0fl76540yjvlcvscw2876gdy5db98n3"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gopherjs/gopherjs"))
  (propagated-inputs
   `(("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-golang-org-x-term" ,go-golang-org-x-term)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-shurcool-vfsgen"
      ,go-github-com-shurcool-vfsgen)
     ("go-github-com-inconshreveable-mousetrap"
      ,go-github-com-inconshreveable-mousetrap)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-shurcool-httpfs"
      ,go-github-com-shurcool-httpfs)
     ("go-github-com-shurcool-go"
      ,go-github-com-shurcool-go)
     ("go-github-com-neelance-sourcemap"
      ,go-github-com-neelance-sourcemap)
     ("go-github-com-neelance-astrewrite"
      ,go-github-com-neelance-astrewrite)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-fsnotify-fsnotify"
      ,go-github-com-fsnotify-fsnotify)))
  (home-page
   "https://github.com/gopherjs/gopherjs")
  (synopsis
   "GopherJS - A compiler from Go to JavaScript")
  (description
   "GopherJS compiles Go code (@url{https://golang.org/,golang.org}) to pure\nJavaScript code.  Its main purpose is to give you the opportunity to write\nfront-end code in Go which will still run in all browsers.")
  (license license:bsd-2))
(package
  (name "go-github-com-jtolds-gls")
  (version "4.20.0+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jtolio/gls")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1k7xd2q2ysv2xsh373qs801v6f359240kx0vrl0ydh7731lngvk6"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jtolds/gls"))
  (home-page "https://github.com/jtolds/gls")
  (synopsis "gls")
  (description
   "Package gls implements goroutine-local storage.")
  (license license:expat))
(package
  (name "go-github-com-smartystreets-assertions")
  (version "1.13.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/smartystreets/assertions")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0flf3fb6fsw3bk1viva0fzrzw87djaj1mqvrx2gzg1ssn7xzfrzr"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/smartystreets/assertions"))
  (home-page
   "https://github.com/smartystreets/assertions")
  (synopsis #f)
  (description
   "Package assertions contains the implementations for all assertions which are\nreferenced in goconvey's `convey` package\n(github.com/smartystreets/goconvey/convey) and gunit\n(github.com/smartystreets/gunit) for use with the So(...) method.  They can also\nbe used in traditional Go test functions and even in applications.")
  (license license:expat))
(package
  (name "go-github-com-smartystreets-goconvey")
  (version "1.7.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/smartystreets/goconvey")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0gwr0d6gb0jzqam76xpan279r2dnifsnhr4px8l6a84bavslqgv1"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/smartystreets/goconvey"))
  (propagated-inputs
   `(("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-github-com-smartystreets-assertions"
      ,go-github-com-smartystreets-assertions)
     ("go-github-com-jtolds-gls"
      ,go-github-com-jtolds-gls)
     ("go-github-com-gopherjs-gopherjs"
      ,go-github-com-gopherjs-gopherjs)))
  (home-page
   "https://github.com/smartystreets/goconvey")
  (synopsis "GoConvey is awesome Go testing")
  (description
   "This executable provides an HTTP server that watches for file system changes to\n.go files within the working directory (and all nested go packages).  Navigating\nto the configured host and port in a web browser will display the latest results\nof running `go test` in each go package.")
  (license license:expat))
(package
  (name "go-github-com-hudl-fargo")
  (version "1.4.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hudl/fargo")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "18pk1b5yybkghrjxskgssz8gzpv37k8w7gk0cldhcnffx85rqi0m"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/hudl/fargo"))
  (propagated-inputs
   `(("go-gopkg-in-warnings-v0"
      ,go-gopkg-in-warnings-v0)
     ("go-gopkg-in-gcfg-v1" ,go-gopkg-in-gcfg-v1)
     ("go-github-com-smartystreets-goconvey"
      ,go-github-com-smartystreets-goconvey)
     ("go-github-com-op-go-logging"
      ,go-github-com-op-go-logging)
     ("go-github-com-onsi-gomega"
      ,go-github-com-onsi-gomega)
     ("go-github-com-miekg-dns"
      ,go-github-com-miekg-dns)
     ("go-github-com-franela-goreq"
      ,go-github-com-franela-goreq)
     ("go-github-com-franela-goblin"
      ,go-github-com-franela-goblin)
     ("go-github-com-clbanning-mxj"
      ,go-github-com-clbanning-mxj)
     ("go-github-com-cenkalti-backoff-v4"
      ,go-github-com-cenkalti-backoff-v4)))
  (home-page "https://github.com/hudl/fargo")
  (synopsis "fargo")
  (description
   "Netflix Eureka client in golang.  Named for the show Eureka.")
  (license license:expat))
(package
  (name "go-github-com-influxdata-influxdb1-client")
  (version "0.0.0-20220302092344-a9ab5670611c")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/influxdata/influxdb1-client")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0chyjhbqp7wqx3ynfsy8a9zf1c7a03ywzgm0p3yalz9gsll7cnv8"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/influxdata/influxdb1-client"))
  (home-page
   "https://github.com/influxdata/influxdb1-client")
  (synopsis "influxdb1-clientv2")
  (description
   "Package client implements a now-deprecated client for InfluxDB; use\ngithub.com/influxdata/influxdb1-client/v2 instead.")
  (license license:expat))
(package
  (name "go-github-com-prashantv-gostub")
  (version "1.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/prashantv/gostub")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "035xf5w4fqlicdbbjcflsqflc0z5gmrn6wr7q41xwqfwfpraf9ah"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/prashantv/gostub"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page "https://github.com/prashantv/gostub")
  (synopsis "gostub")
  (description
   "Package gostub is used for stubbing variables in tests, and resetting the\noriginal value once the test has been run.")
  (license license:expat))
(package
  (name "go-go-uber-org-automaxprocs")
  (version "1.5.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/uber-go/automaxprocs")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "17gspgisniz7xw9xf34g16rh90g39iqvrj86rxrbi242dwwrx53b"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "go.uber.org/automaxprocs"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-prashantv-gostub"
      ,go-github-com-prashantv-gostub)))
  (home-page "https://go.uber.org/automaxprocs")
  (synopsis "automaxprocs")
  (description
   "Package automaxprocs automatically sets GOMAXPROCS to match the Linux container\nCPU quota, if any.")
  (license license:expat))
(package
  (name "go-github-com-nats-io-nats-server-v2")
  (version "2.9.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/nats-io/nats-server")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1ppdl5yjiay5rix19pb1l6jbbxjdwk710qmrnbws7gvrilnz51rr"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/nats-io/nats-server/v2"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-golang-org-x-time" ,go-golang-org-x-time)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-go-uber-org-automaxprocs"
      ,go-go-uber-org-automaxprocs)
     ("go-github-com-nats-io-nuid"
      ,go-github-com-nats-io-nuid)
     ("go-github-com-nats-io-nkeys"
      ,go-github-com-nats-io-nkeys)
     ("go-github-com-nats-io-nats-go"
      ,go-github-com-nats-io-nats-go)
     ("go-github-com-nats-io-jwt-v2"
      ,go-github-com-nats-io-jwt-v2)
     ("go-github-com-minio-highwayhash"
      ,go-github-com-minio-highwayhash)
     ("go-github-com-klauspost-compress"
      ,go-github-com-klauspost-compress)))
  (home-page
   "https://github.com/nats-io/nats-server")
  (synopsis "Documentation")
  (description
   "@url{https://nats.io,NATS} is a simple, secure and performant communications\nsystem for digital systems, services and devices.  NATS is part of the Cloud\nNative Computing Foundation (@url{https://cncf.io,CNCF}).  NATS has over\n@url{https://nats.io/download/,40 client language implementations}, and its\nserver can run on-premise, in the cloud, at the edge, and even on a Raspberry\nPi.  NATS can secure and simplify design and operation of modern distributed\nsystems.")
  (license license:asl2.0))
(package
  (name "go-github-com-nats-io-nats-go")
  (version "1.17.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/nats-io/nats.go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1xnib2c02vv0ymv4zvply7pqjj9nf6w9zs6hk8ckpzdj7kawmmbz"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/nats-io/nats.go"))
  (propagated-inputs
   `(("go-github-com-nats-io-nuid"
      ,go-github-com-nats-io-nuid)
     ("go-github-com-nats-io-nkeys"
      ,go-github-com-nats-io-nkeys)))
  (home-page "https://github.com/nats-io/nats.go")
  (synopsis "NATS - Go Client")
  (description
   "This package provides a Go client for the NATS messaging system\n(@url{https://nats.io,https://nats.io}).")
  (license license:asl2.0))
(package
  (name "go-github-com-shopify-toxiproxy-v2")
  (version "2.5.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Shopify/toxiproxy")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1zcxblfc1niqgx239cdm5z2hffd1q2awrssky850y5syqcgdiga8"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/Shopify/toxiproxy/v2"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-xrash-smetrics"
      ,go-github-com-xrash-smetrics)
     ("go-github-com-russross-blackfriday-v2"
      ,go-github-com-russross-blackfriday-v2)
     ("go-github-com-rs-xid" ,go-github-com-rs-xid)
     ("go-github-com-prometheus-procfs"
      ,go-github-com-prometheus-procfs)
     ("go-github-com-prometheus-common"
      ,go-github-com-prometheus-common)
     ("go-github-com-prometheus-client-model"
      ,go-github-com-prometheus-client-model)
     ("go-github-com-matttproud-golang-protobuf-extensions"
      ,go-github-com-matttproud-golang-protobuf-extensions)
     ("go-github-com-mattn-go-isatty"
      ,go-github-com-mattn-go-isatty)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-cpuguy83-go-md2man-v2"
      ,go-github-com-cpuguy83-go-md2man-v2)
     ("go-github-com-cespare-xxhash-v2"
      ,go-github-com-cespare-xxhash-v2)
     ("go-github-com-beorn7-perks"
      ,go-github-com-beorn7-perks)
     ("go-gopkg-in-tomb-v1" ,go-gopkg-in-tomb-v1)
     ("go-golang-org-x-term" ,go-golang-org-x-term)
     ("go-github-com-urfave-cli-v2"
      ,go-github-com-urfave-cli-v2)
     ("go-github-com-rs-zerolog"
      ,go-github-com-rs-zerolog)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-gorilla-mux"
      ,go-github-com-gorilla-mux)))
  (home-page
   "https://github.com/Shopify/toxiproxy")
  (synopsis "Toxiproxy")
  (description
   "Toxiproxy is a framework for simulating network conditions.  It's made\nspecifically to work in testing, CI and development environments, supporting\ndeterministic tampering with connections, but with support for randomized chaos\nand customization.  We've been successfully using it in all development and test\nenvironments at Shopify since October, 2014.  See our\n@url{https://shopify.engineering/building-and-testing-resilient-ruby-on-rails-applications,blog\npost} on resiliency for more information.")
  (license license:expat))
(package
  (name "go-github-com-eapache-go-resiliency")
  (version "1.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/eapache/go-resiliency")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0m2pgwfdbvfiphmjg58nz07799jisiqschlcjhj79syczjj7wm40"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/eapache/go-resiliency"))
  (home-page
   "https://github.com/eapache/go-resiliency")
  (synopsis "go-resiliency")
  (description
   "Resiliency patterns for golang.  Based in part on\n@url{https://github.com/Netflix/Hystrix,Hystrix},\n@url{https://github.com/Shopify/semian,Semian}, and others.")
  (license license:expat))
(package
  (name "go-github-com-eapache-go-xerial-snappy")
  (version "0.0.0-20180814174437-776d5712da21")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/eapache/go-xerial-snappy")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0ncc41dv7xwb1znyzmzh7cvs6j5fzz0f1n8h1v3grl9ma6s1si9d"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/eapache/go-xerial-snappy"))
  (home-page
   "https://github.com/eapache/go-xerial-snappy")
  (synopsis "go-xerial-snappy")
  (description
   "Xerial-compatible Snappy framing support for golang.")
  (license license:expat))
(package
  (name "go-github-com-eapache-queue")
  (version "1.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/eapache/queue")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "07dp54n94gn3gsvdcki56yqh7py7wqqigxbamhxwgbr05n61fqyg"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/eapache/queue"))
  (home-page "https://github.com/eapache/queue")
  (synopsis "Queue")
  (description
   "Package queue provides a fast, ring-buffer queue based on the version suggested\nby Dariusz Górecki.  Using this instead of other, simpler, queue implementations\n(slice+append or linked list) provides substantial memory and time benefits, and\nfewer GC pauses.")
  (license license:expat))
(package
  (name "go-github-com-fortytw2-leaktest")
  (version "1.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/fortytw2/leaktest")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0487zghyxqzk6zdbhd2j074pcc2l15l4sfg5clrjqwfbql7519wx"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/fortytw2/leaktest"))
  (home-page
   "https://github.com/fortytw2/leaktest")
  (synopsis "Leaktest")
  (description
   "Package leaktest provides tools to detect leaked goroutines in tests.  To use\nit, call \"defer leaktest.Check(t)()\" at the beginning of each test that may use\ngoroutines.  copied out of the cockroachdb source tree with slight modifications\nto be more re-useable")
  (license license:bsd-3))
(package
  (name "go-github-com-gorilla-sessions")
  (version "1.2.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gorilla/sessions")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1zjw2s37yggk9231db0vmgs67z8m3am8i8l4gpgz6fvlbv52baxp"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gorilla/sessions"))
  (propagated-inputs
   `(("go-github-com-gorilla-securecookie"
      ,go-github-com-gorilla-securecookie)))
  (home-page "https://github.com/gorilla/sessions")
  (synopsis "sessions")
  (description
   "Package sessions provides cookie and filesystem sessions and infrastructure for\ncustom session backends.")
  (license license:bsd-3))
(package
  (name "go-github-com-jcmturner-aescts-v2")
  (version "2.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jcmturner/aescts")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0yrdiisdhcqfs8jpicc30dfmbqzxhkmbayn902xrgwkndky8w7l1"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jcmturner/aescts/v2"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page "https://github.com/jcmturner/aescts")
  (synopsis #f)
  (description
   "Package aescts provides AES CBC CipherText Stealing encryption and decryption\nmethods")
  (license license:asl2.0))
(package
  (name "go-github-com-jcmturner-dnsutils-v2")
  (version "2.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jcmturner/dnsutils")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "116zbgvfj88vv93fnapmmgyd5g8kzy774cdyzsnnzyzng92j61c9"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/jcmturner/dnsutils/v2"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page
   "https://github.com/jcmturner/dnsutils")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-github-com-jcmturner-gofork")
  (version "1.7.6")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jcmturner/gofork")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0w1j6b671121r6md5w7hnh2d0sa332pw5q49yihw23wdfinknyin"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jcmturner/gofork"))
  (home-page "https://github.com/jcmturner/gofork")
  (synopsis "GoFork")
  (description
   "This repository contains modified Go standard library packages for use as work\narounds until issues are addressed in the official distribution.")
  (license license:bsd-3))
(package
  (name "go-github-com-jcmturner-goidentity-v6")
  (version "6.0.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jcmturner/goidentity")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "064ysvxvrvij843s7qj1nkzl5qc6j1qbrsb3s0zmwd1sa7vq8q1n"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/jcmturner/goidentity/v6"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-hashicorp-go-uuid"
      ,go-github-com-hashicorp-go-uuid)))
  (home-page
   "https://github.com/jcmturner/goidentity")
  (synopsis "goidentity")
  (description "Please import as below")
  (license license:asl2.0))
(package
  (name "go-github-com-jcmturner-rpc-v2")
  (version "2.0.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jcmturner/rpc")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1nm4j2nwcszghldw39rwdx2hr56i1lybfpv33y4gd67w6qcqbpsi"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jcmturner/rpc/v2"))
  (propagated-inputs
   `(("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page "https://github.com/jcmturner/rpc")
  (synopsis "RPC")
  (description
   "This project relates to @url{http://pubs.opengroup.org/onlinepubs/9629399/,CDE\n1.1: Remote Procedure Call}")
  (license license:asl2.0))
(package
  (name "go-github-com-jcmturner-gokrb5-v8")
  (version "8.4.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jcmturner/gokrb5")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "10qy7siz6a7lrh0p7f74pgpin9zdm3798hniv8sbh58k12dbqqka"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jcmturner/gokrb5/v8"))
  (propagated-inputs
   `(("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-jcmturner-rpc-v2"
      ,go-github-com-jcmturner-rpc-v2)
     ("go-github-com-jcmturner-goidentity-v6"
      ,go-github-com-jcmturner-goidentity-v6)
     ("go-github-com-jcmturner-gofork"
      ,go-github-com-jcmturner-gofork)
     ("go-github-com-jcmturner-dnsutils-v2"
      ,go-github-com-jcmturner-dnsutils-v2)
     ("go-github-com-jcmturner-aescts-v2"
      ,go-github-com-jcmturner-aescts-v2)
     ("go-github-com-hashicorp-go-uuid"
      ,go-github-com-hashicorp-go-uuid)
     ("go-github-com-gorilla-sessions"
      ,go-github-com-gorilla-sessions)))
  (home-page "https://github.com/jcmturner/gokrb5")
  (synopsis "gokrb5")
  (description
   "Package gokrb5 provides a Kerberos 5 implementation for Go.")
  (license license:asl2.0))
(package
  (name "go-github-com-pierrec-lz4-v4")
  (version "4.1.17")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/pierrec/lz4")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0bj9z8vsjq72rm0skp24q6ysj101kh1nc552ws038yqnb5fgbi26"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/pierrec/lz4/v4"))
  (home-page "https://github.com/pierrec/lz4")
  (synopsis "lz4 : LZ4 compression in pure Go")
  (description
   "Package lz4 implements reading and writing lz4 compressed data.")
  (license license:bsd-3))
(package
  (name "go-github-com-shopify-sarama")
  (version "1.37.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Shopify/sarama")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1893xndw459vv31yldv4pzaphij7hdjf0sjzk9fgpnjxgggrb3zx"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/Shopify/sarama"))
  (propagated-inputs
   `(("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-xdg-go-scram"
      ,go-github-com-xdg-go-scram)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-rcrowley-go-metrics"
      ,go-github-com-rcrowley-go-metrics)
     ("go-github-com-pierrec-lz4-v4"
      ,go-github-com-pierrec-lz4-v4)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)
     ("go-github-com-klauspost-compress"
      ,go-github-com-klauspost-compress)
     ("go-github-com-jcmturner-gokrb5-v8"
      ,go-github-com-jcmturner-gokrb5-v8)
     ("go-github-com-jcmturner-gofork"
      ,go-github-com-jcmturner-gofork)
     ("go-github-com-hashicorp-go-multierror"
      ,go-github-com-hashicorp-go-multierror)
     ("go-github-com-golang-snappy"
      ,go-github-com-golang-snappy)
     ("go-github-com-fortytw2-leaktest"
      ,go-github-com-fortytw2-leaktest)
     ("go-github-com-eapache-queue"
      ,go-github-com-eapache-queue)
     ("go-github-com-eapache-go-xerial-snappy"
      ,go-github-com-eapache-go-xerial-snappy)
     ("go-github-com-eapache-go-resiliency"
      ,go-github-com-eapache-go-resiliency)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-shopify-toxiproxy-v2"
      ,go-github-com-shopify-toxiproxy-v2)))
  (home-page "https://github.com/Shopify/sarama")
  (synopsis "sarama")
  (description
   "Package sarama is a pure Go client library for dealing with Apache Kafka\n(versions 0.8 and later).  It includes a high-level API for easily producing and\nconsuming messages, and a low-level API for controlling bytes on the wire when\nthe high-level API is insufficient.  Usage examples for the high-level APIs are\nprovided inline with their full documentation.")
  (license license:expat))
(package
  (name "go-go-uber-org-goleak")
  (version "1.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/uber-go/goleak")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1lpqw7ygffak8qki9i4vw8b99l25l8jrw8iwcplqsclk6fzkl24p"))))
  (build-system go-build-system)
  (arguments '(#:import-path "go.uber.org/goleak"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-golang-org-x-lint" ,go-golang-org-x-lint)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page "https://go.uber.org/goleak")
  (synopsis "goleak")
  (description
   "Package goleak is a Goroutine leak detector.")
  (license license:expat))
(package
  (name "go-github-com-rabbitmq-amqp091-go")
  (version "1.5.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/rabbitmq/amqp091-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "18k1jzan5flyxj72svaplkkcs22win2zykaggrfazmkavxi9mazy"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/rabbitmq/amqp091-go"))
  (propagated-inputs
   `(("go-go-uber-org-goleak" ,go-go-uber-org-goleak)))
  (home-page
   "https://github.com/rabbitmq/amqp091-go")
  (synopsis "Go RabbitMQ Client Library")
  (description
   "Package amqp091 is an AMQP 0.9.1 client with RabbitMQ extensions")
  (license license:bsd-2))
(package
  (name "go-github-com-openzipkin-zipkin-go")
  (version "0.4.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/openzipkin/zipkin-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1jry8lnikrizhrp721fmzyvbjaq0yr7kqiwkc7hi910y1h1pdp14"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/openzipkin/zipkin-go"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-github-com-rabbitmq-amqp091-go"
      ,go-github-com-rabbitmq-amqp091-go)
     ("go-github-com-onsi-gomega"
      ,go-github-com-onsi-gomega)
     ("go-github-com-onsi-ginkgo"
      ,go-github-com-onsi-ginkgo)
     ("go-github-com-shopify-sarama"
      ,go-github-com-shopify-sarama)))
  (home-page
   "https://github.com/openzipkin/zipkin-go")
  (synopsis "Zipkin Library for Go")
  (description
   "Package zipkin implements a native Zipkin instrumentation library for Go.")
  (license license:asl2.0))
(package
  (name "go-github-com-performancecopilot-speed-v4")
  (version "4.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/performancecopilot/speed")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0zpf42pid3cd3sqv4gy2h51adq2zpw0pi0v3fpgxqna4iia280j0"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/performancecopilot/speed/v4"))
  (propagated-inputs
   `(("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-edsrzf-mmap-go"
      ,go-github-com-edsrzf-mmap-go)
     ("go-github-com-hdrhistogram-hdrhistogram-go"
      ,go-github-com-hdrhistogram-hdrhistogram-go)))
  (home-page
   "https://github.com/performancecopilot/speed")
  (synopsis "Install")
  (description
   "Package speed implements a golang client for the Performance Co-Pilot\ninstrumentation API.")
  (license license:expat))
(package
  (name "go-github-com-sony-gobreaker")
  (version "0.5.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/sony/gobreaker")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1dj7pipa6aw2wwqgfnby64ijll0xbadansiwipc99vwcjwlnr4va"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/sony/gobreaker"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page "https://github.com/sony/gobreaker")
  (synopsis "gobreaker")
  (description
   "Package gobreaker implements the Circuit Breaker pattern.  See\n@url{https://msdn.microsoft.com/en-us/library/dn589784.aspx,https://msdn.microsoft.com/en-us/library/dn589784.aspx}.")
  (license license:expat))
(package
  (name "go-github-com-streadway-amqp")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/streadway/amqp")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0k740vmzkdv9il201x4mj0md73w30jqlmn1q7m1ng3dmi635qrlr"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/streadway/amqp"))
  (home-page "https://github.com/streadway/amqp")
  (synopsis "Go RabbitMQ Client Library")
  (description
   "Package amqp is an AMQP 0.9.1 client with RabbitMQ extensions")
  (license license:bsd-2))
(package
  (name "go-github-com-streadway-handy")
  (version "0.0.0-20200128134331-0f66f006fb2e")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/streadway/handy")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "03cm61ndfj6mz8kjsdb5jjka94v21fqn6nd5agnvhb7qx3fkq1y4"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/streadway/handy"))
  (home-page "https://github.com/streadway/handy")
  (synopsis "Handy Handlers")
  (description
   "Package handy organizes some useful http server handler filters or handlers for\nreuse.")
  (license license:bsd-2))
(package
  (name "go-go-etcd-io-etcd-client-pkg-v3")
  (version "3.5.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/etcd-io/etcd")
           (commit
            (string-append "client/pkg/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0d6zja2s2cw6jprldcq1nxghvbwfr5168n29yyyr9m9biiwilpap"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.etcd.io/etcd/client/pkg/v3"
     #:unpack-path
     "go.etcd.io/etcd/client/pkg/v3"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-go-uber-org-zap" ,go-go-uber-org-zap)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-coreos-go-systemd-v22"
      ,go-github-com-coreos-go-systemd-v22)))
  (home-page
   "https://go.etcd.io/etcd/client/pkg/v3")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-go-etcd-io-etcd-client-v2")
  (version "2.305.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/etcd-io/etcd")
           (commit (string-append "client/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0d6zja2s2cw6jprldcq1nxghvbwfr5168n29yyyr9m9biiwilpap"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.etcd.io/etcd/client/v2"
     #:unpack-path
     "go.etcd.io/etcd/client/v2"))
  (propagated-inputs
   `(("go-github-com-modern-go-reflect2"
      ,go-github-com-modern-go-reflect2)
     ("go-github-com-json-iterator-go"
      ,go-github-com-json-iterator-go)))
  (home-page "https://go.etcd.io/etcd/client/v2")
  (synopsis "etcd/client")
  (description
   "Package client provides bindings for the etcd APIs.")
  (license license:asl2.0))
(package
  (name "go-github-com-niemeyer-pretty")
  (version "0.0.0-20200227124842-a10e7caefd8e")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/niemeyer/pretty")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1jmazh4xzaa3v6g46hz60q2z7nmqs9l9cxdzmmscn3kbcs2znq4v"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/niemeyer/pretty"))
  (propagated-inputs
   `(("go-github-com-kr-text" ,go-github-com-kr-text)))
  (home-page "https://github.com/niemeyer/pretty")
  (synopsis #f)
  (description
   "Package pretty provides pretty-printing for Go values.  This is useful during\ndebugging, to avoid wrapping long output lines in the terminal.")
  (license license:expat))
(package
  (name "go-golang-org-x-exp")
  (version "0.0.0-20220927162542-c76eaa363f9d")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://go.googlesource.com/exp")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0mxq4y7f569hnr3h06m15ysqd74n5lp1rnaq2jjb0w870a7z5gp0"))))
  (build-system go-build-system)
  (arguments '(#:import-path "golang.org/x/exp"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-mod" ,go-golang-org-x-mod)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)))
  (home-page "https://golang.org/x/exp")
  (synopsis "exp")
  (description
   "This subrepository holds experimental and deprecated (in the @code{old}\ndirectory) packages.")
  (license license:bsd-3))
(package
  (name "go-github-com-hdrhistogram-hdrhistogram-go")
  (version "1.1.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/HdrHistogram/hdrhistogram-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0l12j3dvljp868p1d2izpiq7ysll05fchvxij8zb8r160lmqv58r"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/HdrHistogram/hdrhistogram-go"))
  (propagated-inputs
   `(("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-gonum-org-v1-gonum" ,go-gonum-org-v1-gonum)
     ("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-golang-org-x-exp" ,go-golang-org-x-exp)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-niemeyer-pretty"
      ,go-github-com-niemeyer-pretty)
     ("go-github-com-kr-text" ,go-github-com-kr-text)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)))
  (home-page
   "https://github.com/HdrHistogram/hdrhistogram-go")
  (synopsis "hdrhistogram-go")
  (description
   "Package hdrhistogram provides an implementation of Gil Tene's HDR Histogram data\nstructure.  The HDR Histogram allows for fast and accurate analysis of the\nextreme ranges of data with non-normal distributions, like latency.")
  (license license:expat))
(package
  (name "go-github-com-knetic-govaluate")
  (version "3.0.0+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Knetic/govaluate")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1b0sy89hy5d1720i43ikqfcxr4v6p9g9c7rnbif8s6256a7c2rsq"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/Knetic/govaluate"))
  (home-page "https://github.com/Knetic/govaluate")
  (synopsis "govaluate")
  (description
   "This package provides support for evaluating arbitrary C-like artithmetic/string\nexpressions.")
  (license license:expat))
(package
  (name "go-github-com-cenkalti-backoff-v4")
  (version "4.1.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/cenkalti/backoff")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "19fqmpz9j80x8ch7dryy3bxkw24wi9rvsvw5cs03b8a7i87098xv"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/cenkalti/backoff/v4"))
  (home-page "https://github.com/cenkalti/backoff")
  (synopsis "Exponential Backoff")
  (description
   "Package backoff implements backoff algorithms for retrying operations.")
  (license license:expat))
(package
  (name "go-github-com-clbanning-mxj")
  (version "1.8.4")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/clbanning/mxj")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "13qlrycdp63q1v8sdpv6n720b6h6jpg58r38ldg4a70iv1wg7s9g"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/clbanning/mxj"))
  (home-page "https://github.com/clbanning/mxj")
  (synopsis #f)
  (description
   "Marshal/Unmarshal XML to/from map[string]interface{} values (and JSON);\nextract/modify values from maps by key or key-path, including wildcards.")
  (license license:expat))
(package
  (name "go-github-com-edsrzf-mmap-go")
  (version "1.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/edsrzf/mmap-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "11xpfcacfvmrkbp0pv4j8pg2gyjnxpfp7l93j42h0svwxywhjmrc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/edsrzf/mmap-go"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
  (home-page "https://github.com/edsrzf/mmap-go")
  (synopsis "mmap-go")
  (description
   "Package mmap allows mapping files into memory.  It tries to provide a simple,\nreasonably portable interface, but doesn't go out of its way to abstract away\nevery little platform detail.  This specifically means:")
  (license license:bsd-3))
(package
  (name "go-github-com-franela-goreq")
  (version "0.0.0-20171204163338-bcd34c9993f8")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/franela/goreq")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "055a20nc5f1blk2swiwpwqpxd3z495ms1qr6a7cbbss1w3a7a7sb"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/franela/goreq"))
  (home-page "https://github.com/franela/goreq")
  (synopsis "GoReq")
  (description
   "Simple and sane HTTP request library for Go language.")
  (license license:expat))
(package
  (name "go-github-com-armon-circbuf")
  (version "0.0.0-20190214190532-5111143e8da2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/armon/circbuf")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1nhzs8wza5sxqjh0920jypy9irq6cspd55g8a9vgyjjfrqb5njs0"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/armon/circbuf"))
  (home-page "https://github.com/armon/circbuf")
  (synopsis "circbuf")
  (description
   "This repository provides the @code{circbuf} package.  This provides a\n@code{Buffer} object which is a circular (or ring) buffer.  It has a fixed size,\nbut can be written to infinitely.  Only the last @code{size} bytes are ever\nretained.  The buffer implements the @code{io.Writer} interface.")
  (license license:expat))
(package
  (name "go-github-com-hashicorp-logutils")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/logutils")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "076wf4sh5p3f953ndqk1cc0x7jhmlqrxak9953rz79rcdw77rjvv"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/hashicorp/logutils"))
  (home-page
   "https://github.com/hashicorp/logutils")
  (synopsis "logutils")
  (description
   "Package logutils augments the standard log package with levels.")
  (license license:mpl2.0))
(package
  (name "go-github-com-hashicorp-mdns")
  (version "1.0.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/mdns")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0i8ly6ixbfjy5gf8irdlda1p3314b2yzn9fxzkajm2bw348mfbfi"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/hashicorp/mdns"))
  (propagated-inputs
   `(("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-miekg-dns"
      ,go-github-com-miekg-dns)))
  (home-page "https://github.com/hashicorp/mdns")
  (synopsis "mdns")
  (description
   "Simple mDNS client/server library in Golang.  mDNS or Multicast DNS can be used\nto discover services on the local network without the use of an authoritative\nDNS server.  This enables peer-to-peer discovery.  It is important to note that\nmany networks restrict the use of multicasting, which prevents mDNS from\nfunctioning.  Notably, multicast cannot be used in any sort of cloud, or shared\ninfrastructure environment.  However it works well in most office, home, or\nprivate infrastructure environments.")
  (license license:expat))
(package
  (name "go-github-com-google-btree")
  (version "1.1.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/google/btree")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0cqa8ck26p3wqz877hcvmfss17xm8wcbwd68shxv795ppahpdd9b"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/google/btree"))
  (home-page "https://github.com/google/btree")
  (synopsis "BTree implementation for Go")
  (description
   "Package btree implements in-memory B-Trees of arbitrary degree.")
  (license license:asl2.0))
(package
  (name "go-github-com-hashicorp-go-msgpack")
  (version "1.1.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/go-msgpack")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1waxi42kpnvb62xb027kqh830im2hqsh4si2j0an79mnjm2wzlpx"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/hashicorp/go-msgpack"))
  (propagated-inputs
   `(("go-golang-org-x-tools" ,go-golang-org-x-tools)))
  (home-page
   "https://github.com/hashicorp/go-msgpack")
  (synopsis "go-codec")
  (description
   "This repository contains the @code{go-codec} library.")
  (license license:expat))
(package
  (name "go-github-com-sean--seed")
  (version "0.0.0-20170313163322-e2103e2c3529")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/sean-/seed")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0glir8jxi1w7aga2jwdb63pp1h8q4whknili7xixsqzwyy716125"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/sean-/seed"))
  (home-page "https://github.com/sean-/seed")
  (synopsis
   "- Quickly Seed Go's Random Number Generator")
  (description
   "Boiler-plate to securely @url{https://en.wikipedia.org/wiki/Random_seed,seed}\nGo's random number generator (if possible).  This library isn't anything fancy,\nit's just a canonical way of seeding Go's random number generator.  Cribbed from\n@url{https://github.com/hashicorp/nomad/commit/f89a993ec6b91636a3384dd568898245fbc273a1,(code\nNomad)} before it was moved into\n@url{https://github.com/hashicorp/consul/commit/d695bcaae6e31ee307c11fdf55bb0bf46ea9fcf4,(code\nConsul)} and made into a helper function, and now further modularized to be a\nsuper lightweight and reusable library.")
  (license (license:non-copyleft "file://LICENSE")))
(package
  (name "go-github-com-hashicorp-memberlist")
  (version "0.4.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/memberlist")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0cdqlmn1b31psg1yn6x26918z544adcysmk154g5gwybais35dqb"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/hashicorp/memberlist"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-sean--seed"
      ,go-github-com-sean--seed)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-pascaldekloe-goe"
      ,go-github-com-pascaldekloe-goe)
     ("go-github-com-miekg-dns"
      ,go-github-com-miekg-dns)
     ("go-github-com-hashicorp-go-sockaddr"
      ,go-github-com-hashicorp-go-sockaddr)
     ("go-github-com-hashicorp-go-multierror"
      ,go-github-com-hashicorp-go-multierror)
     ("go-github-com-hashicorp-go-msgpack"
      ,go-github-com-hashicorp-go-msgpack)
     ("go-github-com-hashicorp-go-immutable-radix"
      ,go-github-com-hashicorp-go-immutable-radix)
     ("go-github-com-google-btree"
      ,go-github-com-google-btree)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-armon-go-metrics"
      ,go-github-com-armon-go-metrics)))
  (home-page
   "https://github.com/hashicorp/memberlist")
  (synopsis "memberlist")
  (description
   "memberlist is a library that manages cluster membership and member failure\ndetection using a gossip based protocol.")
  (license license:mpl2.0))
(package
  (name "go-github-com-hashicorp-serf")
  (version "0.10.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/serf")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0kfpv5jxsiq4db60vw83xmv7x0718791vw0jsaq6qk5kdjmqzzg4"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/hashicorp/serf"))
  (propagated-inputs
   `(("go-github-com-ryanuber-columnize"
      ,go-github-com-ryanuber-columnize)
     ("go-github-com-posener-complete"
      ,go-github-com-posener-complete)
     ("go-github-com-mitchellh-mapstructure"
      ,go-github-com-mitchellh-mapstructure)
     ("go-github-com-mitchellh-cli"
      ,go-github-com-mitchellh-cli)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-hashicorp-memberlist"
      ,go-github-com-hashicorp-memberlist)
     ("go-github-com-hashicorp-mdns"
      ,go-github-com-hashicorp-mdns)
     ("go-github-com-hashicorp-logutils"
      ,go-github-com-hashicorp-logutils)
     ("go-github-com-hashicorp-go-uuid"
      ,go-github-com-hashicorp-go-uuid)
     ("go-github-com-hashicorp-go-syslog"
      ,go-github-com-hashicorp-go-syslog)
     ("go-github-com-hashicorp-go-multierror"
      ,go-github-com-hashicorp-go-multierror)
     ("go-github-com-hashicorp-go-msgpack"
      ,go-github-com-hashicorp-go-msgpack)
     ("go-github-com-fatih-color"
      ,go-github-com-fatih-color)
     ("go-github-com-armon-go-radix"
      ,go-github-com-armon-go-radix)
     ("go-github-com-armon-go-metrics"
      ,go-github-com-armon-go-metrics)
     ("go-github-com-armon-circbuf"
      ,go-github-com-armon-circbuf)))
  (home-page "https://github.com/hashicorp/serf")
  (synopsis "Serf")
  (description
   "Serf is a decentralized solution for service discovery and orchestration that is\nlightweight, highly available, and fault tolerant.")
  (license license:mpl2.0))
(package
  (name "go-github-com-minio-highwayhash")
  (version "1.0.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/minio/highwayhash")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1inrix7720273ccynxcyi7xsgc55cskxrw7gwn08qkmdj9xdxqai"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/minio/highwayhash"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
  (home-page
   "https://github.com/minio/highwayhash")
  (synopsis "HighwayHash")
  (description
   "Package highwayhash implements the pseudo-random-function (PRF) HighwayHash.\nHighwayHash is a fast hash function designed to defend hash-flooding attacks or\nto authenticate short-lived messages.")
  (license license:asl2.0))
(package
  (name "go-github-com-nats-io-jwt-v2")
  (version "2.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/nats-io/jwt")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0wp90jiraggjjf77w34zk2ahj5mnbk0m9am0jsnbb05wf8lxs360"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/nats-io/jwt/v2"))
  (propagated-inputs
   `(("go-github-com-nats-io-nkeys"
      ,go-github-com-nats-io-nkeys)))
  (home-page "https://github.com/nats-io/jwt")
  (synopsis #f)
  (description
   "* Copyright 2020 The NATS Authors * Licensed under the Apache License, Version\n2.0 (the \"License\"); * you may not use this file except in compliance with the\nLicense.  * You may obtain a copy of the License at * *\n@url{http://www.apache.org/licenses/LICENSE-2.0,http://www.apache.org/licenses/LICENSE-2.0}\n* * Unless required by applicable law or agreed to in writing, software *\ndistributed under the License is distributed on an \"AS IS\" BASIS, * WITHOUT\nWARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  * See the\nLicense for the specific language governing permissions and * limitations under\nthe License.")
  (license license:asl2.0))
(package
  (name "go-github-com-nats-io-nkeys")
  (version "0.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/nats-io/nkeys")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "06wbmb3cxjrcfvgfbn6rdfzb4pfaaw11bnvl1r4kig4ag22qcz7b"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/nats-io/nkeys"))
  (propagated-inputs
   `(("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)))
  (home-page "https://github.com/nats-io/nkeys")
  (synopsis "NKEYS")
  (description
   "Package nkeys is an Ed25519 based public-key signature system that simplifies\nkeys and seeds and performs signing and verification.")
  (license license:asl2.0))
(package
  (name "go-github-com-nats-io-nuid")
  (version "1.0.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/nats-io/nuid")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "11zbhg4kds5idsya04bwz4plj0mmiigypzppzih731ppbk2ms1zg"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/nats-io/nuid"))
  (home-page "https://github.com/nats-io/nuid")
  (synopsis "NUID")
  (description
   "This package provides a unique identifier generator that is high performance,\nvery fast, and tries to be entropy pool friendly.")
  (license license:asl2.0))
(package
  (name "go-go-etcd-io-etcd-api-v3")
  (version "3.5.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/etcd-io/etcd")
           (commit (string-append "api/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0d6zja2s2cw6jprldcq1nxghvbwfr5168n29yyyr9m9biiwilpap"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.etcd.io/etcd/api/v3"
     #:unpack-path
     "go.etcd.io/etcd/api/v3"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-github-com-grpc-ecosystem-grpc-gateway"
      ,go-github-com-grpc-ecosystem-grpc-gateway)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-coreos-go-semver"
      ,go-github-com-coreos-go-semver)))
  (home-page "https://go.etcd.io/etcd/api/v3")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-gopkg-in-gcfg-v1")
  (version "1.2.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gopkg.in/gcfg.v1")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "165f9wincwnkblp8x6m1f4ch4m8k4gvy5v4x4gqdpmf59kqv5y7s"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "gopkg.in/gcfg.v1"
     #:unpack-path
     "gopkg.in/gcfg.v1"))
  (home-page "https://gopkg.in/gcfg.v1")
  (synopsis #f)
  (description
   "Package gcfg reads \"INI-style\" text-based configuration files with \"name=value\"\npairs grouped into sections (gcfg files).")
  (license license:bsd-3))
(package
  (name "go-github-com-go-kit-kit")
  (version "0.12.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-kit/kit")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "15cm24sjyvwxpprfha2k0s3c1hhpg5y2kljnw04hayfyazqc79wl"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-kit/kit"))
  (propagated-inputs
   `(("go-gopkg-in-warnings-v0"
      ,go-gopkg-in-warnings-v0)
     ("go-gopkg-in-gcfg-v1" ,go-gopkg-in-gcfg-v1)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-go-uber-org-multierr"
      ,go-go-uber-org-multierr)
     ("go-go-uber-org-atomic" ,go-go-uber-org-atomic)
     ("go-go-etcd-io-etcd-api-v3"
      ,go-go-etcd-io-etcd-api-v3)
     ("go-github-com-prometheus-procfs"
      ,go-github-com-prometheus-procfs)
     ("go-github-com-prometheus-common"
      ,go-github-com-prometheus-common)
     ("go-github-com-prometheus-client-model"
      ,go-github-com-prometheus-client-model)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-op-go-logging"
      ,go-github-com-op-go-logging)
     ("go-github-com-nats-io-nuid"
      ,go-github-com-nats-io-nuid)
     ("go-github-com-nats-io-nkeys"
      ,go-github-com-nats-io-nkeys)
     ("go-github-com-nats-io-jwt-v2"
      ,go-github-com-nats-io-jwt-v2)
     ("go-github-com-modern-go-reflect2"
      ,go-github-com-modern-go-reflect2)
     ("go-github-com-modern-go-concurrent"
      ,go-github-com-modern-go-concurrent)
     ("go-github-com-mitchellh-mapstructure"
      ,go-github-com-mitchellh-mapstructure)
     ("go-github-com-mitchellh-go-homedir"
      ,go-github-com-mitchellh-go-homedir)
     ("go-github-com-minio-highwayhash"
      ,go-github-com-minio-highwayhash)
     ("go-github-com-miekg-dns"
      ,go-github-com-miekg-dns)
     ("go-github-com-matttproud-golang-protobuf-extensions"
      ,go-github-com-matttproud-golang-protobuf-extensions)
     ("go-github-com-mattn-go-isatty"
      ,go-github-com-mattn-go-isatty)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-klauspost-compress"
      ,go-github-com-klauspost-compress)
     ("go-github-com-json-iterator-go"
      ,go-github-com-json-iterator-go)
     ("go-github-com-jmespath-go-jmespath"
      ,go-github-com-jmespath-go-jmespath)
     ("go-github-com-hashicorp-serf"
      ,go-github-com-hashicorp-serf)
     ("go-github-com-hashicorp-golang-lru"
      ,go-github-com-hashicorp-golang-lru)
     ("go-github-com-hashicorp-go-rootcerts"
      ,go-github-com-hashicorp-go-rootcerts)
     ("go-github-com-hashicorp-go-immutable-radix"
      ,go-github-com-hashicorp-go-immutable-radix)
     ("go-github-com-hashicorp-go-hclog"
      ,go-github-com-hashicorp-go-hclog)
     ("go-github-com-hashicorp-go-cleanhttp"
      ,go-github-com-hashicorp-go-cleanhttp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-go-logfmt-logfmt"
      ,go-github-com-go-logfmt-logfmt)
     ("go-github-com-franela-goreq"
      ,go-github-com-franela-goreq)
     ("go-github-com-fatih-color"
      ,go-github-com-fatih-color)
     ("go-github-com-edsrzf-mmap-go"
      ,go-github-com-edsrzf-mmap-go)
     ("go-github-com-coreos-go-systemd-v22"
      ,go-github-com-coreos-go-systemd-v22)
     ("go-github-com-coreos-go-semver"
      ,go-github-com-coreos-go-semver)
     ("go-github-com-clbanning-mxj"
      ,go-github-com-clbanning-mxj)
     ("go-github-com-cespare-xxhash-v2"
      ,go-github-com-cespare-xxhash-v2)
     ("go-github-com-cenkalti-backoff-v4"
      ,go-github-com-cenkalti-backoff-v4)
     ("go-github-com-beorn7-perks"
      ,go-github-com-beorn7-perks)
     ("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)
     ("go-github-com-armon-go-metrics"
      ,go-github-com-armon-go-metrics)
     ("go-github-com-knetic-govaluate"
      ,go-github-com-knetic-govaluate)
     ("go-github-com-hdrhistogram-hdrhistogram-go"
      ,go-github-com-hdrhistogram-hdrhistogram-go)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-golang-org-x-time" ,go-golang-org-x-time)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-go-uber-org-zap" ,go-go-uber-org-zap)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-go-etcd-io-etcd-client-v3"
      ,go-go-etcd-io-etcd-client-v3)
     ("go-go-etcd-io-etcd-client-v2"
      ,go-go-etcd-io-etcd-client-v2)
     ("go-go-etcd-io-etcd-client-pkg-v3"
      ,go-go-etcd-io-etcd-client-pkg-v3)
     ("go-github-com-streadway-handy"
      ,go-github-com-streadway-handy)
     ("go-github-com-streadway-amqp"
      ,go-github-com-streadway-amqp)
     ("go-github-com-sony-gobreaker"
      ,go-github-com-sony-gobreaker)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-performancecopilot-speed-v4"
      ,go-github-com-performancecopilot-speed-v4)
     ("go-github-com-openzipkin-zipkin-go"
      ,go-github-com-openzipkin-zipkin-go)
     ("go-github-com-opentracing-opentracing-go"
      ,go-github-com-opentracing-opentracing-go)
     ("go-github-com-nats-io-nats-go"
      ,go-github-com-nats-io-nats-go)
     ("go-github-com-nats-io-nats-server-v2"
      ,go-github-com-nats-io-nats-server-v2)
     ("go-github-com-influxdata-influxdb1-client"
      ,go-github-com-influxdata-influxdb1-client)
     ("go-github-com-hudl-fargo"
      ,go-github-com-hudl-fargo)
     ("go-github-com-hashicorp-consul-api"
      ,go-github-com-hashicorp-consul-api)
     ("go-github-com-golang-jwt-jwt-v4"
      ,go-github-com-golang-jwt-jwt-v4)
     ("go-github-com-go-zookeeper-zk"
      ,go-github-com-go-zookeeper-zk)
     ("go-github-com-go-kit-log"
      ,go-github-com-go-kit-log)
     ("go-github-com-casbin-casbin-v2"
      ,go-github-com-casbin-casbin-v2)
     ("go-github-com-aws-aws-sdk-go-v2-service-cloudwatch"
      ,go-github-com-aws-aws-sdk-go-v2-service-cloudwatch)
     ("go-github-com-aws-aws-sdk-go-v2"
      ,go-github-com-aws-aws-sdk-go-v2)
     ("go-github-com-aws-aws-sdk-go"
      ,go-github-com-aws-aws-sdk-go)
     ("go-github-com-afex-hystrix-go"
      ,go-github-com-afex-hystrix-go)
     ("go-github-com-vividcortex-gohistogram"
      ,go-github-com-vividcortex-gohistogram)))
  (home-page "https://github.com/go-kit/kit")
  (synopsis "Go kit")
  (description
   "@strong{Go kit} is a @strong{programming toolkit} for building microservices (or\nelegant monoliths) in Go.  We solve common problems in distributed systems and\napplication architecture so you can focus on delivering business value.")
  (license license:expat))
(package
  (name "go-github-com-go-stack-stack")
  (version "1.8.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-stack/stack")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "01m6l9w84yq2yyly8bdfsgc386hla1gn9431c7vr3mfa3bchj5wb"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-stack/stack"))
  (home-page "https://github.com/go-stack/stack")
  (synopsis "stack")
  (description
   "Package stack implements utilities to capture, manipulate, and format call\nstacks.  It provides a simpler API than package runtime.")
  (license license:expat))
(package
  (name "go-github-com-grpc-ecosystem-go-grpc-middleware")
  (version "1.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/grpc-ecosystem/go-grpc-middleware")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1c9chw2nwj46ayx6cbq1sq21gmfmm3fx1gg579hn7srwywq0xsw0"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/grpc-ecosystem/go-grpc-middleware"))
  (propagated-inputs
   `(("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-uber-org-zap" ,go-go-uber-org-zap)
     ("go-go-uber-org-multierr"
      ,go-go-uber-org-multierr)
     ("go-go-uber-org-atomic" ,go-go-uber-org-atomic)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-opentracing-opentracing-go"
      ,go-github-com-opentracing-opentracing-go)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-go-stack-stack"
      ,go-github-com-go-stack-stack)
     ("go-github-com-go-logfmt-logfmt"
      ,go-github-com-go-logfmt-logfmt)
     ("go-github-com-go-kit-kit"
      ,go-github-com-go-kit-kit)))
  (home-page
   "https://github.com/grpc-ecosystem/go-grpc-middleware")
  (synopsis "Go gRPC Middleware")
  (description
   "`grpc_middleware` is a collection of gRPC middleware packages: interceptors,\nhelpers and tools.")
  (license license:asl2.0))
(package
  (name "go-github-com-ghodss-yaml")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ghodss/yaml")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0skwmimpy7hlh7pva2slpcplnm912rp3igs98xnqmn859kwa5v8g"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/ghodss/yaml"))
  (home-page "https://github.com/ghodss/yaml")
  (synopsis
   "YAML marshaling and unmarshaling support for Go")
  (description
   "Copyright 2013 The Go Authors.  All rights reserved.  Use of this source code is\ngoverned by a BSD-style license that can be found in the LICENSE file.")
  (license (license:non-copyleft "file://LICENSE")))
(package
  (name "go-github-com-grpc-ecosystem-grpc-gateway")
  (version "1.16.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/grpc-ecosystem/grpc-gateway")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0dzq1qbgzz2c6vnh8anx0j3py34sd72p35x6s2wrl001q68am5cc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/grpc-ecosystem/grpc-gateway"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-rogpeppe-fastuuid"
      ,go-github-com-rogpeppe-fastuuid)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-glog"
      ,go-github-com-golang-glog)
     ("go-github-com-ghodss-yaml"
      ,go-github-com-ghodss-yaml)
     ("go-github-com-antihax-optional"
      ,go-github-com-antihax-optional)))
  (home-page
   "https://github.com/grpc-ecosystem/grpc-gateway")
  (synopsis "grpc-gateway")
  (description
   "The grpc-gateway is a plugin of the Google protocol buffers compiler\n@url{https://github.com/protocolbuffers/protobuf,protoc}.  It reads protobuf\nservice definitions and generates a reverse-proxy server which translates a\nRESTful HTTP API into gRPC.  This server is generated according to the\n@url{https://github.com/googleapis/googleapis/raw/master/google/api/http.proto#L46,(code\ngoogle.api.http)} annotations in your service definitions.")
  (license license:bsd-3))
(package
  (name "go-github-com-soheilhy-cmux")
  (version "0.1.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/soheilhy/cmux")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "17zpa45xvmk3jl1qqx3lkqdyxs6hdczpv7hwg4s7x0895jx3zl5y"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/soheilhy/cmux"))
  (propagated-inputs
   `(("go-golang-org-x-net" ,go-golang-org-x-net)))
  (home-page "https://github.com/soheilhy/cmux")
  (synopsis "cmux: Connection Mux")
  (description
   "Package cmux is a library to multiplex network connections based on their\npayload.  Using cmux, you can serve different protocols from the same listener.")
  (license license:asl2.0))
(package
  (name "go-go-etcd-io-etcd-tests-v3")
  (version "3.5.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/etcd-io/etcd")
           (commit (string-append "tests/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0d6zja2s2cw6jprldcq1nxghvbwfr5168n29yyyr9m9biiwilpap"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.etcd.io/etcd/tests/v3"
     #:unpack-path
     "go.etcd.io/etcd/tests/v3"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-golang-org-x-time" ,go-golang-org-x-time)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-go-uber-org-zap" ,go-go-uber-org-zap)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-soheilhy-cmux"
      ,go-github-com-soheilhy-cmux)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-grpc-ecosystem-grpc-gateway"
      ,go-github-com-grpc-ecosystem-grpc-gateway)
     ("go-github-com-grpc-ecosystem-go-grpc-prometheus"
      ,go-github-com-grpc-ecosystem-go-grpc-prometheus)
     ("go-github-com-grpc-ecosystem-go-grpc-middleware"
      ,go-github-com-grpc-ecosystem-go-grpc-middleware)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-etcd-io-gofail"
      ,go-github-com-etcd-io-gofail)
     ("go-github-com-dustin-go-humanize"
      ,go-github-com-dustin-go-humanize)))
  (home-page "https://go.etcd.io/etcd/tests/v3")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-go-opentelemetry-io-contrib")
  (version "1.10.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/open-telemetry/opentelemetry-go-contrib")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1myj2gnhq5ffwldqsbqxwi9pc0gld0v0qwl7022v8sfzym5dnbyw"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "go.opentelemetry.io/contrib"))
  (home-page "https://go.opentelemetry.io/contrib")
  (synopsis "OpenTelemetry-Go Contrib")
  (description
   "Package contrib is a collection of extensions for the opentelemetry-go project.\nIt provides 3rd parth resource detectors, propagators, samplers, and\ninstrumentation as submodules.")
  (license license:asl2.0))
(package
  (name "go-go-opentelemetry-io-contrib-instrumentation-google-golang-org-grpc-otelgrpc")
  (version "0.36.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/open-telemetry/opentelemetry-go-contrib")
           (commit
            (string-append
             "instrumentation/google.golang.org/grpc/otelgrpc/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1lfznjrksj5m3hnvn9xdg4l0pm4sfya3fw2rqjawh8q2r487pa6d"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-go-logr-stdr"
      ,go-github-com-go-logr-stdr)
     ("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-go-opentelemetry-io-otel-trace"
      ,go-go-opentelemetry-io-otel-trace)
     ("go-go-opentelemetry-io-otel"
      ,go-go-opentelemetry-io-otel)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)))
  (home-page
   "https://go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-go-opentelemetry-io-otel")
  (version "1.10.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/open-telemetry/opentelemetry-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0kyd2y1x1zygkhzc8glrclvcaks4hzigan1mzy9cwrkbzx8kc0kr"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "go.opentelemetry.io/otel"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-go-logr-stdr"
      ,go-github-com-go-logr-stdr)
     ("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)))
  (home-page "https://go.opentelemetry.io/otel")
  (synopsis "OpenTelemetry-Go")
  (description
   "Package otel provides global access to the OpenTelemetry API.  The subpackages\nof the otel package provide an implementation of the OpenTelemetry API.")
  (license license:asl2.0))
(package
  (name "go-go-opentelemetry-io-otel-exporters-otlp")
  (version "0.20.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/open-telemetry/opentelemetry-go")
           (commit
            (string-append "exporters/otlp/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "09crv3i3dnascqrgvxwgdnkyjajhy0l51siz1qw9ib9sv1645gpi"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.opentelemetry.io/otel/exporters/otlp"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-go-opentelemetry-io-proto-otlp"
      ,go-go-opentelemetry-io-proto-otlp)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)))
  (home-page
   "https://go.opentelemetry.io/otel/exporters/otlp")
  (synopsis "OpenTelemetry Collector Go Exporter")
  (description
   "Package otlp contains an exporter for the OpenTelemetry protocol buffers.")
  (license license:asl2.0))
(package
  (name "go-go-opentelemetry-io-otel-metric")
  (version "0.32.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/open-telemetry/opentelemetry-go")
           (commit (string-append "metric/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1m9gr9rls3z84q5n97nyi17vzrvccw0xz5xaprf7b4cwk758kpfb"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "go.opentelemetry.io/otel/metric"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-go-logr-stdr"
      ,go-github-com-go-logr-stdr)
     ("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page
   "https://go.opentelemetry.io/otel/metric")
  (synopsis #f)
  (description
   "Package metric provides an implementation of the metrics part of the\nOpenTelemetry API.")
  (license license:asl2.0))
(package
  (name "go-go-opentelemetry-io-otel-sdk")
  (version "1.10.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/open-telemetry/opentelemetry-go")
           (commit (string-append "sdk/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0kyd2y1x1zygkhzc8glrclvcaks4hzigan1mzy9cwrkbzx8kc0kr"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "go.opentelemetry.io/otel/sdk"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-go-logr-stdr"
      ,go-github-com-go-logr-stdr)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)))
  (home-page
   "https://go.opentelemetry.io/otel/sdk")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-go-opentelemetry-io-otel-sdk-export-metric")
  (version "0.28.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/open-telemetry/opentelemetry-go")
           (commit
            (string-append "sdk/export/metric/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0gj08wcrycx10pwxcir03h4y8gxcwgzmacdz2iss14py9vx570hi"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.opentelemetry.io/otel/sdk/export/metric"))
  (home-page
   "https://go.opentelemetry.io/otel/sdk/export/metric")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-github-com-go-logr-logr")
  (version "1.2.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-logr/logr")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1148cph7c9qxjvng94a90szpbm2m5dj4pvllbsjqvgqj5j8prwip"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-logr/logr"))
  (home-page "https://github.com/go-logr/logr")
  (synopsis "A minimal logging API for Go")
  (description
   "Package logr defines a general-purpose logging API and abstract interfaces to\nback that API.  Packages in the Go ecosystem can depend on this package, while\ncallers can implement logging with whatever backend is appropriate.")
  (license license:asl2.0))
(package
  (name "go-github-com-go-logr-stdr")
  (version "1.2.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-logr/stdr")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1dl2rzvjacwqlnvw7azrxqbh4jvzaq8v399f6drs146l39ss21c1"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-logr/stdr"))
  (propagated-inputs
   `(("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)))
  (home-page "https://github.com/go-logr/stdr")
  (synopsis
   "Minimal Go logging using logr and Go's standard library")
  (description
   "Package stdr implements github.com/go-logr/logr.Logger in terms of Go's standard\nlog package.")
  (license license:asl2.0))
(package
  (name "go-go-opentelemetry-io-otel-sdk-metric")
  (version "0.32.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/open-telemetry/opentelemetry-go")
           (commit
            (string-append "sdk/metric/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1m9gr9rls3z84q5n97nyi17vzrvccw0xz5xaprf7b4cwk758kpfb"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.opentelemetry.io/otel/sdk/metric"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-go-logr-stdr"
      ,go-github-com-go-logr-stdr)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-go-logr-logr"
      ,go-github-com-go-logr-logr)))
  (home-page
   "https://go.opentelemetry.io/otel/sdk/metric")
  (synopsis #f)
  (description
   "Package metric provides an implementation of the OpenTelemetry metric SDK.")
  (license license:asl2.0))
(package
  (name "go-go-opentelemetry-io-otel-trace")
  (version "1.10.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/open-telemetry/opentelemetry-go")
           (commit (string-append "trace/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0kyd2y1x1zygkhzc8glrclvcaks4hzigan1mzy9cwrkbzx8kc0kr"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "go.opentelemetry.io/otel/trace"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)))
  (home-page
   "https://go.opentelemetry.io/otel/trace")
  (synopsis #f)
  (description
   "Package trace provides an implementation of the tracing part of the\nOpenTelemetry API.")
  (license license:asl2.0))
(package
  (name "go-gopkg-in-natefinch-lumberjack-v2")
  (version "2.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gopkg.in/natefinch/lumberjack.v2")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1m2sxypk7p805jvc68padvylyx5v7cwkh5klnnxxr0340kgspf08"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "gopkg.in/natefinch/lumberjack.v2"
     #:unpack-path
     "gopkg.in/natefinch/lumberjack.v2"))
  (home-page
   "https://gopkg.in/natefinch/lumberjack.v2")
  (synopsis "lumberjack")
  (description
   "Package lumberjack provides a rolling logger.")
  (license license:expat))
(package
  (name "go-github-com-armon-go-socks5")
  (version "0.0.0-20160902184237-e75332964ef5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/armon/go-socks5")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "104w10jf0wlxyxi35hf6frndgf0ybz21h54xjmnkivpb6slycpyq"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/armon/go-socks5"))
  (home-page "https://github.com/armon/go-socks5")
  (synopsis "go-socks5")
  (description
   "This package provides the @code{socks5} package that implements a\n@url{http://en.wikipedia.org/wiki/SOCKS,SOCKS5 server}.  SOCKS (Secure Sockets)\nis used to route traffic between a client and server through an intermediate\nproxy layer.  This can be used to bypass firewalls or NATs.")
  (license license:expat))
(package
  (name "go-github-com-flynn-go-shlex")
  (version "0.0.0-20150515145356-3f9db97f8568")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/flynn-archive/go-shlex")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1j743lysygkpa2s2gii2xr32j7bxgc15zv4113b0q9jhn676ysia"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/flynn/go-shlex"))
  (home-page "https://github.com/flynn/go-shlex")
  (synopsis #f)
  (description
   "go-shlex is a simple lexer for go that supports shell-style quoting, commenting,\nand escaping.")
  (license license:asl2.0))
(package
  (name "go-github-com-anmitsu-go-shlex")
  (version "0.0.0-20200514113438-38f4b401e2be")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/anmitsu/go-shlex")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "17iz68yzbnr7y4s493asbagbv79qq8hvl2pkxvm6bvdkgphj8w1g"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/anmitsu/go-shlex"))
  (home-page "https://github.com/anmitsu/go-shlex")
  (synopsis "go-shlex")
  (description
   "Package shlex provides a simple lexical analysis like Unix shell.")
  (license license:expat))
(package
  (name "go-github-com-gliderlabs-ssh")
  (version "0.3.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gliderlabs/ssh")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "03r1f69hvi1j2ac12k0vp7b4r4b1clgp6mm2wjvgkwmgm4rxg8ki"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gliderlabs/ssh"))
  (propagated-inputs
   `(("go-golang-org-x-term" ,go-golang-org-x-term)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-anmitsu-go-shlex"
      ,go-github-com-anmitsu-go-shlex)))
  (home-page "https://github.com/gliderlabs/ssh")
  (synopsis "gliderlabs/ssh")
  (description
   "Package ssh wraps the crypto/ssh package with a higher-level API for building\nSSH servers.  The goal of the API was to make it as simple as using net/http, so\nthe API is very similar.")
  (license license:bsd-3))
(package
  (name "go-github-com-pelletier-go-buffruneio")
  (version "0.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/pelletier/go-buffruneio")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "12wfsyv4r4353rx32hzlds19c3mcsz9g1zw0npsfc2qsdd06qlkv"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/pelletier/go-buffruneio"))
  (home-page
   "https://github.com/pelletier/go-buffruneio")
  (synopsis "buffruneio")
  (description
   "Package buffruneio provides rune-based buffered input.")
  (license license:expat))
(package
  (name "go-github-com-src-d-gcfg")
  (version "1.4.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/src-d/gcfg")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "044j95skmyrwjw5fwjk6ka32rjgsg0ar0mfp9np19sh1acwv4x4r"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/src-d/gcfg"))
  (home-page "https://github.com/src-d/gcfg")
  (synopsis #f)
  (description
   "Package gcfg reads \"INI-style\" text-based configuration files with \"name=value\"\npairs grouped into sections (gcfg files).")
  (license license:bsd-3))
(package
  (name "go-github-com-creack-pty")
  (version "1.1.18")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/creack/pty")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1qqhcgfym0napz8damj7dhfw28g2qn2f5h3lr93i0sxawq926yzc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/creack/pty"))
  (home-page "https://github.com/creack/pty")
  (synopsis "pty")
  (description
   "Package pty provides functions for working with Unix terminals.")
  (license license:expat))
(package
  (name "go-github-com-kr-pty")
  (version "1.1.8")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/kr/pty")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1vcl6f90n0f8s8b4fyh0832ilybjqcypqyj233lqj1hx62fvgdbk"))))
  (build-system go-build-system)
  (arguments '(#:import-path "github.com/kr/pty"))
  (propagated-inputs
   `(("go-github-com-creack-pty"
      ,go-github-com-creack-pty)))
  (home-page "https://github.com/kr/pty")
  (synopsis "pty")
  (description
   "Package pty is a wrapper for github.com/creack/pty, which provides functions for\nworking with Unix terminals.")
  (license license:expat))
(package
  (name "go-gopkg-in-src-d-go-billy-v4")
  (version "4.3.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gopkg.in/src-d/go-billy.v4")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0jcyi4ink2njgflp3f2mbl5b86p2w0rh945k5xplcl158i5wkrc6"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "gopkg.in/src-d/go-billy.v4"
     #:unpack-path
     "gopkg.in/src-d/go-billy.v4"))
  (propagated-inputs
   `(("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-kr-pty" ,go-github-com-kr-pty)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)))
  (home-page "https://gopkg.in/src-d/go-billy.v4")
  (synopsis "go-billy")
  (description
   "The missing interface filesystem abstraction for Go.  Billy implements an\ninterface based on the @code{os} standard library, allowing to develop\napplications without dependency on the underlying storage.  Makes it virtually\nfree to implement mocks and testing over filesystem operations.")
  (license license:asl2.0))
(package
  (name "go-gopkg-in-src-d-go-git-fixtures-v3")
  (version "3.5.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gopkg.in/src-d/go-git-fixtures.v3")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0ckvfzj9nhvxi3aznid1wbw0yq5s3k2mfhlqmaz2ll8myzr97w96"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "gopkg.in/src-d/go-git-fixtures.v3"
     #:unpack-path
     "gopkg.in/src-d/go-git-fixtures.v3"))
  (home-page
   "https://gopkg.in/src-d/go-git-fixtures.v3")
  (synopsis "go-git-fixtures")
  (description
   "git repository fixtures being use by\n@url{https://github.com/src-d/go-git,go-git}")
  (license license:asl2.0))
(package
  (name "go-gopkg-in-src-d-go-git-v4")
  (version "4.13.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gopkg.in/src-d/go-git.v4")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0n4x7r69qrmpss51b3wd3vj4b9jmip4archz3fbqk6q1yyd1pxjb"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "gopkg.in/src-d/go-git.v4"
     #:unpack-path
     "gopkg.in/src-d/go-git.v4"))
  (propagated-inputs
   `(("go-gopkg-in-warnings-v0"
      ,go-gopkg-in-warnings-v0)
     ("go-gopkg-in-src-d-go-git-fixtures-v3"
      ,go-gopkg-in-src-d-go-git-fixtures-v3)
     ("go-gopkg-in-src-d-go-billy-v4"
      ,go-gopkg-in-src-d-go-billy-v4)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-xanzy-ssh-agent"
      ,go-github-com-xanzy-ssh-agent)
     ("go-github-com-stretchr-objx"
      ,go-github-com-stretchr-objx)
     ("go-github-com-src-d-gcfg"
      ,go-github-com-src-d-gcfg)
     ("go-github-com-sergi-go-diff"
      ,go-github-com-sergi-go-diff)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-pelletier-go-buffruneio"
      ,go-github-com-pelletier-go-buffruneio)
     ("go-github-com-mitchellh-go-homedir"
      ,go-github-com-mitchellh-go-homedir)
     ("go-github-com-kevinburke-ssh-config"
      ,go-github-com-kevinburke-ssh-config)
     ("go-github-com-jessevdk-go-flags"
      ,go-github-com-jessevdk-go-flags)
     ("go-github-com-jbenet-go-context"
      ,go-github-com-jbenet-go-context)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-gliderlabs-ssh"
      ,go-github-com-gliderlabs-ssh)
     ("go-github-com-flynn-go-shlex"
      ,go-github-com-flynn-go-shlex)
     ("go-github-com-emirpasic-gods"
      ,go-github-com-emirpasic-gods)
     ("go-github-com-armon-go-socks5"
      ,go-github-com-armon-go-socks5)
     ("go-github-com-anmitsu-go-shlex"
      ,go-github-com-anmitsu-go-shlex)
     ("go-github-com-alcortesm-tgz"
      ,go-github-com-alcortesm-tgz)))
  (home-page "https://gopkg.in/src-d/go-git.v4")
  (synopsis "Comparison with git")
  (description
   "This package provides a highly extensible git implementation in pure Go.")
  (license license:asl2.0))
(package
  (name "go-gopkg-in-warnings-v0")
  (version "0.1.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gopkg.in/warnings.v0")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1kzj50jn708cingn7a13c2wdlzs6qv89dr2h4zj8d09647vlnd81"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "gopkg.in/warnings.v0"
     #:unpack-path
     "gopkg.in/warnings.v0"))
  (home-page "https://gopkg.in/warnings.v0")
  (synopsis #f)
  (description
   "Package warnings implements error handling with non-fatal errors (warnings).")
  (license license:bsd-2))
(package
  (name "go-github-com-google-trillian")
  (version "1.5.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/google/trillian")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "18jjrhh752b5qh4xpn24cg7n0nhybnwackmcdn2rkyqdw8ddb4ax"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/google/trillian"))
  (propagated-inputs
   `(("go-sigs-k8s-io-yaml" ,go-sigs-k8s-io-yaml)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-warnings-v0"
      ,go-gopkg-in-warnings-v0)
     ("go-gopkg-in-src-d-go-git-v4"
      ,go-gopkg-in-src-d-go-git-v4)
     ("go-gopkg-in-src-d-go-billy-v4"
      ,go-gopkg-in-src-d-go-billy-v4)
     ("go-gopkg-in-natefinch-lumberjack-v2"
      ,go-gopkg-in-natefinch-lumberjack-v2)
     ("go-gopkg-in-cheggaaa-pb-v1"
      ,go-gopkg-in-cheggaaa-pb-v1)
     ("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-golang-org-x-time" ,go-golang-org-x-time)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-mod" ,go-golang-org-x-mod)
     ("go-go-uber-org-zap" ,go-go-uber-org-zap)
     ("go-go-uber-org-multierr"
      ,go-go-uber-org-multierr)
     ("go-go-uber-org-atomic" ,go-go-uber-org-atomic)
     ("go-go-opentelemetry-io-proto-otlp"
      ,go-go-opentelemetry-io-proto-otlp)
     ("go-go-opentelemetry-io-otel-trace"
      ,go-go-opentelemetry-io-otel-trace)
     ("go-go-opentelemetry-io-otel-sdk-metric"
      ,go-go-opentelemetry-io-otel-sdk-metric)
     ("go-go-opentelemetry-io-otel-sdk-export-metric"
      ,go-go-opentelemetry-io-otel-sdk-export-metric)
     ("go-go-opentelemetry-io-otel-sdk"
      ,go-go-opentelemetry-io-otel-sdk)
     ("go-go-opentelemetry-io-otel-metric"
      ,go-go-opentelemetry-io-otel-metric)
     ("go-go-opentelemetry-io-otel-exporters-otlp"
      ,go-go-opentelemetry-io-otel-exporters-otlp)
     ("go-go-opentelemetry-io-otel"
      ,go-go-opentelemetry-io-otel)
     ("go-go-opentelemetry-io-contrib-instrumentation-google-golang-org-grpc-otelgrpc"
      ,go-go-opentelemetry-io-contrib-instrumentation-google-golang-org-grpc-otelgrpc)
     ("go-go-opentelemetry-io-contrib"
      ,go-go-opentelemetry-io-contrib)
     ("go-go-etcd-io-etcd-tests-v3"
      ,go-go-etcd-io-etcd-tests-v3)
     ("go-go-etcd-io-etcd-raft-v3"
      ,go-go-etcd-io-etcd-raft-v3)
     ("go-go-etcd-io-etcd-pkg-v3"
      ,go-go-etcd-io-etcd-pkg-v3)
     ("go-go-etcd-io-etcd-etcdutl-v3"
      ,go-go-etcd-io-etcd-etcdutl-v3)
     ("go-go-etcd-io-etcd-client-v2"
      ,go-go-etcd-io-etcd-client-v2)
     ("go-go-etcd-io-etcd-client-pkg-v3"
      ,go-go-etcd-io-etcd-client-pkg-v3)
     ("go-go-etcd-io-etcd-api-v3"
      ,go-go-etcd-io-etcd-api-v3)
     ("go-go-etcd-io-bbolt" ,go-go-etcd-io-bbolt)
     ("go-github-com-xiang90-probing"
      ,go-github-com-xiang90-probing)
     ("go-github-com-xanzy-ssh-agent"
      ,go-github-com-xanzy-ssh-agent)
     ("go-github-com-urfave-cli"
      ,go-github-com-urfave-cli)
     ("go-github-com-tmc-grpc-websocket-proxy"
      ,go-github-com-tmc-grpc-websocket-proxy)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-src-d-gcfg"
      ,go-github-com-src-d-gcfg)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-soheilhy-cmux"
      ,go-github-com-soheilhy-cmux)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-sergi-go-diff"
      ,go-github-com-sergi-go-diff)
     ("go-github-com-russross-blackfriday-v2"
      ,go-github-com-russross-blackfriday-v2)
     ("go-github-com-rivo-uniseg"
      ,go-github-com-rivo-uniseg)
     ("go-github-com-pseudomuto-protokit"
      ,go-github-com-pseudomuto-protokit)
     ("go-github-com-prometheus-prometheus"
      ,go-github-com-prometheus-prometheus)
     ("go-github-com-prometheus-procfs"
      ,go-github-com-prometheus-procfs)
     ("go-github-com-prometheus-common"
      ,go-github-com-prometheus-common)
     ("go-github-com-otiai10-copy"
      ,go-github-com-otiai10-copy)
     ("go-github-com-onsi-gomega"
      ,go-github-com-onsi-gomega)
     ("go-github-com-onsi-ginkgo"
      ,go-github-com-onsi-ginkgo)
     ("go-github-com-olekukonko-tablewriter"
      ,go-github-com-olekukonko-tablewriter)
     ("go-github-com-mwitkow-go-proto-validators"
      ,go-github-com-mwitkow-go-proto-validators)
     ("go-github-com-modern-go-reflect2"
      ,go-github-com-modern-go-reflect2)
     ("go-github-com-modern-go-concurrent"
      ,go-github-com-modern-go-concurrent)
     ("go-github-com-mitchellh-reflectwalk"
      ,go-github-com-mitchellh-reflectwalk)
     ("go-github-com-mitchellh-go-homedir"
      ,go-github-com-mitchellh-go-homedir)
     ("go-github-com-mitchellh-copystructure"
      ,go-github-com-mitchellh-copystructure)
     ("go-github-com-miekg-pkcs11"
      ,go-github-com-miekg-pkcs11)
     ("go-github-com-matttproud-golang-protobuf-extensions"
      ,go-github-com-matttproud-golang-protobuf-extensions)
     ("go-github-com-mattn-go-runewidth"
      ,go-github-com-mattn-go-runewidth)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-kevinburke-ssh-config"
      ,go-github-com-kevinburke-ssh-config)
     ("go-github-com-json-iterator-go"
      ,go-github-com-json-iterator-go)
     ("go-github-com-jonboulle-clockwork"
      ,go-github-com-jonboulle-clockwork)
     ("go-github-com-jmespath-go-jmespath"
      ,go-github-com-jmespath-go-jmespath)
     ("go-github-com-jhump-protoreflect"
      ,go-github-com-jhump-protoreflect)
     ("go-github-com-jbenet-go-context"
      ,go-github-com-jbenet-go-context)
     ("go-github-com-inconshreveable-mousetrap"
      ,go-github-com-inconshreveable-mousetrap)
     ("go-github-com-imdario-mergo"
      ,go-github-com-imdario-mergo)
     ("go-github-com-huandu-xstrings"
      ,go-github-com-huandu-xstrings)
     ("go-github-com-grpc-ecosystem-grpc-gateway"
      ,go-github-com-grpc-ecosystem-grpc-gateway)
     ("go-github-com-grpc-ecosystem-go-grpc-prometheus"
      ,go-github-com-grpc-ecosystem-go-grpc-prometheus)
     ("go-github-com-gorilla-websocket"
      ,go-github-com-gorilla-websocket)
     ("go-github-com-googleapis-go-type-adapters"
      ,go-github-com-googleapis-go-type-adapters)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-google-martian-v3"
      ,go-github-com-google-martian-v3)
     ("go-github-com-google-licenseclassifier"
      ,go-github-com-google-licenseclassifier)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-form3tech-oss-jwt-go"
      ,go-github-com-form3tech-oss-jwt-go)
     ("go-github-com-fatih-color"
      ,go-github-com-fatih-color)
     ("go-github-com-envoyproxy-protoc-gen-validate"
      ,go-github-com-envoyproxy-protoc-gen-validate)
     ("go-github-com-envoyproxy-go-control-plane"
      ,go-github-com-envoyproxy-go-control-plane)
     ("go-github-com-emirpasic-gods"
      ,go-github-com-emirpasic-gods)
     ("go-github-com-dustin-go-humanize"
      ,go-github-com-dustin-go-humanize)
     ("go-github-com-cpuguy83-go-md2man-v2"
      ,go-github-com-cpuguy83-go-md2man-v2)
     ("go-github-com-coreos-go-systemd-v22"
      ,go-github-com-coreos-go-systemd-v22)
     ("go-github-com-coreos-go-semver"
      ,go-github-com-coreos-go-semver)
     ("go-github-com-cncf-xds-go"
      ,go-github-com-cncf-xds-go)
     ("go-github-com-cncf-udpa-go"
      ,go-github-com-cncf-udpa-go)
     ("go-github-com-cespare-xxhash-v2"
      ,go-github-com-cespare-xxhash-v2)
     ("go-github-com-census-instrumentation-opencensus-proto"
      ,go-github-com-census-instrumentation-opencensus-proto)
     ("go-github-com-bgentry-speakeasy"
      ,go-github-com-bgentry-speakeasy)
     ("go-github-com-beorn7-perks"
      ,go-github-com-beorn7-perks)
     ("go-github-com-benbjohnson-clock"
      ,go-github-com-benbjohnson-clock)
     ("go-github-com-aws-aws-sdk-go"
      ,go-github-com-aws-aws-sdk-go)
     ("go-github-com-masterminds-sprig"
      ,go-github-com-masterminds-sprig)
     ("go-github-com-masterminds-semver"
      ,go-github-com-masterminds-semver)
     ("go-github-com-masterminds-goutils"
      ,go-github-com-masterminds-goutils)
     ("go-cloud-google-com-go-trace"
      ,go-cloud-google-com-go-trace)
     ("go-cloud-google-com-go-storage"
      ,go-cloud-google-com-go-storage)
     ("go-cloud-google-com-go-monitoring"
      ,go-cloud-google-com-go-monitoring)
     ("go-cloud-google-com-go-iam"
      ,go-cloud-google-com-go-iam)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc-cmd-protoc-gen-go-grpc"
      ,go-google-golang-org-grpc-cmd-protoc-gen-go-grpc)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-go-etcd-io-etcd-v3" ,go-go-etcd-io-etcd-v3)
     ("go-go-etcd-io-etcd-server-v3"
      ,go-go-etcd-io-etcd-server-v3)
     ("go-go-etcd-io-etcd-etcdctl-v3"
      ,go-go-etcd-io-etcd-etcdctl-v3)
     ("go-go-etcd-io-etcd-client-v3"
      ,go-go-etcd-io-etcd-client-v3)
     ("go-github-com-transparency-dev-merkle"
      ,go-github-com-transparency-dev-merkle)
     ("go-github-com-pseudomuto-protoc-gen-doc"
      ,go-github-com-pseudomuto-protoc-gen-doc)
     ("go-github-com-prometheus-client-model"
      ,go-github-com-prometheus-client-model)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-letsencrypt-pkcs11key-v4"
      ,go-github-com-letsencrypt-pkcs11key-v4)
     ("go-github-com-grpc-ecosystem-go-grpc-middleware"
      ,go-github-com-grpc-ecosystem-go-grpc-middleware)
     ("go-github-com-google-go-licenses"
      ,go-github-com-google-go-licenses)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-google-btree"
      ,go-github-com-google-btree)
     ("go-github-com-golang-mock"
      ,go-github-com-golang-mock)
     ("go-github-com-golang-glog"
      ,go-github-com-golang-glog)
     ("go-github-com-go-sql-driver-mysql"
      ,go-github-com-go-sql-driver-mysql)
     ("go-github-com-go-redis-redis"
      ,go-github-com-go-redis-redis)
     ("go-github-com-fullstorydev-grpcurl"
      ,go-github-com-fullstorydev-grpcurl)
     ("go-github-com-apache-beam-sdks-v2"
      ,go-github-com-apache-beam-sdks-v2)
     ("go-contrib-go-opencensus-io-exporter-stackdriver"
      ,go-contrib-go-opencensus-io-exporter-stackdriver)
     ("go-cloud-google-com-go-spanner"
      ,go-cloud-google-com-go-spanner)
     ("go-bitbucket-org-creachadair-shell"
      ,go-bitbucket-org-creachadair-shell)))
  (home-page "https://github.com/google/trillian")
  (synopsis "Trillian: General Transparency")
  (description
   "Trillian is an implementation of the concepts described in the\n@url{https://github.com/google/trillian/blob/v1.5.0/docs/papers/VerifiableDataStructures.pdf,Verifiable\nData Structures} white paper, which in turn is an extension and generalisation\nof the ideas which underpin\n@url{https://certificate-transparency.org,Certificate Transparency}.")
  (license license:asl2.0))
(package
  (name "go-github-com-mohae-deepcopy")
  (version "0.0.0-20170929034955-c48cc78d4826")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/mohae/deepcopy")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0jdhsz0hsbn0k45rmvm39knbvs024j24ay2q65k5ih8ql8m2c0sd"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/mohae/deepcopy"))
  (home-page "https://github.com/mohae/deepcopy")
  (synopsis "deepCopy")
  (description
   "deepcopy makes deep copies of things.  A standard copy will copy the pointers:\ndeep copy copies the values pointed to.  Unexported field values are not copied.")
  (license license:expat))
(package
  (name "go-github-com-rs-cors")
  (version "1.8.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/rs/cors")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "156akwff7zmz46pkmll2i2gdwndrw8fql0g2p8z641vlywclzmi3"))))
  (build-system go-build-system)
  (arguments '(#:import-path "github.com/rs/cors"))
  (home-page "https://github.com/rs/cors")
  (synopsis "Go CORS handler")
  (description
   "Package cors is net/http handler to handle CORS related requests as defined by\n@url{http://www.w3.org/TR/cors/,http://www.w3.org/TR/cors/}")
  (license license:expat))
(package
  (name "go-github-com-tomasen-realip")
  (version "0.0.0-20180522021738-f0c99a92ddce")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/tomasen/realip")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1iz2cwks2ywwvvnbfmw3pfyz4ql7z0f8s9sdj6pzirpp75zar9nn"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/tomasen/realip"))
  (home-page "https://github.com/tomasen/realip")
  (synopsis "RealIP")
  (description
   "Go package that can be used to get client's real public IP, which usually useful\nfor logging HTTP server.")
  (license license:expat))
(package
  (name "go-github-com-transparency-dev-merkle")
  (version "0.0.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/transparency-dev/merkle")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1r3fcdja48pb00jlrpgdig8y5gbs3p6f0canl1xbay74mwvibc55"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/transparency-dev/merkle"))
  (propagated-inputs
   `(("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)))
  (home-page
   "https://github.com/transparency-dev/merkle")
  (synopsis "Merkle")
  (description
   "Package merkle provides Merkle tree interfaces and implementation.")
  (license license:asl2.0))
(package
  (name "go-go-etcd-io-etcd-client-v3")
  (version "3.5.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/etcd-io/etcd")
           (commit (string-append "client/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0d6zja2s2cw6jprldcq1nxghvbwfr5168n29yyyr9m9biiwilpap"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.etcd.io/etcd/client/v3"
     #:unpack-path
     "go.etcd.io/etcd/client/v3"))
  (propagated-inputs
   `(("go-sigs-k8s-io-yaml" ,go-sigs-k8s-io-yaml)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-go-uber-org-zap" ,go-go-uber-org-zap)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-grpc-ecosystem-go-grpc-prometheus"
      ,go-github-com-grpc-ecosystem-go-grpc-prometheus)
     ("go-github-com-dustin-go-humanize"
      ,go-github-com-dustin-go-humanize)))
  (home-page "https://go.etcd.io/etcd/client/v3")
  (synopsis "etcd/clientv3")
  (description
   "Package clientv3 implements the official Go etcd client for v3.")
  (license license:asl2.0))
(package
  (name "go-go-etcd-io-etcd-etcdctl-v3")
  (version "3.5.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/etcd-io/etcd")
           (commit (string-append "etcdctl/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0d6zja2s2cw6jprldcq1nxghvbwfr5168n29yyyr9m9biiwilpap"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.etcd.io/etcd/etcdctl/v3"
     #:unpack-path
     "go.etcd.io/etcd/etcdctl/v3"))
  (propagated-inputs
   `(("go-gopkg-in-cheggaaa-pb-v1"
      ,go-gopkg-in-cheggaaa-pb-v1)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-golang-org-x-time" ,go-golang-org-x-time)
     ("go-go-uber-org-zap" ,go-go-uber-org-zap)
     ("go-github-com-urfave-cli"
      ,go-github-com-urfave-cli)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-olekukonko-tablewriter"
      ,go-github-com-olekukonko-tablewriter)
     ("go-github-com-dustin-go-humanize"
      ,go-github-com-dustin-go-humanize)
     ("go-github-com-bgentry-speakeasy"
      ,go-github-com-bgentry-speakeasy)))
  (home-page "https://go.etcd.io/etcd/etcdctl/v3")
  (synopsis "etcdctl")
  (description
   "etcdctl is a command line application that controls etcd.")
  (license license:asl2.0))
(package
  (name "go-gopkg-in-cheggaaa-pb-v1")
  (version "1.0.28")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gopkg.in/cheggaaa/pb.v1")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "13a66cqbpdif804qj12z9ad8r24va9q41gfk71qbc4zg1wsxs3rh"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "gopkg.in/cheggaaa/pb.v1"
     #:unpack-path
     "gopkg.in/cheggaaa/pb.v1"))
  (home-page "https://gopkg.in/cheggaaa/pb.v1")
  (synopsis "Terminal progress bar for Go")
  (description "Simple console progress bars")
  (license license:bsd-3))
(package
  (name "go-go-etcd-io-etcd-v3")
  (version "3.5.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/etcd-io/etcd")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0d6zja2s2cw6jprldcq1nxghvbwfr5168n29yyyr9m9biiwilpap"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "go.etcd.io/etcd/v3"
     #:unpack-path
     "go.etcd.io/etcd/v3"))
  (propagated-inputs
   `(("go-gopkg-in-cheggaaa-pb-v1"
      ,go-gopkg-in-cheggaaa-pb-v1)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-golang-org-x-time" ,go-golang-org-x-time)
     ("go-go-uber-org-zap" ,go-go-uber-org-zap)
     ("go-go-etcd-io-bbolt" ,go-go-etcd-io-bbolt)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-dustin-go-humanize"
      ,go-github-com-dustin-go-humanize)
     ("go-github-com-bgentry-speakeasy"
      ,go-github-com-bgentry-speakeasy)))
  (home-page "https://go.etcd.io/etcd/v3")
  (synopsis "etcd")
  (description
   "@strong{Note}: The @code{main} branch may be in an  during development.  For\nstable versions, see @url{https://github.com/etcd-io/etcd/releases,releases}.")
  (license license:asl2.0))
(package
  (name "go-github-com-google-certificate-transparency-go")
  (version "1.1.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/google/certificate-transparency-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0spxd98l2mpfpppfngav8qdk1jd9pvqsq63n72lp9jn12sg0qap3"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/google/certificate-transparency-go"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-time" ,go-golang-org-x-time)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-go-etcd-io-etcd-v3" ,go-go-etcd-io-etcd-v3)
     ("go-go-etcd-io-etcd-etcdctl-v3"
      ,go-go-etcd-io-etcd-etcdctl-v3)
     ("go-go-etcd-io-etcd-client-v3"
      ,go-go-etcd-io-etcd-client-v3)
     ("go-github-com-transparency-dev-merkle"
      ,go-github-com-transparency-dev-merkle)
     ("go-github-com-tomasen-realip"
      ,go-github-com-tomasen-realip)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-sergi-go-diff"
      ,go-github-com-sergi-go-diff)
     ("go-github-com-rs-cors" ,go-github-com-rs-cors)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-mohae-deepcopy"
      ,go-github-com-mohae-deepcopy)
     ("go-github-com-mattn-go-sqlite3"
      ,go-github-com-mattn-go-sqlite3)
     ("go-github-com-kylelemons-godebug"
      ,go-github-com-kylelemons-godebug)
     ("go-github-com-gorilla-mux"
      ,go-github-com-gorilla-mux)
     ("go-github-com-google-trillian"
      ,go-github-com-google-trillian)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-mock"
      ,go-github-com-golang-mock)
     ("go-github-com-golang-glog"
      ,go-github-com-golang-glog)
     ("go-github-com-fullstorydev-grpcurl"
      ,go-github-com-fullstorydev-grpcurl)
     ("go-github-com-cpuguy83-go-md2man-v2"
      ,go-github-com-cpuguy83-go-md2man-v2)))
  (home-page
   "https://github.com/google/certificate-transparency-go")
  (synopsis "Certificate Transparency: Go Code")
  (description
   "Package ct holds core types and utilities for Certificate Transparency.")
  (license license:asl2.0))
(package
  (name "go-github-com-grpc-ecosystem-go-grpc-prometheus")
  (version "1.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/grpc-ecosystem/go-grpc-prometheus")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1lzk54h7np32b3acidg1ggbn8ppbnns0m71gcg9d1qkkdh8zrijl"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/grpc-ecosystem/go-grpc-prometheus"))
  (home-page
   "https://github.com/grpc-ecosystem/go-grpc-prometheus")
  (synopsis
   "Go gRPC Interceptors for Prometheus monitoring")
  (description
   "@url{https://prometheus.io/,Prometheus} monitoring for your\n@url{https://github.com/grpc/grpc-go,gRPC Go} servers and clients.")
  (license license:asl2.0))
(package
  (name "go-github-com-data-dog-go-sqlmock")
  (version "1.5.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/DATA-DOG/go-sqlmock")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "19vn6xf3wqam312g30f7qdcrh8km3wzqsa43qipyz2y5ma2l7pd4"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/DATA-DOG/go-sqlmock"))
  (home-page
   "https://github.com/DATA-DOG/go-sqlmock")
  (synopsis "Sql driver mock for Golang")
  (description
   "Package sqlmock is a mock library implementing sql driver.  Which has one and\nonly purpose - to simulate any sql driver behavior in tests, without needing a\nreal database connection.  It helps to maintain correct **TDD** workflow.")
  (license license:bsd-3))
(package
  (name "go-github-com-gin-contrib-sse")
  (version "0.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gin-contrib/sse")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "072nq91a65n5xvwslqjyvydfd0mfpnvb3vwjyfvmzm1ym96wr1nd"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gin-contrib/sse"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page "https://github.com/gin-contrib/sse")
  (synopsis "Server-Sent Events")
  (description
   "Server-sent events (SSE) is a technology where a browser receives automatic\nupdates from a server via HTTP connection.  The Server-Sent Events EventSource\nAPI is @url{http://www.w3.org/TR/2009/WD-eventsource-20091029/,standardized as\npart of HTML5[1] by the W3C}.")
  (license license:expat))
(package
  (name "go-github-com-go-playground-assert-v2")
  (version "2.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-playground/assert")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "13mb07dxhcy9ydqbracnrpfj682g6sazjpm56yrlbn2jc1yfy44c"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/go-playground/assert/v2"))
  (home-page
   "https://github.com/go-playground/assert")
  (synopsis "Package assert")
  (description
   "Package assert provides some basic assertion functions for testing and also\nprovides the building blocks for creating your own more complex validations.")
  (license license:expat))
(package
  (name "go-github-com-go-playground-validator-v10")
  (version "10.11.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-playground/validator")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "03sd3gd3pl2bv07ivrixp3h5hrw1d1llrpjdalh9jbgby0x2f8ig"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/go-playground/validator/v10"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-rogpeppe-go-internal"
      ,go-github-com-rogpeppe-go-internal)
     ("go-github-com-leodido-go-urn"
      ,go-github-com-leodido-go-urn)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)
     ("go-github-com-go-playground-universal-translator"
      ,go-github-com-go-playground-universal-translator)
     ("go-github-com-go-playground-locales"
      ,go-github-com-go-playground-locales)
     ("go-github-com-go-playground-assert-v2"
      ,go-github-com-go-playground-assert-v2)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)))
  (home-page
   "https://github.com/go-playground/validator")
  (synopsis "Package validator")
  (description
   "Package validator implements value validations for structs and individual fields\nbased on tags.")
  (license license:expat))
(package
  (name "go-github-com-json-iterator-go")
  (version "1.1.12")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/json-iterator/go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1c8f0hxm18wivx31bs615x3vxs2j3ba0v6vxchsjhldc8kl311bz"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/json-iterator/go"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-modern-go-reflect2"
      ,go-github-com-modern-go-reflect2)
     ("go-github-com-modern-go-concurrent"
      ,go-github-com-modern-go-concurrent)
     ("go-github-com-google-gofuzz"
      ,go-github-com-google-gofuzz)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)))
  (home-page "https://github.com/json-iterator/go")
  (synopsis "Benchmark")
  (description
   "Package jsoniter implements encoding and decoding of JSON as defined in\n@url{https://rfc-editor.org/rfc/rfc4627.html,RFC 4627} and provides interfaces\nwith identical syntax of standard lib encoding/json.  Converting from\nencoding/json to jsoniter is no more than replacing the package with jsoniter\nand variable type declarations (if any).  jsoniter interfaces gives 100%\ncompatibility with code using standard lib.")
  (license license:expat))
(package
  (name "go-github-com-pelletier-go-toml-v2")
  (version "2.0.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/pelletier/go-toml")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0s849mw7bcci49dihh1xpyipcizzils4zdksc2rhdyn92zr20vgn"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/pelletier/go-toml/v2"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page
   "https://github.com/pelletier/go-toml")
  (synopsis "go-toml v2")
  (description
   "Package toml is a library to read and write TOML documents.")
  (license license:expat))
(package
  (name "go-github-com-ugorji-go")
  (version "1.2.7")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ugorji/go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0h4mbxp8zyhash342l00fd5726yhfmgrlk6v7sl6k8fd6mkb10l4"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/ugorji/go"))
  (propagated-inputs
   `(("go-github-com-ugorji-go-codec"
      ,go-github-com-ugorji-go-codec)))
  (home-page "https://github.com/ugorji/go")
  (synopsis "go-codec")
  (description
   "This repository contains the @code{go-codec} library, the @code{codecgen} tool\nand benchmarks for comparing against other libraries.")
  (license license:expat))
(package
  (name "go-github-com-ugorji-go-codec")
  (version "1.2.7")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ugorji/go")
           (commit (string-append "codec/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0h4mbxp8zyhash342l00fd5726yhfmgrlk6v7sl6k8fd6mkb10l4"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/ugorji/go/codec"
     #:unpack-path
     "github.com/ugorji/go"))
  (propagated-inputs
   `(("go-github-com-ugorji-go"
      ,go-github-com-ugorji-go)))
  (home-page "https://github.com/ugorji/go")
  (synopsis
   "Package Documentation for github.com/ugorji/go/codec")
  (description
   "Package codec provides a High Performance, Feature-Rich Idiomatic Go 1.4+\ncodec/encoding library for binc, msgpack, cbor, json.")
  (license license:expat))
(package
  (name "go-github-com-modern-go-reflect2")
  (version "1.0.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/modern-go/reflect2")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "05a89f9j4nj8v1bchfkv2sy8piz746ikj831ilbp54g8dqhl8vzr"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/modern-go/reflect2"))
  (home-page
   "https://github.com/modern-go/reflect2")
  (synopsis "reflect2")
  (description
   "reflect api that avoids runtime reflect.Value cost")
  (license license:asl2.0))
(package
  (name "go-github-com-gin-gonic-gin")
  (version "1.8.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gin-gonic/gin")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0fbs44q2w1cx891l3i1jxfrvf9v3ar3hlb8vnqlg7nbkch04jkdf"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gin-gonic/gin"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-modern-go-reflect2"
      ,go-github-com-modern-go-reflect2)
     ("go-github-com-modern-go-concurrent"
      ,go-github-com-modern-go-concurrent)
     ("go-github-com-leodido-go-urn"
      ,go-github-com-leodido-go-urn)
     ("go-github-com-go-playground-universal-translator"
      ,go-github-com-go-playground-universal-translator)
     ("go-github-com-go-playground-locales"
      ,go-github-com-go-playground-locales)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-ugorji-go-codec"
      ,go-github-com-ugorji-go-codec)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-pelletier-go-toml-v2"
      ,go-github-com-pelletier-go-toml-v2)
     ("go-github-com-mattn-go-isatty"
      ,go-github-com-mattn-go-isatty)
     ("go-github-com-json-iterator-go"
      ,go-github-com-json-iterator-go)
     ("go-github-com-goccy-go-json"
      ,go-github-com-goccy-go-json)
     ("go-github-com-go-playground-validator-v10"
      ,go-github-com-go-playground-validator-v10)
     ("go-github-com-gin-contrib-sse"
      ,go-github-com-gin-contrib-sse)))
  (home-page "https://github.com/gin-gonic/gin")
  (synopsis "Gin Web Framework")
  (description
   "Package gin implements a HTTP web framework called gin.")
  (license license:expat))
(package
  (name "go-github-com-gobuffalo-attrs")
  (version "1.0.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gobuffalo/attrs")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1vlc39rjpmghbn2bgfml9np1l235sb3caq4nps20lwkwif2fn65p"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gobuffalo/attrs"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-gobuffalo-flect"
      ,go-github-com-gobuffalo-flect)))
  (home-page "https://github.com/gobuffalo/attrs")
  (synopsis "attrs")
  (description #f)
  (license license:expat))
(package
  (name "go-github-com-joho-godotenv")
  (version "1.4.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/joho/godotenv")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1036h59vyhb58n817az6yg0zw5wa87yb86i7fnbdq8cw46mnjgw8"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/joho/godotenv"))
  (home-page "https://github.com/joho/godotenv")
  (synopsis "GoDotEnv")
  (description
   "Package godotenv is a go port of the ruby dotenv library\n(@url{https://github.com/bkeepers/dotenv,https://github.com/bkeepers/dotenv})")
  (license license:expat))
(package
  (name "go-github-com-gobuffalo-envy")
  (version "1.10.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gobuffalo/envy")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0mypzac59ml8ry80ffmargdpdla6ivarl755byahg9a2p1ar0341"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gobuffalo/envy"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-rogpeppe-go-internal"
      ,go-github-com-rogpeppe-go-internal)
     ("go-github-com-joho-godotenv"
      ,go-github-com-joho-godotenv)))
  (home-page "https://github.com/gobuffalo/envy")
  (synopsis "envy")
  (description
   "package envy makes working with ENV variables in Go trivial.")
  (license (list license:expat license:expat)))
(package
  (name "go-github-com-gobuffalo-fizz")
  (version "1.14.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gobuffalo/fizz")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1p4kg9xyq09iq2inawpsz3baa6dvp414yqhlpl5xcrr4zr8s796l"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gobuffalo/fizz"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-kballard-go-shellquote"
      ,go-github-com-kballard-go-shellquote)
     ("go-github-com-gobuffalo-plush-v4"
      ,go-github-com-gobuffalo-plush-v4)
     ("go-github-com-go-sql-driver-mysql"
      ,go-github-com-go-sql-driver-mysql)
     ("go-github-com-masterminds-semver-v3"
      ,go-github-com-masterminds-semver-v3)))
  (home-page "https://github.com/gobuffalo/fizz")
  (synopsis "Fizz")
  (description
   "Package fizz is a common DSL for writing SQL migrations")
  (license license:expat))
(package
  (name "go-github-com-gobuffalo-packd")
  (version "1.0.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gobuffalo/packd")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0am0wdhxj0xa06sjpv73l3myypk0ix05ninbg5z04yfmbpyqdf5f"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gobuffalo/packd"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page "https://github.com/gobuffalo/packd")
  (synopsis "github.com/gobuffalo/packd")
  (description
   "This is a collection of interfaces designed to make using\n@url{https://github.com/gobuffalo/packr,github.com/gobuffalo/packr} easier, and\nto make the transition between v1 and v2 as seamless as possible.")
  (license license:expat))
(package
  (name "go-github-com-gobuffalo-genny-v2")
  (version "2.0.13")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gobuffalo/genny")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0ckmf22df99c43jh83phk1phr4jfvvvdhvdhxrx1lawa4im9ak7y"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gobuffalo/genny/v2"))
  (propagated-inputs
   `(("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-gobuffalo-plush-v4"
      ,go-github-com-gobuffalo-plush-v4)
     ("go-github-com-gobuffalo-packd"
      ,go-github-com-gobuffalo-packd)
     ("go-github-com-gobuffalo-logger"
      ,go-github-com-gobuffalo-logger)))
  (home-page "https://github.com/gobuffalo/genny")
  (synopsis "Genny")
  (description
   "Package genny is a _framework_ for writing modular generators, it however,\ndoesn't actually generate anything.  It just makes it easier for you to. :)")
  (license license:expat))
(package
  (name "go-github-com-gobuffalo-logger")
  (version "1.0.7")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gobuffalo/logger")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "02jwpxrm0x72czjdyab65pzssy4wz353ldqpkjzwfda16sf5d3vm"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gobuffalo/logger"))
  (propagated-inputs
   `(("go-golang-org-x-term" ,go-golang-org-x-term)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)))
  (home-page "https://github.com/gobuffalo/logger")
  (synopsis "Logger")
  (description
   "The @url{https://godoc.org/github.com/gobuffalo/logger#Logger,(code\nlogger.Logger)} interface is used throughout Buffalo apps, and other systems, to\nlog a whole manner of things.")
  (license license:expat))
(package
  (name "go-github-com-gobuffalo-nulls")
  (version "0.4.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gobuffalo/nulls")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "06ajysjks8xq7g1prjpx5aiv39s8j1pzxk27pvq9fafg3i68vr5n"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gobuffalo/nulls"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-mattn-go-sqlite3"
      ,go-github-com-mattn-go-sqlite3)
     ("go-github-com-jmoiron-sqlx"
      ,go-github-com-jmoiron-sqlx)
     ("go-github-com-gofrs-uuid"
      ,go-github-com-gofrs-uuid)))
  (home-page "https://github.com/gobuffalo/nulls")
  (synopsis "github.com/gobuffalo/nulls")
  (description
   "This package should be used in place of the built-in null types in the\n@code{sql} package.")
  (license license:expat))
(package
  (name "go-github-com-sourcegraph-annotate")
  (version "0.0.0-20160123013949-f4cad6c6324d")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/sourcegraph/annotate")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "13ja1ap9sh9mpi39wd3scgalgxs4rms6ngyknzg1sl5za1r9k4cp"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/sourcegraph/annotate"))
  (home-page
   "https://github.com/sourcegraph/annotate")
  (synopsis "annotate")
  (description
   "This package provides a Go package for applying multiple sets of annotations to\na region of text.")
  (license license:bsd-3))
(package
  (name "go-github-com-sourcegraph-syntaxhighlight")
  (version "0.0.0-20170531221838-bd320f5d308e")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/sourcegraph/syntaxhighlight")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "01pf2ny2q76hwy05d1407799hah7qbnaqww5dszba287shraar92"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/sourcegraph/syntaxhighlight"))
  (home-page
   "https://github.com/sourcegraph/syntaxhighlight")
  (synopsis "syntaxhighlight")
  (description
   "Package syntaxhighlight provides syntax highlighting for code.  It currently\nuses a language-independent lexer and performs decently on JavaScript, Java,\nRuby, Python, Go, and C.")
  (license license:bsd-3))
(package
  (name "go-github-com-gobuffalo-github-flavored-markdown")
  (version "1.1.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gobuffalo/github_flavored_markdown")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0svs7qa6vh7ivbjh8dv1j74paf7k3hd3gk4kjdx3i22zxfdhzpqw"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/gobuffalo/github_flavored_markdown"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-sourcegraph-syntaxhighlight"
      ,go-github-com-sourcegraph-syntaxhighlight)
     ("go-github-com-sourcegraph-annotate"
      ,go-github-com-sourcegraph-annotate)
     ("go-github-com-sergi-go-diff"
      ,go-github-com-sergi-go-diff)
     ("go-github-com-microcosm-cc-bluemonday"
      ,go-github-com-microcosm-cc-bluemonday)))
  (home-page
   "https://github.com/gobuffalo/github_flavored_markdown")
  (synopsis "github_flavored_markdown")
  (description
   "Package github_flavored_markdown provides a GitHub Flavored Markdown renderer\nwith fenced code block highlighting, clickable heading anchor links.")
  (license license:expat))
(package
  (name "go-github-com-gobuffalo-helpers")
  (version "0.6.6")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gobuffalo/helpers")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "034z0nki1r4h9f2c5icyi5qpx7a7sbcyll6p6nm2v3wa3l0w4478"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gobuffalo/helpers"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-gobuffalo-tags-v3"
      ,go-github-com-gobuffalo-tags-v3)
     ("go-github-com-gobuffalo-github-flavored-markdown"
      ,go-github-com-gobuffalo-github-flavored-markdown)
     ("go-github-com-gobuffalo-flect"
      ,go-github-com-gobuffalo-flect)))
  (home-page
   "https://github.com/gobuffalo/helpers")
  (synopsis "Helpers")
  (description
   "Form implements a @code{github.com/gobuffalo/plush} helper around the\nbootstrap.New function in the @code{github.com/gobuffalo/tags/form/bootstrap}\npackage")
  (license license:expat))
(package
  (name "go-github-com-gobuffalo-tags-v3")
  (version "3.1.4")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gobuffalo/tags")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1qa2ariji9ax26in6wk257vza776vqvjw05l0xxrnsfnzi4c4v2s"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gobuffalo/tags/v3"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-gofrs-uuid"
      ,go-github-com-gofrs-uuid)
     ("go-github-com-gobuffalo-validate-v3"
      ,go-github-com-gobuffalo-validate-v3)
     ("go-github-com-gobuffalo-flect"
      ,go-github-com-gobuffalo-flect)
     ("go-github-com-fatih-structs"
      ,go-github-com-fatih-structs)))
  (home-page "https://github.com/gobuffalo/tags")
  (synopsis "Tags")
  (description
   "Easily build HTML tags in Go! This package is especially useful when using\n@url{http://gobuffalo.io,http://gobuffalo.io}.")
  (license license:expat))
(package
  (name "go-github-com-gobuffalo-plush-v4")
  (version "4.1.15")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gobuffalo/plush")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1ysf035m6wzv35yy9v4y9wi1gdmmav4bih3140h3llww1djg7y99"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gobuffalo/plush/v4"))
  (propagated-inputs
   `(("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-gobuffalo-tags-v3"
      ,go-github-com-gobuffalo-tags-v3)
     ("go-github-com-gobuffalo-helpers"
      ,go-github-com-gobuffalo-helpers)
     ("go-github-com-gobuffalo-github-flavored-markdown"
      ,go-github-com-gobuffalo-github-flavored-markdown)))
  (home-page "https://github.com/gobuffalo/plush")
  (synopsis "Plush")
  (description
   "Plush is the templating system that @url{http://golang.org,Go} both needs\ndeserves.  Powerful, flexible, and extendable, Plush is there to make writing\nyour templates that much easier.")
  (license license:expat))
(package
  (name "go-github-com-gobuffalo-flect")
  (version "0.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gobuffalo/flect")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0n0j8wyabi0ybqdairk03p5fba5cs2psyh1a2hp49yc4lzxxa276"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gobuffalo/flect"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page "https://github.com/gobuffalo/flect")
  (synopsis "Flect")
  (description
   "Package flect is a new inflection engine to replace\n[@url{https://github.com/markbates/inflect,https://github.com/markbates/inflect}](@url{https://github.com/markbates/inflect,https://github.com/markbates/inflect})\ndesigned to be more modular, more readable, and easier to fix issues on than the\noriginal.")
  (license license:expat))
(package
  (name "go-github-com-gobuffalo-validate-v3")
  (version "3.3.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gobuffalo/validate")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "02bbv3v69b9kcvyry4v9w145kcbqi38frq5biczl702cs4j7xc3k"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/gobuffalo/validate/v3"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-gofrs-uuid"
      ,go-github-com-gofrs-uuid)
     ("go-github-com-gobuffalo-flect"
      ,go-github-com-gobuffalo-flect)))
  (home-page
   "https://github.com/gobuffalo/validate")
  (synopsis "github.com/gobuffalo/validate")
  (description
   "This package provides a framework for writing validations for Go applications.\nIt does provide you with few validators, but if you need others you can easly\nbuild them.")
  (license (list license:expat license:expat)))
(package
  (name "go-github-com-cockroachdb-apd")
  (version "1.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/cockroachdb/apd")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "14jnnqpdsa3vxh2zpznd2dpnychcrlkljppfplrigrs245slyh72"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/cockroachdb/apd"))
  (home-page "https://github.com/cockroachdb/apd")
  (synopsis "apd")
  (description
   "Package apd implements arbitrary-precision decimals.")
  (license license:asl2.0))
(package
  (name "go-github-com-go-logfmt-logfmt")
  (version "0.5.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-logfmt/logfmt")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "01fs4x2aqw2qcsz18s4nfvyqv3rcwz5xmgpk3bic6nzgyzsjd7dp"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-logfmt/logfmt"))
  (home-page "https://github.com/go-logfmt/logfmt")
  (synopsis "logfmt")
  (description
   "Package logfmt implements utilities to marshal and unmarshal data in the logfmt\nformat.  The logfmt format records key/value pairs in a way that balances\nreadability for humans and simplicity of computer parsing.  It is most commonly\nused as a more human friendly alternative to JSON for structured logging.")
  (license license:expat))
(package
  (name "go-github-com-go-kit-log")
  (version "0.2.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-kit/log")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1xjv2g1cd1iaghhm1c1zw0lcz89a9zq5xradyjipvrbqxbxckqm6"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-kit/log"))
  (propagated-inputs
   `(("go-github-com-go-logfmt-logfmt"
      ,go-github-com-go-logfmt-logfmt)))
  (home-page "https://github.com/go-kit/log")
  (synopsis "package log")
  (description
   "Package log provides a structured logger.")
  (license license:expat))
(package
  (name "go-github-com-gofrs-uuid")
  (version "4.3.0+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gofrs/uuid")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0rrkj9kswznj838wspji21yqvv5k1w2dd9x9r8dh9djyc44sf0vf"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gofrs/uuid"))
  (home-page "https://github.com/gofrs/uuid")
  (synopsis "UUID")
  (description
   "Package uuid provides implementations of the Universally Unique Identifier\n(UUID), as specified in RFC-4122 and the Peabody RFC Draft (revision 03).")
  (license license:expat))
(package
  (name "go-github-com-jackc-pgmock")
  (version "0.0.0-20210724152146-4ad1a8207f65")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jackc/pgmock")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "189hp5fkvavwgg7z0z9b9xj88ypsphvb7s4dpwa5aj42jm39nqha"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jackc/pgmock"))
  (propagated-inputs
   `(("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-jackc-pgproto3-v2"
      ,go-github-com-jackc-pgproto3-v2)
     ("go-github-com-jackc-pgconn"
      ,go-github-com-jackc-pgconn)))
  (home-page "https://github.com/jackc/pgmock")
  (synopsis "pgmock")
  (description
   "Package pgmock provides the ability to mock a PostgreSQL server.")
  (license license:expat))
(package
  (name "go-github-com-jackc-pgpassfile")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jackc/pgpassfile")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1crw06lzksgimbmr1a3sr00azg2v7l4qkvjra1cpmzzq5mncaj8z"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jackc/pgpassfile"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page "https://github.com/jackc/pgpassfile")
  (synopsis "pgpassfile")
  (description
   "Package pgpassfile is a parser PostgreSQL .pgpass files.")
  (license license:expat))
(package
  (name "go-github-com-jackc-chunkreader-v2")
  (version "2.0.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jackc/chunkreader")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0fj585hp3s4cjfzncr5gmim96p0b956pqdf4nm7yan1ipfch9l1c"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jackc/chunkreader/v2"))
  (home-page
   "https://github.com/jackc/chunkreader")
  (synopsis "chunkreader")
  (description
   "Package chunkreader provides an io.Reader wrapper that minimizes IO reads and\nmemory allocations.")
  (license license:expat))
(package
  (name "go-github-com-jackc-pgproto3-v2")
  (version "2.3.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jackc/pgproto3")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0flyzzbkg1zw12dcfwn9dc9g2s9z56bqg92m3whb5iyxypa3rpy9"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jackc/pgproto3/v2"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-jackc-pgio"
      ,go-github-com-jackc-pgio)
     ("go-github-com-jackc-chunkreader-v2"
      ,go-github-com-jackc-chunkreader-v2)))
  (home-page "https://github.com/jackc/pgproto3")
  (synopsis "pgproto3")
  (description
   "Package pgproto3 is a encoder and decoder of the PostgreSQL wire protocol\nversion 3.")
  (license license:expat))
(package
  (name "go-github-com-jackc-pgservicefile")
  (version "0.0.0-20200714003250-2b9c44734f2b")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jackc/pgservicefile")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "13gbi0ad58rm3rcgj8bssc7hgrqwva0q015fw57vx5cxb4rcrmxh"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jackc/pgservicefile"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page
   "https://github.com/jackc/pgservicefile")
  (synopsis "pgservicefile")
  (description
   "Package pgservicefile is a parser for PostgreSQL service files (e.g.\n.pg_service.conf).")
  (license license:expat))
(package
  (name "go-github-com-jackc-pgconn")
  (version "1.13.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jackc/pgconn")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "14pgrbnc6p2fqjfcan8l73iy3nr12fmva9p9vss0r1fh9skwlw1x"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jackc/pgconn"))
  (propagated-inputs
   `(("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-jackc-pgservicefile"
      ,go-github-com-jackc-pgservicefile)
     ("go-github-com-jackc-pgproto3-v2"
      ,go-github-com-jackc-pgproto3-v2)
     ("go-github-com-jackc-pgpassfile"
      ,go-github-com-jackc-pgpassfile)
     ("go-github-com-jackc-pgmock"
      ,go-github-com-jackc-pgmock)
     ("go-github-com-jackc-pgio"
      ,go-github-com-jackc-pgio)
     ("go-github-com-jackc-chunkreader-v2"
      ,go-github-com-jackc-chunkreader-v2)))
  (home-page "https://github.com/jackc/pgconn")
  (synopsis "pgconn")
  (description
   "Package pgconn is a low-level PostgreSQL database driver.")
  (license license:expat))
(package
  (name "go-github-com-jackc-pgio")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jackc/pgio")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0l17gpn11wf6jm5kbfmxh8j00n5zpmwck3wr91f1cv34k4chyvg1"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jackc/pgio"))
  (home-page "https://github.com/jackc/pgio")
  (synopsis "pgio")
  (description
   "Package pgio is a low-level toolkit building messages in the PostgreSQL wire\nprotocol.")
  (license license:expat))
(package
  (name "go-github-com-jackc-pgtype")
  (version "1.12.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jackc/pgtype")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "19h3x3k3wsahpch48dqa5zkzjvqwly6x6d80w5jmvrwcczp526qw"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jackc/pgtype"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-shopspring-decimal"
      ,go-github-com-shopspring-decimal)
     ("go-github-com-lib-pq" ,go-github-com-lib-pq)
     ("go-github-com-jackc-pgx-v4"
      ,go-github-com-jackc-pgx-v4)
     ("go-github-com-jackc-pgio"
      ,go-github-com-jackc-pgio)
     ("go-github-com-jackc-pgconn"
      ,go-github-com-jackc-pgconn)
     ("go-github-com-gofrs-uuid"
      ,go-github-com-gofrs-uuid)))
  (home-page "https://github.com/jackc/pgtype")
  (synopsis "pgtype")
  (description
   "pgtype implements Go types for over 70 PostgreSQL types.  pgtype is the type\nsystem underlying the\n@url{https://github.com/jackc/pgx,https://github.com/jackc/pgx} PostgreSQL\ndriver.  These types support the binary format for enhanced performance with\npgx.  They also support the database/sql @code{Scan} and @code{Value} interfaces\nand can be used with @url{https://github.com/lib/pq,https://github.com/lib/pq}.")
  (license license:expat))
(package
  (name "go-github-com-jackc-puddle")
  (version "1.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jackc/puddle")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0382q7xjdw5wx6174i2sf4gnc5ppgj9snvrvh3rcnwg02yd0np38"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jackc/puddle"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page "https://github.com/jackc/puddle")
  (synopsis "Puddle")
  (description
   "Package puddle is a generic resource pool.")
  (license license:expat))
(package
  (name "go-github-com-godbus-dbus-v5")
  (version "5.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/godbus/dbus")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1kayd4x7idrhi06ahh5kqkgwzgh9icvv71mjar2d0jl486dfs8r5"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/godbus/dbus/v5"))
  (home-page "https://github.com/godbus/dbus")
  (synopsis "dbus")
  (description
   "Package dbus implements bindings to the D-Bus message bus system.")
  (license license:bsd-2))
(package
  (name "go-github-com-coreos-go-systemd-v22")
  (version "22.4.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/coreos/go-systemd")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1193kh6fpcb29nbfpany7vwwipdkp9zwx8xak2pmrjijrbgs9y26"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/coreos/go-systemd/v22"))
  (propagated-inputs
   `(("go-github-com-godbus-dbus-v5"
      ,go-github-com-godbus-dbus-v5)))
  (home-page
   "https://github.com/coreos/go-systemd")
  (synopsis "go-systemd")
  (description
   "Go bindings to systemd.  The project has several packages:")
  (license license:asl2.0))
(package
  (name "go-github-com-rs-xid")
  (version "1.4.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/rs/xid")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1j1dcrq9napvdfl6g2vd631iv12myirhlmn6kgw8f1jnrkaqgdaz"))))
  (build-system go-build-system)
  (arguments '(#:import-path "github.com/rs/xid"))
  (home-page "https://github.com/rs/xid")
  (synopsis "Globally Unique ID Generator")
  (description
   "Package xid is a globally unique id generator suited for web scale")
  (license license:expat))
(package
  (name "go-github-com-rs-zerolog")
  (version "1.28.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/rs/zerolog")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "123wsr1cbyza15k50md2lq5si5gccb2ah7ykcggsmlr60xm485q9"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/rs/zerolog"))
  (propagated-inputs
   `(("go-github-com-rs-xid" ,go-github-com-rs-xid)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-coreos-go-systemd-v22"
      ,go-github-com-coreos-go-systemd-v22)))
  (home-page "https://github.com/rs/zerolog")
  (synopsis "Zero Allocation JSON Logger")
  (description
   "Package zerolog provides a lightweight logging library dedicated to JSON\nlogging.")
  (license license:expat))
(package
  (name "go-gopkg-in-inconshreveable-log15-v2")
  (version "2.0.0-20200109203555-b30bc20e4fd1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gopkg.in/inconshreveable/log15.v2")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "03frzx2ar9fsvdrlq7d1k8askaxkyvml2im39ipcmnz760rv52hx"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "gopkg.in/inconshreveable/log15.v2"
     #:unpack-path
     "gopkg.in/inconshreveable/log15.v2"))
  (home-page
   "https://gopkg.in/inconshreveable/log15.v2")
  (synopsis "log15")
  (description
   "Package log15 provides an opinionated, simple toolkit for best-practice logging\nthat is both human and machine readable.  It is modeled after the standard\nlibrary's io and net/http packages.")
  (license license:asl2.0))
(package
  (name "go-github-com-jackc-pgx-v4")
  (version "4.17.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jackc/pgx")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1n7p1bail3m3hx13rym308skjp8aiqic8l6p6y0s7i4kymx0zwmk"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jackc/pgx/v4"))
  (propagated-inputs
   `(("go-gopkg-in-inconshreveable-log15-v2"
      ,go-gopkg-in-inconshreveable-log15-v2)
     ("go-go-uber-org-zap" ,go-go-uber-org-zap)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-shopspring-decimal"
      ,go-github-com-shopspring-decimal)
     ("go-github-com-rs-zerolog"
      ,go-github-com-rs-zerolog)
     ("go-github-com-jackc-puddle"
      ,go-github-com-jackc-puddle)
     ("go-github-com-jackc-pgtype"
      ,go-github-com-jackc-pgtype)
     ("go-github-com-jackc-pgproto3-v2"
      ,go-github-com-jackc-pgproto3-v2)
     ("go-github-com-jackc-pgio"
      ,go-github-com-jackc-pgio)
     ("go-github-com-jackc-pgconn"
      ,go-github-com-jackc-pgconn)
     ("go-github-com-gofrs-uuid"
      ,go-github-com-gofrs-uuid)
     ("go-github-com-go-kit-log"
      ,go-github-com-go-kit-log)
     ("go-github-com-cockroachdb-apd"
      ,go-github-com-cockroachdb-apd)
     ("go-github-com-masterminds-semver-v3"
      ,go-github-com-masterminds-semver-v3)))
  (home-page "https://github.com/jackc/pgx")
  (synopsis "pgx - PostgreSQL Driver and Toolkit")
  (description
   "Package pgx is a PostgreSQL database driver.")
  (license license:expat))
(package
  (name "go-github-com-luna-duclos-instrumentedsql")
  (version "1.1.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/luna-duclos/instrumentedsql")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1m6ngx6vwy5fawsrnb4g45rxl41w1s6bsclpgi6shsjn7nr05kfl"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/luna-duclos/instrumentedsql"))
  (home-page
   "https://github.com/luna-duclos/instrumentedsql")
  (synopsis "instrumentedsql")
  (description
   "This package provides a sql driver that will wrap any other driver and log/trace\nall its calls")
  (license license:expat))
(package
  (name "go-github-com-gobuffalo-pop-v6")
  (version "6.0.7")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/gobuffalo/pop")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0d4qcyz2v73wmz445m9fbs4dxfqbylsymm9yvafrv61jdxi4m9rv"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/gobuffalo/pop/v6"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-mattn-go-sqlite3"
      ,go-github-com-mattn-go-sqlite3)
     ("go-github-com-luna-duclos-instrumentedsql"
      ,go-github-com-luna-duclos-instrumentedsql)
     ("go-github-com-lib-pq" ,go-github-com-lib-pq)
     ("go-github-com-jmoiron-sqlx"
      ,go-github-com-jmoiron-sqlx)
     ("go-github-com-jackc-pgx-v4"
      ,go-github-com-jackc-pgx-v4)
     ("go-github-com-jackc-pgconn"
      ,go-github-com-jackc-pgconn)
     ("go-github-com-gofrs-uuid"
      ,go-github-com-gofrs-uuid)
     ("go-github-com-gobuffalo-validate-v3"
      ,go-github-com-gobuffalo-validate-v3)
     ("go-github-com-gobuffalo-plush-v4"
      ,go-github-com-gobuffalo-plush-v4)
     ("go-github-com-gobuffalo-nulls"
      ,go-github-com-gobuffalo-nulls)
     ("go-github-com-gobuffalo-logger"
      ,go-github-com-gobuffalo-logger)
     ("go-github-com-gobuffalo-genny-v2"
      ,go-github-com-gobuffalo-genny-v2)
     ("go-github-com-gobuffalo-flect"
      ,go-github-com-gobuffalo-flect)
     ("go-github-com-gobuffalo-fizz"
      ,go-github-com-gobuffalo-fizz)
     ("go-github-com-gobuffalo-envy"
      ,go-github-com-gobuffalo-envy)
     ("go-github-com-gobuffalo-attrs"
      ,go-github-com-gobuffalo-attrs)
     ("go-github-com-go-sql-driver-mysql"
      ,go-github-com-go-sql-driver-mysql)
     ("go-github-com-fatih-color"
      ,go-github-com-fatih-color)))
  (home-page "https://github.com/gobuffalo/pop")
  (synopsis "POP")
  (description
   "Package pop wraps the absolutely amazing\n@url{https://github.com/jmoiron/sqlx,https://github.com/jmoiron/sqlx} library.\nIt cleans up some of the common patterns and workflows usually associated with\ndealing with databases in Go.")
  (license license:expat))
(package
  (name "go-github-com-jmoiron-sqlx")
  (version "1.3.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jmoiron/sqlx")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "09snd3gfi3sm3gib7jdc6p8zxpn2ah0isqnibbag6f63k473yj14"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jmoiron/sqlx"))
  (propagated-inputs
   `(("go-github-com-mattn-go-sqlite3"
      ,go-github-com-mattn-go-sqlite3)
     ("go-github-com-lib-pq" ,go-github-com-lib-pq)
     ("go-github-com-go-sql-driver-mysql"
      ,go-github-com-go-sql-driver-mysql)))
  (home-page "https://github.com/jmoiron/sqlx")
  (synopsis "sqlx")
  (description
   "Package sqlx provides general purpose extensions to database/sql.")
  (license license:expat))
(package
  (name "go-github-com-julienschmidt-httprouter")
  (version "1.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/julienschmidt/httprouter")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1a6sy0ysqknsjssjh7qg1dqn21xmj9a36c57nrk7srfmab4ffmk1"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/julienschmidt/httprouter"))
  (home-page
   "https://github.com/julienschmidt/httprouter")
  (synopsis "HttpRouter")
  (description
   "Package httprouter is a trie based high performance HTTP request router.")
  (license license:bsd-3))
(package
  (name "go-github-com-golang-jwt-jwt")
  (version "3.2.2+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/golang-jwt/jwt")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0hq8wz11g6kddx9ab0icl5h3k4lrivk1ixappnr5db2ng2wjks9c"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/golang-jwt/jwt"))
  (home-page "https://github.com/golang-jwt/jwt")
  (synopsis "jwt-go")
  (description
   "Package jwt is a Go implementation of JSON Web Tokens:\n@url{http://self-issued.info/docs/draft-jones-json-web-token.html,http://self-issued.info/docs/draft-jones-json-web-token.html}")
  (license license:expat))
(package
  (name "go-github-com-labstack-gommon")
  (version "0.3.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/labstack/gommon")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0bmz94zxhp14izbxn58mbf9q87jv5klp0wqbklvkg1bmw3ycqv8h"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/labstack/gommon"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-valyala-fasttemplate"
      ,go-github-com-valyala-fasttemplate)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-mattn-go-isatty"
      ,go-github-com-mattn-go-isatty)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)))
  (home-page "https://github.com/labstack/gommon")
  (synopsis "Gommon")
  (description "Common packages for Go")
  (license license:expat))
(package
  (name "go-github-com-valyala-fasttemplate")
  (version "1.2.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/valyala/fasttemplate")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0bd1hxxg1bzx307adpd1s4yjaa6q51cqk4qvqskfflxvgll79vdn"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/valyala/fasttemplate"))
  (propagated-inputs
   `(("go-github-com-valyala-bytebufferpool"
      ,go-github-com-valyala-bytebufferpool)))
  (home-page
   "https://github.com/valyala/fasttemplate")
  (synopsis "fasttemplate")
  (description
   "Package fasttemplate implements simple and fast template library.")
  (license license:expat))
(package
  (name "go-github-com-labstack-echo-v4")
  (version "4.9.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/labstack/echo")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0rkly8pfy2i6l560hd0mfafgiwarribd06dqpqz4asma1pzj13c5"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/labstack/echo/v4"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-valyala-bytebufferpool"
      ,go-github-com-valyala-bytebufferpool)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-mattn-go-isatty"
      ,go-github-com-mattn-go-isatty)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-golang-org-x-time" ,go-golang-org-x-time)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-valyala-fasttemplate"
      ,go-github-com-valyala-fasttemplate)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-labstack-gommon"
      ,go-github-com-labstack-gommon)
     ("go-github-com-golang-jwt-jwt"
      ,go-github-com-golang-jwt-jwt)))
  (home-page "https://github.com/labstack/echo")
  (synopsis "Supported Go versions")
  (description
   "Package echo implements high performance, minimalist Go web framework.")
  (license license:expat))
(package
  (name "go-github-com-modern-go-concurrent")
  (version "0.0.0-20180306012644-bacd9c7ef1dd")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/modern-go/concurrent")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0s0fxccsyb8icjmiym5k7prcqx36hvgdwl588y0491gi18k5i4zs"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/modern-go/concurrent"))
  (home-page
   "https://github.com/modern-go/concurrent")
  (synopsis "concurrent")
  (description
   "because sync.Map is only available in go 1.9, we can use concurrent.Map to make\ncode portable")
  (license license:asl2.0))
(package
  (name "go-goji-io-v3")
  (version "3.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/goji/goji")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0y7l8v6ha6qd9zppnhas1sakvyf292v661c9z8qzbrsx1ban7kkm"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "goji.io/v3"
     #:unpack-path
     "goji.io/v3"))
  (home-page "https://goji.io/v3")
  (synopsis "Goji")
  (description
   "Package goji is a minimalistic and flexible HTTP request multiplexer.")
  (license license:expat))
(package
  (name "go-github-com-honeycombio-beeline-go")
  (version "1.10.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/honeycombio/beeline-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1nkf0443q07qhpvqrk1i5qzxddpf0146rp6f9z4qa7b73bfqfqbn"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/honeycombio/beeline-go"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-goji-io-v3" ,go-goji-io-v3)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-modern-go-concurrent"
      ,go-github-com-modern-go-concurrent)
     ("go-github-com-labstack-echo-v4"
      ,go-github-com-labstack-echo-v4)
     ("go-github-com-julienschmidt-httprouter"
      ,go-github-com-julienschmidt-httprouter)
     ("go-github-com-jmoiron-sqlx"
      ,go-github-com-jmoiron-sqlx)
     ("go-github-com-honeycombio-libhoney-go"
      ,go-github-com-honeycombio-libhoney-go)
     ("go-github-com-gorilla-mux"
      ,go-github-com-gorilla-mux)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-gobuffalo-pop-v6"
      ,go-github-com-gobuffalo-pop-v6)
     ("go-github-com-go-sql-driver-mysql"
      ,go-github-com-go-sql-driver-mysql)
     ("go-github-com-gin-gonic-gin"
      ,go-github-com-gin-gonic-gin)
     ("go-github-com-felixge-httpsnoop"
      ,go-github-com-felixge-httpsnoop)
     ("go-github-com-data-dog-go-sqlmock"
      ,go-github-com-data-dog-go-sqlmock)))
  (home-page
   "https://github.com/honeycombio/beeline-go")
  (synopsis "Honeycomb Beeline for Go")
  (description
   "Package beeline aids adding instrumentation to go apps using Honeycomb.")
  (license license:asl2.0))
(package
  (name "go-github-com-hpcloud-tail")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hpcloud/tail")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1njpzc0pi1acg5zx9y6vj9xi6ksbsc5d387rd6904hy6rh2m6kn0"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/hpcloud/tail"))
  (home-page "https://github.com/hpcloud/tail")
  (synopsis "Go package for tail-ing files")
  (description
   "This package provides a Go package striving to emulate the features of the BSD\n@code{tail} program.")
  (license license:expat))
(package
  (name "go-github-com-jmhodges-clock")
  (version "1.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jmhodges/clock")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0ys85dlg3zzzwl7p46kf5gckjm1ddgr5dai42v4p3wn9nm6ln252"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jmhodges/clock"))
  (home-page "https://github.com/jmhodges/clock")
  (synopsis "clock")
  (description
   "Package clock provides an abstraction for system time that enables testing of\ntime-sensitive code.")
  (license license:expat))
(package
  (name "go-github-com-letsencrypt-challtestsrv")
  (version "1.2.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/letsencrypt/challtestsrv")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1n7yk0bjh3y4qrng00dhr0zjzr5ynv9nwg8l52wv7k5sj238c7pb"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/letsencrypt/challtestsrv"))
  (propagated-inputs
   `(("go-github-com-miekg-dns"
      ,go-github-com-miekg-dns)))
  (home-page
   "https://github.com/letsencrypt/challtestsrv")
  (synopsis "Challenge Test Server")
  (description
   "Package challtestsrv provides a trivially insecure acme challenge response\nserver for rapidly testing HTTP-01, DNS-01 and TLS-ALPN-01 challenge types.")
  (license license:mpl2.0))
(package
  (name "go-github-com-letsencrypt-pkcs11key-v4")
  (version "4.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/letsencrypt/pkcs11key")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1ynmw2zhsr1m880clc2hgmc53cx6b69wdcjddw9pz0sysddnpb81"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/letsencrypt/pkcs11key/v4"))
  (propagated-inputs
   `(("go-github-com-miekg-pkcs11"
      ,go-github-com-miekg-pkcs11)))
  (home-page
   "https://github.com/letsencrypt/pkcs11key")
  (synopsis #f)
  (description
   "Package pkcs11key implements crypto.Signer for PKCS #11 private keys.  See\n@url{https://docs.oasis-open.org/pkcs11/pkcs11-base/v2.40/pkcs11-base-v2.40.pdf,https://docs.oasis-open.org/pkcs11/pkcs11-base/v2.40/pkcs11-base-v2.40.pdf}\nfor details of the Cryptoki PKCS#11 API.  See\n@url{https://github.com/letsencrypt/pkcs11key/blob/master/test.sh,https://github.com/letsencrypt/pkcs11key/blob/master/test.sh}\nfor examples of how to test and/or benchmark.")
  (license license:bsd-2))
(package
  (name "go-github-com-miekg-dns")
  (version "1.1.50")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/miekg/dns")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1svvx9qamy3hy0ms8iwbisqjmfkbza0zljmds6091siq150ggmws"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/miekg/dns"))
  (propagated-inputs
   `(("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-net" ,go-golang-org-x-net)))
  (home-page "https://github.com/miekg/dns")
  (synopsis
   "Alternative (more granular) approach to a DNS library")
  (description
   "Package dns implements a full featured interface to the Domain Name System.\nBoth server- and client-side programming is supported.  The package allows\ncomplete control over what is sent out to the DNS.  The API follows the\nless-is-more principle, by presenting a small, clean interface.")
  (license license:bsd-3))
(package
  (name "go-github-com-miekg-pkcs11")
  (version "1.1.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/miekg/pkcs11")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1w403kmqxf8w25aap4901nrm7wj0wf95lrwwv1nvdjnwi8jjgapz"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/miekg/pkcs11"))
  (home-page "https://github.com/miekg/pkcs11")
  (synopsis "PKCS#11")
  (description
   "Package pkcs11 is a wrapper around the PKCS#11 cryptographic library.")
  (license license:bsd-3))
(package
  (name "go-github-com-mreiferson-go-httpclient")
  (version "0.0.0-20201222173833-5e475fde3a4d")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/mreiferson/go-httpclient")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "13s8va5zlbmh5lgxpkdrcxvbqkbxszjvf27p1njv75q4jk8g5vhq"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/mreiferson/go-httpclient"))
  (home-page
   "https://github.com/mreiferson/go-httpclient")
  (synopsis "go-httpclient")
  (description
   "This package provides an HTTP Transport that implements the `RoundTripper`\ninterface and can be used as a built in replacement for the standard library's,\nproviding:")
  (license license:expat))
(package
  (name "go-github-com-zmap-rc2")
  (version "0.0.0-20190804163417-abaa70531248")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/zmap/rc2")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0ghg9k628a32iivpb5bd8xx5cjbxsbbm3rnmi3qjjbywb1y9kk68"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/zmap/rc2"))
  (home-page "https://github.com/zmap/rc2")
  (synopsis #f)
  (description #f)
  (license #f))
(package
  (name "go-github-com-zmap-zcertificate")
  (version "0.0.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/zmap/zcertificate")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1lxayyxb0gvls1l05jglqdf8b7zxz3gw94kwbgxvshs7lc0s6hnw"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/zmap/zcertificate"))
  (propagated-inputs
   `(("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-zmap-zlint-v3"
      ,go-github-com-zmap-zlint-v3)
     ("go-github-com-zmap-zcrypto"
      ,go-github-com-zmap-zcrypto)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)))
  (home-page
   "https://github.com/zmap/zcertificate")
  (synopsis "ZCertificate")
  (description
   "ZCertificate parses X.509 certificates and runs\n@url{https://github.com/zmap/zlint,ZLint}.")
  (license license:asl2.0))
(package
  (name "go-github-com-zmap-zcrypto")
  (version "0.0.0-20220803033029-557f3e4940be")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/zmap/zcrypto")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "09v4a98phawk6pnjgik71s2ajmxkyvpnf42kss8zdpgf505v2z5m"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/zmap/zcrypto"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-zmap-zcertificate"
      ,go-github-com-zmap-zcertificate)
     ("go-github-com-zmap-rc2"
      ,go-github-com-zmap-rc2)
     ("go-github-com-weppos-publicsuffix-go"
      ,go-github-com-weppos-publicsuffix-go)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-op-go-logging"
      ,go-github-com-op-go-logging)
     ("go-github-com-mreiferson-go-httpclient"
      ,go-github-com-mreiferson-go-httpclient)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)))
  (home-page "https://github.com/zmap/zcrypto")
  (synopsis "ZCrypto")
  (description
   "ZCrypto is a research and data collection cryptography library, designed to be\nused for measuring and analyzing cryptographic deployments on the Internet.  It\nis largely centered around the WebPKI.")
  (license (license:non-copyleft "file://LICENSE")))
(package
  (name "go-github-com-weppos-publicsuffix-go-publicsuffix-generator")
  (version "0.0.0-20220927085643-dc0d00c92642")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/weppos/publicsuffix-go")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "11gap9m4bhizp1is8w1vxs1z8i5i41xmrd1b138hz2px2gam7y67"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/weppos/publicsuffix-go/publicsuffix/generator"
     #:unpack-path
     "github.com/weppos/publicsuffix-go"))
  (propagated-inputs
   `(("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-weppos-publicsuffix-go"
      ,go-github-com-weppos-publicsuffix-go)
     ("go-github-com-google-go-querystring"
      ,go-github-com-google-go-querystring)
     ("go-github-com-google-go-github"
      ,go-github-com-google-go-github)))
  (home-page
   "https://github.com/weppos/publicsuffix-go")
  (synopsis #f)
  (description #f)
  (license #f))
(package
  (name "go-github-com-weppos-publicsuffix-go")
  (version "0.20.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/weppos/publicsuffix-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0239irx83rbpdnwfydz2wk9s1fg9mvm9rkdjs5yv9gz64wph8f6w"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/weppos/publicsuffix-go"))
  (propagated-inputs
   `(("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-weppos-publicsuffix-go-publicsuffix-generator"
      ,go-github-com-weppos-publicsuffix-go-publicsuffix-generator)))
  (home-page
   "https://github.com/weppos/publicsuffix-go")
  (synopsis "Public Suffix")
  (description
   "The package  provides a Go domain name parser based on the\n@url{http://publicsuffix.org/,Public Suffix List}.")
  (license license:expat))
(package
  (name "go-github-com-zmap-zlint-v3")
  (version "3.3.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/zmap/zlint")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1nri6lc0wjbrsjnyplyyk1zvnnfqx8fhapss6n2g6vb2fiq23ygc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/zmap/zlint/v3"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-weppos-publicsuffix-go"
      ,go-github-com-weppos-publicsuffix-go)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-zmap-zcrypto"
      ,go-github-com-zmap-zcrypto)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)))
  (home-page "https://github.com/zmap/zlint")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-github-com-aws-aws-sdk-go-v2-aws-protocol-eventstream")
  (version "1.4.8")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit
            (string-append
             "aws/protocol/eventstream/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "05v3b74krwa9y00glvbk9czsha1q5c3bkc8f2kjkh0c49na37vbr"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/aws/aws-sdk-go-v2/aws/protocol/eventstream"
     #:unpack-path
     "github.com/aws/aws-sdk-go-v2"))
  (propagated-inputs
   `(("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-github-com-aws-aws-sdk-go-v2-internal-v4a")
  (version "1.0.14")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit
            (string-append "internal/v4a/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lyqchcph8yfkldcd5pxmk70wqrspp5wgx03fn6xi643w1l2hm5j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/aws/aws-sdk-go-v2/internal/v4a"
     #:unpack-path
     "github.com/aws/aws-sdk-go-v2"))
  (propagated-inputs
   `(("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-github-com-aws-aws-sdk-go-v2-service-internal-accept-encoding")
  (version "1.9.9")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit
            (string-append
             "service/internal/accept-encoding/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "05v3b74krwa9y00glvbk9czsha1q5c3bkc8f2kjkh0c49na37vbr"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding"
     #:unpack-path
     "github.com/aws/aws-sdk-go-v2"))
  (propagated-inputs
   `(("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis #f)
  (description
   "Package acceptencoding provides customizations associated with Accept Encoding\nHeader.")
  (license license:asl2.0))
(package
  (name "go-github-com-aws-aws-sdk-go-v2-service-internal-checksum")
  (version "1.1.18")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit
            (string-append
             "service/internal/checksum/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lyqchcph8yfkldcd5pxmk70wqrspp5wgx03fn6xi643w1l2hm5j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/aws/aws-sdk-go-v2/service/internal/checksum"
     #:unpack-path
     "github.com/aws/aws-sdk-go-v2"))
  (propagated-inputs
   `(("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-github-com-aws-aws-sdk-go-v2-service-internal-s3shared")
  (version "1.13.17")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit
            (string-append
             "service/internal/s3shared/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lyqchcph8yfkldcd5pxmk70wqrspp5wgx03fn6xi643w1l2hm5j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/aws/aws-sdk-go-v2/service/internal/s3shared"
     #:unpack-path
     "github.com/aws/aws-sdk-go-v2"))
  (propagated-inputs
   `(("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-github-com-beorn7-perks")
  (version "1.0.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/beorn7/perks")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "17n4yygjxa6p499dj3yaqzfww2g7528165cl13haj97hlx94dgl7"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/beorn7/perks"))
  (home-page "https://github.com/beorn7/perks")
  (synopsis "Perks for Go (golang.org)")
  (description
   "Perks contains the Go package quantile that computes approximate quantiles over\nan unbounded data stream within low memory and CPU bounds.")
  (license license:expat))
(package
  (name "go-github-com-dgryski-go-rendezvous")
  (version "0.0.0-20200823014737-9f7001d12a5f")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/dgryski/go-rendezvous")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0hhdbsm5k19kh1fyxs4aibza9jylils4p3555lr8xalhj2iz3zlz"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/dgryski/go-rendezvous"))
  (home-page
   "https://github.com/dgryski/go-rendezvous")
  (synopsis #f)
  (description #f)
  (license license:expat))
(package
  (name "go-github-com-datadog-zstd")
  (version "1.5.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/DataDog/zstd")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1skdl7lw5v4zzrd6lkk22b1ikgnclx3djimcbbmx1zgi3k32jqzb"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/DataDog/zstd"))
  (home-page "https://github.com/DataDog/zstd")
  (synopsis "Zstd Go Wrapper")
  (description
   "The current headers and C files are from  (Commit\n@url{https://github.com/facebook/zstd/releases/tag/v1.5.0,10f0e699}).")
  (license license:bsd-3))
(package
  (name "go-github-com-facebookgo-clock")
  (version "0.0.0-20150410010913-600d898af40a")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/facebookarchive/clock")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1z3jxwsqll65il7rcdx5j4dggg6w143z24h3agk09xvsc2iyj7a2"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/facebookgo/clock"))
  (home-page "https://github.com/facebookgo/clock")
  (synopsis "clock")
  (description
   "Clock is a small library for mocking time in Go.  It provides an interface\naround the standard library's @url{http://golang.org/pkg/time/,(code time)}\npackage so that the application can use the realtime clock while tests can use\nthe mock clock.")
  (license license:expat))
(package
  (name "go-github-com-facebookgo-ensure")
  (version "0.0.0-20200202191622-63f1cf65ac4c")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/facebookarchive/ensure")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "05vi49g2967i5awcb1z69i2n5b5hwn06682kw90x81hbxlr0px36"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/facebookgo/ensure"))
  (home-page
   "https://github.com/facebookgo/ensure")
  (synopsis "ensure")
  (description
   "Package ensure provides utilities for testing to ensure the given conditions are\nmet and Fatal if they aren't satisified.")
  (license license:bsd-3))
(package
  (name "go-github-com-facebookgo-limitgroup")
  (version "0.0.0-20150612190941-6abd8d71ec01")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/facebookarchive/limitgroup")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0jyiwbn9g85svsfmn2f313b56yshcnaqxpndi6j1lyiasimjy4q0"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/facebookgo/limitgroup"))
  (home-page
   "https://github.com/facebookgo/limitgroup")
  (synopsis "limitgroup")
  (description
   "Package limitgroup provides a sync.WaitGroup equivalent with a configurable\nupper bound.  This is implemented by having Add() block as well if necessary.")
  (license license:bsd-3))
(package
  (name "go-github-com-facebookgo-muster")
  (version "0.0.0-20150708232844-fd3d7953fd52")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/facebookarchive/muster")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "08jbvly031904w9yx6b6vyrk23k3fcpj5fvrjwz631gicbd24vns"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/facebookgo/muster"))
  (home-page
   "https://github.com/facebookgo/muster")
  (synopsis "muster")
  (description
   "Package muster provides a framework for writing libraries that internally batch\noperations.")
  (license license:bsd-3))
(package
  (name "go-github-com-facebookgo-stack")
  (version "0.0.0-20160209184415-751773369052")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/facebookarchive/stack")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "07yr05mz7h007ldpij90zjflwgixp148sbyrdlh1fj5bikr4p8m3"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/facebookgo/stack"))
  (home-page "https://github.com/facebookgo/stack")
  (synopsis "stack")
  (description
   "Package stack provides utilities to capture and pass around stack traces.")
  (license license:bsd-3))
(package
  (name "go-github-com-facebookgo-subset")
  (version "0.0.0-20200203212716-c811ad88dec4")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/facebookarchive/subset")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1sjczgmq26mgqvh7267saypnn4sfdjx467wsm1pgdhyss77mc650"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/facebookgo/subset"))
  (home-page
   "https://github.com/facebookgo/subset")
  (synopsis "subset")
  (description
   "Package subset implements logic to check if a value is a subset of another using\nreflect.")
  (license license:bsd-3))
(package
  (name "go-github-com-honeycombio-libhoney-go")
  (version "1.17.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/honeycombio/libhoney-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0r6vyf83wfrfckvapz5agc1ji9d4xym39za58anhm3xw3h2bg5mc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/honeycombio/libhoney-go"))
  (propagated-inputs
   `(("go-gopkg-in-alexcesaro-statsd-v2"
      ,go-gopkg-in-alexcesaro-statsd-v2)
     ("go-github-com-vmihailenco-msgpack-v5"
      ,go-github-com-vmihailenco-msgpack-v5)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-klauspost-compress"
      ,go-github-com-klauspost-compress)
     ("go-github-com-facebookgo-subset"
      ,go-github-com-facebookgo-subset)
     ("go-github-com-facebookgo-stack"
      ,go-github-com-facebookgo-stack)
     ("go-github-com-facebookgo-muster"
      ,go-github-com-facebookgo-muster)
     ("go-github-com-facebookgo-limitgroup"
      ,go-github-com-facebookgo-limitgroup)
     ("go-github-com-facebookgo-ensure"
      ,go-github-com-facebookgo-ensure)
     ("go-github-com-facebookgo-clock"
      ,go-github-com-facebookgo-clock)
     ("go-github-com-datadog-zstd"
      ,go-github-com-datadog-zstd)))
  (home-page
   "https://github.com/honeycombio/libhoney-go")
  (synopsis "libhoney")
  (description
   "Package libhoney is a client library for sending data to\n@url{https://honeycomb.io,https://honeycomb.io}")
  (license license:asl2.0))
(package
  (name "go-github-com-matttproud-golang-protobuf-extensions")
  (version "1.0.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/matttproud/golang_protobuf_extensions")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1xqsf9vpcrd4hp95rl6kgmjvkv1df4aicfw4l5vfcxcwxknfx2xs"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/matttproud/golang_protobuf_extensions"))
  (propagated-inputs
   `(("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)))
  (home-page
   "https://github.com/matttproud/golang_protobuf_extensions")
  (synopsis "Overview")
  (description
   "This repository provides various Protocol Buffer extensions for the Go language\n(golang), namely support for record length-delimited message streaming.")
  (license license:asl2.0))
(package
  (name "go-github-com-vmihailenco-msgpack-v5")
  (version "5.3.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/vmihailenco/msgpack")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "14zpr0r4xga2c4xpn729gx0qcmnny7ya2glpxy8mfmh7lir5acd5"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/vmihailenco/msgpack/v5"))
  (propagated-inputs
   `(("go-github-com-vmihailenco-tagparser-v2"
      ,go-github-com-vmihailenco-tagparser-v2)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page
   "https://github.com/vmihailenco/msgpack")
  (synopsis "MessagePack encoding for Golang")
  (description "Other projects you may like:")
  (license license:bsd-2))
(package
  (name "go-github-com-vmihailenco-tagparser-v2")
  (version "2.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/vmihailenco/tagparser")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "13arliaz3b4bja9jj7cr5ax4zvxaxm484fwrn0q6d6jjm1l35m1k"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/vmihailenco/tagparser/v2"))
  (home-page
   "https://github.com/vmihailenco/tagparser")
  (synopsis "Opinionated Golang tag parser")
  (description "Install:")
  (license license:bsd-2))
(package
  (name "go-gopkg-in-alexcesaro-statsd-v2")
  (version "2.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gopkg.in/alexcesaro/statsd.v2")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "02jdx68vicwsgabrnwgg1rvc45rinyh8ikinqgbqc56c5hkx3brj"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "gopkg.in/alexcesaro/statsd.v2"
     #:unpack-path
     "gopkg.in/alexcesaro/statsd.v2"))
  (home-page
   "https://gopkg.in/alexcesaro/statsd.v2")
  (synopsis "statsd")
  (description
   "Package statsd is a simple and efficient StatsD client.")
  (license license:expat))
(package
  (name "go-gopkg-in-fsnotify-v1")
  (version "1.4.7")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gopkg.in/fsnotify.v1")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "07va9crci0ijlivbb7q57d2rz9h27zgn2fsm60spjsqpdbvyrx4g"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "gopkg.in/fsnotify.v1"
     #:unpack-path
     "gopkg.in/fsnotify.v1"))
  (home-page "https://gopkg.in/fsnotify.v1")
  (synopsis "File system notifications for Go")
  (description
   "Package fsnotify provides a platform-independent interface for file system\nnotifications.")
  (license license:bsd-3))
(package
  (name "go-github-com-letsencrypt-boulder")
  (version "0.0.0-20220928225919-b99058d3fc95")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/letsencrypt/boulder")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1nvk600cglxmk2fkclwsw1v998jxmaq5crdgzq7dmilzv0zqam67"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/letsencrypt/boulder"))
  (propagated-inputs
   `(("go-gopkg-in-tomb-v1" ,go-gopkg-in-tomb-v1)
     ("go-gopkg-in-fsnotify-v1"
      ,go-gopkg-in-fsnotify-v1)
     ("go-gopkg-in-alexcesaro-statsd-v2"
      ,go-gopkg-in-alexcesaro-statsd-v2)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-mod" ,go-golang-org-x-mod)
     ("go-github-com-vmihailenco-tagparser-v2"
      ,go-github-com-vmihailenco-tagparser-v2)
     ("go-github-com-vmihailenco-msgpack-v5"
      ,go-github-com-vmihailenco-msgpack-v5)
     ("go-github-com-syndtr-goleveldb"
      ,go-github-com-syndtr-goleveldb)
     ("go-github-com-prometheus-procfs"
      ,go-github-com-prometheus-procfs)
     ("go-github-com-prometheus-common"
      ,go-github-com-prometheus-common)
     ("go-github-com-matttproud-golang-protobuf-extensions"
      ,go-github-com-matttproud-golang-protobuf-extensions)
     ("go-github-com-klauspost-compress"
      ,go-github-com-klauspost-compress)
     ("go-github-com-honeycombio-libhoney-go"
      ,go-github-com-honeycombio-libhoney-go)
     ("go-github-com-golang-snappy"
      ,go-github-com-golang-snappy)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-felixge-httpsnoop"
      ,go-github-com-felixge-httpsnoop)
     ("go-github-com-facebookgo-muster"
      ,go-github-com-facebookgo-muster)
     ("go-github-com-facebookgo-limitgroup"
      ,go-github-com-facebookgo-limitgroup)
     ("go-github-com-facebookgo-clock"
      ,go-github-com-facebookgo-clock)
     ("go-github-com-dgryski-go-rendezvous"
      ,go-github-com-dgryski-go-rendezvous)
     ("go-github-com-cespare-xxhash-v2"
      ,go-github-com-cespare-xxhash-v2)
     ("go-github-com-beorn7-perks"
      ,go-github-com-beorn7-perks)
     ("go-github-com-aws-aws-sdk-go-v2-service-sts"
      ,go-github-com-aws-aws-sdk-go-v2-service-sts)
     ("go-github-com-aws-aws-sdk-go-v2-service-sso"
      ,go-github-com-aws-aws-sdk-go-v2-service-sso)
     ("go-github-com-aws-aws-sdk-go-v2-service-internal-s3shared"
      ,go-github-com-aws-aws-sdk-go-v2-service-internal-s3shared)
     ("go-github-com-aws-aws-sdk-go-v2-service-internal-presigned-url"
      ,go-github-com-aws-aws-sdk-go-v2-service-internal-presigned-url)
     ("go-github-com-aws-aws-sdk-go-v2-service-internal-checksum"
      ,go-github-com-aws-aws-sdk-go-v2-service-internal-checksum)
     ("go-github-com-aws-aws-sdk-go-v2-service-internal-accept-encoding"
      ,go-github-com-aws-aws-sdk-go-v2-service-internal-accept-encoding)
     ("go-github-com-aws-aws-sdk-go-v2-internal-v4a"
      ,go-github-com-aws-aws-sdk-go-v2-internal-v4a)
     ("go-github-com-aws-aws-sdk-go-v2-internal-ini"
      ,go-github-com-aws-aws-sdk-go-v2-internal-ini)
     ("go-github-com-aws-aws-sdk-go-v2-internal-endpoints-v2"
      ,go-github-com-aws-aws-sdk-go-v2-internal-endpoints-v2)
     ("go-github-com-aws-aws-sdk-go-v2-internal-configsources"
      ,go-github-com-aws-aws-sdk-go-v2-internal-configsources)
     ("go-github-com-aws-aws-sdk-go-v2-feature-ec2-imds"
      ,go-github-com-aws-aws-sdk-go-v2-feature-ec2-imds)
     ("go-github-com-aws-aws-sdk-go-v2-credentials"
      ,go-github-com-aws-aws-sdk-go-v2-credentials)
     ("go-github-com-aws-aws-sdk-go-v2-aws-protocol-eventstream"
      ,go-github-com-aws-aws-sdk-go-v2-aws-protocol-eventstream)
     ("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-square-go-jose-v2"
      ,go-gopkg-in-square-go-jose-v2)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-term" ,go-golang-org-x-term)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-zmap-zlint-v3"
      ,go-github-com-zmap-zlint-v3)
     ("go-github-com-zmap-zcrypto"
      ,go-github-com-zmap-zcrypto)
     ("go-github-com-weppos-publicsuffix-go"
      ,go-github-com-weppos-publicsuffix-go)
     ("go-github-com-titanous-rocacheck"
      ,go-github-com-titanous-rocacheck)
     ("go-github-com-prometheus-client-model"
      ,go-github-com-prometheus-client-model)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-miekg-pkcs11"
      ,go-github-com-miekg-pkcs11)
     ("go-github-com-miekg-dns"
      ,go-github-com-miekg-dns)
     ("go-github-com-letsencrypt-pkcs11key-v4"
      ,go-github-com-letsencrypt-pkcs11key-v4)
     ("go-github-com-letsencrypt-challtestsrv"
      ,go-github-com-letsencrypt-challtestsrv)
     ("go-github-com-jmhodges-clock"
      ,go-github-com-jmhodges-clock)
     ("go-github-com-hpcloud-tail"
      ,go-github-com-hpcloud-tail)
     ("go-github-com-honeycombio-beeline-go"
      ,go-github-com-honeycombio-beeline-go)
     ("go-github-com-grpc-ecosystem-go-grpc-prometheus"
      ,go-github-com-grpc-ecosystem-go-grpc-prometheus)
     ("go-github-com-google-certificate-transparency-go"
      ,go-github-com-google-certificate-transparency-go)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-github-com-go-sql-driver-mysql"
      ,go-github-com-go-sql-driver-mysql)
     ("go-github-com-go-redis-redis-v8"
      ,go-github-com-go-redis-redis-v8)
     ("go-github-com-go-gorp-gorp-v3"
      ,go-github-com-go-gorp-gorp-v3)
     ("go-github-com-eggsampler-acme-v3"
      ,go-github-com-eggsampler-acme-v3)
     ("go-github-com-beeker1121-goque"
      ,go-github-com-beeker1121-goque)
     ("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)
     ("go-github-com-aws-aws-sdk-go-v2-service-s3"
      ,go-github-com-aws-aws-sdk-go-v2-service-s3)
     ("go-github-com-aws-aws-sdk-go-v2-config"
      ,go-github-com-aws-aws-sdk-go-v2-config)
     ("go-github-com-aws-aws-sdk-go-v2"
      ,go-github-com-aws-aws-sdk-go-v2)))
  (home-page
   "https://github.com/letsencrypt/boulder")
  (synopsis "Boulder - An ACME CA")
  (description
   "This is an implementation of an ACME-based CA.  The  allows the CA to\nautomatically verify that an applicant for a certificate actually controls an\nidentifier, and allows domain holders to issue and revoke certificates for their\ndomains.  Boulder is the software that runs .")
  (license license:mpl2.0))
(package
  (name "go-github-com-pkg-browser")
  (version "0.0.0-20210911075715-681adbf594b8")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/pkg/browser")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1d40cz35x6f5hhals00d2h08l2r9vchpdmc9742s80qbl9fmr615"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/pkg/browser"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
  (home-page "https://github.com/pkg/browser")
  (synopsis "browser")
  (description
   "Package browser provides helpers to open files, readers, and urls in a browser\nwindow.")
  (license license:bsd-2))
(package
  (name "go-github-com-segmentio-ksuid")
  (version "1.0.4")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/segmentio/ksuid")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1qc9w7imal5jk0lw0hwyszs2fh7wjsnbkawgw7kwzdvg9nbahjg7"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/segmentio/ksuid"))
  (home-page "https://github.com/segmentio/ksuid")
  (synopsis "ksuid")
  (description
   "ksuid is an efficient, comprehensive, battle-tested Go library for generating\nand parsing a specific kind of globally unique identifier called a .  This\nlibrary serves as its reference implementation.")
  (license license:expat))
(package
  (name "go-github-com-azure-go-autorest-autorest")
  (version "0.11.28")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Azure/go-autorest")
           (commit (string-append "autorest/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0w0b8z76q0znhzhm8955pwqvvgxk8qfbgj0yqrr5d03chadqk88m"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/Azure/go-autorest/autorest"
     #:unpack-path
     "github.com/Azure/go-autorest"))
  (propagated-inputs
   `(("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-golang-jwt-jwt-v4"
      ,go-github-com-golang-jwt-jwt-v4)
     ("go-github-com-azure-go-autorest-tracing"
      ,go-github-com-azure-go-autorest-tracing)
     ("go-github-com-azure-go-autorest-logger"
      ,go-github-com-azure-go-autorest-logger)
     ("go-github-com-azure-go-autorest-autorest-mocks"
      ,go-github-com-azure-go-autorest-autorest-mocks)
     ("go-github-com-azure-go-autorest-autorest-adal"
      ,go-github-com-azure-go-autorest-autorest-adal)
     ("go-github-com-azure-go-autorest"
      ,go-github-com-azure-go-autorest)))
  (home-page
   "https://github.com/Azure/go-autorest")
  (synopsis #f)
  (description
   "Package autorest implements an HTTP request pipeline suitable for use across\nmultiple go-routines and provides the shared routines relied on by AutoRest (see\n@url{https://github.com/Azure/autorest/,https://github.com/Azure/autorest/})\ngenerated Go code.")
  (license license:asl2.0))
(package
  (name "go-github-com-azure-go-autorest-autorest-azure-auth")
  (version "0.5.11")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Azure/go-autorest")
           (commit
            (string-append
             "autorest/azure/auth/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0z12i9vcc4qahzic3k651cb5qg6mdm1skmlm6n8hwd17xn3d0bkx"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/Azure/go-autorest/autorest/azure/auth"
     #:unpack-path
     "github.com/Azure/go-autorest"))
  (propagated-inputs
   `(("go-github-com-dimchansky-utfbom"
      ,go-github-com-dimchansky-utfbom)
     ("go-github-com-azure-go-autorest-logger"
      ,go-github-com-azure-go-autorest-logger)
     ("go-github-com-azure-go-autorest-autorest-azure-cli"
      ,go-github-com-azure-go-autorest-autorest-azure-cli)
     ("go-github-com-azure-go-autorest-autorest-adal"
      ,go-github-com-azure-go-autorest-autorest-adal)
     ("go-github-com-azure-go-autorest-autorest"
      ,go-github-com-azure-go-autorest-autorest)
     ("go-github-com-azure-go-autorest"
      ,go-github-com-azure-go-autorest)))
  (home-page
   "https://github.com/Azure/go-autorest")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-github-com-azure-go-autorest-autorest-mocks")
  (version "0.4.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Azure/go-autorest")
           (commit
            (string-append "autorest/mocks/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "01nfq39jdnc46jjzj2y5gan1qxacl7g40qw3lzk6skfkwm4f888a"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/Azure/go-autorest/autorest/mocks"
     #:unpack-path
     "github.com/Azure/go-autorest"))
  (propagated-inputs
   `(("go-github-com-azure-go-autorest"
      ,go-github-com-azure-go-autorest)))
  (home-page
   "https://github.com/Azure/go-autorest")
  (synopsis #f)
  (description
   "Package mocks provides mocks and helpers used in testing.")
  (license license:asl2.0))
(package
  (name "go-github-com-azure-go-autorest-autorest-adal")
  (version "0.9.21")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Azure/go-autorest")
           (commit
            (string-append "autorest/adal/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0w0b8z76q0znhzhm8955pwqvvgxk8qfbgj0yqrr5d03chadqk88m"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/Azure/go-autorest/autorest/adal"
     #:unpack-path
     "github.com/Azure/go-autorest"))
  (propagated-inputs
   `(("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-golang-jwt-jwt-v4"
      ,go-github-com-golang-jwt-jwt-v4)
     ("go-github-com-azure-go-autorest-tracing"
      ,go-github-com-azure-go-autorest-tracing)
     ("go-github-com-azure-go-autorest-logger"
      ,go-github-com-azure-go-autorest-logger)
     ("go-github-com-azure-go-autorest-autorest-mocks"
      ,go-github-com-azure-go-autorest-autorest-mocks)
     ("go-github-com-azure-go-autorest-autorest-date"
      ,go-github-com-azure-go-autorest-autorest-date)
     ("go-github-com-azure-go-autorest"
      ,go-github-com-azure-go-autorest)))
  (home-page
   "https://github.com/Azure/go-autorest")
  (synopsis
   "NOTE: This module will go out of support by March 31, 2023.  For authenticating with Azure AD, use module")
  (description
   "This is a standalone package for authenticating with Azure Active Directory from\nother Go libraries and applications, in particular the .")
  (license license:asl2.0))
(package
  (name "go-github-com-azure-go-autorest-autorest-azure-cli")
  (version "0.4.6")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Azure/go-autorest")
           (commit
            (string-append "autorest/azure/cli/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0w0b8z76q0znhzhm8955pwqvvgxk8qfbgj0yqrr5d03chadqk88m"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/Azure/go-autorest/autorest/azure/cli"
     #:unpack-path
     "github.com/Azure/go-autorest"))
  (propagated-inputs
   `(("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-mitchellh-go-homedir"
      ,go-github-com-mitchellh-go-homedir)
     ("go-github-com-golang-jwt-jwt-v4"
      ,go-github-com-golang-jwt-jwt-v4)
     ("go-github-com-dimchansky-utfbom"
      ,go-github-com-dimchansky-utfbom)
     ("go-github-com-azure-go-autorest-autorest-date"
      ,go-github-com-azure-go-autorest-autorest-date)
     ("go-github-com-azure-go-autorest-autorest-adal"
      ,go-github-com-azure-go-autorest-autorest-adal)
     ("go-github-com-azure-go-autorest"
      ,go-github-com-azure-go-autorest)))
  (home-page
   "https://github.com/Azure/go-autorest")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-github-com-azure-go-autorest-autorest-date")
  (version "0.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Azure/go-autorest")
           (commit
            (string-append "autorest/date/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "08594gzj6lmparpqddzp8d7h2647r0jqwgy3lmz9visihklxddiy"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/Azure/go-autorest/autorest/date"
     #:unpack-path
     "github.com/Azure/go-autorest"))
  (propagated-inputs
   `(("go-github-com-azure-go-autorest"
      ,go-github-com-azure-go-autorest)))
  (home-page
   "https://github.com/Azure/go-autorest")
  (synopsis #f)
  (description
   "Package date provides time.Time derivatives that conform to the Swagger.io\n(@url{https://swagger.io/,https://swagger.io/}) defined date   formats: Date and\nDateTime.  Both types may, in most cases, be used in lieu of time.Time types.\nAnd both convert to time.Time through a ToTime method.")
  (license license:asl2.0))
(package
  (name "go-github-com-azure-go-autorest-autorest-validation")
  (version "0.3.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Azure/go-autorest")
           (commit
            (string-append
             "autorest/validation/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1jrzqq2ck5c8xckr1v57w2xdvws8qkri4hapyy0pvls36l2v3d6l"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/Azure/go-autorest/autorest/validation"
     #:unpack-path
     "github.com/Azure/go-autorest"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-azure-go-autorest"
      ,go-github-com-azure-go-autorest)))
  (home-page
   "https://github.com/Azure/go-autorest")
  (synopsis #f)
  (description
   "Package validation provides methods for validating parameter value using\nreflection.")
  (license license:asl2.0))
(package
  (name "go-github-com-azure-go-autorest-logger")
  (version "0.2.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Azure/go-autorest")
           (commit (string-append "logger/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wl004px2nijq9az79dck9lknddh14r3v8q1yygi2msa1byxak4x"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/Azure/go-autorest/logger"
     #:unpack-path
     "github.com/Azure/go-autorest"))
  (propagated-inputs
   `(("go-github-com-azure-go-autorest"
      ,go-github-com-azure-go-autorest)))
  (home-page
   "https://github.com/Azure/go-autorest")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-github-com-azure-go-autorest")
  (version "14.2.0+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Azure/go-autorest")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0z3j6jj2f9r208vgrg4byaczxbygiw97k2cm83qd64bl82vhyjix"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/Azure/go-autorest"))
  (home-page
   "https://github.com/Azure/go-autorest")
  (synopsis "go-autorest")
  (description
   "Package go-autorest provides an HTTP request client for use with\nAutorest-generated API client packages.")
  (license license:asl2.0))
(package
  (name "go-github-com-azure-go-autorest-tracing")
  (version "0.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Azure/go-autorest")
           (commit (string-append "tracing/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "08594gzj6lmparpqddzp8d7h2647r0jqwgy3lmz9visihklxddiy"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/Azure/go-autorest/tracing"
     #:unpack-path
     "github.com/Azure/go-autorest"))
  (propagated-inputs
   `(("go-github-com-azure-go-autorest"
      ,go-github-com-azure-go-autorest)))
  (home-page
   "https://github.com/Azure/go-autorest")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-github-com-aws-aws-sdk-go-v2-credentials")
  (version "1.12.20")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit
            (string-append "credentials/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lyqchcph8yfkldcd5pxmk70wqrspp5wgx03fn6xi643w1l2hm5j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/aws/aws-sdk-go-v2/credentials"
     #:unpack-path
     "github.com/aws/aws-sdk-go-v2"))
  (propagated-inputs
   `(("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis #f)
  (description
   "Package credentials provides types for retrieving credentials from credentials\nsources.")
  (license license:asl2.0))
(package
  (name "go-github-com-aws-aws-sdk-go-v2-feature-ec2-imds")
  (version "1.12.17")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit
            (string-append "feature/ec2/imds/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lyqchcph8yfkldcd5pxmk70wqrspp5wgx03fn6xi643w1l2hm5j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/aws/aws-sdk-go-v2/feature/ec2/imds"
     #:unpack-path
     "github.com/aws/aws-sdk-go-v2"))
  (propagated-inputs
   `(("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis #f)
  (description
   "Package imds provides the API client for interacting with the Amazon EC2\nInstance Metadata Service.")
  (license license:asl2.0))
(package
  (name "go-github-com-aws-aws-sdk-go-v2-internal-configsources")
  (version "1.1.23")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit
            (string-append
             "internal/configsources/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lyqchcph8yfkldcd5pxmk70wqrspp5wgx03fn6xi643w1l2hm5j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/aws/aws-sdk-go-v2/internal/configsources"
     #:unpack-path
     "github.com/aws/aws-sdk-go-v2"))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-github-com-aws-aws-sdk-go-v2-internal-endpoints-v2")
  (version "2.4.17")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit
            (string-append "internal/endpoints/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lyqchcph8yfkldcd5pxmk70wqrspp5wgx03fn6xi643w1l2hm5j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/aws/aws-sdk-go-v2/internal/endpoints/v2"
     #:unpack-path
     "github.com/aws/aws-sdk-go-v2"))
  (propagated-inputs
   `(("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-github-com-aws-aws-sdk-go-v2-internal-ini")
  (version "1.3.24")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit
            (string-append "internal/ini/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lyqchcph8yfkldcd5pxmk70wqrspp5wgx03fn6xi643w1l2hm5j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/aws/aws-sdk-go-v2/internal/ini"
     #:unpack-path
     "github.com/aws/aws-sdk-go-v2"))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis #f)
  (description
   "Package ini is an LL(1) parser for configuration files.")
  (license license:asl2.0))
(package
  (name "go-github-com-aws-aws-sdk-go-v2-service-internal-presigned-url")
  (version "1.9.17")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit
            (string-append
             "service/internal/presigned-url/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lyqchcph8yfkldcd5pxmk70wqrspp5wgx03fn6xi643w1l2hm5j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/aws/aws-sdk-go-v2/service/internal/presigned-url"
     #:unpack-path
     "github.com/aws/aws-sdk-go-v2"))
  (propagated-inputs
   `(("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis #f)
  (description
   "Package presignedurl provides the customizations for API clients to fill in\npresigned URLs into input parameters.")
  (license license:asl2.0))
(package
  (name "go-github-com-aws-aws-sdk-go-v2-service-sso")
  (version "1.11.23")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit
            (string-append "service/sso/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lyqchcph8yfkldcd5pxmk70wqrspp5wgx03fn6xi643w1l2hm5j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/aws/aws-sdk-go-v2/service/sso"
     #:unpack-path
     "github.com/aws/aws-sdk-go-v2"))
  (propagated-inputs
   `(("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis #f)
  (description
   "Package sso provides the API client, operations, and parameter types for AWS\nSingle Sign-On.")
  (license license:asl2.0))
(package
  (name "go-github-com-aws-aws-sdk-go-v2-service-ssooidc")
  (version "1.13.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit
            (string-append "service/ssooidc/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lyqchcph8yfkldcd5pxmk70wqrspp5wgx03fn6xi643w1l2hm5j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/aws/aws-sdk-go-v2/service/ssooidc"
     #:unpack-path
     "github.com/aws/aws-sdk-go-v2"))
  (propagated-inputs
   `(("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis #f)
  (description
   "Package ssooidc provides the API client, operations, and parameter types for AWS\nSSO OIDC.")
  (license license:asl2.0))
(package
  (name "go-github-com-aws-aws-sdk-go-v2-service-sts")
  (version "1.16.19")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/aws-sdk-go-v2")
           (commit
            (string-append "service/sts/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0lyqchcph8yfkldcd5pxmk70wqrspp5wgx03fn6xi643w1l2hm5j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/aws/aws-sdk-go-v2/service/sts"
     #:unpack-path
     "github.com/aws/aws-sdk-go-v2"))
  (propagated-inputs
   `(("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)))
  (home-page
   "https://github.com/aws/aws-sdk-go-v2")
  (synopsis #f)
  (description
   "Package sts provides the API client, operations, and parameter types for AWS\nSecurity Token Service.")
  (license license:asl2.0))
(package
  (name "go-github-com-aws-smithy-go")
  (version "1.13.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aws/smithy-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "182kbmrl3qja5ypc44bcgdly5z65hvqkh14yc21l8nybaid5xvhc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/aws/smithy-go"))
  (propagated-inputs
   `(("go-github-com-jmespath-go-jmespath"
      ,go-github-com-jmespath-go-jmespath)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)))
  (home-page "https://github.com/aws/smithy-go")
  (synopsis "Smithy Go")
  (description
   "Package smithy provides the core components for a Smithy SDK.")
  (license license:asl2.0))
(package
  (name "go-github-com-cenkalti-backoff-v3")
  (version "3.2.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/cenkalti/backoff")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "01h52k1sl6drabm3fgd4yy1iwbz06wcbbh16zd6v4wi7slabma9m"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/cenkalti/backoff/v3"))
  (home-page "https://github.com/cenkalti/backoff")
  (synopsis "Exponential Backoff")
  (description
   "Package backoff implements backoff algorithms for retrying operations.")
  (license license:expat))
(package
  (name "go-github-com-dimchansky-utfbom")
  (version "1.1.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/dimchansky/utfbom")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0ll3wqvifmdanfyg6wsvz31c7n4mnczg2yxb65j35qxrnak89hn3"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/dimchansky/utfbom"))
  (home-page
   "https://github.com/dimchansky/utfbom")
  (synopsis "utfbom")
  (description
   "Package utfbom implements the detection of the BOM (Unicode Byte Order Mark) and\nremoving as necessary.  It wraps an io.Reader object, creating another object\n(Reader) that also implements the io.Reader interface but provides automatic BOM\nchecking and removing as necessary.")
  (license license:asl2.0))
(package
  (name "go-github-com-golang-jwt-jwt-v4")
  (version "4.4.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/golang-jwt/jwt")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1ynimhjlg8l7ywh94vsrvdh4hzh6awb6c5nxkcic73hmjmr63bsf"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/golang-jwt/jwt/v4"))
  (home-page "https://github.com/golang-jwt/jwt")
  (synopsis "jwt-go")
  (description
   "Package jwt is a Go implementation of JSON Web Tokens:\n@url{http://self-issued.info/docs/draft-jones-json-web-token.html,http://self-issued.info/docs/draft-jones-json-web-token.html}")
  (license license:expat))
(package
  (name "go-github-com-hashicorp-go-rootcerts")
  (version "1.0.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/go-rootcerts")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "06z1bxcnr0rma02b6r52m6y0q7niikqjs090vm1i8xi3scyaw1qa"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/hashicorp/go-rootcerts"))
  (propagated-inputs
   `(("go-github-com-mitchellh-go-homedir"
      ,go-github-com-mitchellh-go-homedir)))
  (home-page
   "https://github.com/hashicorp/go-rootcerts")
  (synopsis "rootcerts")
  (description
   "Package rootcerts contains functions to aid in loading CA certificates for TLS\nconnections.")
  (license license:mpl2.0))
(package
  (name "go-github-com-datadog-datadog-go")
  (version "4.8.3+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/DataDog/datadog-go")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "03dc3ld9zyynhmslzlciry6rs06hvd1c5finjip9vj300xaybazl"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/DataDog/datadog-go"))
  (home-page
   "https://github.com/DataDog/datadog-go")
  (synopsis "Datadog Go")
  (description
   "@code{datadog-go} is a library that provides a\n@url{https://docs.datadoghq.com/developers/dogstatsd/?code-lang=go,DogStatsD}\nclient in Golang.")
  (license license:expat))
(package
  (name "go-github-com-circonus-labs-circonus-gometrics")
  (version "2.3.1+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/circonus-labs/circonus-gometrics")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0s2wir711h0k2h8xsypgpzshccnx8jkwjfni7n32l7wd8yng9ngs"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/circonus-labs/circonus-gometrics"))
  (home-page
   "https://github.com/circonus-labs/circonus-gometrics")
  (synopsis
   "Circonus metrics tracking for Go applications")
  (description
   "Package circonusgometrics provides instrumentation for your applications in the\nform of counters, gauges and histograms and allows you to publish them to\nCirconus")
  (license license:bsd-3))
(package
  (name "go-github-com-circonus-labs-circonusllhist")
  (version "0.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/openhistogram/circonusllhist")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "04dkhd0np0kg2rmsnghg613x93glkxhllzjh3ha8k77wdcw6mcak"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/circonus-labs/circonusllhist"))
  (home-page
   "https://github.com/circonus-labs/circonusllhist")
  (synopsis #f)
  (description
   "Package circllhist provides an implementation of Circonus' fixed log-linear\nhistogram data structure.  This allows tracking of histograms in a composable\nway such that accurate error can be reasoned about.")
  (license license:bsd-3))
(package
  (name "go-github-com-hashicorp-go-cleanhttp")
  (version "0.5.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/go-cleanhttp")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1i5xslizzwd966w81bz6dxjwzgml4q9bwqa186bsxd1vi8lqxl9p"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/hashicorp/go-cleanhttp"))
  (home-page
   "https://github.com/hashicorp/go-cleanhttp")
  (synopsis "cleanhttp")
  (description
   "Package cleanhttp offers convenience utilities for acquiring \"clean\"\nhttp.Transport and http.Client structs.")
  (license license:mpl2.0))
(package
  (name "go-github-com-hashicorp-go-retryablehttp")
  (version "0.7.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/go-retryablehttp")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "04cnc6dkccgi8vlmwd83xmzcpxbxrb3wwd1b39rz8hz8ry54vqhm"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/hashicorp/go-retryablehttp"))
  (propagated-inputs
   `(("go-github-com-hashicorp-go-hclog"
      ,go-github-com-hashicorp-go-hclog)
     ("go-github-com-hashicorp-go-cleanhttp"
      ,go-github-com-hashicorp-go-cleanhttp)))
  (home-page
   "https://github.com/hashicorp/go-retryablehttp")
  (synopsis "go-retryablehttp")
  (description
   "Package retryablehttp provides a familiar HTTP client interface with automatic\nretries and exponential backoff.  It is a thin wrapper over the standard\nnet/http client library and exposes nearly the same public API.  This makes\nretryablehttp very easy to drop into existing programs.")
  (license license:mpl2.0))
(package
  (name "go-github-com-pascaldekloe-goe")
  (version "0.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/pascaldekloe/goe")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1dqd3mfb4z2vmv6pg6fhgvfc53vhndk24wcl9lj1rz02n6m279fq"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/pascaldekloe/goe"))
  (home-page "https://github.com/pascaldekloe/goe")
  (synopsis "Go Enterprise")
  (description
   "Common enterprise features for the Go programming language (golang).")
  (license license:cc0))
(package
  (name "go-github-com-armon-go-metrics")
  (version "0.4.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/armon/go-metrics")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "10cmhyaicjawiaa4l0qvlc8afyfnz5n8n1xb6cfh6h9lf1857k5s"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/armon/go-metrics"))
  (propagated-inputs
   `(("go-github-com-tv42-httpunix"
      ,go-github-com-tv42-httpunix)
     ("go-github-com-prometheus-common"
      ,go-github-com-prometheus-common)
     ("go-github-com-prometheus-client-model"
      ,go-github-com-prometheus-client-model)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-pascaldekloe-goe"
      ,go-github-com-pascaldekloe-goe)
     ("go-github-com-hashicorp-go-retryablehttp"
      ,go-github-com-hashicorp-go-retryablehttp)
     ("go-github-com-hashicorp-go-immutable-radix"
      ,go-github-com-hashicorp-go-immutable-radix)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-circonus-labs-circonusllhist"
      ,go-github-com-circonus-labs-circonusllhist)
     ("go-github-com-circonus-labs-circonus-gometrics"
      ,go-github-com-circonus-labs-circonus-gometrics)
     ("go-github-com-datadog-datadog-go"
      ,go-github-com-datadog-datadog-go)))
  (home-page "https://github.com/armon/go-metrics")
  (synopsis "go-metrics")
  (description
   "This library provides a @code{metrics} package which can be used to instrument\ncode, expose application metrics, and profile runtime performance in a flexible\nmanner.")
  (license license:expat))
(package
  (name "go-github-com-jessevdk-go-flags")
  (version "1.5.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jessevdk/go-flags")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "13ixw1yx4bvcj66lkc8zgwf9j7gkvj686g991gycdsafvdvca0lj"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jessevdk/go-flags"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
  (home-page
   "https://github.com/jessevdk/go-flags")
  (synopsis
   "go-flags: a go library for parsing command line arguments")
  (description
   "Package flags provides an extensive command line option parser.  The flags\npackage is similar in functionality to the go built-in flag package but provides\nmore options and uses reflection to provide a convenient and succinct way of\nspecifying command line options.")
  (license license:bsd-3))
(package
  (name "go-github-com-evanphx-json-patch-v5")
  (version "5.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/evanphx/json-patch")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0xrqha67ps24wmzx4yv87pkl25hk4v7lvcga0f18928jzzk4wbvk"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/evanphx/json-patch/v5"))
  (propagated-inputs
   `(("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-jessevdk-go-flags"
      ,go-github-com-jessevdk-go-flags)))
  (home-page
   "https://github.com/evanphx/json-patch")
  (synopsis #f)
  (description #f)
  (license license:bsd-3))
(package
  (name "go-github-com-fatih-structs")
  (version "1.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/fatih/structs")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wrhb8wp8zpzggl61lapb627lw8yv281abvr6vqakmf569nswa9q"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/fatih/structs"))
  (home-page "https://github.com/fatih/structs")
  (synopsis "Structs")
  (description
   "Package structs contains various utilities functions to work with structs.")
  (license license:expat))
(package
  (name "go-github-com-go-ldap-ldap-v3")
  (version "3.4.4")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-ldap/ldap")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "15h0172cpz94d90n8njwd0p6ksrgdyjil63gfvpwi90g8nxz8km5"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-ldap/ldap/v3"))
  (propagated-inputs
   `(("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-go-asn1-ber-asn1-ber"
      ,go-github-com-go-asn1-ber-asn1-ber)
     ("go-github-com-azure-go-ntlmssp"
      ,go-github-com-azure-go-ntlmssp)))
  (home-page "https://github.com/go-ldap/ldap")
  (synopsis #f)
  (description
   "Package ldap provides basic LDAP v3 functionality.")
  (license license:expat))
(package
  (name "go-github-com-go-test-deep")
  (version "1.0.8")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-test/deep")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1mmw2w3by7y24jjpjwmf2gfl08c65jihn3si9m0sswmagmdsk8q0"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-test/deep"))
  (home-page "https://github.com/go-test/deep")
  (synopsis "Deep Variable Equality for Humans")
  (description
   "Package deep provides function deep.Equal which is like reflect.DeepEqual but\nreturns a list of differences.  This is helpful when comparing complex types\nlike structures and maps.")
  (license license:expat))
(package
  (name "go-github-com-hashicorp-go-immutable-radix")
  (version "1.3.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/go-immutable-radix")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0s7sf8y5lj8rx4gdymrz29gg6y2xwksfpgniaz32yzcmg3c817zb"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/hashicorp/go-immutable-radix"))
  (propagated-inputs
   `(("go-github-com-hashicorp-golang-lru"
      ,go-github-com-hashicorp-golang-lru)
     ("go-github-com-hashicorp-go-uuid"
      ,go-github-com-hashicorp-go-uuid)))
  (home-page
   "https://github.com/hashicorp/go-immutable-radix")
  (synopsis "go-immutable-radix")
  (description
   "This package provides the @code{iradix} package that implements an immutable\n@url{http://en.wikipedia.org/wiki/Radix_tree,radix tree}.  The package only\nprovides a single @code{Tree} implementation, optimized for sparse nodes.")
  (license license:mpl2.0))
(package
  (name "go-github-com-hashicorp-go-kms-wrapping-entropy-v2")
  (version "2.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/go-kms-wrapping")
           (commit (string-append "entropy/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0a1iiaaf3hcqjnyi573254pbrvinalckg70idyxblchlv53sjqb2"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/hashicorp/go-kms-wrapping/entropy/v2"
     #:unpack-path
     "github.com/hashicorp/go-kms-wrapping"))
  (home-page
   "https://github.com/hashicorp/go-kms-wrapping")
  (synopsis "Entropy Package")
  (description
   "This package is split into its own Go module so that importers just wanting\nentropy do not need the full set of dependencies used by the main module.")
  (license license:mpl2.0))
(package
  (name "go-github-com-hashicorp-go-hclog")
  (version "1.3.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/go-hclog")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1fpyzhzrxaqwz548h84a619182c4bjfq1762yfi615zcfdbph5zk"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/hashicorp/go-hclog"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-mattn-go-isatty"
      ,go-github-com-mattn-go-isatty)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-fatih-color"
      ,go-github-com-fatih-color)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)))
  (home-page
   "https://github.com/hashicorp/go-hclog")
  (synopsis "go-hclog")
  (description
   "@code{go-hclog} is a package for Go that provides a simple key/value logging\ninterface for use in development and production environments.")
  (license license:expat))
(package
  (name "go-github-com-hashicorp-go-plugin")
  (version "1.4.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/go-plugin")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "10ighp17z2mlb500fmdrc0a2d61nwmmwv0k0xgr9r4smkh91wi4q"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/hashicorp/go-plugin"))
  (propagated-inputs
   `(("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-mattn-go-isatty"
      ,go-github-com-mattn-go-isatty)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-fatih-color"
      ,go-github-com-fatih-color)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-oklog-run"
      ,go-github-com-oklog-run)
     ("go-github-com-mitchellh-go-testing-interface"
      ,go-github-com-mitchellh-go-testing-interface)
     ("go-github-com-jhump-protoreflect"
      ,go-github-com-jhump-protoreflect)
     ("go-github-com-hashicorp-yamux"
      ,go-github-com-hashicorp-yamux)
     ("go-github-com-hashicorp-go-hclog"
      ,go-github-com-hashicorp-go-hclog)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)))
  (home-page
   "https://github.com/hashicorp/go-plugin")
  (synopsis "Go Plugin System over RPC")
  (description
   "The plugin package exposes functions and helpers for communicating to plugins\nwhich are implemented as standalone binary applications.")
  (license license:mpl2.0))
(package
  (name "go-github-com-hashicorp-go-secure-stdlib-base62")
  (version "0.1.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/go-secure-stdlib")
           (commit (string-append "base62/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1msydpc23805qnrqhi8mrgji9x2cdglhifqhmg2vcv70dnkcnkhs"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/hashicorp/go-secure-stdlib/base62"
     #:unpack-path
     "github.com/hashicorp/go-secure-stdlib"))
  (propagated-inputs
   `(("go-github-com-hashicorp-go-uuid"
      ,go-github-com-hashicorp-go-uuid)))
  (home-page
   "https://github.com/hashicorp/go-secure-stdlib")
  (synopsis #f)
  (description
   "Package base62 provides utilities for working with base62 strings.  base62\nstrings will only contain characters: 0-9, a-z, A-Z")
  (license license:mpl2.0))
(package
  (name "go-github-com-hashicorp-go-secure-stdlib-mlock")
  (version "0.1.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/go-secure-stdlib")
           (commit (string-append "mlock/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "16c2h71pkpm3wgv9xqsgimafxh2is2avzy92yd4bcgr1yp3i3zgw"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/hashicorp/go-secure-stdlib/mlock"
     #:unpack-path
     "github.com/hashicorp/go-secure-stdlib"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
  (home-page
   "https://github.com/hashicorp/go-secure-stdlib")
  (synopsis #f)
  (description #f)
  (license license:mpl2.0))
(package
  (name "go-github-com-hashicorp-go-secure-stdlib-password")
  (version "0.1.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/go-secure-stdlib")
           (commit (string-append "password/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1qy1qwlc49v5280hz8g2adpbg235dzm7j6qyn5g8nx7k6lv5vs8v"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/hashicorp/go-secure-stdlib/password"
     #:unpack-path
     "github.com/hashicorp/go-secure-stdlib"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)))
  (home-page
   "https://github.com/hashicorp/go-secure-stdlib")
  (synopsis #f)
  (description
   "password is a package for reading a password securely from a terminal.  The code\nin this package disables echo in the terminal so that the password is not echoed\nback in plaintext to the user.")
  (license license:mpl2.0))
(package
  (name "go-github-com-hashicorp-go-secure-stdlib-parseutil")
  (version "0.1.7")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/go-secure-stdlib")
           (commit (string-append "parseutil/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1gjxdhifpw4s00v2ffa4lbakb5whbhrkx8kfl27kwycdm7fjagrj"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/hashicorp/go-secure-stdlib/parseutil"
     #:unpack-path
     "github.com/hashicorp/go-secure-stdlib"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-mitchellh-mapstructure"
      ,go-github-com-mitchellh-mapstructure)
     ("go-github-com-hashicorp-go-sockaddr"
      ,go-github-com-hashicorp-go-sockaddr)
     ("go-github-com-hashicorp-go-secure-stdlib-strutil"
      ,go-github-com-hashicorp-go-secure-stdlib-strutil)))
  (home-page
   "https://github.com/hashicorp/go-secure-stdlib")
  (synopsis #f)
  (description #f)
  (license license:mpl2.0))
(package
  (name "go-github-com-hashicorp-go-secure-stdlib-strutil")
  (version "0.1.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/go-secure-stdlib")
           (commit (string-append "strutil/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "19jgdmw5snwfq4z8ifsqr917aj535x6fjkv7ma08qmibv1rrxs6s"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/hashicorp/go-secure-stdlib/strutil"
     #:unpack-path
     "github.com/hashicorp/go-secure-stdlib"))
  (propagated-inputs
   `(("go-github-com-ryanuber-go-glob"
      ,go-github-com-ryanuber-go-glob)))
  (home-page
   "https://github.com/hashicorp/go-secure-stdlib")
  (synopsis #f)
  (description #f)
  (license license:mpl2.0))
(package
  (name "go-github-com-hashicorp-go-secure-stdlib-tlsutil")
  (version "0.1.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/go-secure-stdlib")
           (commit (string-append "tlsutil/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0k6gdddrj445mzmhs745kqaxv3mpqq4kjcbh37jp3k81w9z6ykaa"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/hashicorp/go-secure-stdlib/tlsutil"
     #:unpack-path
     "github.com/hashicorp/go-secure-stdlib"))
  (propagated-inputs
   `(("go-github-com-hashicorp-go-secure-stdlib-strutil"
      ,go-github-com-hashicorp-go-secure-stdlib-strutil)
     ("go-github-com-hashicorp-go-secure-stdlib-parseutil"
      ,go-github-com-hashicorp-go-secure-stdlib-parseutil)))
  (home-page
   "https://github.com/hashicorp/go-secure-stdlib")
  (synopsis #f)
  (description #f)
  (license license:mpl2.0))
(package
  (name "go-github-com-masterminds-semver-v3")
  (version "3.1.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Masterminds/semver")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0dsqa585ixz6pbff60p0pk709kp3kksh668mjwrlxgqiammxa1p8"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/Masterminds/semver/v3"))
  (home-page
   "https://github.com/Masterminds/semver")
  (synopsis "SemVer")
  (description
   "Package semver provides the ability to work with Semantic Versions\n(@url{http://semver.org,http://semver.org}) in Go.")
  (license license:expat))
(package
  (name "go-github-com-shopspring-decimal")
  (version "1.3.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/shopspring/decimal")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1w1wjv2aqyqp22s8gc2nxp8gk4h0dxvp15xsn5lblghaqjcd239h"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/shopspring/decimal"))
  (home-page
   "https://github.com/shopspring/decimal")
  (synopsis "decimal")
  (description
   "Package decimal implements an arbitrary precision fixed-point decimal.")
  (license license:expat))
(package
  (name "go-github-com-masterminds-sprig-v3")
  (version "3.2.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Masterminds/sprig")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0wfbzhmv971si9gx9c77gz89b9va2y03bhdmds9hzal4i7cccw2x"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/Masterminds/sprig/v3"))
  (propagated-inputs
   `(("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-spf13-cast"
      ,go-github-com-spf13-cast)
     ("go-github-com-shopspring-decimal"
      ,go-github-com-shopspring-decimal)
     ("go-github-com-mitchellh-copystructure"
      ,go-github-com-mitchellh-copystructure)
     ("go-github-com-imdario-mergo"
      ,go-github-com-imdario-mergo)
     ("go-github-com-huandu-xstrings"
      ,go-github-com-huandu-xstrings)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-masterminds-semver-v3"
      ,go-github-com-masterminds-semver-v3)
     ("go-github-com-masterminds-goutils"
      ,go-github-com-masterminds-goutils)))
  (home-page
   "https://github.com/Masterminds/sprig")
  (synopsis
   "Sprig: Template functions for Go templates")
  (description
   "Package sprig provides template functions for Go.")
  (license license:expat))
(package
  (name "go-github-com-armon-go-radix")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/armon/go-radix")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1m1k0jz9gjfrk4m7hjm7p03qmviamfgxwm2ghakqxw3hdds8v503"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/armon/go-radix"))
  (home-page "https://github.com/armon/go-radix")
  (synopsis "go-radix")
  (description
   "This package provides the @code{radix} package that implements a\n@url{http://en.wikipedia.org/wiki/Radix_tree,radix tree}.  The package only\nprovides a single @code{Tree} implementation, optimized for sparse nodes.")
  (license license:expat))
(package
  (name "go-github-com-bgentry-speakeasy")
  (version "0.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/bgentry/speakeasy")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "02dfrj0wyphd3db9zn2mixqxwiz1ivnyc5xc7gkz58l5l27nzp8s"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/bgentry/speakeasy"))
  (home-page
   "https://github.com/bgentry/speakeasy")
  (synopsis "Speakeasy")
  (description
   "This package provides cross-platform Go (#golang) helpers for taking user input\nfrom the terminal while not echoing the input back (similar to\n@code{getpasswd}).  The package uses syscalls to avoid any dependence on cgo,\nand is therefore compatible with cross-compiling.")
  (license license:expat))
(package
  (name "go-github-com-hashicorp-errwrap")
  (version "1.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/errwrap")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0p5wdz8p7dmwphmb33gwhy3iwci5k9wkfqmmfa6ay1lz0cqjwp7a"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/hashicorp/errwrap"))
  (home-page
   "https://github.com/hashicorp/errwrap")
  (synopsis "errwrap")
  (description
   "Package errwrap implements methods to formalize error wrapping in Go.")
  (license license:mpl2.0))
(package
  (name "go-github-com-hashicorp-go-multierror")
  (version "1.1.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/go-multierror")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0l4s41skdpifndn9s8y6s9vzgghdzg4z8z0lld9qjr28888wzp00"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/hashicorp/go-multierror"))
  (propagated-inputs
   `(("go-github-com-hashicorp-errwrap"
      ,go-github-com-hashicorp-errwrap)))
  (home-page
   "https://github.com/hashicorp/go-multierror")
  (synopsis "go-multierror")
  (description
   "@code{go-multierror} is a package for Go that provides a mechanism for\nrepresenting a list of @code{error} values as a single @code{error}.")
  (license license:mpl2.0))
(package
  (name "go-github-com-posener-complete")
  (version "1.2.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/posener/complete")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0nri6hkfb0z3dkxf2fsfidr4bxbn91rjsqhg5s0c2jplf0aclppz"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/posener/complete"))
  (propagated-inputs
   `(("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-hashicorp-go-multierror"
      ,go-github-com-hashicorp-go-multierror)))
  (home-page "https://github.com/posener/complete")
  (synopsis "complete")
  (description
   "Package complete provides a tool for bash writing bash completion in go, and\nbash completion for the go command line.")
  (license license:expat))
(package
  (name "go-github-com-mitchellh-cli")
  (version "1.1.4")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/mitchellh/cli")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "000kfqfss0mwy303hb843lz1vzmdadbrnrgf809wch320mwan34b"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/mitchellh/cli"))
  (propagated-inputs
   `(("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-posener-complete"
      ,go-github-com-posener-complete)
     ("go-github-com-mattn-go-isatty"
      ,go-github-com-mattn-go-isatty)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-huandu-xstrings"
      ,go-github-com-huandu-xstrings)
     ("go-github-com-hashicorp-go-multierror"
      ,go-github-com-hashicorp-go-multierror)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-fatih-color"
      ,go-github-com-fatih-color)
     ("go-github-com-bgentry-speakeasy"
      ,go-github-com-bgentry-speakeasy)
     ("go-github-com-armon-go-radix"
      ,go-github-com-armon-go-radix)
     ("go-github-com-masterminds-sprig-v3"
      ,go-github-com-masterminds-sprig-v3)))
  (home-page "https://github.com/mitchellh/cli")
  (synopsis "Go CLI Library")
  (description
   "cli is a library for implementing command-line interfaces in Go.  cli is the\nlibrary that powers the CLI for\n@url{https://github.com/mitchellh/packer,Packer},\n@url{https://github.com/hashicorp/consul,Consul},\n@url{https://github.com/hashicorp/vault,Vault},\n@url{https://github.com/hashicorp/terraform,Terraform},\n@url{https://github.com/hashicorp/nomad,Nomad}, and more.")
  (license license:mpl2.0))
(package
  (name "go-github-com-ryanuber-columnize")
  (version "2.1.2+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ryanuber/columnize")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0xxzzgvfabc2qx6n313vis8l4npkggiy5kjflv0arm2y7xnv73qj"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/ryanuber/columnize"))
  (home-page
   "https://github.com/ryanuber/columnize")
  (synopsis "Columnize")
  (description
   "Easy column-formatted output for golang")
  (license license:expat))
(package
  (name "go-github-com-hashicorp-go-sockaddr")
  (version "1.0.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/go-sockaddr")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0y106nhd3s63lj7h7k21iq0br97h0z9qjrvx028zqcsq9407k9is"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/hashicorp/go-sockaddr"))
  (propagated-inputs
   `(("go-github-com-ryanuber-columnize"
      ,go-github-com-ryanuber-columnize)
     ("go-github-com-mitchellh-go-wordwrap"
      ,go-github-com-mitchellh-go-wordwrap)
     ("go-github-com-mitchellh-cli"
      ,go-github-com-mitchellh-cli)
     ("go-github-com-hashicorp-errwrap"
      ,go-github-com-hashicorp-errwrap)))
  (home-page
   "https://github.com/hashicorp/go-sockaddr")
  (synopsis "go-sockaddr")
  (description
   "Package sockaddr is a Go implementation of the UNIX socket family data types and\nrelated helper functions.")
  (license license:mpl2.0))
(package
  (name "go-github-com-hashicorp-go-uuid")
  (version "1.0.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/go-uuid")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0wd4maaq20alxwcvfhr52rzfnwwpmc2a698ihyr0vfns2sl7gkzk"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/hashicorp/go-uuid"))
  (home-page
   "https://github.com/hashicorp/go-uuid")
  (synopsis "uuid")
  (description
   "Generates UUID-format strings using high quality,  bytes.  It is @strong{not}\nintended to be RFC compliant, merely to use a well-understood string\nrepresentation of a 128-bit value.  It can also parse UUID-format strings into\ntheir component bytes.")
  (license license:mpl2.0))
(package
  (name "go-github-com-hashicorp-golang-lru")
  (version "0.5.4")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/golang-lru")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1sdbymypp9vrnzp8ashw0idlxvaq0rb0alwxx3x8g27yjlqi9jfn"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/hashicorp/golang-lru"))
  (home-page
   "https://github.com/hashicorp/golang-lru")
  (synopsis "golang-lru")
  (description
   "Package lru provides three different LRU caches of varying sophistication.")
  (license license:mpl2.0))
(package
  (name "go-github-com-hashicorp-vault-sdk")
  (version "0.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/vault")
           (commit (string-append "sdk/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1ircha2dvq4qz8p7a2r5s03ayacvbirmzbrmp35c7bim4waybva5"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/hashicorp/vault/sdk"
     #:unpack-path
     "github.com/hashicorp/vault"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-term" ,go-golang-org-x-term)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-stretchr-objx"
      ,go-github-com-stretchr-objx)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-oklog-run"
      ,go-github-com-oklog-run)
     ("go-github-com-mitchellh-reflectwalk"
      ,go-github-com-mitchellh-reflectwalk)
     ("go-github-com-mattn-go-isatty"
      ,go-github-com-mattn-go-isatty)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-kr-text" ,go-github-com-kr-text)
     ("go-github-com-hashicorp-yamux"
      ,go-github-com-hashicorp-yamux)
     ("go-github-com-go-asn1-ber-asn1-ber"
      ,go-github-com-go-asn1-ber-asn1-ber)
     ("go-github-com-frankban-quicktest"
      ,go-github-com-frankban-quicktest)
     ("go-github-com-fatih-color"
      ,go-github-com-fatih-color)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-go-uber-org-atomic" ,go-go-uber-org-atomic)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-ryanuber-go-glob"
      ,go-github-com-ryanuber-go-glob)
     ("go-github-com-pierrec-lz4"
      ,go-github-com-pierrec-lz4)
     ("go-github-com-mitchellh-mapstructure"
      ,go-github-com-mitchellh-mapstructure)
     ("go-github-com-mitchellh-go-testing-interface"
      ,go-github-com-mitchellh-go-testing-interface)
     ("go-github-com-mitchellh-copystructure"
      ,go-github-com-mitchellh-copystructure)
     ("go-github-com-hashicorp-hcl"
      ,go-github-com-hashicorp-hcl)
     ("go-github-com-hashicorp-golang-lru"
      ,go-github-com-hashicorp-golang-lru)
     ("go-github-com-hashicorp-go-version"
      ,go-github-com-hashicorp-go-version)
     ("go-github-com-hashicorp-go-uuid"
      ,go-github-com-hashicorp-go-uuid)
     ("go-github-com-hashicorp-go-sockaddr"
      ,go-github-com-hashicorp-go-sockaddr)
     ("go-github-com-hashicorp-go-secure-stdlib-tlsutil"
      ,go-github-com-hashicorp-go-secure-stdlib-tlsutil)
     ("go-github-com-hashicorp-go-secure-stdlib-strutil"
      ,go-github-com-hashicorp-go-secure-stdlib-strutil)
     ("go-github-com-hashicorp-go-secure-stdlib-password"
      ,go-github-com-hashicorp-go-secure-stdlib-password)
     ("go-github-com-hashicorp-go-secure-stdlib-parseutil"
      ,go-github-com-hashicorp-go-secure-stdlib-parseutil)
     ("go-github-com-hashicorp-go-secure-stdlib-mlock"
      ,go-github-com-hashicorp-go-secure-stdlib-mlock)
     ("go-github-com-hashicorp-go-secure-stdlib-base62"
      ,go-github-com-hashicorp-go-secure-stdlib-base62)
     ("go-github-com-hashicorp-go-plugin"
      ,go-github-com-hashicorp-go-plugin)
     ("go-github-com-hashicorp-go-multierror"
      ,go-github-com-hashicorp-go-multierror)
     ("go-github-com-hashicorp-go-kms-wrapping-entropy-v2"
      ,go-github-com-hashicorp-go-kms-wrapping-entropy-v2)
     ("go-github-com-hashicorp-go-immutable-radix"
      ,go-github-com-hashicorp-go-immutable-radix)
     ("go-github-com-hashicorp-go-hclog"
      ,go-github-com-hashicorp-go-hclog)
     ("go-github-com-hashicorp-errwrap"
      ,go-github-com-hashicorp-errwrap)
     ("go-github-com-golang-snappy"
      ,go-github-com-golang-snappy)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-go-test-deep"
      ,go-github-com-go-test-deep)
     ("go-github-com-go-ldap-ldap-v3"
      ,go-github-com-go-ldap-ldap-v3)
     ("go-github-com-fatih-structs"
      ,go-github-com-fatih-structs)
     ("go-github-com-evanphx-json-patch-v5"
      ,go-github-com-evanphx-json-patch-v5)
     ("go-github-com-armon-go-radix"
      ,go-github-com-armon-go-radix)
     ("go-github-com-armon-go-metrics"
      ,go-github-com-armon-go-metrics)))
  (home-page "https://github.com/hashicorp/vault")
  (synopsis "Vault SDK libs")
  (description
   "This package provides the @code{sdk} package which contains code useful for\ndeveloping Vault plugins.")
  (license license:mpl2.0))
(package
  (name "go-github-com-hashicorp-yamux")
  (version "0.1.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/hashicorp/yamux")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "09ainh10w3rjlak7hkj1mhibhfhrkmlp44cpl432q7fprla1kglf"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/hashicorp/yamux"))
  (home-page "https://github.com/hashicorp/yamux")
  (synopsis "Yamux")
  (description
   "Yamux (Yet another Multiplexer) is a multiplexing library for Golang.  It relies\non an underlying connection to provide reliability and ordering, such as TCP or\nUnix domain sockets, and provides stream-oriented multiplexing.  It is inspired\nby SPDY but is not interoperable with it.")
  (license license:mpl2.0))
(package
  (name "go-github-com-jhump-gopoet")
  (version "0.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jhump/gopoet")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0wb1ldpc9l8p29xhl9nkkq4vcp4rfrz72a4xlfn1qsjdg66b1rhq"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jhump/gopoet"))
  (home-page "https://github.com/jhump/gopoet")
  (synopsis "Go Poet")
  (description
   "Package gopoet is a library to assist with generating Go code.  It includes a\nmodel of the Go language that is simpler, and thus easier to work with, than\nthose provided by the \"go/ast\" and \"go/types\" packages.  It also provides\nadapter methods to allow simple interoperability with elements from the\n\"go/types\" and \"reflect\" packages.")
  (license license:asl2.0))
(package
  (name "go-github-com-jhump-goprotoc")
  (version "0.5.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jhump/goprotoc")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0k2wy5as8h7zbmy151973g20lpyzjcgijh1pq28kn0vwqia34qjg"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jhump/goprotoc"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)
     ("go-github-com-jhump-protoreflect"
      ,go-github-com-jhump-protoreflect)
     ("go-github-com-jhump-gopoet"
      ,go-github-com-jhump-gopoet)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)))
  (home-page "https://github.com/jhump/goprotoc")
  (synopsis "Go-protoc")
  (description
   "This repo makes it easy to work in the protobuf tool chain using Go.")
  (license license:asl2.0))
(package
  (name "go-github-com-jhump-protoreflect")
  (version "1.13.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/jhump/protoreflect")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "09g3a97a1fwjnzfjvm55mksw9z9xdl6r3k56wjvnhv5cryaasbaf"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/jhump/protoreflect"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-github-com-jhump-goprotoc"
      ,go-github-com-jhump-goprotoc)
     ("go-github-com-jhump-gopoet"
      ,go-github-com-jhump-gopoet)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)))
  (home-page
   "https://github.com/jhump/protoreflect")
  (synopsis "Protocol Buffer and gRPC Reflection")
  (description
   "This repo provides reflection APIs for\n@url{https://developers.google.com/protocol-buffers/,protocol buffers} (also\nknown as \"protobufs\" for short) and @url{https://grpc.io/,gRPC}.  The core of\nreflection in protobufs is the\n@url{https://github.com/google/protobuf/raw/199d82fde1734ab5bc931cd0de93309e50cd7ab9/src/google/protobuf/descriptor.proto,descriptor}.\nA descriptor is itself a protobuf message that describes a @code{.proto} source\nfile or any element therein.  So a collection of descriptors can describe an\nentire schema of protobuf types, including RPC services.")
  (license license:asl2.0))
(package
  (name "go-github-com-mitchellh-go-testing-interface")
  (version "1.14.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/mitchellh/go-testing-interface")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1xrpdficli723g74mq36r4nj04i9yfh7hacp6wai3p7mq3gs5hac"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/mitchellh/go-testing-interface"))
  (home-page
   "https://github.com/mitchellh/go-testing-interface")
  (synopsis "go-testing-interface")
  (description
   "go-testing-interface is a Go library that exports an interface that\n@code{*testing.T} implements as well as a runtime version you can use in its\nplace.")
  (license license:expat))
(package
  (name "go-github-com-oklog-run")
  (version "1.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/oklog/run")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0r55p3kgdkgw55i33lqvvvl60mjp92mhd1170m980sw98z9150jk"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/oklog/run"))
  (home-page "https://github.com/oklog/run")
  (synopsis "run")
  (description
   "Package run implements an actor-runner with deterministic teardown.  It is\nsomewhat similar to package errgroup, except it does not require actor\ngoroutines to understand context semantics.  This makes it suitable for use in\nmore circumstances; for example, goroutines which are handling connections from\nnet.Listeners, or scanning input from a closable io.Reader.")
  (license license:asl2.0))
(package
  (name "go-github-com-opencontainers-go-digest")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/opencontainers/go-digest")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0i5acjajvr6hi9zb7gxwifd8w28y884cv7cx36adj8lngj647xbi"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/opencontainers/go-digest"))
  (home-page
   "https://github.com/opencontainers/go-digest")
  (synopsis "go-digest")
  (description
   "Package digest provides a generalized type to opaquely represent message digests\nand their operations within the registry.  The Digest type is designed to serve\nas a flexible identifier in a content-addressable system.  More importantly, it\nprovides tools and wrappers to work with hash.Hash-based digests with little\neffort.")
  (license
   (list license:asl2.0 license:cc-by-sa4.0)))
(package
  (name "go-github-com-pierrec-lz4")
  (version "2.6.1+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/pierrec/lz4")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0vfn01gd3hcpbj6gb4ig3pw6bv0g4j5780awr0fv4kf9id8gjvyy"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/pierrec/lz4"))
  (home-page "https://github.com/pierrec/lz4")
  (synopsis "lz4 : LZ4 compression in pure Go")
  (description
   "Package lz4 implements reading and writing lz4 compressed data (a frame), as\nspecified in\n@url{http://fastcompression.blogspot.fr/2013/04/lz4-streaming-format-final.html,http://fastcompression.blogspot.fr/2013/04/lz4-streaming-format-final.html}.")
  (license license:bsd-3))
(package
  (name "go-github-com-ryanuber-go-glob")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ryanuber/go-glob")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0mhrjy0iba3jr6bsgy7q50zjr42ar1njn1sb2fvihlkhxgb2ahv2"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/ryanuber/go-glob"))
  (home-page "https://github.com/ryanuber/go-glob")
  (synopsis "String globbing in golang")
  (description
   "@code{go-glob} is a single-function library implementing basic string glob\nsupport.")
  (license license:expat))
(package
  (name "go-github-com-ysmood-gotrace")
  (version "0.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ysmood/gotrace")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "06jzxbi27mknkx5kp5zramca16r9i423dhmlp17r4r75znhklgaz"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/ysmood/gotrace"))
  (home-page "https://github.com/ysmood/gotrace")
  (synopsis "Overview")
  (description
   "This package provides a lib for monitoring runtime goroutine stack.  Such as\nwait for goroutines to exit, leak detection, etc.")
  (license license:expat))
(package
  (name "go-github-com-ysmood-goob")
  (version "0.4.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ysmood/goob")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1z4632i1mx9rxslq7b9jd4zg600wangxyirh99fxsv0i2jprak53"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/ysmood/goob"))
  (propagated-inputs
   `(("go-github-com-ysmood-gotrace"
      ,go-github-com-ysmood-gotrace)))
  (home-page "https://github.com/ysmood/goob")
  (synopsis "Overview")
  (description
   "This package provides a lightweight observable lib.  Go channel doesn't support\nunlimited buffer size, it's a pain to decide what size to use, this lib will\nhandle it dynamically.")
  (license license:expat))
(package
  (name "go-github-com-ysmood-gson")
  (version "0.7.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ysmood/gson")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "04p732g98amm5kaad156m5q8y7lnza9jwknpa44jvzf16w5srdmd"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/ysmood/gson"))
  (home-page "https://github.com/ysmood/gson")
  (synopsis "Overview")
  (description "The tests is the doc.")
  (license license:expat))
(package
  (name "go-github-com-ysmood-leakless")
  (version "0.8.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ysmood/leakless")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0dq8w8ad4km857a1k9c709700ymbk0jzdpw28x7xgnylyad3agpq"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/ysmood/leakless"))
  (home-page "https://github.com/ysmood/leakless")
  (synopsis "leakless")
  (description
   "Run sub-process and make sure to kill it when the parent process exits.  The way\nhow it works is to output a standalone executable file to guard the subprocess\nand check parent TCP connection with a UUID.  So that it works consistently on\nLinux, Mac, and Windows.")
  (license license:expat))
(package
  (name "go-github-com-sigstore-sigstore")
  (version "1.4.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/sigstore/sigstore")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0388gbrrkmsmjbcplvbz53gk834w2g9dbhy94rijrzj8bwnlk5h3"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/sigstore/sigstore"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-time" ,go-golang-org-x-time)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-uber-org-atomic" ,go-go-uber-org-atomic)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-ysmood-leakless"
      ,go-github-com-ysmood-leakless)
     ("go-github-com-ysmood-gson"
      ,go-github-com-ysmood-gson)
     ("go-github-com-ysmood-goob"
      ,go-github-com-ysmood-goob)
     ("go-github-com-titanous-rocacheck"
      ,go-github-com-titanous-rocacheck)
     ("go-github-com-syndtr-goleveldb"
      ,go-github-com-syndtr-goleveldb)
     ("go-github-com-ryanuber-go-glob"
      ,go-github-com-ryanuber-go-glob)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-pierrec-lz4"
      ,go-github-com-pierrec-lz4)
     ("go-github-com-opencontainers-go-digest"
      ,go-github-com-opencontainers-go-digest)
     ("go-github-com-oklog-run"
      ,go-github-com-oklog-run)
     ("go-github-com-mitchellh-reflectwalk"
      ,go-github-com-mitchellh-reflectwalk)
     ("go-github-com-mitchellh-mapstructure"
      ,go-github-com-mitchellh-mapstructure)
     ("go-github-com-mitchellh-go-testing-interface"
      ,go-github-com-mitchellh-go-testing-interface)
     ("go-github-com-mitchellh-copystructure"
      ,go-github-com-mitchellh-copystructure)
     ("go-github-com-mattn-go-isatty"
      ,go-github-com-mattn-go-isatty)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-jmespath-go-jmespath"
      ,go-github-com-jmespath-go-jmespath)
     ("go-github-com-jhump-protoreflect"
      ,go-github-com-jhump-protoreflect)
     ("go-github-com-hashicorp-yamux"
      ,go-github-com-hashicorp-yamux)
     ("go-github-com-hashicorp-vault-sdk"
      ,go-github-com-hashicorp-vault-sdk)
     ("go-github-com-hashicorp-hcl"
      ,go-github-com-hashicorp-hcl)
     ("go-github-com-hashicorp-golang-lru"
      ,go-github-com-hashicorp-golang-lru)
     ("go-github-com-hashicorp-go-version"
      ,go-github-com-hashicorp-go-version)
     ("go-github-com-hashicorp-go-uuid"
      ,go-github-com-hashicorp-go-uuid)
     ("go-github-com-hashicorp-go-sockaddr"
      ,go-github-com-hashicorp-go-sockaddr)
     ("go-github-com-hashicorp-go-secure-stdlib-strutil"
      ,go-github-com-hashicorp-go-secure-stdlib-strutil)
     ("go-github-com-hashicorp-go-secure-stdlib-parseutil"
      ,go-github-com-hashicorp-go-secure-stdlib-parseutil)
     ("go-github-com-hashicorp-go-secure-stdlib-mlock"
      ,go-github-com-hashicorp-go-secure-stdlib-mlock)
     ("go-github-com-hashicorp-go-rootcerts"
      ,go-github-com-hashicorp-go-rootcerts)
     ("go-github-com-hashicorp-go-retryablehttp"
      ,go-github-com-hashicorp-go-retryablehttp)
     ("go-github-com-hashicorp-go-plugin"
      ,go-github-com-hashicorp-go-plugin)
     ("go-github-com-hashicorp-go-multierror"
      ,go-github-com-hashicorp-go-multierror)
     ("go-github-com-hashicorp-go-immutable-radix"
      ,go-github-com-hashicorp-go-immutable-radix)
     ("go-github-com-hashicorp-go-hclog"
      ,go-github-com-hashicorp-go-hclog)
     ("go-github-com-hashicorp-go-cleanhttp"
      ,go-github-com-hashicorp-go-cleanhttp)
     ("go-github-com-hashicorp-errwrap"
      ,go-github-com-hashicorp-errwrap)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-golang-snappy"
      ,go-github-com-golang-snappy)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-github-com-golang-jwt-jwt-v4"
      ,go-github-com-golang-jwt-jwt-v4)
     ("go-github-com-fatih-color"
      ,go-github-com-fatih-color)
     ("go-github-com-dimchansky-utfbom"
      ,go-github-com-dimchansky-utfbom)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-github-com-cenkalti-backoff-v3"
      ,go-github-com-cenkalti-backoff-v3)
     ("go-github-com-aws-smithy-go"
      ,go-github-com-aws-smithy-go)
     ("go-github-com-aws-aws-sdk-go-v2-service-sts"
      ,go-github-com-aws-aws-sdk-go-v2-service-sts)
     ("go-github-com-aws-aws-sdk-go-v2-service-ssooidc"
      ,go-github-com-aws-aws-sdk-go-v2-service-ssooidc)
     ("go-github-com-aws-aws-sdk-go-v2-service-sso"
      ,go-github-com-aws-aws-sdk-go-v2-service-sso)
     ("go-github-com-aws-aws-sdk-go-v2-service-internal-presigned-url"
      ,go-github-com-aws-aws-sdk-go-v2-service-internal-presigned-url)
     ("go-github-com-aws-aws-sdk-go-v2-internal-ini"
      ,go-github-com-aws-aws-sdk-go-v2-internal-ini)
     ("go-github-com-aws-aws-sdk-go-v2-internal-endpoints-v2"
      ,go-github-com-aws-aws-sdk-go-v2-internal-endpoints-v2)
     ("go-github-com-aws-aws-sdk-go-v2-internal-configsources"
      ,go-github-com-aws-aws-sdk-go-v2-internal-configsources)
     ("go-github-com-aws-aws-sdk-go-v2-feature-ec2-imds"
      ,go-github-com-aws-aws-sdk-go-v2-feature-ec2-imds)
     ("go-github-com-aws-aws-sdk-go-v2-credentials"
      ,go-github-com-aws-aws-sdk-go-v2-credentials)
     ("go-github-com-armon-go-radix"
      ,go-github-com-armon-go-radix)
     ("go-github-com-armon-go-metrics"
      ,go-github-com-armon-go-metrics)
     ("go-github-com-azure-go-autorest-tracing"
      ,go-github-com-azure-go-autorest-tracing)
     ("go-github-com-azure-go-autorest-logger"
      ,go-github-com-azure-go-autorest-logger)
     ("go-github-com-azure-go-autorest-autorest-validation"
      ,go-github-com-azure-go-autorest-autorest-validation)
     ("go-github-com-azure-go-autorest-autorest-date"
      ,go-github-com-azure-go-autorest-autorest-date)
     ("go-github-com-azure-go-autorest-autorest-azure-cli"
      ,go-github-com-azure-go-autorest-autorest-azure-cli)
     ("go-github-com-azure-go-autorest-autorest-azure-auth"
      ,go-github-com-azure-go-autorest-autorest-azure-auth)
     ("go-github-com-azure-go-autorest-autorest-adal"
      ,go-github-com-azure-go-autorest-autorest-adal)
     ("go-github-com-azure-go-autorest"
      ,go-github-com-azure-go-autorest)
     ("go-cloud-google-com-go-iam"
      ,go-cloud-google-com-go-iam)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)
     ("go-gopkg-in-square-go-jose-v2"
      ,go-gopkg-in-square-go-jose-v2)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-golang-org-x-term" ,go-golang-org-x-term)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-theupdateframework-go-tuf"
      ,go-github-com-theupdateframework-go-tuf)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-skratchdot-open-golang"
      ,go-github-com-skratchdot-open-golang)
     ("go-github-com-segmentio-ksuid"
      ,go-github-com-segmentio-ksuid)
     ("go-github-com-secure-systems-lab-go-securesystemslib"
      ,go-github-com-secure-systems-lab-go-securesystemslib)
     ("go-github-com-pkg-browser"
      ,go-github-com-pkg-browser)
     ("go-github-com-mitchellh-go-homedir"
      ,go-github-com-mitchellh-go-homedir)
     ("go-github-com-letsencrypt-boulder"
      ,go-github-com-letsencrypt-boulder)
     ("go-github-com-jellydator-ttlcache-v2"
      ,go-github-com-jellydator-ttlcache-v2)
     ("go-github-com-hashicorp-vault-api"
      ,go-github-com-hashicorp-vault-api)
     ("go-github-com-google-go-containerregistry"
      ,go-github-com-google-go-containerregistry)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-go-test-deep"
      ,go-github-com-go-test-deep)
     ("go-github-com-go-rod-rod"
      ,go-github-com-go-rod-rod)
     ("go-github-com-coreos-go-oidc-v3"
      ,go-github-com-coreos-go-oidc-v3)
     ("go-github-com-aws-aws-sdk-go-v2-service-kms"
      ,go-github-com-aws-aws-sdk-go-v2-service-kms)
     ("go-github-com-aws-aws-sdk-go-v2-config"
      ,go-github-com-aws-aws-sdk-go-v2-config)
     ("go-github-com-aws-aws-sdk-go-v2"
      ,go-github-com-aws-aws-sdk-go-v2)
     ("go-github-com-aws-aws-sdk-go"
      ,go-github-com-aws-aws-sdk-go)
     ("go-github-com-azure-go-autorest-autorest-to"
      ,go-github-com-azure-go-autorest-autorest-to)
     ("go-github-com-azure-go-autorest-autorest"
      ,go-github-com-azure-go-autorest-autorest)
     ("go-github-com-azure-azure-sdk-for-go"
      ,go-github-com-azure-azure-sdk-for-go)
     ("go-cloud-google-com-go-kms"
      ,go-cloud-google-com-go-kms)))
  (home-page
   "https://github.com/sigstore/sigstore")
  (synopsis "sigstore framework")
  (description
   "sigstore/sigstore is a generic library / framework that is utilized by various\nother clients and projects including fulcio (webPKI), cosign (container and OCI\nsigning tool) and tektoncd/chains (Supply Chain Security in Tekton Pipelines).")
  (license license:asl2.0))
(package
  (name "go-github-com-stefanberger-go-pkcs11uri")
  (version "0.0.0-20201008174630-78d3cae3a980")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/stefanberger/go-pkcs11uri")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "09bnd1fn2v5y5ngsxz751a0x9fsqn8idlfrwyymfv9l57wvmrd2l"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/stefanberger/go-pkcs11uri"))
  (home-page
   "https://github.com/stefanberger/go-pkcs11uri")
  (synopsis "go-pkcs11uri")
  (description
   "Welcome to the go-pkcs11uri library.  The implementation follows\n@url{https://tools.ietf.org/html/rfc7512,RFC 7512} and this\n@url{https://www.rfc-editor.org/errata/rfc7512,errata}.")
  (license license:asl2.0))
(package
  (name "go-github-com-syndtr-gocapability")
  (version "0.0.0-20200815063812-42c35b437635")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/syndtr/gocapability")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "00zi0k190ydlm9drnafvj9p4cf6axm858wr71pbmq1p3r94iqws4"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/syndtr/gocapability"))
  (home-page
   "https://github.com/syndtr/gocapability")
  (synopsis #f)
  (description #f)
  (license license:bsd-2))
(package
  (name "go-github-com-flynn-go-docopt")
  (version "0.0.0-20140912013429-f6dd2ebbb31e")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/flynn/go-docopt")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "07s8fvnab40mcfmlsgrrddgvrirgm1krb7kaqgipcikjcmj8j6ql"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/flynn/go-docopt"))
  (home-page "https://github.com/flynn/go-docopt")
  (synopsis "docopt-go")
  (description
   "Package docopt parses command-line arguments based on a help message.")
  (license license:expat))
(package
  (name "go-github-com-codahale-rfc6979")
  (version "0.0.0-20141003034818-6a90f24967eb")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/codahale/rfc6979")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "07p51hmvvzvn84mg1c3kmp799j7jf7w15770qw8qz9q7j8frx03f"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/codahale/rfc6979"))
  (home-page "https://github.com/codahale/rfc6979")
  (synopsis "rfc6979")
  (description
   "Package rfc6979 is an implementation of\n@url{https://rfc-editor.org/rfc/rfc6979.html,RFC 6979}'s deterministic DSA.")
  (license license:expat))
(package
  (name "go-github-com-secure-systems-lab-go-securesystemslib")
  (version "0.4.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/secure-systems-lab/go-securesystemslib")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0nrzy78r10dy1jc6i57k2fc439msmg8b1jf0gj4y4alrzb69p5j0"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/secure-systems-lab/go-securesystemslib"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-codahale-rfc6979"
      ,go-github-com-codahale-rfc6979)))
  (home-page
   "https://github.com/secure-systems-lab/go-securesystemslib")
  (synopsis #f)
  (description
   "This package provides a library that provides cryptographic and general-purpose\nfunctions for Go Secure Systems Lab projects at NYU.")
  (license license:expat))
(package
  (name "go-gopkg-in-tomb-v1")
  (version "1.0.0-20141024135613-dd632973f1e7")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gopkg.in/tomb.v1")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1lqmq1ag7s4b3gc3ddvr792c5xb5k6sfn0cchr3i2s7f1c231zjv"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "gopkg.in/tomb.v1"
     #:unpack-path
     "gopkg.in/tomb.v1"))
  (home-page "https://gopkg.in/tomb.v1")
  (synopsis "Installation and usage")
  (description
   "The tomb package offers a conventional API for clean goroutine termination.")
  (license license:bsd-3))
(package
  (name "go-github-com-nxadm-tail")
  (version "1.4.8")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/nxadm/tail")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1j2gi485fhwdpmyzn42wk62103fclwbfywg42p275z1qv2bsz1rc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/nxadm/tail"))
  (propagated-inputs
   `(("go-gopkg-in-tomb-v1" ,go-gopkg-in-tomb-v1)
     ("go-github-com-fsnotify-fsnotify"
      ,go-github-com-fsnotify-fsnotify)))
  (home-page "https://github.com/nxadm/tail")
  (synopsis "tail functionality in Go")
  (description
   "nxadm/tail provides a Go library that emulates the features of the BSD `tail`\nprogram.  The library comes with full support for truncation/move detection as\nit is designed to work with log rotation tools.  The library works on all\noperating systems supported by Go, including POSIX systems like Linux and *BSD,\nand MS Windows.  Go 1.9 is the oldest compiler release supported.")
  (license license:expat))
(package
  (name "go-github-com-go-task-slim-sprig")
  (version "2.20.0+incompatible")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/go-task/slim-sprig")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0p14axjkiznjrhl7gbmlc1fliq125xkckn1y9vy2jalslzrgprvv"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/go-task/slim-sprig"))
  (home-page
   "https://github.com/go-task/slim-sprig")
  (synopsis
   "Sprig: Template functions for Go templates")
  (description "Sprig: Template functions for Go.")
  (license license:expat))
(package
  (name "go-github-com-chzyer-test")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/chzyer/test")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1axdlcnx2qjsn5wsr2pr1m0w0a8k4nk5kkrngh742fgh81vzzy8s"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/chzyer/test"))
  (propagated-inputs
   `(("go-github-com-chzyer-logex"
      ,go-github-com-chzyer-logex)))
  (home-page "https://github.com/chzyer/test")
  (synopsis "test")
  (description #f)
  (license license:expat))
(package
  (name "go-github-com-chzyer-logex")
  (version "1.2.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/chzyer/logex")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0c9yr3r7dl3lcs22cvmh9iknihi9568wzmdywmc2irkjdrn8bpxw"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/chzyer/logex"))
  (home-page "https://github.com/chzyer/logex")
  (synopsis "Logex")
  (description
   "An golang log lib, supports tracing and level, wrap by standard log lib")
  (license license:expat))
(package
  (name "go-github-com-chzyer-readline")
  (version "1.5.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/chzyer/readline")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1msh9qcm7l1idpmfj4nradyprsr86yhk9ch42yxz7xsrybmrs0pb"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/chzyer/readline"))
  (propagated-inputs
   `(("go-github-com-chzyer-logex"
      ,go-github-com-chzyer-logex)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-chzyer-test"
      ,go-github-com-chzyer-test)))
  (home-page "https://github.com/chzyer/readline")
  (synopsis "Guide")
  (description
   "Readline is a pure go implementation for GNU-Readline kind library.")
  (license license:expat))
(package
  (name "go-github-com-ianlancetaylor-demangle")
  (version "0.0.0-20220517205856-0058ec4f073c")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ianlancetaylor/demangle")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "00xfkjr48v96qwsi68fak0chskks0iq5yvpigx8n373z857xbgdf"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/ianlancetaylor/demangle"))
  (home-page
   "https://github.com/ianlancetaylor/demangle")
  (synopsis "github.com/ianlancetaylor/demangle")
  (description
   "Package demangle defines functions that demangle GCC/LLVM C++ and Rust symbol\nnames.  This package recognizes names that were mangled according to the C++ ABI\ndefined at\n@url{http://codesourcery.com/cxx-abi/,http://codesourcery.com/cxx-abi/} and the\nRust ABI defined at\n@url{https://rust-lang.github.io/rfcs/2603-rust-symbol-name-mangling-v0.html,https://rust-lang.github.io/rfcs/2603-rust-symbol-name-mangling-v0.html}")
  (license license:bsd-3))
(package
  (name "go-github-com-google-pprof")
  (version "0.0.0-20220829040838-70bd9ae97f40")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/google/pprof")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1mb0bzfr61hm8958j9ih68wj7pfrrv5bljvkp5igl2qrfmivqn5b"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/google/pprof"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-ianlancetaylor-demangle"
      ,go-github-com-ianlancetaylor-demangle)
     ("go-github-com-chzyer-readline"
      ,go-github-com-chzyer-readline)))
  (home-page "https://github.com/google/pprof")
  (synopsis "Introduction")
  (description
   "pprof is a tool for collection, manipulation and visualization of performance\nprofiles.")
  (license license:asl2.0))
(package
  (name "go-github-com-onsi-ginkgo-v2")
  (version "2.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/onsi/ginkgo")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0ljwdj0rgs55xiz7f2jrq8xggf0vvkzk6bwh30s97n5jq2gd99nn"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/onsi/ginkgo/v2"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-onsi-gomega"
      ,go-github-com-onsi-gomega)
     ("go-github-com-google-pprof"
      ,go-github-com-google-pprof)
     ("go-github-com-go-task-slim-sprig"
      ,go-github-com-go-task-slim-sprig)))
  (home-page "https://github.com/onsi/ginkgo")
  (synopsis
   "Ginkgo 2.0 is now Generally Available!")
  (description
   "Ginkgo is a testing framework for Go designed to help you write expressive\ntests.  @url{https://github.com/onsi/ginkgo,https://github.com/onsi/ginkgo}\nMIT-Licensed")
  (license license:expat))
(package
  (name "go-github-com-onsi-gomega")
  (version "1.20.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/onsi/gomega")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0yzw4ylgjmxnhlwdq0pdi6i5696rxch4brw8cbniv5cm2nzb48fx"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/onsi/gomega"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-onsi-ginkgo-v2"
      ,go-github-com-onsi-ginkgo-v2)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)))
  (home-page "https://github.com/onsi/gomega")
  (synopsis ": a BDD Testing Framework for Golang")
  (description
   "Gomega is the Ginkgo BDD-style testing framework's preferred matcher library.")
  (license license:expat))
(package
  (name "go-github-com-onsi-ginkgo")
  (version "1.16.5")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/onsi/ginkgo")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1hh6n7q92y0ai8k6rj2yzw6wwxikhyiyk4j92zgvf1zad0gmqqmz"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/onsi/ginkgo"))
  (propagated-inputs
   `(("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-onsi-gomega"
      ,go-github-com-onsi-gomega)
     ("go-github-com-nxadm-tail"
      ,go-github-com-nxadm-tail)
     ("go-github-com-go-task-slim-sprig"
      ,go-github-com-go-task-slim-sprig)))
  (home-page "https://github.com/onsi/ginkgo")
  (synopsis
   "Ginkgo 2.0 Release Candidate is available!")
  (description
   "Ginkgo is a BDD-style testing framework for Golang")
  (license license:expat))
(package
  (name "go-github-com-theupdateframework-go-tuf")
  (version "0.5.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/theupdateframework/go-tuf")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1bcpc01sxm7d8db1agx3zg76sfh6nqhmf1pg79rfjrni3za4vz3z"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/theupdateframework/go-tuf"))
  (propagated-inputs
   `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-pmezard-go-difflib"
      ,go-github-com-pmezard-go-difflib)
     ("go-github-com-onsi-ginkgo"
      ,go-github-com-onsi-ginkgo)
     ("go-github-com-kr-text" ,go-github-com-kr-text)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)
     ("go-github-com-golang-snappy"
      ,go-github-com-golang-snappy)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)
     ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-golang-org-x-term" ,go-golang-org-x-term)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-syndtr-goleveldb"
      ,go-github-com-syndtr-goleveldb)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-secure-systems-lab-go-securesystemslib"
      ,go-github-com-secure-systems-lab-go-securesystemslib)
     ("go-github-com-google-gofuzz"
      ,go-github-com-google-gofuzz)
     ("go-github-com-flynn-go-docopt"
      ,go-github-com-flynn-go-docopt)
     ("go-github-com-dustin-go-humanize"
      ,go-github-com-dustin-go-humanize)))
  (home-page
   "https://github.com/theupdateframework/go-tuf")
  (synopsis "go-tuf")
  (description
   "This is a Go implementation of @url{http://theupdateframework.com/,The Update\nFramework (TUF)}, a framework for securing software update systems.")
  (license license:bsd-3))
(package
  (name "go-github-com-titanous-rocacheck")
  (version "0.0.0-20171023193734-afe73141d399")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/titanous/rocacheck")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1xb0hii3dffi88hczd81jb5p1hi7yk1davlsfz6q2xiza03x95dg"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/titanous/rocacheck"))
  (home-page
   "https://github.com/titanous/rocacheck")
  (synopsis "rocacheck")
  (description
   "Package rocacheck checks if a key was generated by broken Infineon code and is\nvulnerable to factorization via the Return of Coppersmith's Attack (ROCA) /\nCVE-2017-15361.")
  (license license:expat))
(package
  (name "go-github-com-ulikunitz-xz")
  (version "0.5.10")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ulikunitz/xz")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "07vynk0sh8i8g7x9p9x04dj8wylvxaf8ypbi43yvcv7j6zd63c72"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/ulikunitz/xz"))
  (home-page "https://github.com/ulikunitz/xz")
  (synopsis "Package xz")
  (description
   "Package xz supports the compression and decompression of xz files.  It supports\nversion 1.0.4 of the specification without the non-LZMA2 filters.  See\n@url{http://tukaani.org/xz/xz-file-format-1.0.4.txt,http://tukaani.org/xz/xz-file-format-1.0.4.txt}")
  (license license:bsd-3))
(package
  (name "go-github-com-cpuguy83-go-md2man-v2")
  (version "2.0.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/cpuguy83/go-md2man")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "19qri18cinpzxblkid6ngz2vcxslv73s1aid900q0gfzvc71mqqb"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/cpuguy83/go-md2man/v2"))
  (propagated-inputs
   `(("go-github-com-russross-blackfriday-v2"
      ,go-github-com-russross-blackfriday-v2)))
  (home-page
   "https://github.com/cpuguy83/go-md2man")
  (synopsis "go-md2man")
  (description
   "Converts markdown into roff (man pages).")
  (license license:expat))
(package
  (name "go-github-com-russross-blackfriday-v2")
  (version "2.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/russross/blackfriday")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0d1rg1drrfmabilqjjayklsz5d0n3hkf979sr3wsrw92bfbkivs7"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/russross/blackfriday/v2"))
  (home-page
   "https://github.com/russross/blackfriday")
  (synopsis "Blackfriday")
  (description
   "Package blackfriday is a markdown processor.")
  (license license:bsd-2))
(package
  (name "go-github-com-xrash-smetrics")
  (version "0.0.0-20201216005158-039620a65673")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/xrash/smetrics")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0cmzcq567avzqzrf1ns7lz1gv69s8dxbs276m0j8qbm4yddysqaq"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/xrash/smetrics"))
  (home-page "https://github.com/xrash/smetrics")
  (synopsis "smetrics")
  (description
   "Package smetrics provides a bunch of algorithms for calculating the distance\nbetween strings.")
  (license license:expat))
(package
  (name "go-github-com-vbatts-go-mtree")
  (version "0.5.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/vbatts/go-mtree")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0r0yjas60gppmmskiygmry6hypck43mzq6z3knrl854ls77qzlqf"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/vbatts/go-mtree"))
  (propagated-inputs
   `(("go-github-com-xrash-smetrics"
      ,go-github-com-xrash-smetrics)
     ("go-github-com-russross-blackfriday-v2"
      ,go-github-com-russross-blackfriday-v2)
     ("go-github-com-mattn-go-isatty"
      ,go-github-com-mattn-go-isatty)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-cpuguy83-go-md2man-v2"
      ,go-github-com-cpuguy83-go-md2man-v2)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-github-com-urfave-cli-v2"
      ,go-github-com-urfave-cli-v2)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-fatih-color"
      ,go-github-com-fatih-color)
     ("go-github-com-davecgh-go-spew"
      ,go-github-com-davecgh-go-spew)))
  (home-page "https://github.com/vbatts/go-mtree")
  (synopsis "go-mtree")
  (description
   "@code{mtree} is a filesystem hierarchy validation tooling and format.  This is a\nlibrary and simple cli tool for\n@url{https://www.freebsd.org/cgi/man.cgi?mtree%288%29=,mtree(8)} support.")
  (license license:bsd-3))
(package
  (name "go-github-com-vbatts-tar-split")
  (version "0.11.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/vbatts/tar-split")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0zmqnlif7r9n9kffw8k3m820ybvyy4zp7m2xfg8rrb321m869dcd"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/vbatts/tar-split"))
  (propagated-inputs
   `(("go-github-com-urfave-cli"
      ,go-github-com-urfave-cli)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)))
  (home-page "https://github.com/vbatts/tar-split")
  (synopsis "tar-split")
  (description
   "Pristinely disassembling a tar archive, and stashing needed raw bytes and\noffsets to reassemble a validating original archive.")
  (license license:bsd-3))
(package
  (name "go-github-com-vishvananda-netlink")
  (version "1.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/vishvananda/netlink")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1vhl30p1gx636a088ls4h6a0l8jjyfvz79fr5w0qzdrg4qg9h08h"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/vishvananda/netlink"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-vishvananda-netns"
      ,go-github-com-vishvananda-netns)))
  (home-page
   "https://github.com/vishvananda/netlink")
  (synopsis "netlink - netlink library for go")
  (description
   "Package netlink provides a simple library for netlink.  Netlink is the interface\na user-space program in linux uses to communicate with the kernel.  It can be\nused to add and remove interfaces, set up ip addresses and routes, and confiugre\nipsec.  Netlink communication requires elevated privileges, so in most cases\nthis code needs to be run as root.  The low level primitives for netlink are\ncontained in the nl subpackage.  This package attempts to provide a high-level\ninterface that is loosly modeled on the iproute2 cli.")
  (license license:asl2.0))
(package
  (name "go-github-com-vishvananda-netns")
  (version "0.0.0-20220913150850-18c4f4234207")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/vishvananda/netns")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "061kd1sppz38ysr1zvdqh2na9lcqknn1aah3dk874p7hj901pmvy"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/vishvananda/netns"))
  (propagated-inputs
   `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
  (home-page
   "https://github.com/vishvananda/netns")
  (synopsis "netns - network namespaces in go")
  (description
   "Package netns allows ultra-simple network namespace handling.  NsHandles can be\nretrieved and set.  Note that the current namespace is thread local so actions\nthat set and reset namespaces should use LockOSThread to make sure the namespace\ndoesn't change due to a goroutine switch.  It is best to close NsHandles when\nyou are done with them.  This can be accomplished via a `defer ns.Close()` on\nthe handle.  Changing namespaces requires elevated privileges, so in most cases\nthis code needs to be run as root.")
  (license license:asl2.0))
(package
  (name "go-github-com-xeipuuv-gojsonpointer")
  (version "0.0.0-20190905194746-02993c407bfb")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/xeipuuv/gojsonpointer")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0y7gmpgsm8c12ax4a0ij9srmd9d424iq224n172ckwfqf37amvzy"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/xeipuuv/gojsonpointer"))
  (home-page
   "https://github.com/xeipuuv/gojsonpointer")
  (synopsis "gojsonpointer")
  (description
   "An implementation of JSON Pointer - Go language")
  (license license:asl2.0))
(package
  (name "go-github-com-xeipuuv-gojsonreference")
  (version "0.0.0-20180127040603-bd5ef7bd5415")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/xeipuuv/gojsonreference")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1xby79padc7bmyb8rfbad8wfnfdzpnh51b1n8c0kibch0kwc1db5"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/xeipuuv/gojsonreference"))
  (home-page
   "https://github.com/xeipuuv/gojsonreference")
  (synopsis "gojsonreference")
  (description
   "An implementation of JSON Reference - Go language")
  (license license:asl2.0))
(package
  (name "go-github-com-xeipuuv-gojsonschema")
  (version "1.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/xeipuuv/gojsonschema")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1mqiq0r8qw4qlfp3ls8073r6514rmzwrmdn4j33rppk3zh942i6l"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/xeipuuv/gojsonschema"))
  (propagated-inputs
   `(("go-github-com-xeipuuv-gojsonreference"
      ,go-github-com-xeipuuv-gojsonreference)
     ("go-github-com-xeipuuv-gojsonpointer"
      ,go-github-com-xeipuuv-gojsonpointer)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)))
  (home-page
   "https://github.com/xeipuuv/gojsonschema")
  (synopsis "gojsonschema")
  (description
   "An implementation of JSON Schema for the Go  programming language.  Supports\ndraft-04, draft-06 and draft-07.")
  (license license:asl2.0))
(package
  (name "go-go-mozilla-org-pkcs7")
  (version "0.0.0-20210826202110-33d05740a352")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/mozilla-services/pkcs7")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1gw1jsmcyf881612v5ncq23rlvqsvan47clh5pfdfn6cp4gax4y7"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "go.mozilla.org/pkcs7"))
  (home-page "https://go.mozilla.org/pkcs7")
  (synopsis "pkcs7")
  (description
   "Package pkcs7 implements parsing and generation of some PKCS#7 structures.")
  (license license:expat))
(package
  (name "go-github-com-cespare-xxhash-v2")
  (version "2.1.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/cespare/xxhash")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1f3wyr9msnnz94szrkmnfps9wm40s5sp9i4ak0kl92zcrkmpy29a"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/cespare/xxhash/v2"))
  (home-page "https://github.com/cespare/xxhash")
  (synopsis "xxhash")
  (description
   "Package xxhash implements the 64-bit variant of xxHash (XXH64) as described at\n@url{http://cyan4973.github.io/xxHash/,http://cyan4973.github.io/xxHash/}.")
  (license license:expat))
(package
  (name "go-github-com-cncf-udpa-go")
  (version "0.0.0-20220112060539-c52dc94e7fbe")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/cncf/udpa")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1i3nm1hxc4am3a7d9wxvf0ia420qg1xpwflcc0z19lxn952bdbnd"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/cncf/udpa/go"
     #:unpack-path
     "github.com/cncf/udpa"))
  (propagated-inputs
   `(("go-github-com-cncf-xds-go"
      ,go-github-com-cncf-xds-go)))
  (home-page "https://github.com/cncf/udpa")
  (synopsis "Description")
  (description
   "This library has been deprecated in favor of @code{github.com/cncf/xds/go}.  All\nusers are recommended to switch their imports.")
  (license license:asl2.0))
(package
  (name "go-github-com-cncf-xds-go")
  (version "0.0.0-20220520190051-1e77728a1eaa")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/cncf/xds")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "190r2ci1wvzk4idmcc8dm1cgxz21zhrxdmz269q3ccwhwgcbh7l8"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/cncf/xds/go"
     #:unpack-path
     "github.com/cncf/xds"))
  (propagated-inputs
   `(("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-envoyproxy-protoc-gen-validate"
      ,go-github-com-envoyproxy-protoc-gen-validate)))
  (home-page "https://github.com/cncf/xds")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-go-opentelemetry-io-proto-otlp")
  (version "0.19.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/open-telemetry/opentelemetry-proto-go")
           (commit (string-append "otlp/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0z5rb31d02i7ihx46hzyq8hq8vx7c89m65821s5wk3vl50yh9nhy"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "go.opentelemetry.io/proto/otlp"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-github-com-grpc-ecosystem-grpc-gateway-v2"
      ,go-github-com-grpc-ecosystem-grpc-gateway-v2)))
  (home-page
   "https://go.opentelemetry.io/proto/otlp")
  (synopsis #f)
  (description #f)
  (license license:asl2.0))
(package
  (name "go-github-com-envoyproxy-go-control-plane")
  (version "0.10.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/envoyproxy/go-control-plane")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "02zg0yn1jzjih48679q0jnn3z7jgircy8slg6japxvgnh937wg53"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/envoyproxy/go-control-plane"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-go-opentelemetry-io-proto-otlp"
      ,go-go-opentelemetry-io-proto-otlp)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-prometheus-client-model"
      ,go-github-com-prometheus-client-model)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-envoyproxy-protoc-gen-validate"
      ,go-github-com-envoyproxy-protoc-gen-validate)
     ("go-github-com-cncf-xds-go"
      ,go-github-com-cncf-xds-go)
     ("go-github-com-census-instrumentation-opencensus-proto"
      ,go-github-com-census-instrumentation-opencensus-proto)))
  (home-page
   "https://github.com/envoyproxy/go-control-plane")
  (synopsis "control-plane")
  (description
   "This repository contains a Go-based implementation of an API server that\nimplements the discovery service APIs defined in\n@url{https://github.com/envoyproxy/data-plane-api,data-plane-api}.")
  (license license:asl2.0))
(package
  (name "go-github-com-antihax-optional")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/antihax/optional")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1ix08vl49qxr58rc6201cl97g1yznhhkwvqldslawind99js4rj0"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/antihax/optional"))
  (home-page "https://github.com/antihax/optional")
  (synopsis #f)
  (description #f)
  (license license:expat))
(package
  (name "go-github-com-golang-glog")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/golang/glog")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0vm206qrvhn3d571bqcman6fnavw4y3a31ffrmv2xkk0li74h2bf"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/golang/glog"))
  (home-page "https://github.com/golang/glog")
  (synopsis "glog")
  (description
   "Package glog implements logging analogous to the Google-internal C++\nINFO/ERROR/V setup.  It provides functions Info, Warning, Error, Fatal, plus\nformatting variants such as Infof.  It also provides V-style logging controlled\nby the -v and -vmodule=file=2 flags.")
  (license license:asl2.0))
(package
  (name "go-github-com-rogpeppe-fastuuid")
  (version "1.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/rogpeppe/fastuuid")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "028acdg63zkxpjz3l639nlhki2l0canr2v5jglrmwa1wpjqcfff8"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/rogpeppe/fastuuid"))
  (home-page
   "https://github.com/rogpeppe/fastuuid")
  (synopsis "fastuuid")
  (description
   "Package fastuuid provides fast UUID generation of 192 bit universally unique\nidentifiers.")
  (license license:bsd-3))
(package
  (name "go-github-com-grpc-ecosystem-grpc-gateway-v2")
  (version "2.11.3")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/grpc-ecosystem/grpc-gateway")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0qynzcfddc1q63h7a3lfi1b6i3l9sk9c9668nmnw70bd3976wr0l"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/grpc-ecosystem/grpc-gateway/v2"))
  (propagated-inputs
   `(("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
     ("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-kr-pretty"
      ,go-github-com-kr-pretty)
     ("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-github-com-rogpeppe-fastuuid"
      ,go-github-com-rogpeppe-fastuuid)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-glog"
      ,go-github-com-golang-glog)
     ("go-github-com-antihax-optional"
      ,go-github-com-antihax-optional)))
  (home-page
   "https://github.com/grpc-ecosystem/grpc-gateway")
  (synopsis "About")
  (description
   "The gRPC-Gateway is a plugin of the Google protocol buffers compiler\n@url{https://github.com/protocolbuffers/protobuf,protoc}.  It reads protobuf\nservice definitions and generates a reverse-proxy server which translates a\nRESTful HTTP API into gRPC.  This server is generated according to the\n@url{https://github.com/googleapis/googleapis/raw/master/google/api/http.proto#L46,(code\ngoogle.api.http)} annotations in your service definitions.")
  (license license:bsd-3))
(package
  (name "go-cloud-google-com-go-aiplatform")
  (version "1.24.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "aiplatform/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "03wskmkrcgami32zid33s0xdznzkpsllp0w2bnwsm0lyhs8v0bsq"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/aiplatform"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/aiplatform")
  (synopsis "Vertex AI API")
  (description
   "Go Client Library for Vertex AI API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-analytics")
  (version "0.12.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "analytics/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/analytics"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)))
  (home-page
   "https://cloud.google.com/go/analytics")
  (synopsis "Analytics API")
  (description
   "Go Client Library for Analytics API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-area120")
  (version "0.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "area120/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/area120"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)))
  (home-page "https://cloud.google.com/go/area120")
  (synopsis "Area120 API")
  (description
   "Go Client Library for Area120 API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-artifactregistry")
  (version "1.7.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "artifactregistry/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/artifactregistry"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/artifactregistry")
  (synopsis "Artifact Registry API")
  (description
   "Go Client Library for Artifact Registry API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-asset")
  (version "1.7.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "asset/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "03wskmkrcgami32zid33s0xdznzkpsllp0w2bnwsm0lyhs8v0bsq"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/asset"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page "https://cloud.google.com/go/asset")
  (synopsis "Cloud Asset API")
  (description
   "Go Client Library for Cloud Asset API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-assuredworkloads")
  (version "1.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "assuredworkloads/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/assuredworkloads"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/assuredworkloads")
  (synopsis "Assured Workloads API")
  (description
   "Go Client Library for Assured Workloads API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-automl")
  (version "1.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "automl/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/automl"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page "https://cloud.google.com/go/automl")
  (synopsis "Cloud AutoML API")
  (description
   "Go Client Library for Cloud AutoML API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-bigquery")
  (version "1.42.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "bigquery/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1yhvifacagca4hf3h9nqdslzlnbn26566n5y4rnhk3l34rckmjkz"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/bigquery"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-googleapis-go-type-adapters"
      ,go-github-com-googleapis-go-type-adapters)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-google-martian-v3"
      ,go-github-com-google-martian-v3)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-cloud-google-com-go-storage"
      ,go-cloud-google-com-go-storage)
     ("go-cloud-google-com-go-iam"
      ,go-cloud-google-com-go-iam)
     ("go-cloud-google-com-go-datacatalog"
      ,go-cloud-google-com-go-datacatalog)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/bigquery")
  (synopsis "BigQuery")
  (description
   "Package bigquery provides a client for the BigQuery service.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-billing")
  (version "1.5.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "billing/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/billing"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)))
  (home-page "https://cloud.google.com/go/billing")
  (synopsis "Cloud Billing API")
  (description
   "Go Client Library for Cloud Billing API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-binaryauthorization")
  (version "1.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append
             "binaryauthorization/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/binaryauthorization"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)))
  (home-page
   "https://cloud.google.com/go/binaryauthorization")
  (synopsis "Binary Authorization API")
  (description
   "Go Client Library for Binary Authorization API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-cloudtasks")
  (version "1.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "cloudtasks/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/cloudtasks"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)))
  (home-page
   "https://cloud.google.com/go/cloudtasks")
  (synopsis "Cloud Tasks API")
  (description
   "Go Client Library for Cloud Tasks API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-grafeas")
  (version "0.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "grafeas/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "04i77f5gdcwpqxpgjl7g1rbc76y3678bf1ppcxcbjw37kmkqs4zf"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/grafeas"))
  (propagated-inputs
   `(("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page "https://cloud.google.com/go/grafeas")
  (synopsis "Grafeas API")
  (description
   "Go Client Library for Grafeas API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-containeranalysis")
  (version "0.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "containeranalysis/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "01b8wyd4nhi8kqj5mx7z2cmsfgs9c6dsmdpf8bx6gmhw2l1jai2s"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/containeranalysis"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go-grafeas"
      ,go-cloud-google-com-go-grafeas)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/containeranalysis")
  (synopsis "Container Analysis API")
  (description
   "Go Client Library for Container Analysis API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-datacatalog")
  (version "1.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "datacatalog/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/datacatalog"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)))
  (home-page
   "https://cloud.google.com/go/datacatalog")
  (synopsis "Google Cloud Data Catalog API")
  (description
   "Go Client Library for Google Cloud Data Catalog API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-dataflow")
  (version "0.7.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "dataflow/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/dataflow"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)))
  (home-page
   "https://cloud.google.com/go/dataflow")
  (synopsis "Dataflow API")
  (description
   "Go Client Library for Dataflow API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-dataform")
  (version "0.4.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "dataform/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/dataform"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)))
  (home-page
   "https://cloud.google.com/go/dataform")
  (synopsis "Dataform API")
  (description
   "Go Client Library for Dataform API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-datalabeling")
  (version "0.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "datalabeling/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/datalabeling"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/datalabeling")
  (synopsis "Data Labeling API")
  (description
   "Go Client Library for Data Labeling API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-dataqna")
  (version "0.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "dataqna/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/dataqna"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)))
  (home-page "https://cloud.google.com/go/dataqna")
  (synopsis "Data QnA API")
  (description
   "Go Client Library for Data QnA API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-datastream")
  (version "1.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "datastream/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/datastream"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/datastream")
  (synopsis "Datastream API")
  (description
   "Go Client Library for Datastream API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-dialogflow")
  (version "1.16.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "dialogflow/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "03wskmkrcgami32zid33s0xdznzkpsllp0w2bnwsm0lyhs8v0bsq"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/dialogflow"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/dialogflow")
  (synopsis "Dialogflow API")
  (description
   "Go Client Library for Dialogflow API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-documentai")
  (version "1.8.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "documentai/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/documentai"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/documentai")
  (synopsis "Cloud Document AI API")
  (description
   "Go Client Library for Cloud Document AI API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-domains")
  (version "0.7.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "domains/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/domains"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page "https://cloud.google.com/go/domains")
  (synopsis "Cloud Domains API")
  (description
   "Go Client Library for Cloud Domains API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-edgecontainer")
  (version "0.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "edgecontainer/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1pc3qilgjpbaniq10y7439kv19lkia766wprznd1g8bjcylg2hir"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/edgecontainer"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/edgecontainer")
  (synopsis "Distributed Cloud Edge Container API")
  (description
   "Go Client Library for Distributed Cloud Edge Container API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-functions")
  (version "1.7.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "functions/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/functions"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/functions")
  (synopsis "Cloud Functions API")
  (description
   "Go Client Library for Cloud Functions API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-gaming")
  (version "1.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "gaming/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/gaming"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page "https://cloud.google.com/go/gaming")
  (synopsis "Game Services API")
  (description
   "Go Client Library for Game Services API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-gkeconnect")
  (version "0.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "gkeconnect/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/gkeconnect"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)))
  (home-page
   "https://cloud.google.com/go/gkeconnect")
  (synopsis "GKE Connect APIs")
  (description
   "Go Client Library for GKE Connect APIs.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-gkehub")
  (version "0.10.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "gkehub/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/gkehub"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page "https://cloud.google.com/go/gkehub")
  (synopsis "GKE Hub")
  (description "Go Client Library for GKE Hub.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-language")
  (version "1.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "language/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "03wskmkrcgami32zid33s0xdznzkpsllp0w2bnwsm0lyhs8v0bsq"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/language"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/language")
  (synopsis "Cloud Natural Language API")
  (description
   "Go Client Library for Cloud Natural Language API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-lifesciences")
  (version "0.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "lifesciences/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/lifesciences"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/lifesciences")
  (synopsis "Cloud Life Sciences API")
  (description
   "Go Client Library for Cloud Life Sciences API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-mediatranslation")
  (version "0.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "mediatranslation/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/mediatranslation"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)))
  (home-page
   "https://cloud.google.com/go/mediatranslation")
  (synopsis "Media Translation API")
  (description
   "Go Client Library for Media Translation API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-memcache")
  (version "1.5.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "memcache/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/memcache"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/memcache")
  (synopsis "Cloud Memorystore for Memcached API")
  (description
   "Go Client Library for Cloud Memorystore for Memcached API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-metastore")
  (version "1.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "metastore/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/metastore"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/metastore")
  (synopsis "Dataproc Metastore API")
  (description
   "Go Client Library for Dataproc Metastore API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-networkconnectivity")
  (version "1.5.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append
             "networkconnectivity/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/networkconnectivity"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/networkconnectivity")
  (synopsis "Network Connectivity API")
  (description
   "Go Client Library for Network Connectivity API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-networksecurity")
  (version "0.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "networksecurity/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/networksecurity"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/networksecurity")
  (synopsis "Network Security API")
  (description
   "Go Client Library for Network Security API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-notebooks")
  (version "1.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "notebooks/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/notebooks"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/notebooks")
  (synopsis "Notebooks API")
  (description
   "Go Client Library for Notebooks API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-osconfig")
  (version "1.8.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "osconfig/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/osconfig"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/osconfig")
  (synopsis "OS Config API")
  (description
   "Go Client Library for OS Config API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-oslogin")
  (version "1.5.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "oslogin/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/oslogin"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)))
  (home-page "https://cloud.google.com/go/oslogin")
  (synopsis "Cloud OS Login API")
  (description
   "Go Client Library for Cloud OS Login API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-phishingprotection")
  (version "0.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "phishingprotection/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/phishingprotection"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)))
  (home-page
   "https://cloud.google.com/go/phishingprotection")
  (synopsis "Phishing Protection API")
  (description
   "Go Client Library for Phishing Protection API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-privatecatalog")
  (version "0.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "privatecatalog/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/privatecatalog"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)))
  (home-page
   "https://cloud.google.com/go/privatecatalog")
  (synopsis "Cloud Private Catalog API")
  (description
   "Go Client Library for Cloud Private Catalog API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-recaptchaenterprise")
  (version "1.3.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append
             "recaptchaenterprise/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0fdbpbm8imxpqzim4djq13kjv1kca6dcasnyc1d1h3m742gajfsk"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/recaptchaenterprise"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)))
  (home-page
   "https://cloud.google.com/go/recaptchaenterprise")
  (synopsis "reCAPTCHA Enterprise API")
  (description
   "Go Client Library for reCAPTCHA Enterprise API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-recaptchaenterprise-v2")
  (version "2.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append
             "recaptchaenterprise/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/recaptchaenterprise/v2"
     #:unpack-path
     "cloud.google.com/go/recaptchaenterprise/v2"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go-recaptchaenterprise"
      ,go-cloud-google-com-go-recaptchaenterprise)))
  (home-page
   "https://cloud.google.com/go/recaptchaenterprise/v2")
  (synopsis "reCAPTCHA Enterprise API")
  (description
   "Go Client Library for reCAPTCHA Enterprise API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-recommendationengine")
  (version "0.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append
             "recommendationengine/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/recommendationengine"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/recommendationengine")
  (synopsis "Recommendations AI")
  (description
   "Go Client Library for Recommendations AI.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-recommender")
  (version "1.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "recommender/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/recommender"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)))
  (home-page
   "https://cloud.google.com/go/recommender")
  (synopsis "Recommender API")
  (description
   "Go Client Library for Recommender API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-redis")
  (version "1.8.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "redis/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/redis"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page "https://cloud.google.com/go/redis")
  (synopsis
   "Google Cloud Memorystore for Redis API")
  (description
   "Go Client Library for Google Cloud Memorystore for Redis API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-retail")
  (version "1.9.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "retail/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/retail"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page "https://cloud.google.com/go/retail")
  (synopsis "Retail API")
  (description "Go Client Library for Retail API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-scheduler")
  (version "1.5.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "scheduler/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/scheduler"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)))
  (home-page
   "https://cloud.google.com/go/scheduler")
  (synopsis "Cloud Scheduler API")
  (description
   "Go Client Library for Cloud Scheduler API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-secretmanager")
  (version "1.7.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "secretmanager/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/secretmanager"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go-iam"
      ,go-cloud-google-com-go-iam)))
  (home-page
   "https://cloud.google.com/go/secretmanager")
  (synopsis "Secret Manager API")
  (description
   "Go Client Library for Secret Manager API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-security")
  (version "1.8.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "security/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/security"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/security")
  (synopsis "Security APIs")
  (description
   "Go Client Library for Security APIs.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-securitycenter")
  (version "1.14.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "securitycenter/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/securitycenter"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/securitycenter")
  (synopsis "Security Command Center API")
  (description
   "Go Client Library for Security Command Center API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-servicedirectory")
  (version "1.5.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "servicedirectory/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/servicedirectory"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)))
  (home-page
   "https://cloud.google.com/go/servicedirectory")
  (synopsis "Service Directory API")
  (description
   "Go Client Library for Service Directory API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-speech")
  (version "1.7.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "speech/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/speech"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page "https://cloud.google.com/go/speech")
  (synopsis "Cloud Speech-to-Text API")
  (description
   "Go Client Library for Cloud Speech-to-Text API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-talent")
  (version "1.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "talent/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/talent"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page "https://cloud.google.com/go/talent")
  (synopsis "Cloud Talent Solution API")
  (description
   "Go Client Library for Cloud Talent Solution API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-videointelligence")
  (version "1.7.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit
            (string-append "videointelligence/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/videointelligence"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/videointelligence")
  (synopsis "Google Cloud Video Intelligence API")
  (description
   "Go Client Library for Google Cloud Video Intelligence API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-vision")
  (version "1.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "vision/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1qcdyvamdg4l9947xnysl27nwp1js1yqfi996ly3psy3ykcgsgdc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/vision"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page "https://cloud.google.com/go/vision")
  (synopsis "Cloud Vision API")
  (description
   "Go Client Library for Cloud Vision API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-vision-v2")
  (version "2.3.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "vision/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "cloud.google.com/go/vision/v2"
     #:unpack-path
     "cloud.google.com/go/vision/v2"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go-vision"
      ,go-cloud-google-com-go-vision)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/vision/v2")
  (synopsis "Cloud Vision API")
  (description
   "Go Client Library for Cloud Vision API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-webrisk")
  (version "1.5.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "webrisk/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/webrisk"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)))
  (home-page "https://cloud.google.com/go/webrisk")
  (synopsis "Web Risk API")
  (description
   "Go Client Library for Web Risk API.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-storage")
  (version "1.27.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "storage/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "18lw9g9ai64jhv135gcwjlgcc4fyya9vfmvi9md3rcmbriz3ywy4"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/storage"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-martian-v3"
      ,go-github-com-google-martian-v3)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-cloud-google-com-go-iam"
      ,go-cloud-google-com-go-iam)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page "https://cloud.google.com/go/storage")
  (synopsis "Cloud Storage")
  (description
   "Package storage provides an easy way to work with Google Cloud Storage.  Google\nCloud Storage stores data in named objects, which are grouped into buckets.")
  (license license:asl2.0))
(package
  (name "go-google-golang-org-grpc-cmd-protoc-gen-go-grpc")
  (version "1.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/grpc/grpc-go")
           (commit
            (string-append
             "cmd/protoc-gen-go-grpc/"
             "v"
             version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1qhhwlcdzl556xav2bldl048jkxk95g4kc5sv8wyvjih9k5cr0d4"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "google.golang.org/grpc/cmd/protoc-gen-go-grpc"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)))
  (home-page
   "https://google.golang.org/grpc/cmd/protoc-gen-go-grpc")
  (synopsis "protoc-gen-go-grpc")
  (description
   "protoc-gen-go-grpc is a plugin for the Google protocol buffer compiler to\ngenerate Go code.  Install it by building this program and making it accessible\nwithin your PATH with the name:")
  (license license:asl2.0))
(package
  (name "go-github-com-google-martian-v3")
  (version "3.3.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/google/martian")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "16ag4vb2q7qcq6j5n5pj204gdd4g22bjbk2mbagmrpx3h1r3hfnl"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/google/martian/v3"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc-cmd-protoc-gen-go-grpc"
      ,go-google-golang-org-grpc-cmd-protoc-gen-go-grpc)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-golang-snappy"
      ,go-github-com-golang-snappy)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)))
  (home-page "https://github.com/google/martian")
  (synopsis "Martian Proxy")
  (description
   "Package martian provides an HTTP/1.1 proxy with an API for configurable request\nand response modifiers.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-iam")
  (version "0.5.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "iam/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "03wskmkrcgami32zid33s0xdznzkpsllp0w2bnwsm0lyhs8v0bsq"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/iam"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page "https://cloud.google.com/go/iam")
  (synopsis "IAM API")
  (description
   "Package iam supports the resource-specific operations of Google Cloud IAM\n(Identity and Access Management) for the Google Cloud Libraries.  See\n@url{https://cloud.google.com/iam,https://cloud.google.com/iam} for more about\nIAM.")
  (license license:asl2.0))
(package
  (name "go-github-com-googleapis-go-type-adapters")
  (version "1.0.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/go-type-adapters")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "11y2a2xg3wb02ywq1jy03acz7vd1yggpm2jm2dv47z2mwjpa6xmv"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/googleapis/go-type-adapters"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)))
  (home-page
   "https://github.com/googleapis/go-type-adapters")
  (synopsis "Go google.type Adapters")
  (description
   "This library provides helper functions for converting between the Go proto\nmessages in @code{google.type} (as found in\n@url{https://pkg.go.dev/google.golang.org/genproto,genproto}) and Golang native\ntypes.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go")
  (version "0.104.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1alcp8zmlx8jcb7d2qiqrcpyiljfn36702c3r3c6mhp6v34ax1h7"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-googleapis-go-type-adapters"
      ,go-github-com-googleapis-go-type-adapters)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-iam"
      ,go-cloud-google-com-go-iam)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-google-martian-v3"
      ,go-github-com-google-martian-v3)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-cloud-google-com-go-storage"
      ,go-cloud-google-com-go-storage)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)))
  (home-page "https://cloud.google.com/go")
  (synopsis "Google Cloud Client Libraries for Go")
  (description
   "Package cloud is the root of the packages used to access Google Cloud Services.\nSee\n@url{https://godoc.org/cloud.google.com/go,https://godoc.org/cloud.google.com/go}\nfor a full list of sub-packages.")
  (license license:asl2.0))
(package
  (name "go-github-com-googleapis-gax-go-v2")
  (version "2.5.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/gax-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0yb2vvvlgzqjnkrw21gpi46nz7jdana1akbzvysy4xzzphcdsgps"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/googleapis/gax-go/v2"))
  (propagated-inputs
   `(("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)))
  (home-page
   "https://github.com/googleapis/gax-go")
  (synopsis #f)
  (description
   "Package gax contains a set of modules which aid the development of APIs for\nclients and servers based on gRPC and Google API conventions.")
  (license license:bsd-3))
(package
  (name "go-google-golang-org-api")
  (version "0.98.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-api-go-client")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "01hb51cliw273ywn77b4pqlzq7bbmpia7xlbgpr364dl3bj0bacg"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "google.golang.org/api"))
  (propagated-inputs
   `(("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)))
  (home-page "https://google.golang.org/api")
  (synopsis "Google APIs Client Library for Go")
  (description
   "Package api is the root of the packages used to access Google Cloud Services.\nSee\n@url{https://godoc.org/google.golang.org/api,https://godoc.org/google.golang.org/api}\nfor a full list of sub-packages.")
  (license license:bsd-3))
(package
  (name "go-cloud-google-com-go-compute")
  (version "1.10.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "compute/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1jbihqfwis5g3wd43v5bwlsiibbid9if990ybs3l4vmf4ry9z43m"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/compute"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page "https://cloud.google.com/go/compute")
  (synopsis "Compute API")
  (description
   "Go Client Library for Compute API.")
  (license license:asl2.0))
(package
  (name "go-github-com-googleapis-enterprise-certificate-proxy")
  (version "0.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/enterprise-certificate-proxy")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0jzqc16im89rkkjsq3aspnvak76xa1mqr4vvvqgd6lzy0p73xc94"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/googleapis/enterprise-certificate-proxy"))
  (home-page
   "https://github.com/googleapis/enterprise-certificate-proxy")
  (synopsis
   "Google Proxies for Enterprise Certificates")
  (description
   "Google Enterprise Certificate Proxies are part of the\n@url{https://cloud.google.com/beyondcorp,Google Cloud Zero Trust architecture}\nthat enables mutual authentication with\n@url{https://en.wikipedia.org/wiki/Client_certificate,client-side certificates}.\n This repository contains a set of proxies/modules that can be used by clients\nor toolings to interact with certificates that are stored in\n@url{https://en.wikipedia.org/wiki/Key_management,protected key storage\nsystems}.")
  (license license:asl2.0))
(package
  (name "go-github-com-golang-groupcache")
  (version "0.0.0-20210331224755-41bb18bfe9da")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/golang/groupcache")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "07amgr8ji4mnq91qbsw2jlcmw6hqiwdf4kzfdrj8c4b05w4knszc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/golang/groupcache"))
  (home-page
   "https://github.com/golang/groupcache")
  (synopsis "groupcache")
  (description
   "Package groupcache provides a data loading mechanism with caching and\nde-duplication that works across a set of peer processes.")
  (license license:asl2.0))
(package
  (name "go-go-opencensus-io")
  (version "0.23.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/census-instrumentation/opencensus-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0gw4f7inf8y2ik00yfb36xganiq9rl4w2d1a41bsjqsh83ajz2km"))))
  (build-system go-build-system)
  (arguments '(#:import-path "go.opencensus.io"))
  (propagated-inputs
   `(("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)))
  (home-page "https://go.opencensus.io")
  (synopsis "OpenCensus Libraries for Go")
  (description
   "Package opencensus contains Go support for OpenCensus.")
  (license license:asl2.0))
(package
  (name "go-cloud-google-com-go-workflows")
  (version "1.7.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/google-cloud-go")
           (commit (string-append "workflows/" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wi01z6d23d0zzj2pw4h95ns8dy7ch9izpvv67wirl2nkjx3fclc"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "cloud.google.com/go/workflows"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-github-com-googleapis-enterprise-certificate-proxy"
      ,go-github-com-googleapis-enterprise-certificate-proxy)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-cloud-google-com-go-compute"
      ,go-cloud-google-com-go-compute)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-google-golang-org-api"
      ,go-google-golang-org-api)
     ("go-github-com-googleapis-gax-go-v2"
      ,go-github-com-googleapis-gax-go-v2)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)))
  (home-page
   "https://cloud.google.com/go/workflows")
  (synopsis "Workflows API")
  (description
   "Go Client Library for Workflows API.")
  (license license:asl2.0))
(package
  (name "go-google-golang-org-genproto")
  (version "0.0.0-20220927151529-dcaddaf36704")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/googleapis/go-genproto")
           (commit (go-version->git-ref version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "17h0ri3cm06d003qj9xxbnbrajvrisrbww99k53gj3r254pfya2h"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "google.golang.org/genproto"))
  (propagated-inputs
   `(("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-cloud-google-com-go-workflows"
      ,go-cloud-google-com-go-workflows)
     ("go-cloud-google-com-go-webrisk"
      ,go-cloud-google-com-go-webrisk)
     ("go-cloud-google-com-go-vision-v2"
      ,go-cloud-google-com-go-vision-v2)
     ("go-cloud-google-com-go-videointelligence"
      ,go-cloud-google-com-go-videointelligence)
     ("go-cloud-google-com-go-talent"
      ,go-cloud-google-com-go-talent)
     ("go-cloud-google-com-go-speech"
      ,go-cloud-google-com-go-speech)
     ("go-cloud-google-com-go-servicedirectory"
      ,go-cloud-google-com-go-servicedirectory)
     ("go-cloud-google-com-go-securitycenter"
      ,go-cloud-google-com-go-securitycenter)
     ("go-cloud-google-com-go-security"
      ,go-cloud-google-com-go-security)
     ("go-cloud-google-com-go-secretmanager"
      ,go-cloud-google-com-go-secretmanager)
     ("go-cloud-google-com-go-scheduler"
      ,go-cloud-google-com-go-scheduler)
     ("go-cloud-google-com-go-retail"
      ,go-cloud-google-com-go-retail)
     ("go-cloud-google-com-go-redis"
      ,go-cloud-google-com-go-redis)
     ("go-cloud-google-com-go-recommender"
      ,go-cloud-google-com-go-recommender)
     ("go-cloud-google-com-go-recommendationengine"
      ,go-cloud-google-com-go-recommendationengine)
     ("go-cloud-google-com-go-recaptchaenterprise-v2"
      ,go-cloud-google-com-go-recaptchaenterprise-v2)
     ("go-cloud-google-com-go-privatecatalog"
      ,go-cloud-google-com-go-privatecatalog)
     ("go-cloud-google-com-go-phishingprotection"
      ,go-cloud-google-com-go-phishingprotection)
     ("go-cloud-google-com-go-oslogin"
      ,go-cloud-google-com-go-oslogin)
     ("go-cloud-google-com-go-osconfig"
      ,go-cloud-google-com-go-osconfig)
     ("go-cloud-google-com-go-notebooks"
      ,go-cloud-google-com-go-notebooks)
     ("go-cloud-google-com-go-networksecurity"
      ,go-cloud-google-com-go-networksecurity)
     ("go-cloud-google-com-go-networkconnectivity"
      ,go-cloud-google-com-go-networkconnectivity)
     ("go-cloud-google-com-go-metastore"
      ,go-cloud-google-com-go-metastore)
     ("go-cloud-google-com-go-memcache"
      ,go-cloud-google-com-go-memcache)
     ("go-cloud-google-com-go-mediatranslation"
      ,go-cloud-google-com-go-mediatranslation)
     ("go-cloud-google-com-go-lifesciences"
      ,go-cloud-google-com-go-lifesciences)
     ("go-cloud-google-com-go-language"
      ,go-cloud-google-com-go-language)
     ("go-cloud-google-com-go-gkehub"
      ,go-cloud-google-com-go-gkehub)
     ("go-cloud-google-com-go-gkeconnect"
      ,go-cloud-google-com-go-gkeconnect)
     ("go-cloud-google-com-go-gaming"
      ,go-cloud-google-com-go-gaming)
     ("go-cloud-google-com-go-functions"
      ,go-cloud-google-com-go-functions)
     ("go-cloud-google-com-go-edgecontainer"
      ,go-cloud-google-com-go-edgecontainer)
     ("go-cloud-google-com-go-domains"
      ,go-cloud-google-com-go-domains)
     ("go-cloud-google-com-go-documentai"
      ,go-cloud-google-com-go-documentai)
     ("go-cloud-google-com-go-dialogflow"
      ,go-cloud-google-com-go-dialogflow)
     ("go-cloud-google-com-go-datastream"
      ,go-cloud-google-com-go-datastream)
     ("go-cloud-google-com-go-dataqna"
      ,go-cloud-google-com-go-dataqna)
     ("go-cloud-google-com-go-datalabeling"
      ,go-cloud-google-com-go-datalabeling)
     ("go-cloud-google-com-go-dataform"
      ,go-cloud-google-com-go-dataform)
     ("go-cloud-google-com-go-dataflow"
      ,go-cloud-google-com-go-dataflow)
     ("go-cloud-google-com-go-datacatalog"
      ,go-cloud-google-com-go-datacatalog)
     ("go-cloud-google-com-go-containeranalysis"
      ,go-cloud-google-com-go-containeranalysis)
     ("go-cloud-google-com-go-cloudtasks"
      ,go-cloud-google-com-go-cloudtasks)
     ("go-cloud-google-com-go-binaryauthorization"
      ,go-cloud-google-com-go-binaryauthorization)
     ("go-cloud-google-com-go-billing"
      ,go-cloud-google-com-go-billing)
     ("go-cloud-google-com-go-bigquery"
      ,go-cloud-google-com-go-bigquery)
     ("go-cloud-google-com-go-automl"
      ,go-cloud-google-com-go-automl)
     ("go-cloud-google-com-go-assuredworkloads"
      ,go-cloud-google-com-go-assuredworkloads)
     ("go-cloud-google-com-go-asset"
      ,go-cloud-google-com-go-asset)
     ("go-cloud-google-com-go-artifactregistry"
      ,go-cloud-google-com-go-artifactregistry)
     ("go-cloud-google-com-go-area120"
      ,go-cloud-google-com-go-area120)
     ("go-cloud-google-com-go-analytics"
      ,go-cloud-google-com-go-analytics)
     ("go-cloud-google-com-go-aiplatform"
      ,go-cloud-google-com-go-aiplatform)))
  (home-page "https://google.golang.org/genproto")
  (synopsis "Go generated proto packages")
  (description
   "This repository contains the generated Go packages for common protocol buffer\ntypes, and the generated @url{http://grpc.io,gRPC} code necessary for\ninteracting with Google's gRPC APIs.")
  (license license:asl2.0))
(package
  (name "go-github-com-census-instrumentation-opencensus-proto")
  (version "0.4.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/census-instrumentation/opencensus-proto")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0zda7v8fqbc2hamnwajdwr9742nznajxgcw636n570v8k5ahrymw"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/census-instrumentation/opencensus-proto"))
  (propagated-inputs
   `(("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-github-com-grpc-ecosystem-grpc-gateway-v2"
      ,go-github-com-grpc-ecosystem-grpc-gateway-v2)))
  (home-page
   "https://github.com/census-instrumentation/opencensus-proto")
  (synopsis
   "OpenCensus Proto - Language Independent Interface Types For OpenCensus")
  (description
   "Census provides a framework to define and collect stats against metrics and to\nbreak those stats down across user-defined dimensions.")
  (license license:asl2.0))
(package
  (name "go-github-com-iancoleman-strcase")
  (version "0.2.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/iancoleman/strcase")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0rgfn6zz1r9h7yic3b0dcqq900bi638d6qgcyy9jhvk00f4dlg5j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/iancoleman/strcase"))
  (home-page
   "https://github.com/iancoleman/strcase")
  (synopsis "strcase")
  (description
   "Package strcase converts strings to various cases.  See the conversion table\nbelow:")
  (license license:expat))
(package
  (name "go-github-com-lyft-protoc-gen-star")
  (version "0.6.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/lyft/protoc-gen-star")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "101zm3ajxqqqagn4y1kpd7szb97an5v27ih85ypl4yz3q07grjn5"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/lyft/protoc-gen-star"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-github-com-stretchr-testify"
      ,go-github-com-stretchr-testify)
     ("go-github-com-spf13-afero"
      ,go-github-com-spf13-afero)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)))
  (home-page
   "https://github.com/lyft/protoc-gen-star")
  (synopsis "protoc-gen-star (PG*)")
  (description
   "Package pgs provides a library for building protoc plugins")
  (license license:asl2.0))
(package
  (name "go-github-com-envoyproxy-protoc-gen-validate")
  (version "0.6.8")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/envoyproxy/protoc-gen-validate")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0s9lw11bpqlgh33a9p5ls09xcazfcgsqimnvw8mhr27jlxyqgbmk"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/envoyproxy/protoc-gen-validate"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-golang-org-x-tools" ,go-golang-org-x-tools)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-lint" ,go-golang-org-x-lint)
     ("go-github-com-spf13-afero"
      ,go-github-com-spf13-afero)
     ("go-github-com-lyft-protoc-gen-star"
      ,go-github-com-lyft-protoc-gen-star)
     ("go-github-com-iancoleman-strcase"
      ,go-github-com-iancoleman-strcase)))
  (home-page
   "https://github.com/envoyproxy/protoc-gen-validate")
  (synopsis "protoc-gen-validate (PGV)")
  (description
   "PGV is a protoc plugin to generate polyglot message validators.  While protocol\nbuffers effectively guarantee the types of structured data, they cannot enforce\nsemantic rules for values.  This plugin adds support to protoc-generated code to\nvalidate such constraints.")
  (license license:asl2.0))
(package
  (name "go-google-golang-org-appengine")
  (version "1.6.7")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/golang/appengine")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wkipg7xxc0ha5p6c3bj0vpgq38l18441n5l6zxdhx0gzvz5z1hs"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "google.golang.org/appengine"))
  (propagated-inputs
   `(("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)))
  (home-page "https://google.golang.org/appengine")
  (synopsis "Go App Engine packages")
  (description
   "Package appengine provides basic functionality for Google App Engine.")
  (license license:asl2.0))
(package
  (name "go-google-golang-org-grpc")
  (version "1.49.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/grpc/grpc-go")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "07hkk0z8qpg7rvbbyzfphpqzny93qr2qbsciyc1sd7a1q697z58j"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "google.golang.org/grpc"))
  (propagated-inputs
   `(("go-google-golang-org-appengine"
      ,go-google-golang-org-appengine)
     ("go-golang-org-x-xerrors"
      ,go-golang-org-x-xerrors)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-github-com-envoyproxy-protoc-gen-validate"
      ,go-github-com-envoyproxy-protoc-gen-validate)
     ("go-github-com-census-instrumentation-opencensus-proto"
      ,go-github-com-census-instrumentation-opencensus-proto)
     ("go-cloud-google-com-go"
      ,go-cloud-google-com-go)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-golang-org-x-oauth2"
      ,go-golang-org-x-oauth2)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-glog"
      ,go-github-com-golang-glog)
     ("go-github-com-envoyproxy-go-control-plane"
      ,go-github-com-envoyproxy-go-control-plane)
     ("go-github-com-cncf-xds-go"
      ,go-github-com-cncf-xds-go)
     ("go-github-com-cncf-udpa-go"
      ,go-github-com-cncf-udpa-go)
     ("go-github-com-cespare-xxhash-v2"
      ,go-github-com-cespare-xxhash-v2)))
  (home-page "https://google.golang.org/grpc")
  (synopsis "gRPC-Go")
  (description
   "Package grpc implements an RPC system called gRPC.")
  (license license:asl2.0))
(package
  (name "go-github-com-golang-protobuf")
  (version "1.5.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/golang/protobuf")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1mh5fyim42dn821nsd3afnmgscrzzhn3h8rag635d2jnr23r1zhk"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/golang/protobuf"))
  (propagated-inputs
   `(("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)))
  (home-page "https://github.com/golang/protobuf")
  (synopsis "Go support for Protocol Buffers")
  (description
   "This module (@url{https://pkg.go.dev/mod/github.com/golang/protobuf,(code\ngithub.com/golang/protobuf)}) contains Go bindings for protocol buffers.")
  (license license:bsd-3))
(package
  (name "go-github-com-google-go-cmp")
  (version "0.5.9")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/google/go-cmp")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0a13m7l1jrysa7mrlmra8y7n83zcnb23yjyg3a609p8i9lxkh1wm"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/google/go-cmp"))
  (home-page "https://github.com/google/go-cmp")
  (synopsis "Package for equality of Go values")
  (description
   "This package is intended to be a more powerful and safer alternative to\n@code{reflect.DeepEqual} for comparing whether two values are semantically\nequal.")
  (license license:bsd-3))
(package
  (name "go-google-golang-org-protobuf")
  (version "1.28.1")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://go.googlesource.com/protobuf")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0qy9wy36wr1vj8lhmzi26hfc14y3rfbsi0p4vkbxhiwb3iy3na7c"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "google.golang.org/protobuf"))
  (propagated-inputs
   `(("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)))
  (home-page "https://google.golang.org/protobuf")
  (synopsis "Go support for Protocol Buffers")
  (description
   "This project hosts the Go implementation for\n@url{https://developers.google.com/protocol-buffers,protocol buffers}, which is\na language-neutral, platform-neutral, extensible mechanism for serializing\nstructured data.  The protocol buffer language is a language for specifying the\nschema for structured data.  This schema is compiled into language specific\nbindings.  This project provides both a tool to generate Go code for the\nprotocol buffer language, and also the runtime implementation to handle\nserialization of messages in Go.  See the\n@url{https://developers.google.com/protocol-buffers/docs/overview,protocol\nbuffer developer guide} for more information about protocol buffers themselves.")
  (license license:bsd-3))
(package
  (name "go-gopkg-in-square-go-jose-v2")
  (version "2.6.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gopkg.in/square/go-jose.v2")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1b1nhqxfmhzwrfk7pkvp2w3z3d0pf5ir00vizmy2d4xdbnldn70r"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "gopkg.in/square/go-jose.v2"
     #:unpack-path
     "gopkg.in/square/go-jose.v2"))
  (home-page "https://gopkg.in/square/go-jose.v2")
  (synopsis "Go JOSE")
  (description
   "Package jose aims to provide an implementation of the Javascript Object Signing\nand Encryption set of standards.  It implements encryption and signing based on\nthe JSON Web Encryption and JSON Web Signature standards, with optional JSON Web\nToken support available in a sub-package.  The library supports both the compact\nand full serialization formats, and has optional support for multiple\nrecipients.")
  (license license:asl2.0))
(package
  (name "go-github-com-opencontainers-image-spec")
  (version "1.0.2")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/opencontainers/image-spec")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "1wcw1z39wjx338406ga86a41f5ird0yc4ab3c70nfhkpkvjjzhkm"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path
     "github.com/opencontainers/image-spec"))
  (home-page
   "https://github.com/opencontainers/image-spec")
  (synopsis "OCI Image Format Specification")
  (description
   "The OCI Image Format project creates and maintains the software shipping\ncontainer image format spec (OCI Image Format).")
  (license license:asl2.0))
(package
  (name "go-github-com-apptainer-apptainer")
  (version "1.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/apptainer/apptainer")
           (commit (string-append "" "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0cns06yjsm42di662k753bvrkkhkjbd6jl2fhrd3q6fxxcisa1pw"))))
  (build-system go-build-system)
  (arguments
   '(#:import-path "github.com/apptainer/apptainer"))
  (propagated-inputs
   `(("go-github-com-opencontainers-image-spec"
      ,go-github-com-opencontainers-image-spec)
     ("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
     ("go-gopkg-in-square-go-jose-v2"
      ,go-gopkg-in-square-go-jose-v2)
     ("go-google-golang-org-protobuf"
      ,go-google-golang-org-protobuf)
     ("go-google-golang-org-grpc"
      ,go-google-golang-org-grpc)
     ("go-google-golang-org-genproto"
      ,go-google-golang-org-genproto)
     ("go-golang-org-x-text" ,go-golang-org-x-text)
     ("go-golang-org-x-sync" ,go-golang-org-x-sync)
     ("go-golang-org-x-net" ,go-golang-org-x-net)
     ("go-golang-org-x-crypto"
      ,go-golang-org-x-crypto)
     ("go-go-opencensus-io" ,go-go-opencensus-io)
     ("go-go-mozilla-org-pkcs7"
      ,go-go-mozilla-org-pkcs7)
     ("go-go-etcd-io-bbolt" ,go-go-etcd-io-bbolt)
     ("go-github-com-xeipuuv-gojsonschema"
      ,go-github-com-xeipuuv-gojsonschema)
     ("go-github-com-xeipuuv-gojsonreference"
      ,go-github-com-xeipuuv-gojsonreference)
     ("go-github-com-xeipuuv-gojsonpointer"
      ,go-github-com-xeipuuv-gojsonpointer)
     ("go-github-com-vishvananda-netns"
      ,go-github-com-vishvananda-netns)
     ("go-github-com-vishvananda-netlink"
      ,go-github-com-vishvananda-netlink)
     ("go-github-com-vbatts-tar-split"
      ,go-github-com-vbatts-tar-split)
     ("go-github-com-vbatts-go-mtree"
      ,go-github-com-vbatts-go-mtree)
     ("go-github-com-ulikunitz-xz"
      ,go-github-com-ulikunitz-xz)
     ("go-github-com-titanous-rocacheck"
      ,go-github-com-titanous-rocacheck)
     ("go-github-com-theupdateframework-go-tuf"
      ,go-github-com-theupdateframework-go-tuf)
     ("go-github-com-syndtr-gocapability"
      ,go-github-com-syndtr-gocapability)
     ("go-github-com-stefanberger-go-pkcs11uri"
      ,go-github-com-stefanberger-go-pkcs11uri)
     ("go-github-com-sigstore-sigstore"
      ,go-github-com-sigstore-sigstore)
     ("go-github-com-sergi-go-diff"
      ,go-github-com-sergi-go-diff)
     ("go-github-com-safchain-ethtool"
      ,go-github-com-safchain-ethtool)
     ("go-github-com-russross-blackfriday-v2"
      ,go-github-com-russross-blackfriday-v2)
     ("go-github-com-rootless-containers-proto"
      ,go-github-com-rootless-containers-proto)
     ("go-github-com-rivo-uniseg"
      ,go-github-com-rivo-uniseg)
     ("go-github-com-prometheus-procfs"
      ,go-github-com-prometheus-procfs)
     ("go-github-com-prometheus-common"
      ,go-github-com-prometheus-common)
     ("go-github-com-prometheus-client-model"
      ,go-github-com-prometheus-client-model)
     ("go-github-com-prometheus-client-golang"
      ,go-github-com-prometheus-client-golang)
     ("go-github-com-proglottis-gpgme"
      ,go-github-com-proglottis-gpgme)
     ("go-github-com-networkplumbing-go-nft"
      ,go-github-com-networkplumbing-go-nft)
     ("go-github-com-morikuni-aec"
      ,go-github-com-morikuni-aec)
     ("go-github-com-modern-go-reflect2"
      ,go-github-com-modern-go-reflect2)
     ("go-github-com-modern-go-concurrent"
      ,go-github-com-modern-go-concurrent)
     ("go-github-com-moby-term"
      ,go-github-com-moby-term)
     ("go-github-com-moby-sys-mountinfo"
      ,go-github-com-moby-sys-mountinfo)
     ("go-github-com-moby-locker"
      ,go-github-com-moby-locker)
     ("go-github-com-miekg-pkcs11"
      ,go-github-com-miekg-pkcs11)
     ("go-github-com-matttproud-golang-protobuf-extensions"
      ,go-github-com-matttproud-golang-protobuf-extensions)
     ("go-github-com-mattn-go-shellwords"
      ,go-github-com-mattn-go-shellwords)
     ("go-github-com-mattn-go-runewidth"
      ,go-github-com-mattn-go-runewidth)
     ("go-github-com-mattn-go-isatty"
      ,go-github-com-mattn-go-isatty)
     ("go-github-com-mattn-go-colorable"
      ,go-github-com-mattn-go-colorable)
     ("go-github-com-letsencrypt-boulder"
      ,go-github-com-letsencrypt-boulder)
     ("go-github-com-klauspost-pgzip"
      ,go-github-com-klauspost-pgzip)
     ("go-github-com-klauspost-compress"
      ,go-github-com-klauspost-compress)
     ("go-github-com-kardianos-osext"
      ,go-github-com-kardianos-osext)
     ("go-github-com-json-iterator-go"
      ,go-github-com-json-iterator-go)
     ("go-github-com-inconshreveable-mousetrap"
      ,go-github-com-inconshreveable-mousetrap)
     ("go-github-com-hashicorp-errwrap"
      ,go-github-com-hashicorp-errwrap)
     ("go-github-com-gosimple-unidecode"
      ,go-github-com-gosimple-unidecode)
     ("go-github-com-gorilla-mux"
      ,go-github-com-gorilla-mux)
     ("go-github-com-gorilla-handlers"
      ,go-github-com-gorilla-handlers)
     ("go-github-com-google-go-containerregistry"
      ,go-github-com-google-go-containerregistry)
     ("go-github-com-google-go-cmp"
      ,go-github-com-google-go-cmp)
     ("go-github-com-golang-protobuf"
      ,go-github-com-golang-protobuf)
     ("go-github-com-golang-groupcache"
      ,go-github-com-golang-groupcache)
     ("go-github-com-gogo-protobuf"
      ,go-github-com-gogo-protobuf)
     ("go-github-com-gofrs-uuid"
      ,go-github-com-gofrs-uuid)
     ("go-github-com-godbus-dbus-v5"
      ,go-github-com-godbus-dbus-v5)
     ("go-github-com-ghodss-yaml"
      ,go-github-com-ghodss-yaml)
     ("go-github-com-garyburd-redigo"
      ,go-github-com-garyburd-redigo)
     ("go-github-com-felixge-httpsnoop"
      ,go-github-com-felixge-httpsnoop)
     ("go-github-com-docker-libtrust"
      ,go-github-com-docker-libtrust)
     ("go-github-com-docker-go-metrics"
      ,go-github-com-docker-go-metrics)
     ("go-github-com-docker-go-connections"
      ,go-github-com-docker-go-connections)
     ("go-github-com-docker-docker-credential-helpers"
      ,go-github-com-docker-docker-credential-helpers)
     ("go-github-com-docker-cli"
      ,go-github-com-docker-cli)
     ("go-github-com-d2g-dhcp4client"
      ,go-github-com-d2g-dhcp4client)
     ("go-github-com-d2g-dhcp4"
      ,go-github-com-d2g-dhcp4)
     ("go-github-com-cpuguy83-go-md2man-v2"
      ,go-github-com-cpuguy83-go-md2man-v2)
     ("go-github-com-coreos-go-systemd-v22"
      ,go-github-com-coreos-go-systemd-v22)
     ("go-github-com-coreos-go-iptables"
      ,go-github-com-coreos-go-iptables)
     ("go-github-com-containers-storage"
      ,go-github-com-containers-storage)
     ("go-github-com-containers-ocicrypt"
      ,go-github-com-containers-ocicrypt)
     ("go-github-com-containers-libtrust"
      ,go-github-com-containers-libtrust)
     ("go-github-com-containerd-cgroups"
      ,go-github-com-containerd-cgroups)
     ("go-github-com-cilium-ebpf"
      ,go-github-com-cilium-ebpf)
     ("go-github-com-cespare-xxhash-v2"
      ,go-github-com-cespare-xxhash-v2)
     ("go-github-com-bugsnag-panicwrap"
      ,go-github-com-bugsnag-panicwrap)
     ("go-github-com-bugsnag-bugsnag-go"
      ,go-github-com-bugsnag-bugsnag-go)
     ("go-github-com-blang-semver"
      ,go-github-com-blang-semver)
     ("go-github-com-beorn7-perks"
      ,go-github-com-beorn7-perks)
     ("go-github-com-alexflint-go-filemutex"
      ,go-github-com-alexflint-go-filemutex)
     ("go-github-com-acarl005-stripansi"
      ,go-github-com-acarl005-stripansi)
     ("go-github-com-vividcortex-ewma"
      ,go-github-com-vividcortex-ewma)
     ("go-github-com-microsoft-hcsshim"
      ,go-github-com-microsoft-hcsshim)
     ("go-github-com-microsoft-go-winio"
      ,go-github-com-microsoft-go-winio)
     ("go-github-com-burntsushi-toml"
      ,go-github-com-burntsushi-toml)
     ("go-github-com-azure-go-ansiterm"
      ,go-github-com-azure-go-ansiterm)
     ("go-github-com-adamkorcz-go-fuzz-headers"
      ,go-github-com-adamkorcz-go-fuzz-headers)
     ("go-github-com-sirupsen-logrus"
      ,go-github-com-sirupsen-logrus)
     ("go-github-com-hashicorp-go-multierror"
      ,go-github-com-hashicorp-go-multierror)
     ("go-github-com-docker-distribution"
      ,go-github-com-docker-distribution)
     ("go-oras-land-oras-go" ,go-oras-land-oras-go)
     ("go-mvdan-cc-sh-v3" ,go-mvdan-cc-sh-v3)
     ("go-gotest-tools-v3" ,go-gotest-tools-v3)
     ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
     ("go-golang-org-x-term" ,go-golang-org-x-term)
     ("go-golang-org-x-sys" ,go-golang-org-x-sys)
     ("go-github-com-yvasiyarov-newrelic-platform-go"
      ,go-github-com-yvasiyarov-newrelic-platform-go)
     ("go-github-com-yvasiyarov-gorelic"
      ,go-github-com-yvasiyarov-gorelic)
     ("go-github-com-yvasiyarov-go-metrics"
      ,go-github-com-yvasiyarov-go-metrics)
     ("go-github-com-vbauerster-mpb-v7"
      ,go-github-com-vbauerster-mpb-v7)
     ("go-github-com-urfave-cli"
      ,go-github-com-urfave-cli)
     ("go-github-com-sylabs-json-resp"
      ,go-github-com-sylabs-json-resp)
     ("go-github-com-spf13-pflag"
      ,go-github-com-spf13-pflag)
     ("go-github-com-spf13-cobra"
      ,go-github-com-spf13-cobra)
     ("go-github-com-shopspring-decimal"
      ,go-github-com-shopspring-decimal)
     ("go-github-com-seccomp-libseccomp-golang"
      ,go-github-com-seccomp-libseccomp-golang)
     ("go-github-com-seccomp-containers-golang"
      ,go-github-com-seccomp-containers-golang)
     ("go-github-com-pkg-errors"
      ,go-github-com-pkg-errors)
     ("go-github-com-pelletier-go-toml"
      ,go-github-com-pelletier-go-toml)
     ("go-github-com-opencontainers-umoci"
      ,go-github-com-opencontainers-umoci)
     ("go-github-com-opencontainers-selinux"
      ,go-github-com-opencontainers-selinux)
     ("go-github-com-opencontainers-runtime-tools"
      ,go-github-com-opencontainers-runtime-tools)
     ("go-github-com-opencontainers-runtime-spec"
      ,go-github-com-opencontainers-runtime-spec)
     ("go-github-com-opencontainers-runc"
      ,go-github-com-opencontainers-runc)
     ("go-github-com-opencontainers-go-digest"
      ,go-github-com-opencontainers-go-digest)
     ("go-github-com-moby-sys-mount"
      ,go-github-com-moby-sys-mount)
     ("go-github-com-gosimple-slug"
      ,go-github-com-gosimple-slug)
     ("go-github-com-google-uuid"
      ,go-github-com-google-uuid)
     ("go-github-com-go-log-log"
      ,go-github-com-go-log-log)
     ("go-github-com-fsnotify-fsnotify"
      ,go-github-com-fsnotify-fsnotify)
     ("go-github-com-fatih-color"
      ,go-github-com-fatih-color)
     ("go-github-com-docker-go-units"
      ,go-github-com-docker-go-units)
     ("go-github-com-docker-docker"
      ,go-github-com-docker-docker)
     ("go-github-com-cyphar-filepath-securejoin"
      ,go-github-com-cyphar-filepath-securejoin)
     ("go-github-com-creack-pty"
      ,go-github-com-creack-pty)
     ("go-github-com-containers-image-v5"
      ,go-github-com-containers-image-v5)
     ("go-github-com-containernetworking-plugins"
      ,go-github-com-containernetworking-plugins)
     ("go-github-com-containernetworking-cni"
      ,go-github-com-containernetworking-cni)
     ("go-github-com-containerd-containerd"
      ,go-github-com-containerd-containerd)
     ("go-github-com-cenkalti-backoff-v4"
      ,go-github-com-cenkalti-backoff-v4)
     ("go-github-com-buger-jsonparser"
      ,go-github-com-buger-jsonparser)
     ("go-github-com-blang-semver-v4"
      ,go-github-com-blang-semver-v4)
     ("go-github-com-apptainer-sif-v2"
      ,go-github-com-apptainer-sif-v2)
     ("go-github-com-apptainer-container-library-client"
      ,go-github-com-apptainer-container-library-client)
     ("go-github-com-apptainer-container-key-client"
      ,go-github-com-apptainer-container-key-client)
     ("go-github-com-apex-log"
      ,go-github-com-apex-log)
     ("go-github-com-adigunhammedolalekan-registry-auth"
      ,go-github-com-adigunhammedolalekan-registry-auth)
     ("go-github-com-protonmail-go-crypto"
      ,go-github-com-protonmail-go-crypto)
     ("go-github-com-netflix-go-expect"
      ,go-github-com-netflix-go-expect)))
  (home-page
   "https://github.com/apptainer/apptainer")
  (synopsis "Apptainer")
  (description
   "Apptainer is an open source container platform designed to be simple, fast, and\nsecure.  Many container platforms are available, but Apptainer is designed for\nease-of-use on shared systems and in high performance computing (HPC)\nenvironments.  It features:")
  (license license:bsd-3))
