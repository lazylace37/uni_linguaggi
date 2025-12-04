emptyList :: [a] -> Bool
emptyList [] = True
emptyList _  = False

allTrue :: [Bool] -> Bool
allTrue [] = True
allTrue (x:xs) = x && allTrue xs

colaltsums :: Num a => [[a]] -> [a]
colaltsums xs
  | emptyList xs               = []
  | allTrue (map emptyList xs) = [] -- caso base: ho letto tutte le colonne
  | otherwise                  = altsums head : colaltsums tail
    where
      head = [y  | (y:_)  <- xs]
      tail = [ys | (_:ys) <- xs]
      altsums (x:xs) = fst (foldl (\(s, m) x -> (s + m * x, -1 * m)) (x, -1) xs)
