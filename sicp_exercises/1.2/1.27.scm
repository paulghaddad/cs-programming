;;; Ex. 1.27

;;; Demonstrate that the Carmichael numbers listed in footnote 47 really do fool
;;; the Fermat test. That is, write a procedure that takes an integer n and
;;; tests whether an is congruent to a modulo n for every a<n, and try your
;;; procedure on the given Carmichael numbers.


(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (fermat-test n)
  (define (congruent? a)
    (if (= a 1)
        true
        (= (expmod a n n) a)))

  (and (congruent? (- n 1)) (congruent? (- n 2))))

;;; Now let's test this on the Carmichael numbers:
(fermat-test 561) ; #t
(fermat-test 1105) ; #t
(fermat-test 1729) ; #t
(fermat-test 2465) ; #t
(fermat-test 2821) ; #t
(fermat-test 6601) ; #t
