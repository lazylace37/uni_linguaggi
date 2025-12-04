transpose :: [[a]] -> [[a]]
transpose xs = foldr transposeAux [] xs
  where
    transposeAux row []        = map (\x -> [x]) row
    transposeAux (x:xs) (y:ys) = (x:y) : transposeAux xs ys
    transposeAux _ _           = []
