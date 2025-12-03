sumList :: [Integer] -> Integer
sumList [] = 0
sumList (x:xs) = x + sumList xs

calc :: [Integer] -> [(Integer, Integer)]
calc [] = []
calc (x:xs) = (x, sumList xs) : calc xs

-- oppure con fold
calc1 [] = []
calc1 xs = fst (foldr step ([], 0) xs)
  where
    step x (ys, s) = ((x, s) : ys, s + x)
