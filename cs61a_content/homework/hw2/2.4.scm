;;; In principle, we could build a version of Scheme with no primitives except
;;; lambda. Every- thing else can be defined in terms of lambda, although it’s
;;; not done that way in practice because it would be so painful. But we can get
;;; a sense of the flavor of such a language by eliminating one feature at a
;;; time from Scheme to see how to work around it.

;;; In this problem we explore a Scheme without define. We can give things names
;;; by using argument binding, as let does, so instead of

(define (sumsq a b)
  (define (square x) (* x x))
  (+ (square a) (square b)))

(sumsq 3 4) ; 25

;;; we can use lambda

((lambda (a b)
   ((lambda (square)
      (+ (square a) (square b)))
    (lambda (x) (* x x))))
 3 4) ; 25

;;; This works fine as long as we don’t want to use recursive procedures. But we
;;; can’t replace

(define (fact n)
  (if (= n 0)
    1
    (* n (fact (- n 1)))))

(fact 5)

;;; by
;;; ((lambda (n)
;;;   (if ...))
;;; 5)

;;; because what do we do about the invocation of fact inside the body?

;;; Your task is to find a way to express the fact procedure in a Scheme without
;;; any way to define global names.

((lambda (fact)
   (display (fact fact 5)))
 (lambda (fn n)
          (if (= n 0)
            1
          (* n (fn fn (- n 1))))))
