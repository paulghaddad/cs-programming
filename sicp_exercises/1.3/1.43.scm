;;; If f is a numerical function and n is a positive integer, then we can form
;;; the nth repeated application of f, which is defined to be the function whose
;;; value at x is f(f(...(f(x))...)). For example, if f is the function x  x +
;;; 1, then the nth repeated application of f is the function x  x + n. If f is
;;; the operation of squaring a number, then the nth repeated application of f
;;; is the function that raises its argument to the 2nth power. Write a
;;; procedure that takes as inputs a procedure that computes f and a positive
;;; integer n and returns the procedure that computes the nth repeated
;;; application of f. Your procedure should be able to be used as follows:

;;; ((repeated square 2) 5) => 625

(define (compose fa fb)
  (lambda (x) (fa (fb x))))

;;; Approach 1
(define (repeated-1 fn n)
  (if (= n 2)
    (compose fn fn)
    (compose fn (repeated-1 fn (- n 1)))))

((repeated-1 square 2) 5) ; 625

;;; Approach 2

(define (repeated-2 fn n)
  (if (= n 1)
    fn
    (compose fn (repeated-2 fn (- n 1)))))

((repeated-2 square 2) 5)
