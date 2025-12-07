prodScal :: Num a => [a] -> [a] -> a
prodScal [] [] = 0
prodScal (x:xs) (y:ys) = x * y + prodScal xs ys

transpose :: [[a]] -> [[a]]
transpose xs = foldr transposeAux [] xs
  where
    transposeAux row []        = map (\x -> [x]) row
    transposeAux (x:xs) (y:ys) = (x:y) : transposeAux xs ys
    transposeAux _ _           = []

matmul :: Num a => [[a]] -> [[a]] -> [[a]]
matmul xs ys = [map (prodScal x) (transpose ys) | x <- xs]
