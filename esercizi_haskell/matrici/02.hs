sumList :: Num a => [a] -> a
sumList [] = 0
sumList (x:xs) = x + sumList xs

emptyList :: [a] -> Bool
emptyList [] = True
emptyList _  = False

allTrue :: [Bool] -> Bool
allTrue [] = True
allTrue (x:xs) = x && allTrue xs

colsums :: Num a => [[a]] -> [a]
colsums xs
  | emptyList xs               = [] -- input è []
  | allTrue (map emptyList xs) = [] -- caso base: ho letto tutte le colonne
  | otherwise                  = (sumList [y | (y:_) <- xs]) : colsums [ys | (_:ys) <- xs]
