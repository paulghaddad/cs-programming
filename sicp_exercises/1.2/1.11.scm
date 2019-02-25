;;; A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1)
;;; + 2f(n - 2) + 3f(n - 3) if n> 3. Write a procedure that computes f by means
;;; of a recursive process. Write a procedure that computes f by means of an
;;; iterative process

;;; Recursive solution

(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
         (* 2 (f-recursive (- n 2)))
         (* 3 (f-recursive (- n 3))))))

(f-recursive 3) ; 11
(f-recursive 10) ; 1892

;;; Iterative Solution

(define (f-iterative n)
  (define (iter n1 n2 n3 count)
    (let ((next-n (+ n3 (* 2 n2) (* 3 n1))))
      (if (= (- count 3) 0)
        next-n
        (iter n2 n3 next-n (- count 1)))))

  (if (< n 3)
      n
      (iter 0 1 2 n)))


(f-iterative 3) ; 11
(f-iterative 10) ; 1892
