;;; 1. Predict what Scheme will print in response to each of these expressions

;;; (define a 3) => value: 3
;;; incorrect, prints a

;;; (define b (+ a 1)) => b
;;; correct

;;; (+ a b (* a b)) => (+ 3 4 (* 3 4)) => (+ 3 4 12) => 19
;;; correct

;;; (= a b) => #f
;;; correct

;;; (if (and (> b a) (< b (* a b)))
;;;   b
;;;   a) => 4
;;; correct

;;; (cond ((= a 4) 6)
;;;       ((= b 4) (+ 6 7 a))
;;;       (else 25)) => 16
;;; correct

;;; (+ 2 (if (> b a) b a)) => 6
;;; correct

;;; (* (cond ((> a b) a)
;;;          ((< a b) b)
;;;          (else -1))
;;;    (+ a 1)) => 16
;;; correct

;;; ((if (< a b) + -) a b) => 7
;;; correct

;;; 3. Define a procedure that takes three numbers as arguments and returns the
;;; sum of the squares of the two larger numbers.

(define (sum-of-squares-of-two-largest x y z)
  (cond ((and (>= x z) (>= y z)) (sum-of-squares x y))
        ((and (>= x y) (>= z y)) (sum-of-squares x z))
        (else (sum-of-squares y z))))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (square x)
  (* x x))

;;; 4. Write a procedure dupls-removed that, given a sentence as input, returns
;;; the result of removing duplicate words from the sentence.

(define (dupls-removed sent)
  (if (empty? sent)
    ()
    (sentence (add-letter-if-unique (first sent) (bf sent)) (dupls-removed (bf sent)))))

(define (add-letter-if-unique letter sent)
  (if (member? letter sent)
    ()
    letter))
