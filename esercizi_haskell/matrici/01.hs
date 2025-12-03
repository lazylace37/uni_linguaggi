len :: [a] -> Integer
len [] = 0
len (x:xs) = 1 + len xs

matrix_dim :: [[a]] -> (Integer, Integer)
matrix_dim [] = (0, 0)
matrix_dim (x:xs) = foldl matrix_dim_aux (1, len x) xs
  where
    matrix_dim_aux (nrows, ncols) row
      | nrows == -1 && ncols == -1 = (-1, -1)
      | len row /= ncols           = (-1, -1)
      | otherwise                  = (nrows + 1, ncols)
