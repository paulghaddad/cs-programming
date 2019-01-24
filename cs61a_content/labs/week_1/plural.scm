(define (plural wd)
  (if (and (equal? (last wd) 'y) (consonant? (last (bl wd))))
    (word (bl wd) 'ies)
    (word wd 's)))

(define (consonant? letter)
  (not (member? letter '(a e i o u))))
