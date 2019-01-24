;;; Specific procedures to compute the summation of a series

(define (sum-integers a b)
  (if (> a b)
    0
    (+ a (sum-integers (+ a 1) b))))

(define (sum-cubes a b)
  (if (> a b)
    0
    (+ (cube a) (sum-cubes (+ a 1) b))))

(define (pi-sum a b)
  (if (> a b)
    0
    (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))

;;; Higher-order procedure to generalize summing a series

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

;;; Applied to specific series

(define (inc n) (+ n 1))

(define (cube x)
  (* x x x))

(define (sum-cubes-higher-order a b)
  (sum cube a inc b))

(define (identity x) x)

(define (sum-integers-higher-order a b)
  (sum identity a inc b))

(define (pi-sum-higher-order a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))
