;;; Ex. 1.36

(define tolerance 0.00001)

(define (average x y)
  (/ (+ x y) 2.0))

(define (display-approximation x)
    (display "Approximation: ")
    (display x)
    (newline))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display-approximation guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

;;; Without average dampening
;;; 4.555530807938518 ** 4.555530807938518 = 999.98!
(fixed-point (lambda (x) (/ (log 1000) (log x))) 1.1)

;;; With average dampening
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 1.1)
