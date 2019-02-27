;;; Ex. 1.16

;;; Design a procedure that evolves an iterative exponentiation process that
;;; uses successive squaring and uses a logarithmic number of steps, as does
;;; fast-expt. (Hint: Using the observation that (bn/2)2 = (b2)n/2, keep, along
;;; with the exponent n and the base b, an additional state variable a, and
;;; define the state transformation in such a way that the product a bn is
;;; unchanged from state to state. At the beginning of the process a is taken to
;;; be 1, and the answer is given by the value of a at the end of the process.
;;; In general, the technique of defining an invariant quantity that remains
;;; unchanged from state to state is a powerful way to think about the design of
;;; iterative algorithms.)

;;; The key to this problem is keeping calls to expt-log-iter on the outside,
;;; not as a subexpression as in the original iterative solution, ie. (* b
;;; (fast-expt b (- n 1))

;;; We achieve this with an additional state variable, recognizing the state
;;; transformations as follows, and with the use of a quantity that is
;;; invariant: ab**n

;;; If even, this quantity has the same value, but the values it consists of
;;; change: ab**n -> a(b**2)b**n/2
;;; and if odd: ab**n -> abb**(- n 1)

;;; when n == 0, b**0 = 1 and a by definition equals ab**n -> ab**nb**0

(define (expt b n)
  (expt-log-iter b n 1))

(define (expt-log-iter b n a)
  (newline)
  (display n)
  (newline)
  (display b)
  ; (newline)
  ; (display a)

  (cond ((= n 0) a)
      ((even? n) (expt-log-iter (square b) (/ n 2) a))
      (else (expt-log-iter b (- n 1) (* a b)))))

(expt 2 0) ; 1
(expt 2 8) ; 256
(expt 2 9) ; 512
