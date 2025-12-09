data Tree a = Void | Node a [Tree a]
  deriving (Eq, Show)

treefoldl :: (Eq a, Show a) => (b -> a -> c) -> c -> (c -> b -> b) -> b -> Tree a -> c
treefoldl _ y _ _ Void        = y
treefoldl f y g z (Node x ts) = f (foldl aux z ts) x
  where
    aux acc t = g (treefoldl f y g z t) acc

treefoldr :: (Eq a, Show a) => (a -> b -> c) -> c -> (c -> b -> b) -> b -> Tree a -> c
treefoldr _ y _ _ Void        = y
treefoldr f y g z (Node x ts) = f x (foldr aux z ts)
  where
    aux t acc = g (treefoldr f y g z t) acc
