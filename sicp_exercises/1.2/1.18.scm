;;; Ex. 1.18

;;; Using the results of exercises 1.16 and 1.17, devise a procedure that
;;; generates an iterative process for multiplying two integers in terms of
;;; adding, doubling, and halving and uses a logarithmic number of steps.

;;; This procedure generates an interative process that takes n steps
(define (* a b)
  (define (mult-iter a b product)
    (if (= b 0)
        product
        (mult-iter a (- b 1) (+ product a))))

  (mult-iter a b 0))

(* 2 4) ; 8

;;; Same procedure as above, except it produces a logarithmic number of steps

(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))


(define (* a b)
  (define (mult-iter a b product)
    (cond ((or (= a 0) (= b 0)) product)
          ((even? b) (mult-iter (double a) (halve b) product))
          ((odd? b) (mult-iter a (- b 1) (+ product a)))))

  (mult-iter a b 0))

(* 2 4) ; 8
(* 3 3) ; 9
(* 1 3) ; 3
(* 3 1) ; 3
(* 0 3) ; 0
(* 3 0) ; 0
