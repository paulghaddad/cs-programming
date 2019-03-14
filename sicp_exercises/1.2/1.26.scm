;;; Ex. 1.26

;;; Louis Reasoner is having great difficulty doing exercise 1.24. His
;;; fast-prime? test seems to run more slowly than his prime? test. Louis calls
;;; his friend Eva Lu Ator over to help. When they examine Louis's code, they
;;; find that he has rewritten the expmod procedure to use an explicit
;;; multiplication, rather than calling square:

(define (expmod base exp m)
  (newline)
  (display exp)
  (newline)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

;;; ``I don't see what difference that could make,'' says Louis. ``I do.'' says
;;; Eva. ``By writing the procedure like that, you have transformed the (log n)
;;; process into a (n) process.'' Explain.


(define (expmod-orig base exp m)
  (newline)
  (display exp)
  (newline)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod-orig base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod-orig base (- exp 1) m))
                     m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(fast-prime? 100 100)

;;; So starting out with a simple test illuminates that Eva is correct. The
;;; original expmod implementation returns nearly immediately for a large
;;; number, whereas the tweaked version took so long I cut it off.

;;; If we analyze a simple case, such as 100, we can confirm the original expmod
;;; implementation results in a linear recursive process that logarithmically
;;; reduces the problem:
;;; 100 -> 50 -> 25 -> 12 -> 6 -> 3 -> 2 -> 1 -> 0

;;; The version with explicit multiplication results in tree recursion:

;;; 100
;;; 50 50
;;; 25 25 25 25
;;; 12 12 12 12 12 12 12 12
;;; ...

;;; Notice how much redundant computation we are doing. The number of leaves in
;;; the tree is n + 1, so we're doing a linear computation.
