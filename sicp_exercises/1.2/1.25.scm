; Ex. 1.25

;;; Alyssa P. Hacker complains that we went to a lot of extra work in writing expmod. After all, she says, since we already know how to compute exponentials, we could have simply written

(define (square x)
  (display "square ")(display x)(newline)
  (* x x))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (time-expmod start-time)
  (newline)
  (display "Starting expmod")
  (newline)
  (expmod 5 1000037 100)
  (display "Run Time: ")
  (display (- (runtime) start-time)))

(time-expmod (runtime)) ; Runtime: 4.91s

(define (expmod-orig base exp m)
  (newline)
  (display exp)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod-orig base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod-orig base (- exp 1) m))
                     m))))

(define (time-expmod-orig start-time)
  (newline)
  (display "Starting expmod-orig")
  (newline)
  (expmod-orig 5 1000037 100)
  (display "Run Time: ")
  (display (- (runtime) start-time)))

(time-expmod-orig (runtime)) ; Runtime: 1e-3s

;;; Is she correct? Would this procedure serve as well for our fast prime
;;; tester? Explain.

;;; She is not correct. The critical difference between the two is in the
;;; original version, we are returning the modulo of the square calculation
;;; against m. This will keep the intermediate return values of the recursive
;;; calls below m (since we're using modulo m). In the fast-expt implementation,
;;; we're only doing the modulo at the top-level call. There are a number of
;;; intermediate recursive calls to fast-expt, but these will return the square
;;; of the number if even. This means exponential growth and will slow the
;;; calculation down for larger numbers. While it's not noticeable on smaller
;;; primes, on larger primes, the difference is enormous.
