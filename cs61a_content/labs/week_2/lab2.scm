;;; Problem 1

(lambda (x) (+ x 3)) ; defines the lambda; doesn't call it; the return value is the procedure itself

((lambda (x) (+ x 3)) 7) ; 10

(define (make-adder num)
  (lambda (x) (+ x num))) ; defines a procedure make-adder that returns a lambda

((make-adder 3) 7) ; => ((lambda (x) (+ x 3)) 7) => 10

(define plus3 (make-adder 3)) ; bounds the name plus3 to the return value of invoking make-adder with 3, which is a lambda
                              ; => (define plus3 (lambda (x) (+ x 3)))

(plus3 7) ; => 10

(define (square x) (* x x)) ; defines a named procedure

(square 5) ; invokes the procedure with the argument 5 => 25

(define sq (lambda (x) (* x x))) ; assigns the name sq to the procedure defined by the lambda

(sq 5) ; (lambda (5) (* 5 5)) => 25

(define (try f) (f 3 5)) ; defines named procedure try, which accepts a function as an argument

(try +) ; 8

; (try word) ; '35

;;; Problem 2

(define (substitute sent old subt)
  (cond ((empty? sent) '())
        ((equal? (first sent) old) (se subt (substitute (bf sent) old subt)))
        (else (se (first sent) (substitute (bf sent) old subt)))))

(substitute '(she loves you yeah yeah yeah) 'yeah 'maybe) ; (she loves you maybe maybe maybe)

;;; Problem 3

; g is a procedure that returns a lambda. This lambda accepts a single argument that adds 2 to it.
(define (g)
  (lambda (x) (+ x 2)))

((g) 1) ; 3

;;; Problem 4

;;; For each of the following expressions, what must f be in order for the evaluation of the expression to succeed, without causing an error? For each expression, give a definition of f such that evaluating the expression will not cause an error, and say what the expression’s value will be, given your definition.

;;; f
;;; f must be a type such as a number or procedure that is not evaluated.

(define f 2)
f

(define f (lambda (x) 1))
f

;;; (f)
;;; f must be a procedure with no arguments

;;; so this will error
; (define f 2)
; (f)

;;; but this won't
(define (f) 1)
(f)

;;; (f 3)
;;; f must be a procedure with 1 argument
(define (f x) x)
(f 3)

;;; ((f))
;;; f must return a procedure with no arguments, and when evaluated, its return value can in turn be evaluated
(define (f) (lambda () 1))
((f))

;;; (((f) 3))
;;; f must return a procedure that accepts a single argument, and when called with that single argument, continually returns a procedure that takes in no arguments

(define (f) (lambda (x) (lambda () ())))
((f) 3)

;;; Problem 5

;;; Find the values of the expressions
; ((t 1+) 0)
; ((t (t 1+)) 0)
; (((t t) 1+) 0)

; where 1+ is a primitive procedure that adds 1 to its argument, and t is defined as follows:
(define (t f)
  (lambda (x) (f (f (f x)))) )

((t 1+) 0) ; evaluates to 3

((t (t 1+)) 0) ; evaluates to 9

(((t t) 1+) 0) ; evaluates to 27

;;; Problem 6

; Find the values of the expressions
; ((t s) 0)
; ((t (t s)) 0)
; (((t t) s) 0)

; where t is defined as in question 5 above, and s is defined as follows:

(define (s x)
  (+ 1 x))

((t s) 0) ; evaluates to 3

((t (t s)) 0) ; evaluates to 9

(((t t) s) 0) ; evaluates to 27

;;; Problem 7

(define (make-tester w)
  (lambda (x) (equal? x w)))

((make-tester 'ha1) 'ha1) ; #t
((make-tester 'ha1) 'cs61a) ; #f

(define sicp-author-and-astronomer? (make-tester 'gerry))

(sicp-author-and-astronomer? 'ha) ; #f
(sicp-author-and-astronomer? 'gerry) ; #t
