;;; 1.2.2: Tree Recursion

;;; Fibonacci - Recursive

(define (fib-rec n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-rec (- n 1))
                 (fib-rec (- n 2))))))

(fib-rec 5) ; 5

;;; Fibonacci - Iterative

(define (fib-it n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(fib-it 5) ; 5

;;; Counting Change

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 10) ; 4
(count-change 100) ; 292

;;; Exponentiation - linear recursive process

(define (expt b n)
  (if (= n 0)
    1
    (* b (exp b (- n 1)))))

;;; Exponentiation - linear iterative process

(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
    product
    (expt-iter b
               (- counter 1)
               (* b product))))

;;; Exponentiation - Successive Squaring

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(fast-expt 2 16) ; 65536

;;; Euclid's Algorithm

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(gcd 16 28)

;;; Searching for Divisors

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

;;; Determine if prime

(define (prime? n)
  (= n (smallest-divisor n)))

;;; Fermat Test

(define (expmod base exp m)
  (cond ((= exp ) 1)
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
  (cond ((= timex 0) true)
        ((fermat-test n) (fast-prime? 1 (- times 1)))
        (else false)))
