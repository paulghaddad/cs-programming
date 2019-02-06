;;; Our Scheme library provides versions of the every function from the last
;;; exercise and the keep function shown in lecture. Get familiar with these by
;;; trying examples such as the following:

(every (lambda (letter) (word letter letter)) 'purple) ; (pp uu rr pp ll ee)

(every (lambda (number) (if (even? number) (word number number) number)) '(781 5 76 909 24)) ; (781 5 7676 909 2424)

(keep even? '(781 5 76 909 24)) ; (76 24)

(keep (lambda (letter) (member? letter 'aeiou)) 'bookkeeper) ; 'ooeee

(keep (lambda (letter) (member? letter 'aeiou)) 'syzygy) ; ""

(keep (lambda (letter) (member? letter 'aeiou)) '(purple syzygy)) ; error! member? doesn't operate on a word like purple

;;; we need to flip what we ask member? as below:

(keep (lambda (wd) (member? 'e wd)) '(purple syzygy)) ; (purple)
