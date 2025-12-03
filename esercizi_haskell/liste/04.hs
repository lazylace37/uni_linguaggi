filterOdds :: [Integer] -> [Integer]
filterOdds xs = [x | x <- xs, x `mod` 2 == 1]

minCouple :: [Integer] -> Maybe (Integer, Integer)
minCouple [] = Nothing
minCouple (x:[]) = Nothing
minCouple (x:y:xs) = Just(foldl aux pair xs)
  where
    pair
      | x < y     = (x, y)
      | otherwise = (y, x)
    aux (d1, d2) x
      | x < d2 && x < d1 = (x, d2)
      | x < d2           = (d1, x)
      | otherwise        = (d1, d2)

minOdd :: [Integer] -> Maybe (Integer, Integer)
minOdd xs = (minCouple . filterOdds) xs
