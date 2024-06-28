(define-module (nezzar packages robotics)
  #:use-module (gnu packages)

  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages compression)

  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)

  #:use-module (guix build-system qt)
  )

(define-public qgroundcontrol
  (package
   (name "qgroundcontrol")
   (version "4.3.0-2ee3357")
   (home-page "https://qgroundcontrol.com")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
	   (url "https://github.com/mavlink/qgroundcontrol")
	   (commit "2ee3357f5e0055c7b592837241c101d67bc55ef2")
	   (recursive? #t)))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "15nnf593q707gmsvddfa97mkvvw04sgqy6x50449n0wdzgkrw9lv"))))
   (build-system qt-build-system)
   (inputs
    (list qtconnectivity
	  qtcharts
	  qtlocation
	  qtdeclarative-5
	  qtmultimedia-5
	  qtquickcontrols2-5
	  qtsvg-5
	  qtspeech-5
	  qtserialport-5

	  sdl2

	  ;; shapelib

	  zlib))
   (propagated-inputs
    (list qtquickcontrols-5
	  qtgraphicaleffects))
   (arguments
    `(#:tests? #f))
   (synopsis "Cross-platform ground control station for drones")
   (description "QGroundControl (QGC) is an intuitive and powerful ground control
station (GCS) for UAVs.")
   (license
    (list license:asl2.0
	  license:gpl3))))
