;;; 1. Try these in Scheme:

(define x (cons 4 5))
(car x) ; 4
(cdr x) ; 5
(define y (cons 'hello 'goodbye))
(define z (cons x y))
(car (cdr z)) ; 'hello
(cdr (cdr z)) ; 'goodbye

;;; 2. Predict the result of each of these before you try it:

(cdr (car z)) ; 5
(car (cons 8 3)) ; 8
(car z) ; (4 . 5)
; (car 3) ; type error

;;; 3. Enter these definitions into Scheme:

(define (make-rational num den)
  (cons num den))

(define (numerator rat)
  (car rat))

(define (denominator rat)
  (cdr rat))

(define (*rat a b)
  (make-rational (* (numerator a) (numerator b))
                 (* (denominator a) (denominator b))))

(define (print-rat rat)
  (word (numerator rat) '/ (denominator rat)))

;;; 4. Try this:

(print-rat (make-rational 2 3)) ; "2/3"
(print-rat (*rat (make-rational 2 3) (make-rational 1 4)))
; =>  (* rat (2 . 3) (1 . 4)) => (make-rational (* 2 1) (* 3 4)) =>
; (make-rational 2 12) => "2/12"

;;; 5. Define a procedure +rat to add two rational numbers, in the same style as
;;; *rat above.

(define (+rat a b)
  (make-rational (+ (* (numerator a) (denominator b))
                    (* (numerator b) (denominator a)))
                 (* (denominator a) (denominator b))))

(print-rat (+rat (make-rational 2 3) (make-rational 1 4))) ; "11/12"
