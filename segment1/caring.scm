#lang racket
(define (visit-doctor name)
  (begin
    (print (list 'hello name))
    (print '(what seems to be the trouble?))
    (doctor-driver-loop name)))

(define (doctor-driver-loop name)
  (begin
    (newline)
    (display '**)
    (let ((user-response (read)))
      (if (equal? user-response '(goodbye))
                (begin
                   (print (list 'goodbye name))
                   (print '(see you next week))
                )
                (begin
                    (print (reply user-response))
                    (doctor-driver-loop name)
                )))))

(define (reply user-response)
  (if (fifty-fifty)
        (append (qualifier) (change-person user-response))
        (hedge)))

(define (fifty-fifty) (= (random 2) 0))

(define (qualifier)
  (pick-random '((you seem to think)
                 (you feel that)
                 (why do you believe)
                 (you seem to feel that)
                 (can you tell me why you think that)
                 (why do you say that)
                 (why do you say))))

(define (hedge)
  (pick-random
   '((please go on)
     (many people have the same sorts of feelings)
     (many of my patients have told me the same thing)
     (i believe that this is quite common)
     (please tell me more)
     (please continue))))

(define (replace pattern replacement lst)
  (cond ((null? lst) '())
        ((equal? (car lst) pattern)
                 (cons replacement
                       (replace pattern replacement (cdr lst)))
        )
        (else (cons (car lst)
                    (replace pattern replacement (cdr lst)))
        )))

(define (many-replace replacement-pairs lst)
  (if (null? replacement-pairs); if list has words
         lst
         (let ((pat-rep (car replacement-pairs))); pat-rep is a replacement pair
                (replace (car pat-rep)
                         (cadr pat-rep)
                         (many-replace (cdr replacement-pairs)
                                       lst)))))

(define (change-person phrase)
  (if (isFirstPerson phrase '(i me am my))
      (many-replace '((i you) (me you) (am are) (my your)) phrase)
      (many-replace '((are am) (you i) (your my)) phrase)
  )
)

(define (isFirstPerson lst firstPersonWords)
  (cond ((conditional) return)
        ((conditional) return)
        ...
        (else ))
  (if (null? lst) ; switch to cond
      #f
      (if (isEqualToOneOf (car lst) firstPersonWords)
      ;(if (equal? (car lst) 'i)
          #t
          (isFirstPerson (cdr lst) firstPersonWords))))
(define (pick-random lst) (list-ref lst (random (length lst))))

(define (isEqualToOneOf single lst)
  (if (null? lst)
      #f
      (if (equal? single (car lst))
          #t
          (isEqualToOneOf single (cdr lst))
      )
   )
)

;(change-person '(you are not being very helpful to me))
;(isFirstPerson '(hello you are sam))
;(isEqualToOneOf 'sam '(hello world this is sam))
;(isFirstPerson '(hello you are a duck) '(i me am my))
(visit-doctor 'Sam)