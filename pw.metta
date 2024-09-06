(= (factorial $x)
   (case $x
     ((0 1)
      ($_ (* $x (factorial (- $x 1)))))
   )
)

;; TODO: Implement power for negative exponents.
(: pow (-> $a $a $a))
;(= (pow $x $y)
 ; (if (> $y 0 )
 ; (* $x (pow $x (- $y 1)))
 ; 1
 ; )

 ;)


;!(pow 2 -5);
! (factorial 5) ; 120

(= (greater $x)
 (> $x 0) )

(Sam is Frog)
(Apple is Green)


;;abs accepts a number and returns an absolute value of a number
(: abs(->Number Number))
(= (abs $x)
    (if (>= $x 0)
    $x
    (* $x -1)
    )
)



;; equals-to-zero  accepts a Number and compares it with zero if it is equals to zero it returns a boolean value True else False
(: equals-to-zero (-> Number Boolean))
(= (equals-to-zero $x) (== $x 0))


;; classify_integer_position function accepts a Number and returns a strings that tells if a number is Greater than zero equal to zero or less than zero
(: classify_integer_position (-> Number String))
(= (classify_integer_position $x)
   (if (> $x 0)
     ("Greater than zero")
     (case (equals-to-zero $x)
     (
               (False "Less than zero")
               (True "Equal to zero")))))
;; pow is a function that calculates a to the power of b where a and b are numbers
 (: pow (-> Number Number Number))
 (= (pow $a $b)
   (case (classify_integer_position $b)
     (
    ("Equal to zero" 1)
     ("Less than zero" (/ 1 (pow $a (abs $b))))
      ($_ (* $a (pow $a (- $b 1))))
    )
   )
 )

(= (test $x)
   (case (classify_integer_position $x)
    (
        (True   "The answer is 42!")
        (False "Do not ask me about frogs")
        ($a   ($who is $a))
    )))
! (test -1) ; "Do not ask me about frogs"
! (test Apple) ; (Apple is Green)
! (test Car) ; empty
! (pow 100000 -7)
! (pow 5 3)
!(pow 1 0)
! (+ (abs -5) 10) ; 15
!(classify_integer_position -7)
!(abs -10)


