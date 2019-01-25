;;; Observe taht our model of evaluation allows for combinations whose operators
;;; are compound expressions. Use this observation to describe the behavior of
;;; the following procedure.

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; the if condition will resolve to the + or - operator depending on whether b is
; positive. If positive, we'll in turn add a to b. If negative, we'll subtract b
; from a. This will in effect make b the absolute value because we're
; subtracting a negative number from a, ie 2 - (-4) = 6.

; Test cases

(a-plus-abs-b 2 4) ; 6
(a-plus-abs-b 2 -4) ; 6
