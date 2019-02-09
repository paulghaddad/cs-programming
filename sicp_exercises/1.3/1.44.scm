;;; The idea of smoothing a function is an important concept in signal
;;; processing. If f is a function and dx is some small number, then the
;;; smoothed version of f is the function whose value at a point x is the
;;; average of f(x - dx), f(x), and f(x + dx). Write a procedure smooth that
;;; takes as input a procedure that computes f and returns a procedure that
;;; computes the smoothed f. It is sometimes valuable to repeatedly smooth a
;;; function (that is, smooth the smoothed function, and so on) to obtained the
;;; n-fold smoothed function. Show how to generate the n-fold smoothed function
;;; of any given function using smooth and repeated from exercise 1.43.

(define (square x) (* x x))

(define (smooth fn)
  (let ((dx 0.00001))
  (lambda (x) (/ (+ (fn (- x dx)) (fn x) (fn (+ x dx))) 3))))

((smooth square) 4) ; 16.000000000066663

(define (compose fa fb)
  (lambda (x) (fa (fb x))))

(define (repeated fn n)
  (if (= n 1)
    fn
    (compose fn (repeated fn (- n 1)))))

;;; (repeated smooth n) returns a procedure that takes a single argument,
;;; another procedure, fn, that will be applied n times.
(define (n-fold-smoothed fn n)
  ((repeated smooth n) fn))

((n-fold-smoothed square 10) 4) ; 16.000000000666663
