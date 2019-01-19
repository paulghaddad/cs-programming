;;; Write a predicate ordered? that takes a sentence of numbers as its argument
;;; and returns a true value if the numbers are in ascending order, or a false
;;; value otherwise.

;;; (ordered? '(1 2 3)) => #t
;;; (ordered? '(1 4 3)) => #f

(define (ordered? nums)
  (if (or (empty? nums) (empty? (bf nums))
    #t
    (and (< (first nums) (first (bf nums))) (ordered? (bf nums)))))
