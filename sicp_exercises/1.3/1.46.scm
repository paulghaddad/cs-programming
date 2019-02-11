;;; Several of the numerical methods described in this chapter are instances of
;;; an extremely general computational strategy known as iterative improvement.
;;; Iterative improvement says that, to compute something, we start with an
;;; initial guess for the answer, test if the guess is good enough, and
;;; otherwise improve the guess and continue the process using the improved
;;; guess as the new guess. Write a procedure iterative-improve that takes two
;;; procedures as arguments: a method for telling whether a guess is good enough
;;; and a method for improving a guess. Iterative-improve should return as its
;;; value a procedure that takes a guess as argument and keeps improving the
;;; guess until it is good enough. Rewrite the sqrt procedure of section 1.1.7
;;; and the fixed-point procedure of section 1.3.3 in terms of
;;; iterative-improve.

;;; return a procedure that takes a guess as an argument and keeps improving the
;;; guess until it is good enough.

(define (iterative-improve good-enough? improve-guess)
  (lambda (guess)
            (if (good-enough? guess)
              guess
              ((iterative-improve good-enough? improve-guess) (improve-guess guess)))))
(define tolerance 0.001)

;;; Part A: rewrite sqrt

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x) (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) tolerance))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))


(define (sqrt x)
  (let ((good-enough? (lambda (guess) (< (abs (- (square guess) x)) tolerance)))
        (improve-guess (lambda (guess) (average guess (/ x guess)))))

  ((iterative-improve good-enough? improve-guess) 1.0)))

(sqrt 9) ; 3.000000001396984
(sqrt 16) ; 4.000000636692939

;;; Part B: rewrite fixed-point

(define tolerance 0.00001)

(define (fixed-point fn guess)
  (let ((good-enough? (lambda (guess) (< (abs (- guess (fn guess))) tolerance)))
        (improve-guess (lambda (guess) (fn guess))))

  ((iterative-improve good-enough? improve-guess) 1.0)))

(fixed-point cos 1.0) ; .7390893414033928
(fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0) ; 1.2587228743052672
