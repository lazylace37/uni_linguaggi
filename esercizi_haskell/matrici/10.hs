areListsEqual :: Ord a => [a] -> [a] -> Bool
areListsEqual [] [] = True
areListsEqual (x:xs) (y:ys) = x == y && areListsEqual xs ys

isSymmetric :: (Ord a, Num a) => [[a]] -> Bool
isSymmetric [] = True
isSymmetric xs = areListsEqual row col && isSymmetric subm
  where
    row = head xs
    col = [y | (y:_) <- xs]
    subm = map (\(_:ys) -> ys) (drop 1 xs)

-- Oppure usando la trasposta
transpose :: [[a]] -> [[a]]
transpose xs = foldr transposeAux [] xs
  where
    transposeAux row []        = map (\x -> [x]) row
    transposeAux (x:xs) (y:ys) = (x:y) : transposeAux xs ys
    transposeAux _ _           = []

isSymmetric2 :: Eq a => [[a]] -> Bool
isSymmetric2 xs = xs == transpose xs
