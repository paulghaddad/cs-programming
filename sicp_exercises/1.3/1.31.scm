(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

;;; Test product from range 1 to 5
(define (identity x) x)
(define (inc x) (+ x 1))

(product identity 1 inc 5) ; 120

;;; Now define factorial

(define (factorial n)
  (product identity 1 inc n))

(factorial 5) ; 120

;;; Use product to compute approximations to pi

(define (pi-product a b)
  (define (pi-term x)
    (define (numer x)
      (if (= (remainder x 2) 0)
        (+ x 2)
        (+ x 1)))
    (define (denom x)
      (if (= (remainder x 2) 0)
        (+ x 1)
        (+ x 2)))

    (/ (numer x) (denom x)))

  (product pi-term a inc b))

;;; This calculates the approximation to pi/4
(pi-product 1 1000)

;;; Now let's multiply the above by 4 to get pi
(* 4.0 (pi-product 1 1000)) ; 3.1431607055322663
