data BST a = Null | Node { value :: a, left, right :: BST a }
  deriving (Eq, Ord, Read, Show)

inorder :: Ord a => BST a -> [a]
inorder Null = []
inorder (Node v l r) = inorder l ++ (v : inorder r)

insert :: Ord a => a -> BST a -> BST a
insert n Null = Node {value = n, left = Null, right = Null}
insert n (Node v l r)
  | n <= v    = Node v (insert n l) r -- i duplicati se ci sono li mettiamo a sinistra
  | otherwise = Node v l (insert n r)

bstsort :: Ord a => [a] -> [a]
bstsort xs = inorder (foldl (\b x -> insert x b) Null xs)
