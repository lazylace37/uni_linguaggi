gen :: [Int] -> [(Int, Int)]
gen xs = aux xs 0
  where
    aux [] _       = []
    aux (x:xs) acc = (x, acc) : aux xs (acc + x)
