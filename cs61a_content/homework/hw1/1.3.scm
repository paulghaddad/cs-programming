;;; Write a procedure switch that takes a sentence as its argument and returns a
;;; sentence in which every instance of the words I or me is replaced by you,
;;; while every instance of you is replaced by me except at the beginning of the
;;; sentence, where it’s replaced by I. (Don’t worry about capitalization of
;;; letters.) Example:

;;; > (switch ’(You told me that I should wake you up))

;;; (i told you that you should wake me up)

(define (switch sent)
  (if (equal? (first sent) 'You)
    (sentence (word 'i) (switch-words (bf sent)))
    (switch-words sent)))

(define (switch-words sent)
  (if (empty? sent)
    ()
    (sentence (switch-word (first sent)) (switch-words (bf sent)))))

(define (switch-word wd)
  (cond ((or (equal? wd 'I) (equal? wd 'me)) (word 'you))
        ((equal? wd 'you) (word 'me))
        (wd)))
