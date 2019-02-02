;;; Ex. 1.37.A
;;; 1/golden ration ~ .6180

;;; To do this recursively, we need a "wrapper" function that makes the initial
;;; call, i = 1, and then subsuquent terms are built up using the inner
;;; cont-frac function, which is the resursive call. This recursive call is
;;; going from 1 -> k

(define (cont-frac n d k)
  (define (cont-frac-term i)
    (if (<= i k)
      (/ (n i) (+ (d i) (cont-frac-term (+ i 1))))
      0))

  (/ (n 1) (+ (d 1) (cont-frac-term 1)))
)

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0)  10) ; .6180555555555556
