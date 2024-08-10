(use-modules
 (ice-9 match)

 (srfi srfi-41)
 
 (fibers)
 (fibers scheduler)
 (fibers channels)

 (gnu packages))

;; (define (dep-build-manager in wrkr-out coll-out init-keys)
;;   (let loop ((keys init-keys)
;; 	     (reqs         0)
;; 	     (workers      0)
;; 	     (visited  (set)))
;;     (cond
;;      ;; If keys is empty and all workers are done, return
;;      ((and (null? keys)
;; 	   (= reqs workers))
;;       (put-message coll-out 'done))
;;      ;; If next key has been visited, pop it and loop
;;      ((and (not (null? keys))
;; 	   (set-contains? visited (car keys)))
;;       (loop (cdr keys) reqs workers visited))
;;      ;; Else wait for message
;;      (else
;;       (begin
;; 	(match (get-message in)
;; 	  ('register        (loop keys reqs (+ 1 workers) visited))
;; 	  ('req-dep         (match keys
;; 			      (()        (loop keys (+ 1 reqs) workers visited))
;; 			      ((hd . tl) (begin
;; 					   (put-message wrkr-out `(dep . ,hd))
;; 					   (loop tl reqs workers (set-insert hd visited))))))
;; 	  (('add-dep . key) (match reqs
;; 			      (0             (loop (cons key keys) reqs workers visited))
;; 			      ((? number? n) (begin
;; 					       ;; FIXME: this logic is fragmented to hell, refactor this whole function
;; 					       (if (set-contains? visited key)
;; 						   (loop keys reqs workers visited)
;; 						   (begin
;; 						     (put-message wrkr-out `(dep . ,key))
;; 						     (loop keys (- n 1) workers (set-insert key visited))))))))))))))

;; (define (worker in mngr-out coll-out key->imported-package)
;;   (begin
;;     (put-message mngr-out 'register)
;;     (with-store store
;;       (let loop ()
;; 	(begin
;; 	  (put-message mngr-out 'req-dep)
;; 	  (match (get-message in)
;; 	    (('dep . key) (begin
;; 			    (let* ((ipkg ((key->imported-package key) store))
;; 				   (dep-keys (imported-package-upstream-keys ipkg)))
;; 			      (begin
;; 				(for-each
;; 				 (lambda (key)
;; 				   (put-message mngr-out `(add-dep . ,key)))
;; 				 dep-keys)
;; 				(put-message coll-out `(add-pkg . ,ipkg))))
;; 			    (loop)))))))))

;; (define (pkg-import-collector in)
;;   (let loop ((res  '()))
;;     (match (get-message in)
;;       (('add-pkg . pkg) (loop (cons pkg res)))
;;       ( 'done           res))))

(define (make-pkgfold-generator out)
  (lambda ()
    (fold-available-packages
     (lambda* (name vers _ #:key outputs location #:allow-other-keys)
       (begin
	 (put-message
	  out
	  (pk 'put
	   (list name vers outputs location)))
	 #f))
     #f)))

(define pkgstream
  (let ((sched  (make-scheduler))
	(pkgout (make-channel)))
    (spawn-fiber (make-pkgfold-generator pkgout)
		 sched)
    (stream-unfold
     identity
     identity
     (lambda _ (pk 'get (get-message pkgout)))
     (begin
       (run-scheduler sched (const #f))
       (pk 'get-init (get-message pkgout))))))

;; (display
;;  (stream->list
;;   (stream-take 3 pkgstream)))

;; 
;; FIXME: #:parallel? flag is a no-go, corrupts the locally
;;        cached git checkout from the user's ~/.cache/guix/checouts
;;        folder if there's a conflict in the workers...
;; 
;; TODO: we can avoid this with careful thread coordination,
;;       but first make sure guix doesn't provide a better
;;       interface for this...
;;
;;       It very might well not, as local writes to the user's
;;       checkout dirs don't seem to have lockfiles
;;
;;       This is likely a guix bug which should be reported
;;       upstream, although it's unlikely to occur in practice,
;;       as this caching interface would typically only be used
;;       by a single user on a single terminal, which will run
;;       jobs sequentially and synchronously
;; 

;; (spawn-fiber (lambda () (worker            m2w w2m 2c key->imported-package)) #:parallel? #f)
;; (spawn-fiber (lambda () (worker            m2w w2m 2c key->imported-package)) #:parallel? #f)
;; (spawn-fiber (lambda () (worker            m2w w2m 2c key->imported-package)) #:parallel? #f)
;; (spawn-fiber (lambda () (worker            m2w w2m 2c key->imported-package)) #:parallel? #f)

;; (pkg-import-collector 2c)

