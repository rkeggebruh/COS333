; Rachel Kegge - U20426586

#lang racket

; ----------------------------------------------
;                TASK 1
; ----------------------------------------------

(display "Task 1")
(newline)

; func called circleArea - takes one param
(define (circleArea radius)

    ; define pi as 22/7 via binding - more accurate that way (spec)
    (let ((pi (/ 22 7)))
    ; if the radius is negative/zero - then result should be 0, otherwise do the equation
        (if (<= radius 0)
            0
            ; else...
            (* pi (* radius radius)))))

; calling the function with a radius of 3.2
; output should be 32.182857142857145
(display (circleArea -1.8))
(newline) ; Just for displaying the result



; ----------------------------------------------
;                    TASK 2
; ----------------------------------------------

(display "Task 2")
(newline)

; func called countDivisors - takes two params (atom and listOfAtoms)
(define (countDivisors atomNum listOfAtoms)
    ; (display "checking: ")
    ; (display listOfAtoms)

    ; find number of divisible atoms from the list
    ; (how many of them from the list are divisable by atomNum)
    (cond ((null? listOfAtoms) 0)
        ; car = first item in list - if first is 0, skip it, go through the rest recursively
        ((= 0 (car listOfAtoms)) (countDivisors atomNum (cdr listOfAtoms)))
        ; checks if first item of list is divisible by num
        ((= 0 (remainder atomNum (car listOfAtoms)))
            ; if so - increment counter
            (+ 1 (countDivisors atomNum (cdr listOfAtoms))))
        ; if nothing else - recursive call func
        (else (countDivisors atomNum (cdr listOfAtoms)))))

; NOTE ; cdr goes to next element

;my own checking - works
; (display (countDivisors 40 '(3 2 4 20 10 60 59)))
; (newline)

; from the spec
(display (countDivisors 3 '(2 3 1 9 5))) ; should output 0
(newline)
(display (countDivisors 10 '(20 50 60))) ; should output 0
(newline)
(display (countDivisors 10 '(1 20 30 2 5 40 10 60))) ; should output 4
(newline)



; ----------------------------------------------
;                    TASK 3
; ----------------------------------------------

(display "Task 3")
(newline)

; func getEveryEvenElement2 - takes 1 param (list of atoms)
; get all even positions
(define (getEveryEvenElement2 list)
    (getEvens list 2))

(define (getEvens list position)
    ; Base case: Empty list, return empty list
    (cond ((null? list) '())
        ; If position is 1, add current element to result
        ; use cons - "construct" new pair
        ((= position 1) (cons (car list)
            ; Move to next even position
            (getEvens (cdr list) 2)))
        ; Move to next position
        (else (getEvens (cdr list) (- position 1)))))
        ; "cdr list" will get the rest of list except first


; own testing
; (display (getEveryEvenElement '(x y z a b))) ; should output (y a)
; (newline)

; testing from spec
(display (getEveryEvenElement2 '())) ; should output ()
(newline)
(display (getEveryEvenElement2 '(a b c))) ; should output ()
(newline)
(display (getEveryEvenElement2 '(a b c d e f))) ; should output (b d)
(newline)