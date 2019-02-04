;; Ex. 1.38


(define (cont-frac n d k)
  (define (cont-frac-term i)
    (if (<= i k)
      (/ (n i) (+ (d i) (cont-frac-term (+ i 1))))
      0))

  (/ (n 1) (+ (d 1) (cont-frac-term 1)))
)

(define (eulers-expansion i)
  (if (= (remainder i 3) 2)
    (* (+ (quotient i 3) 1) 2)
    1))

(+ 2.0 (cont-frac (lambda (i) 1.0) eulers-expansion 10)) ; 2.5819767068693267
