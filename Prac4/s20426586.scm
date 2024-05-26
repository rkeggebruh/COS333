; Rachel Kegge - U20426586

#lang racket

; -----------------------------------------------------------------------------------------
;                                       TASK 1 : Scheme
; -----------------------------------------------------------------------------------------

(display "Task 1")
(newline)

; func called stripNegativesDuplicateEvens - takes one param - simple lis
(define (stripNegativesDuplicateEvens lis)
  ; base case - empty list - return ()
  (cond ((null? lis) '())
        ; skip -ve no.s
        ((< (car lis) 0) (stripNegativesDuplicateEvens (cdr lis)))
        ; if even - duplicate
        ((even? (car lis))
         ; dupe
         (cons (car lis) (cons (car lis) (stripNegativesDuplicateEvens (cdr lis)))))
        ; if odd - DONT dupe - just leave in list
        (else (cons (car lis) (stripNegativesDuplicateEvens (cdr lis))))))




; tests from le spec
(display (stripNegativesDuplicateEvens '()))
(display (stripNegativesDuplicateEvens '(-6 -1)))
(display (stripNegativesDuplicateEvens '(6 8)))
(display (stripNegativesDuplicateEvens '(4 -1 8))) ; should get()



