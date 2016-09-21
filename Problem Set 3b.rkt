;; ------------------------ Problem Set 3 b ----------------------------

;; Design posn-. The function consumes two Posns, p and q.
;; To create the resulting Posn, it subtracts the x coordinate of q from
;; the one of p and the y coordinate of q from that of p.

;; posn-: posn -> posn
;; subtract q's x value from p's and q's y value from p's
(define (posn--template p q)
  (make-posn ... (posn-x p) (posn-x q)...
             ... (posn-y p) (posn-y q)...))

(define (posn- p q)
  (make-posn (- (posn-x p) (posn-x q))
             (- (posn-y p) (posn-y q))))

(check-expect (posn- (make-posn 10 12) (make-posn 8 10))
              (make-posn 2 2))
(check-expect (posn- (make-posn 20 8) (make-posn 32 22))
              (make-posn -12 -14))

;;--------------------------------------------------------------------

;; Exercise 73. Design the function posn-up-x,
;; which consumes a Posn p and a Number n.
;; It produces a Posn like p with n in the x field.

;; posn-up-x: posn  number -> posn
;; Produces new posn with x value replaced with given number
(define (posn-up-x-template p n)
  (make-posn ... (posn-y p) ...))

(define (posn-up-x p n)
  (make-posn n (posn-y p)))

(check-expect (posn-up-x (make-posn 10 120) 120) (make-posn 120 120))
(check-expect (posn-up-x (make-posn 20 20) -20) (make-posn -20 20))
