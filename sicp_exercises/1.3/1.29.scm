;;; Ex. 1.29
;;; Simpson's Rule

(define (cube x)
  (* x x x))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (simpson-approx f a b n)
  (define h (/ (- b a) n))

  (define (inc k) (+ k 1))

  (define (coefficient k)
    (cond ((or (= k 0) (= k n) ) 1)
          ((odd? k) 4)
          ((even? k) 2)))

  (define (simpson-term k)
    (* (coefficient k) (f (+ a (* h k)))))

  (* (/ h 3) (sum simpson-term 0 inc n))
)

(simpson-approx cube 0 1 100) ; 1/4

(simpson-approx cube 0 1 1000) ; 1/4
