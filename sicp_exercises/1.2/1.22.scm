;;; 1.22 scm

;;; Use the smallest-divisor procedure to find the smallest divisor of each of
;;; the following numbers: 199, 1999, 19999.

;;; Most Lisp implementations include a primitive called runtime that returns an
;;; integer that specifies the amount of time the system has been running
;;; (measured, for example, in microseconds). The following timed-prime-test
;;; procedure, when called with an integer n, prints n and checks to see if n is
;;; prime. If n is prime, the procedure prints three asterisks followed by the
;;; amount of time used in performing the test.

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

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


; (search-for-primes 1000 0)
; (search-for-primes 10000 0)
; (search-for-primes 100000 0)
; (search-for-primes 1000000 0)

;;; Unfortunately the times reported are so near 0 that I can't determine the
;;; difference in runtimes between the four runs. Let's bump up the magnitudes
;;; of the starting numbers.

; (search-for-primes 1000000000 0) ; ~.06
; (search-for-primes 10000000000 0) ; ~.19 Growth Factor: 3.16
; (search-for-primes 100000000000 0) ; ~.6 Growth Factor: 3.15
(search-for-primes 1000000000000 0) ; ~ 1.84 Growth Factor: 3.06

;;; The above growth factors are all around 3.16. The difference in n between
;;; run is 10, And because root(10) = 3.16, we can confirm the actual runtime
;;; matches the predicted runtime.
