(define-module (nezzar packages networking)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages autogen)
  #:use-module (gnu packages autotools))

(define-public tcpreplay
  (package
    (name "tcpreplay")
    (version "4.4.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/appneta/tcpreplay.git")
	     (commit version)))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "18ihm0y61bmd30lqbi1w5yhwbqf1a1l80zlnc0zf65nw4f13ac2f"))))
    (native-inputs
     (list autogen
	   autoconf
	   automake
	   which
	   libtool
	   libpcap))
    (build-system gnu-build-system)
    (arguments
     (list
      #:configure-flags #~(list
			   (string-append
			    "--with-libpcap="
			    #$libpcap))))
    (home-page "https://tcpreplay.appneta.com/")
    (synopsis "Pcap editing and replay tools")
    (description
     "Tcpreplay is a suite of GPLv3 licensed utilities for UNIX (and Win32
under Cygwin) operating systems for editing and replaying network
traffic which was previously captured by tools like tcpdump and
Wireshark. It allows you to classify traffic as client or server,
rewrite Layer 2, 3 and 4 packets and finally replay the traffic back
onto the network and through other devices such as switches, routers,
firewalls, NIDS and IPS's. Tcpreplay supports both single and dual NIC
modes for testing both sniffing and in-line devices.")
    (license license:gpl3)))

