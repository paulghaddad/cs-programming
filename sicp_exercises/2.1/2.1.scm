;;; Exercise 2.1.

;;; Define a better version of make-rat that handles both
;;; positive and negative arguments. Make-rat should normalize the sign so that
;;; if the rational number is positive, both the numerator and denominator are
;;; positive, and if the rational number is negative, only the numerator is
;;; negative.

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g (abs(gcd n d)))
        (norm-n (abs n))
        (norm-d (abs d)))

      (cond ((< (* n d) 0) (cons (/ (- norm-n) g) (/ norm-d g)))
            (else (cons (/ norm-n g) (/ norm-d g))))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

;;; Rational number is positive

(define one-half-a (make-rat 1 2))

(print-rat one-half-a) ; 1/2

(define one-half-b (make-rat -1 -2))

(print-rat one-half-b) ; 1/2

;;; Rational number is negative

(define one-half-c (make-rat -1 2))

(print-rat one-half-c) ; -1/2

(define one-half-d (make-rat 1 -2))

(print-rat one-half-d) ; -1/2
