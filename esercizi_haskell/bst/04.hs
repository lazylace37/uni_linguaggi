data Tree a = Null | Node { value :: a, left, right :: Tree a }
  deriving (Eq, Ord, Read, Show)

bstElem :: Eq a => a -> Tree a -> Bool
bstElem _ Null = False
bstElem val (Node value left right) = val == value || bstElem val left || bstElem val right

t1 = Node { value = 5,
  left = Node { value = 4, left = Null, right = Null},
  right = Node { value = 1, left = Null, right = Null}
}
