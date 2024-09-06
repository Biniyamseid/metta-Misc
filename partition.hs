partitions :: [a] -> [[[a]]]
partitions [] = [[]]
partitions lst = [xs : p | (xs, rest) <- select lst, p <- partitions rest]
  where
    select []     = []
    select (x:xs) = ([x], xs) : [(x:ys, zs) | (ys, zs) <- select xs]

-- Example usage
main :: IO ()
main = print $ partitions [1, 2, 3]


(=(select Nil) Nil)
(= (select (Cons $x $xs))
    (Cons (Cons [x] xs))

))

(:partitions(-> (List $a) (List $a)) )
(= (partitions Nil) (Cons Nil Nil))
(= (partitions (Cons )))

(: insert (-> $a (List $a) (List $a)))
(= (insert $x Nil) (Cons $x Nil))
(= (insert $x (Cons $head $tail))
   (if (< $x $head)
       (Cons $x (Cons $head $tail))
       (Cons $head (insert $x $tail))))
