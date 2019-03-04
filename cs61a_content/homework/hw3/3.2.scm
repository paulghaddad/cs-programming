;;; A “perfect number” is defined as a number equal to the sum of all its
;;; factors less than itself. For example, the first perfect number is 6,
;;; because its factors are 1, 2, 3, and 6, and 1+2+3=6. The second perfect
;;; number is 28, because 1+2+4+7+14=28. What is the third perfect number? Write
;;; a procedure (next-perf n) that tests numbers starting with n and continuing
;;; with n+1, n+2, etc. until a perfect number is found. Then you can evaluate
;;; (next-perf 29) to solve the problem. Hint: you’ll need a sum-of-factors
;;; subprocedure.

(define (next-perf n)
  (let ((next-num (+ n 1)))

    (if (perfect-number? next-num)
      next-num
      (next-perf next-num))))

(define (perfect-number? n)
  (= (sum-of-factors n) n)
)

(define (divisor? n divisor)
  (= (remainder n divisor) 0))

(define (sum-of-factors n)
  (define (sum-factors n d sum)
    (cond ((= d 0) sum)
          ((divisor? n d) (sum-factors n (- d 1) (+ sum d)))
          (else (sum-factors n (- d 1) sum))))

  (sum-factors n (- n 1) 0))

(next-perf 6) ; 28
(next-perf 29) ; 496
