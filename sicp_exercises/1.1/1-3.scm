;;; Define a procedure that takes three numbers as arguments and returns the sum
;;; of the squares of the two larger numbers.

(define (square x)
  (* x x))

(define (sum_of_squares x y)
  (+ (square x) (square y)))

(define (sum_of_squares_of_largest_nums x y z)
  (cond ((and (> x z) (> y z)) (sum_of_squares x y))
        ((and (> x y) (> z y)) (sum_of_squares x z))
        (else (sum_of_squares y z))))

(sum_of_squares_of_largest_nums 1 2 3) ; 13
(sum_of_squares_of_largest_nums 1 1 1) ; 2
(sum_of_squares_of_largest_nums 1 2 2) ; 8
(sum_of_squares_of_largest_nums 1 1 2) ; 5
