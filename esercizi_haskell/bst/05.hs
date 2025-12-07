data BST a = Null | Node { value :: a, left, right :: BST a }
  deriving (Eq, Ord, Read, Show)

insert :: Ord a => a -> BST a -> BST a
insert n Null = Node {value = n, left = Null, right = Null}
insert n (Node v l r)
  | n <= v    = Node v (insert n l) r -- i duplicati se ci sono li mettiamo a sinistra
  | otherwise = Node v l (insert n r)

t1 = Node { value = 7,
  left = Node { value = 4, left = Null, right = Null},
  right = Node { value = 10, left = Null, right = Null}
}
