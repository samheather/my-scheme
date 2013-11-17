#lang eopl
(require "syntax.scm")
;(require "semantics.scm")
;(require "data-structures.scm")
;(require "driver.scm")
;;
;
; CORE
;
(define ten   "10")               ;; 10
(define true  "zero?(0)")         ;; #t
(define nope! "zero?(10)")        ;; #f
(define Hmm?  "zero?(zero?(0))")  ;; semantic error
(define HmHm!  "-( 2, zero?(2))") ;; semantic error
(define e1 ;; 3
    "if zero?( -( 2, 3) ) then 4 else -( 4, -(2,1))")
(define if1  ;; 2    
     "if zero?(1) then 10 else if zero?(1) then 1 else 2")
(define if2 ;; 398    
     "if zero?(1) then 10 else -( 400, if zero?(1) then 1 else 2)")
;
; ** Add more tests ***

