sumList :: [Integer] -> Integer
sumList [] = 0
sumList (x:xs) = x + sumList xs

calc :: [Integer] -> [(Integer, Integer)]
calc [] = []
calc (x:xs) = (x, sumList xs) : calc xs
