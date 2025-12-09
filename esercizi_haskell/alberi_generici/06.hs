data Tree a = Void | Node a [Tree a]
  deriving (Eq, Show)

treefoldr :: (Eq a, Show a) => (a -> b -> c) -> c -> (c -> b -> b) -> b -> Tree a -> c
treefoldr _ y _ _ Void        = y
treefoldr f y g z (Node x ts) = f x (foldr aux z ts)
  where
    aux t acc = g (treefoldr f y g z t) acc

simplify :: (Eq a, Show a) => Tree a -> Tree a
simplify t = treefoldr (\x ts -> (Node x ts)) Void (\t ts -> if t == Void then ts else (t:ts)) [] t

t1 = Node 10 [
    Node 11 [Void, Void], Void,
    Node 12 [Node 13 [Node 14 [Void]], Void]
  ]
