;;; Suppose we define the procedure

(define (f g)
  (g 2))

;;; Then we have

(f square) ; 4

(f (lambda (z) (* z (+ z 1)))) ; 6

;;; What happens if we ask the interpreter to evaluate the combination of (f f)?

;;; (f f) => (f 2) => (2 2) => error

(f f) ; The object 2 is not applicable.
