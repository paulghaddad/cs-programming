;;; Ex. 1.23

;;; The smallest-divisor procedure shown at the start of this section does lots
;;; of needless testing: After it checks to see if the number is divisible by 2
;;; there is no point in checking to see if it is divisible by any larger even
;;; numbers. This suggests that the values used for test-divisor should not be
;;; 2, 3, 4, 5, 6, ..., but rather 2, 3, 5, 7, 9, .... To implement this change,
;;; define a procedure next that returns 3 if its input is equal to 2 and
;;; otherwise returns its input plus 2. Modify the smallest-divisor procedure to
;;; use (next test-divisor) instead of (+ test-divisor 1). With timed-prime-test
;;; incorporating this modified version of smallest-divisor, run the test for
;;; each of the 12 primes found in exercise 1.22. Since this modification halves
;;; the number of test steps, you should expect it to run about twice as fast.
;;; Is this expectation confirmed? If not, what is the observed ratio of the
;;; speeds of the two algorithms, and how do you explain the fact that it is
;;; different from 2?


(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (define (next n)
    (if (= n 2)
        (+ n 1)
        (+ n 2)))
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (cond ((prime? n)
    (report-prime (- (runtime) start-time))
    true)
        (else false)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes a primes-found)
  (if (= primes-found 3)
    (exit))

  (if (even? a)
    (search-for-primes (+ a 1) primes-found))


  (if (timed-prime-test a)
    (search-for-primes (+ a 2) (+ primes-found 1))
    (search-for-primes (+ a 2) primes-found)))


(search-for-primes 1000000000 0) ; ~.06 => ~.04 ; reduction: 33%
; (search-for-primes 10000000000 0) ; ~.19 => ~.12 ; reduction: 36%; Growth Factor: 3.0
; (search-for-primes 100000000000 0) ; ~..6 => ~.37; reduction: 38%; Growth Factor: 3.08
; (search-for-primes 1000000000000 0) ; ~1.84 =>  ~1.15; reduction: 38%; Growth Factor: 3.10

;;; While this implementation does indeed reduce the runtime, it doesn't reduce
;;; it by half as expected. The observed ratio reduction of the tests are
;;; approximately 33%-38%. My thoughts on why this is the case is the actual
;;; program has a number of fixed start-up costs that are independent of skipping
;;; some numbers after it's initialized, such as calling the functions, loading
;;; data into memory, etc.
