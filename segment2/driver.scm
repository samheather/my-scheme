#lang eopl
;; Loads all required pieces.
;; Provides the top-level (run ...) function
;;
(require "data-structures.scm")  ; for expval constructors
(require "syntax.scm")           ; for scan&parse
(require "semantics.scm")        ; for execute
;
(provide (all-defined-out))
;
;; run : String -> SchemeValue
(define (run string)
  (<-ExpVal 
     (execute (scan&parse string))
  )
)