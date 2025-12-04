skip :: Integer -> [a] -> [a]
skip _ []     = []
skip 0 xs     = xs
skip n (x:xs) = skip (n - 1) xs

lowertriangular :: (Ord a, Num a) => [[a]] -> Bool
lowertriangular [] = True
lowertriangular xs = snd (foldl isValidRow (1, True) xs)
  where
    isValidRow (i, b) ys = (i + 1, b && allZeros els)
      where
        els = skip i ys
        allZeros []     = True
        allZeros (x:xs) = (x == 0) && allZeros xs
