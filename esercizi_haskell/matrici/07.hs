skip :: Integer -> [a] -> [a]
skip _ []     = []
skip 0 xs     = xs
skip n (x:xs) = skip (n - 1) xs

diagonal :: (Ord a, Num a) => [[a]] -> Bool
diagonal [] = True
diagonal xs = snd (foldl diagonalAux (1, True) xs)
  where
    diagonalAux (i, b) ys = (i + 1, b && allZeros els)
      where
        els             = skip i ys
        allZeros []     = True
        allZeros (x:xs) = (x == 0) && allZeros xs
