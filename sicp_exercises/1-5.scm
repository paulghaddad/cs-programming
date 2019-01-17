;;; (p) is a variable whose value is (p)
(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

;;; Applicative Order

(test 0 (p))

=> (if (= 0 0) ; this expression is evaluated immediately
     0
     (p)) ; as is this expression, even though it's not needed by this test. But because it's recursive, it will never resolve

;;; Normal Order

(test 0 (p))

=>  (if (= 0 0) ; in contrast, this is evaluated and gives #t, which then causes the interpreter to evaluate the consequent, 0
     0
     (p)) ; but (p) is not evalated as it's not needed to complete the function call, and thus we don't make indefinite recursive calls
