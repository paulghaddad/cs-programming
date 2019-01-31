;;; Ex. 1.35

;;; if x = golden ratio and x**2 = x + 1
;;; if we divide both sides by x, we get:
;;; x -> 1 + 1/x

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(fixed-point (lambda (y) (+ 1.0 (/ 1 y))) 1.0) ; 1.6180327868852458
