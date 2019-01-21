(define (ends-e sent)
  (if (empty? sent)
    ()
    (se (filter-words-ends-e (first sent)) (ends-e (bf sent))
  )))

(define (filter-words-ends-e wd)
  (if (equal? (last wd) 'e)
    wd
    ()))
