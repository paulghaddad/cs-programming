;;; Continuation of Example 2 from Section 1.3.3

;;; Original Function

(define tolerance 0.00001)
(define (average x y) (/ (+ x y) 2))

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

;;; Abstracting out the idea of average dampening to its own procedure that
;;; returns a procedure as its value: (average y (/ x y))

(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

((average-damp square) 10) ; 55

;;; With with abstraction, we can easily reuse its ideas to apply the
;;; fixed-point method to determine the cube roots

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

;;; Newton's Method

;;; Express the idea of derivative

(define dx 0.00001)

;;; deriv is a procedure that take a procedure as an argument and returns a
;;; procedure as a value
(define (deriv g )
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

;;; Calculate the derivative of x**3 at 5:

(define (cube x) (* x x x))

((deriv cube) 5) ; 75.00014999664018 (actual value is 75)

;;; Express Newton's Method as a fixed-point process:
;;; f(x) = x - g(x) / Dg(x)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

;;; Use Newton's Method to find a zero of the function y**2 - x with an initial
;;; guess of 1

(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))

(sqrt 5) ; 2.2360679775020436

;;; Further abstraction: find a fixed-point of some transformation of a function

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

;;; Using the above abstraction, we'll recast the first square-root computation: 
;;;   y -> x / y

(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (/ x y))
                            average-damp
                            1.0))

;;; We'll also recast the second square-root computation: 
;;;   y -> y**2 - x

(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (- (square y) x))
                            newton-transform
                            1.0))
