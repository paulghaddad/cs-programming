; >>> def series(n):
; ...   d = 0
; ...   j = 1
; ...   for i in range(n):
; ...     if j == 0:
; ...       d += 2
; ...       j = 2
; ...       print(d)
; ...     else:
; ...       j -= 1
; ...       print(1)
; ...

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
