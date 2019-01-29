;;; Using lambdas in place of trivial procedures


(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

;;; Original form using defined procedures
(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(* 8 (pi-sum 1 1000)) ; 3.139...

;;; Using lambdas instead

(define (pi-sum-lambda a b)
  (sum
    (lambda (x) (/ 1.0 (* x (+ x 2))))
    a
    (lambda (x) (+ x 4))
    b))

(* (pi-sum-lambda 1 1000)) ; 3.139592655589783

;;; Using let to define local variables

;;; Using defined procedures

(define (square x) (* x x))

(define (f x y)
  (define (f-helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
  (f-helper (+ 1 (* x y))
            (- 1 y)))

;;; Using lambda directly

(define (f-lambda x y)
  ((lambda (a b)
     (+ (* x (square a))
        (* y b)
        (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

(f-lambda 1 4) ; -2

;;; Using let to make the lambda construct more convinient

(define (f-let x y)
  (let ((a (+ 1 (* x y)))
        (b ( - 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))

(f-let 1 4) ; -2
