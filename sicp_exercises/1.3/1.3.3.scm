;;; Example 1
;;; Finding roots of equations by the half-interval method

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (average x y)
  (/ (+ x y) 2.0))

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
      midpoint
      (let ((test-value (f midpoint)))
            (cond ((positive? test-value)
                   (search f neg-point midpoint))
                  ((negative? test-value)
                   (search f midpoint pos-point))
                  (else midpoint))))))

;;; the function below is a wrapper around search to make sure the values we
;;; provided it make sense (a must be negative and b positive); otherwise we
;;; flip them or raise an error

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
           ((and (negative? b-value) (positive? a-value))
            (search f b a))
          (else
            (error "Values are not of opposite sign" a b)))))

;;; calculate root of sin between 2 and 4
(half-interval-method sin 2.0 4.0) ; 3.14111328125

;;; calculate root of x**3 -2x - 3 = 0 between 1 and 2
(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3)) 1.0 2.0) ; 1.89306640625


;;; Example 2
;;; Finding fixed points of functions

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next ; return this value as the answer
        (try next))))
  (try first-guess))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))

(sqrt 4.0)
