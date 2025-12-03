sumOddPositions :: Num a => [a] -> a
sumOddPositions [] = 0
sumOddPositions [x] = x
sumOddPositions (x : _ : xs) = x + sumOddPositions xs

-- alternativa
sumOddPositions2 :: Num a => [a] -> a
sumOddPositions2 xs = snd (foldl aux (1, 0) xs)
  where aux (idx, sum) x | idx `mod` 2 == 1 = (idx + 1, sum + x)
                         | otherwise        = (idx + 1, sum)
