-- Copy-insert function
copyInsert :: a -> [[a]] -> [[[a]]]
copyInsert _ [] = [[[]]]
copyInsert a (x:xs) = map (insertIntoSublist a) (copyInsert a xs) ++ [insertIntoFirstSublist a x : xs]

-- Helper to insert element into each sublist
insertIntoSublist :: a -> [[a]] -> [[a]]
insertIntoSublist a l = [a] : l

-- Helper to insert element into the first sublist
insertIntoFirstSublist :: a -> [a] -> [a]
insertIntoFirstSublist a list = a : list

-- Main function to test the utility functions
main :: IO ()
main = do
    let a = 4
    let l = [[1], [2, 3]]
    print (copyInsert a l)
