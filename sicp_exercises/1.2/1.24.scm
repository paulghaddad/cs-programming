;;; Ex. 1.24

;;; Modify the timed-prime-test procedure of exercise 1.22 to use fast-prime?
;;; (the Fermat method), and test each of the 12 primes you found in that
;;; exercise. Since the Fermat test has (log n) growth, how would you expect the
;;; time to test primes near 1,000,000 to compare with the time needed to test
;;; primes near 1000? Do your data bear this out? Can you explain any
;;; discrepancy you find?

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline)
  (display n) (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (cond ((fast-prime? n 100)
    (report-prime (- (runtime) start-time))
    true)
        (else false)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)
(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)
(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 100043)
(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)

; 1009 *** 0.                                                                                                                        1013 *** 1.0000000000000009e-2
; 1019 *** 9.999999999999981e-3                                                                                                      10007 *** 1.0000000000000009e-2
; 10009 *** 1.0000000000000009e-2
; 10037 *** 0.
; 100003 *** 9.999999999999981e-3
; 100019 *** 1.0000000000000009e-2
; 100043 *** 1.0000000000000009e-2
; 1000003 *** 9.999999999999981e-3
; 1000033 *** 1.0000000000000009e-2
; 1000037 *** 0.

;;; We can't see much of a difference between 10e3 vs 10e6. We'll compare 10e6 vs. 10e12:


(timed-prime-test 1000003) ; 1.0000000000000009e-2
(timed-prime-test 1000033) ; 1.0000000000000009e-2
(timed-prime-test 1000037) ; 1.0000000000000009e-2
(timed-prime-test 1000000000039) ; 2.0000000000000018e-2
(timed-prime-test 1000000000061) ; 2.0000000000000018e-2
(timed-prime-test 1000000000063) ; 2.0000000000000018e-2

;;; From this data, as we double the size of the exponent (10e6) to (10e12), the
;;; time required to determine whether it's prime increases linearly, from 1e-2
;;; to 2e-2. Thus, it approximates logarithmic growth.
