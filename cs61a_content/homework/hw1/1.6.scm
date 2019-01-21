(define (test-or-special-form)
  ;;; since 2 is truthy, the latter expression doesn't need to be evaluated.
  ;;; Indeed, it is not because it's output isn't displayed on the console.
  (or 2 (display '(expression invoked))))

(define (test-and-special-form-1)
  ;;; the second expression should be invoked to evaluate the and form
  (and true (display '(expression invoked))))

(define (test-and-special-form-2)
  ;;; but in this case, it doesn't need to be evaluated, and indeed, isn't. It
  ;;; returns #f
  (and false (display '(expression invoked))))

;;; it's advantageous to treat them as special forms and evaluate the arguments
;;; one at a time because it saves needless computing if a preceding term
;;; determines if the overall and or or is true or not.
