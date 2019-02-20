;;; Lab 3

;;; Problem 1

;;; Counting Change - Alternative 1

(define (count-change-reverse-1 amount)
  (cc amount 5 1))

(define (cc amount kinds-of-coins coins-used)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (> coins-used kinds-of-coins)) 0)
        (else (+ (cc amount kinds-of-coins
                     (+ coins-used 1))
                 (cc (- amount
                        (first-denomination coins-used))
                     kinds-of-coins
                     coins-used)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change-reverse-1 10) ; 4
(count-change-reverse-1 100) ; 292

;;; Counting Change - Alternative 2

;;; Can't think of another way, but I don't think this is worth spending a huge
;;; amount of time on.

;;; Problem 2

;;; The number of calls to cc by reverseing the order from 1 to 5 increases the
;;; number of calls because we're always having to test all coins from 1 to 5.
;;; Instead of going from 2 to 1 directly and not having to test 3, 4 and 5.
;;; Reversing the order forces us to always test all possible coins, whereas we
;;; only need to do that in the original solution if we start with 5 coins.

;;; Problem 3

(define (count-change-sent amount)
  (cc amount '(50 25 10 5 1)))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (empty? kinds-of-coins)) 0)
        (else (+ (cc amount 
                     (bf kinds-of-coins))
                 (cc (- amount (first kinds-of-coins))
                     kinds-of-coins)))))

(count-change-sent 10) ; 4
(count-change-sent 100) ; 292

;;; Problem 4

(define (type-check fn check datum)
  (if (not (check datum))
    #f
    (fn datum)))

(type-check sqrt number? 'hello) ; #f

(type-check sqrt number? 4) ; 2

;;; Problem 5

(define (make-safe fn type-check)
  (lambda (datum) (
                   if (not (type-check datum))
                           #f
                           (fn datum))))

(define safe-sqrt (make-safe sqrt number?))

(safe-sqrt 'hello) ; #f

(safe-sqrt 4) ; 2
