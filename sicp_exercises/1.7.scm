(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (display guess)
  (display "\n")
  (display x)
  (display "\n")
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; normal number
; (sqrt 9)

; small number
; (sqrt 0.001)
; this gives .04124542607499115
; correct answer is 0.0316227766

; the reason small numbers aren't accurate is because when we test whether it is
; good enough, we're squaring our guess, which results in a number that is
; within 0.001 of x. Small numbers, when squared, have very low tolerances. To
; improve this, we need a much smaller delta to test for.

; large number
(sqrt 1000000000000) ; this resolves immediately

; (sqrt 10000000000000); this results in an infinite loop because improve keeps yielding 3162277.6601683795 inside improve due to arithmetic rounding

; for very large numbers, limited arithmetic precision gives us inaccurate
; values in good-enough, which can potentially lead to inaccurate answers in
; good-enough because we're comparing the difference in the square of our guess
; to x.

; Alternative algorithm for good-enough?

(define (sqrt-iter-alt guess x)
  (if (good-enough-alt? guess x)
    guess
    (sqrt-iter-alt (improve guess x)
               x)))

(define (good-enough-alt? guess x)
  ; since we have guess, we can also improve our guess within here and compare
  ; the two values. If below a threshold, return true
  (< (abs (- (improve guess x) guess)) 0.001))

(define (sqrt-alt x)
  (sqrt-iter-alt 1.0 x))

; normal number
(sqrt-alt 9)

; small number
(sqrt-alt 0.001)
; this now gives an answer of 3.1642015868650786e-2, which is much more accurate

; large number
(sqrt-alt 1000000000000) ; this resolves immediately
(sqrt-alt 10000000000000); this now immediately resolves

