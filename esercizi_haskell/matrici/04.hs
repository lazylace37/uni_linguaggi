emptyList :: [a] -> Bool
emptyList [] = True
emptyList _  = False

allTrue :: [Bool] -> Bool
allTrue [] = True
allTrue (x:xs) = x && allTrue xs

colMinMax :: Ord a => [[a]] -> [(a, a)]
colMinMax [] = []
colMinMax xs
  | allTrue (map emptyList xs) = []
  | otherwise                  = lstMinMax head : colMinMax tail
    where
      head = [y  | (y:_)  <- xs]
      tail = [ys | (_:ys) <- xs]
      lstMinMax (x:y:xys) = foldl calcMinMax pair xys
        where
          pair
            | x < y     = (x, y)
            | otherwise = (y, x)
          calcMinMax (a, b) x
            | x < a     = (x, b)
            | x > b     = (a, x)
            | otherwise = (a, b)
