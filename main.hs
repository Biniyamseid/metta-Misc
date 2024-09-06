-- Main.hs

-- Copy-insert function
copyInsert :: a -> [[a]] -> [[[a]]]
copyInsert _ [] = [[[]]]
copyInsert a (x:xs) = map (insertIntoSublist a) (copyInsert a xs) ++ [insertIntoFirstSublist a x : xs]

-- Helper to insert element into each sublist
insertIntoSublist :: a -> [[a]] -> [[a]]
insertIntoSublist a l = map (a :) l

-- Helper to insert element into the first sublist
insertIntoFirstSublist :: a -> [a] -> [a]
insertIntoFirstSublist a list = a : list

-- Partitions function
partitions :: [a] -> [[[a]]]
partitions [] = [[]]
partitions (x:xs) = concatMap (insertPartitions x) (partitions xs)

-- Insert element into each subset of the partition
insertPartitions :: a -> [[a]] -> [[a]]
insertPartitions x [] = [[[x]]]
insertPartitions x (y:ys) = (x : y : ys) : map (y :) (insertPartitions x ys)

-- Main function to test the utility functions
main :: IO ()
main = do
    let a = 4
    let l = [[1], [2, 3]]
    let partitionsList = [1, 2, 3]

    putStrLn "Testing copyInsert function:"
    print (copyInsert a l)

    putStrLn "\nTesting partitions function:"
    print (partitions partitionsList)
