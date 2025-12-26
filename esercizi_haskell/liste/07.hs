shiftToZero :: (Num a, Ord a) => [a] -> [a]
shiftToZero [] = []
shiftToZero xs = ls
  where
    (ls, m) = aux xs m

    aux [x] m     = ([x - m], x)
    aux (x: xs) m = ((x - m) : rs, min x rm)
      where
        (rs, rm) = aux xs m
