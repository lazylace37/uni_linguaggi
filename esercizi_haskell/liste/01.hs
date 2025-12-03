removeEvenPositions :: [a] -> [a]
removeEvenPositions [] = []
removeEvenPositions [x] = [x]
removeEvenPositions (x : _ : xs) = x : removeEvenPositions xs
