;;; accumulate: (accumulate combiner null-value term a next b)

(define (accumulate combiner null-value term a next b)
(if (> a b)
  null-value
  (combiner (term a)
     (accumulate combiner null-value term (next a) next b))))


(define (identity x) x)
(define (inc n) (+ n 1))

;;; Producing sum and product functionality with straight calls to accumulate

(accumulate + 0 identity 0 inc 10) ; 55
(accumulate * 1 identity 1 inc 5) ; 120

;;; Define sum in terms of accumulate

(define (sum term a next b)
  (accumulate + 0 term a next b))

(sum identity 0 inc 10) ; 55

;;; Define product in terms of accumulate

(define (product term a next b)
  (accumulate * 1 term a next b))

(product identity 1 inc 5) ; 120
