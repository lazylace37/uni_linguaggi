data Tree a = Null | Node { value :: a, left, right :: Tree a }
  deriving (Eq, Ord, Read, Show)

sumTree :: Integral a => Tree a -> a
sumTree Null = 0
sumTree (Node value left right) = s + sumTree left + sumTree right
  where s = if (odd value) then value else 0

t :: Tree Int
t = Node { value = 5,
  left = Node { value = 4, left = Null, right = Null},
  right = Node { value = 1, left = Null, right = Null}
}
