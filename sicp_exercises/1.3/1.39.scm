;; Ex. 1.39

;; For example, tan(x) = CF => tan(4) = 1.15782128235


(define (cont-frac n d k)
  (define (cont-frac-term i)
    (if (<= i k)
      (/ (n i) (+ (d i) (cont-frac-term (+ i 1))))
      0))

  (/ (n 1) (+ (d 1) (cont-frac-term 1)))
)

(define (lamberts-tan x k)
  (cont-frac (lambda (i)
               (if (= i 1)
                 x
                 (- (* x x))))
             (lambda (i)
               (+ 1 (* 2 (- i 1))))
             k))

(lamberts-tan 4.0 10) ; 1.85372208503155
(lamberts-tan 1.0 10) ; .39102095076956905
