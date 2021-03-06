;;; Ex.1.42

;;; Let f and g be two one-argument functions. The composition f after g is
;;; defined to be the function x  f(g(x)). Define a procedure compose that
;;; implements composition. For example, if inc is a procedure that adds 1 to
;;; its argument,

;;; ((compose square inc) 6) ; 49

(define (inc x) (+ x 1))
(define (square x) (* x x))

(define (compose fa fb)
  (lambda (x) (fa (fb x))))

((compose square inc) 6) ; 49
