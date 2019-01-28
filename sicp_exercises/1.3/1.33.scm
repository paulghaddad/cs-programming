;;; filtered-accumulate: (filtered-accumulate combiner null-value term a next b filter)

(define (filtered-accumulate combiner null-value term a next b filter)
  (define (current-term)
    (if (filter a)
      (term a)
      null-value))
  (current-term)

  (if (> a b)
    null-value
    (combiner
      (current-term)
      (filtered-accumulate combiner null-value term (next a) next b filter))))


(define (identity x) x)
(define (square x) (* x x))
(define (inc n) (+ n 1))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (and (> n 1) (= n (smallest-divisor n))))

;;; Part a: The sume of the squares of the prime numbers from a to b

(define (sum-of-prime-squares a b)
  (filtered-accumulate + 0 square a inc b prime?))

(sum-of-prime-squares 0 10) ; 87 (1 is not prime)

;;; Part b: The product of all the positive integers less than n that are
;;; relatively prime to n

