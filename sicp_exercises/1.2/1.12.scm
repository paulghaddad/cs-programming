;;; Ex. 1.12

;;; The following pattern of numbers is called Pascal's triangle.

;;;         1
;;;        1 1
;;;       1 2 1
;;;      1 3 3 1
;;;     1 4 6 4 1

;;; The numbers at the edge of the triangle are all 1, and each number inside
;;; the triangle is the sum of the two numbers above it.35 Write a procedure
;;; that computes elements of Pascal's triangle by means of a recursive process.

;;; Use zero-based indexing for rows and columns

(define (pascal row column)
  (if (or (= column 0) (= column row))
      1
      (+ (pascal (- row 1) (- column 1))
         (pascal (- row 1) column))))

(pascal 0 0) ; 1
(pascal 1 0) ; 1
(pascal 1 1) ; 1
(pascal 2 0) ; 1
(pascal 2 2) ; 1
(pascal 2 1) ; 2
(pascal 4 1) ; 4
(pascal 4 2) ; 6
