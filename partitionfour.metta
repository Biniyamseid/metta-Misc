;; Declaration of List data type and constructors
(: List (-> $a Type))
(: Nil (List $a))
(: Cons (-> $a (List $a) (List $a)))

;; Select function
(: select (-> (List $a) (List ( (List $a) (List $a)))))
(= (select Nil) Nil)
(= (select (Cons $x $xs))
   (Cons ( (Cons $x Nil) $xs)
         (map (lambda ( $ys $zs) ( (Cons $x $ys) $zs))
              (select $xs))))

;; Partitions function
(: partitions (-> (List $a) (List (List (List $a)))))
(= (partitions Nil) (Cons Nil Nil))
(= (partitions $lst)
   (flatten (map (lambda ( $xs $rest)
                   (map (lambda $p (Cons $xs $p))
                        (partitions $rest)))
                 (select $lst))))


;; Helper function to flatten a list of lists
(: flatten (-> (List (List $a)) (List $a)))
(= (flatten Nil) Nil)
(= (flatten (Cons $x $xs)) (append $x (flatten $xs)))



;; Helper function to append two lists
(: append (-> (List $a) (List $a) (List $a)))
(= (append Nil $ys) $ys)
(= (append (Cons $x $xs) $ys) (Cons $x (append $xs $ys)))


;; Example usage
!(println! (partitions (Cons 1 (Cons 2 (Cons 3 Nil)))))
