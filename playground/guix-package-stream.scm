(use-modules
 (gnu packages)
 (guix diagnostics)
 (ice-9 match)
 (ice-9 format)
 (srfi srfi-41))

(define (pkgfold-generator yield)
  (let ((return
	 (fold-available-packages
	  (lambda* (name vers yield #:key outputs location #:allow-other-keys)
	    (call/cc
	     (lambda (next)
	       (yield (cons next (list name vers outputs location))))))
	  yield)))
    (return #f)))

(define pkg-stream
  (stream-unfold
   (match-lambda ((_ . vals) vals))
   identity
   (match-lambda
     (((? procedure? next) . vals)
      (call/cc next)))
   (call/cc pkgfold-generator)))

(stream-for-each
 (match-lambda
   ((name vers outs loc)
    (format #t "~30a ~30a ~30s ~30a~%"
	    name vers (string-join outs ",") (location->string loc))))
 pkg-stream)
