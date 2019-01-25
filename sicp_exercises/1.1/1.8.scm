(define (cube-root x)
  (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
    guess
    (cube-root-iter (improve guess x)
                    x)))

; defined if the change from one guess to the next is very small
(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) 0.001))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(cube-root 27)
(cube-root 0.5)
