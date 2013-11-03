#lang racket
(define (visit-doctor name)
  (begin
    (print (list 'hello name))
    (print '(what seems to be the trouble?))
    (doctor-driver-loop name '(thisIsAStringThatIsRemoved))))

(define (doctor-driver-loop name past-responses)
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
                    (print (reply user-response past-responses))
                    (if (equal? (car past-responses) 'thisIsAStringThatIsRemoved)
                        (doctor-driver-loop name (list user-response))
                        (doctor-driver-loop name (cons user-response past-responses))
                ))))))

(define (reply user-response past-responses)
  (if (fifty-fifty)
        (append (qualifier) (change-person user-response))
        (if (equal? (car past-responses) 'thisIsAStringThatIsRemoved)
            (hedge)
            (if (fifty-fifty)
                (hedge)
                (if (fifty-fifty)
                    (hedge)
                    (append '(earlier you said) (change-person (pick-random past-responses))))))))

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

(define (change-person phrase)
  (if (null? phrase)
      phrase
      (cons (single-word-replace (car phrase) 
                                 '((i you) (me you) (am are) (my your))
                                 '((are am) (you i) (your my)))
            (change-person (cdr phrase)))))

(define (single-word-replace word firstPerson secondPerson)
  (if (isEqualToOneOf word firstPerson)
      (multi-replace word firstPerson)
      (multi-replace word secondPerson)))

(define (multi-replace word lst)
  (if (null? lst)
      word
      (if (equal? word (car (car lst)))
          (car (cdr (car lst)))
          (multi-replace word (cdr lst)))))
 
(define (pick-random lst) (list-ref lst (random (length lst))))

(define (isEqualToOneOf single lst)
  (if (null? lst)
      #f
      (if (equal? single (car (car lst)))
          #t
          (isEqualToOneOf single (cdr lst))
      )
   )
)

;(change-person '(you are not being very helpful to me))
(visit-doctor 'Sam)