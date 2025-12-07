data Tree a = Null | Node { value :: a, left, right :: Tree a }
  deriving (Eq, Ord, Read, Show)

sumTree :: Num a => Tree a -> a
sumTree Null = 0
sumTree (Node value left right) = value + sumTree left + sumTree right

bigTree :: Tree Int
bigTree = Node { value = 5,
      left = Node { value = 1 , left = Null , right = Null },
      right = Node { value = 2 , left = Null , right = Node { value = 3, left = Null, right = Null } }
}
