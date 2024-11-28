(define-module (nezzar packages maths)
  #:use-module (guix packages)
  #:use-module (gnu packages maths))

(define-public cadical-1.9
  (package
    (inherit cadical)
    (version "1.9.5")))
