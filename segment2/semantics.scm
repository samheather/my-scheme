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
    (a-program (exp) ???)
  )
)
;;
;; (value-of ...) takes an abstract syntax representation of an expression
;; and returns its Expressed Value

;; ** Requires editing the ???s **
(define (value-of expr)                     
  (cases expression expr    
    (const-exp (num) ??? )
    (diff-exp (exp1 exp2)
        (number-ExpVal (- ??? ???) )
    )
    (zero?-exp (exp)
       (??? (zero? ???))
    )
    (if-exp (test true-exp false-exp)
         (if (ExpVal->bool ???)
                  ???         
                  ???       
         ) 
    )
  )
)