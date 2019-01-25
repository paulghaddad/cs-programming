(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; test 1
(new-if (= 2 3) 0 5) ; 5

; test 2
(new-if (= 1 1) 0 5) ; 0

; use in the sqrt-iter program

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)

;;; the problem with this new definition of if is that the alternative is
;;; evaluated immediately, which leads to an infinite recursion. The special
;;; form of if must not have this behavior. This is explained on page 19: IF the
;;; (predicate) evaluates to a true value, the interpreter then evaluates the
;;; (consequent) and returns its value. OTHERWISE it evaluates the (alternative)
;;; and returns its value.

;;; Thus, if works because the alternative, which is recursive, is not evaluated
;;; if the predicate evaluates to true, which allows the function to resolve.
