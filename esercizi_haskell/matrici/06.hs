-- take :: Integer -> [a] -> [a]
-- take _ []     = []
-- take 0 xs     = []
-- take n (x:xs) = x : take (n - 1) xs

uppertriangular :: (Ord a, Num a) => [[a]] -> Bool
uppertriangular [] = True
uppertriangular xs = snd (foldl isValidRow (0, True) xs)
  where
    isValidRow (i, b) ys = (i + 1, b && allZeros els)
      where
        els = take i ys
        allZeros []     = True
        allZeros (x:xs) = (x == 0) && allZeros xs
