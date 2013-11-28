#lang eopl
(provide (all-defined-out))
;; Syntax for CORE

; *** Requires relacing the ??? ***

; Lexical structure
(define the-lexical-spec
  '(
    (whitespace (whitespace)                skip)
    (number     (digit (arbno digit))      number)
    (primitive  (???) ???)
   )
)
; Grammar
(define the-grammar
  '(
    (program (expression) a-program)
    
    (expression (number)  const-exp)
    (expression
      (primitive "(" expression "," expression ")") prim-exp)
    (expression
      ("zero?" "(" expression ")") zero?-exp)  
    (expression
     ("equal?" "(" expression "," expression ")") equal?exp)
    (expression
     ("greater?" "(" expression "," expression ")") greater?exp)
    (expression
     ("less?" "(" expression "," expression ")") less?exp)
    (expression
     ("-" "(" expression "," expression ")")  diff-exp) 
    (expression
     ("if" expression "then" expression "else" expression) if-exp)
    )
)

; Primitives
(list
 ("-" (lambda (exp exp) ???))
 ???
 )
      

;;;;;;;;;;;;;;;; sllgen boilerplate ;;;;;;;;;;;;;;;;
;; Evaluating the following is *required* to construct the
;; data-types from the lexer and parser specs.
;; ... will be evaluated when this file is 'loaded'
(sllgen:make-define-datatypes the-lexical-spec the-grammar)

;; (sca&parse string) scans and parses the program represented
;; by the string argumnet. Produces an abstract syntax representation of
;; the program if no errors, which can be passed to (execute ...)
(define scan&parse
  (sllgen:make-string-parser the-lexical-spec the-grammar))
;; Applies the scanner given by lexical-spce to a string ...
;; used to test scanners
(define just-scan
  (sllgen:make-string-scanner the-lexical-spec the-grammar))
; (show-the-datatypes) displays the data-types created by the scanner
; and parser
(define (show-the-datatypes)
  (sllgen:list-define-datatypes the-lexical-spec the-grammar))
  