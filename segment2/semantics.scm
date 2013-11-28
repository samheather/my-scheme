#lang eopl
;; Semantic interpreter for CORE
(provide  (all-defined-out))
(require "syntax.scm")
(require "data-structures.scm")
;; 
;; (execute ...) takes an abstract syntax representation of a program,
;; and returns its Expressed Value
;;
(define (execute prog)
  (cases program prog
    (a-program (exp) (value-of exp))
  )
)
;;
;; (value-of ...) takes an abstract syntax representation of an expression
;; and returns its Expressed Value

;; ** Requires editing the ???s **
(define (value-of expr)                     
  (cases expression expr    
    (const-exp (num) (->ExpVal num)) ;???
    (diff-exp (exp1 exp2)
        (number-ExpVal (- (<-ExpVal (value-of exp1)) (<-ExpVal (value-of exp2))) )
    )
    (zero?-exp (exp)
       (->ExpVal (zero? (<-ExpVal (value-of exp)))) ; ???
    )
    (equal?exp (exp1 exp2)
       (->ExpVal (equal? (<-ExpVal (value-of exp1)) (<-ExpVal (value-of exp2)))))
    (greater?exp (exp1 exp2)
       (->ExpVal (> (<-ExpVal (value-of exp1)) (<-ExpVal (value-of exp2)))))
    (less?exp (exp1 exp2)
       (->ExpVal (< (<-ExpVal (value-of exp1)) (<-ExpVal (value-of exp2)))))
    (if-exp (test true-exp false-exp)
         (if (ExpVal->bool (value-of test)) ; ???
                  (value-of true-exp) ; ???        
                  (value-of false-exp) ; ???      
         ) 
    )
    
    (prim-exp (prim exp1 exp2)
              ??? ; assoc here?
              )
  )
)