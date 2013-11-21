#lang racket
;(define operateTwice (lambda (op1 op2) (lambda(x y) (op2 (op1 x y) y))))

;((operateTwice * +) 2 3)

;(map (lambda (x) (* 2 x)) (list 1 2 3 4 5))
;(map (lambda (+ 2 (lambda (x) (* 2 x)))) ((list 1 2 3 4 5)))
;(map (lambda (x) (lambda (x) (+ 2 (* 2 x)))) (list 1 2 3 4 5))

(define tt (lambda (op1 op2) (lambda(x y) (op1 2 (op2 x y)))))
((tt + *) 3 4)
(map (lambda (x) ((tt + *) 2 x)) (list 1 2 3)) 