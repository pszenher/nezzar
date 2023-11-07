(use-modules (ice-9 peg))

(define %bom-string (make-string 1 #\xFEFF))

(define-syntax-rule (peg-char symb char)
  `(define-peg-pattern ,(symbol-append 'c- symb) none ,(make-string 1 char)))

;;; FIXME:  peg-any here should be limited to printing unicode chars...
;; (peg-char 'printable 'peg-any)
(define-peg-pattern c-printable body peg-any)
(peg-char 'byte-order-mark #\xFEFF)
(define-peg-pattern c-byte-order-mark none %bom-string)

(define-peg-pattern c-sequence-entry none "-")
(define-peg-pattern c-mapping-key none "?")
(define-peg-pattern c-mapping-value none ":")

(define-peg-pattern c-collect-entry none ",")
(define-peg-pattern c-sequence-start none "[")
(define-peg-pattern c-sequence-end none "]")
(define-peg-pattern c-mapping-start none "{")
(define-peg-pattern c-mapping-end none "}")

(define-peg-pattern c-comment none "#")
;; ;; Main parser function
;; ;;
;; (define (yaml-read port ))
