;;; Generalize this pattern to create a higher-order procedure called every that
;;; applies an arbitrary procedure, given as an argument, to each word of an
;;; argument sentence.

(define (square x) (* x x))


(define (every fn collection)
  (if (empty? collection)
    '()
    (se (fn (first collection)) (every fn (bf collection)))))

(every square '(1 2 3 4)) ; (1 4 9 16)

(every first '(nowhere man)) ; (n m)
