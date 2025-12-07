data Tree a = Null | Node { value :: a, left, right :: Tree a }
  deriving (Eq, Ord, Read, Show)

sumTree :: Integral a => Tree a -> a
sumTree Null = 0
sumTree (Node value left right) = value + sumTree left + sumTree right

allTrue :: (a -> Bool) -> [a] -> Bool
allTrue _ [] = True
allTrue f (x:xs) = f x && allTrue f xs

samesums :: Integral a => [Tree a] -> Bool
samesums (x:xs) = allTrue (\y -> sumTree y == sumTree x) xs

t1 = Node { value = 5,
  left = Node { value = 4, left = Null, right = Null},
  right = Node { value = 1, left = Null, right = Null}
}

t2 = Node { value = 5,
  left = Node { value = 1, left = Null, right = Null},
  right = Node { value = 4, left = Null, right = Null}
}
