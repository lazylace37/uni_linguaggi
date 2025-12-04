convergent :: (Ord a, Num a) => a -> [[a]] -> Bool
convergent _ [] = True
convergent r m = snd (foldl aux (1, True) m)
  where
    aux (i, b) row = (i + 1, b && abs (rowSumNoEl i row) < r)
    rowSumNoEl i row = snd (foldl (\(j, s) x -> if i == j then (j + 1, s) else (j + 1, s + x)) (i, 0) row)
