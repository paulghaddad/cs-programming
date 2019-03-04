;;; Ex. 1.20

;;; The process that a procedure generates is of course dependent on the rules
;;; used by the interpreter. As an example, consider the iterative gcd procedure
;;; given above. Suppose we were to interpret this procedure using normal-order
;;; evaluation, as discussed in section 1.1.5. (The normal-order-evaluation rule
;;; for if is described in exercise 1.5.) Using the substitution method (for
;;; normal order), illustrate the process generated in evaluating (gcd 206 40)
;;; and indicate the remainder operations that are actually performed. How many
;;; remainder operations are actually performed in the normal-order evaluation
;;; of (gcd 206 40)? In the applicative-order evaluation?

;;; Normal Order

(gcd 206 40) -> ; if evaluates whether b == 0
    (gcd 40 (remainder 206 40)) -> ; if evaluates whether (remainder 206 40) == 0 ; remainder is applied 1 time
        (gcd (remainder 206 40) (remainder 40 (remainder 206 40))) -> ; if evaluates whether b == 0, remainder is applied 2 times
            (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) ; if evaluates wehther b == 0; remainder is applied 4 times
                (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))) ; if evaluates whether b == 0; remainder is applied 7 times

;;; Summary of remainder operations: 14 operations + 4 evaluating the find a (since the if predicate is successful)

;;; Applicative Order

(gcd 206 40) ->
    (gcd 40 (remainder 206 40)) -> (gcd 40 6) ->
        (gcd 6 (remainder 40 6)) --> (gcd 6 4) ->
            (gcd 4 (remainder 6 4)) --> (gcd 4 2) ->
                (gcd 2 (remainder 4 2)) --> (gcd 2 0)
                    2

;;; Summary of remainder operations: 4
