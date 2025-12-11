data Tree a = Void | Node a [Tree a]
  deriving (Eq, Show)

treefoldr :: (Eq a, Show a) => (a -> b -> c) -> c -> (c -> b -> b) -> b -> Tree a -> c
treefoldr _ y _ _ Void        = y
treefoldr f y g z (Node x ts) = f x (foldr aux z ts)
  where
    aux t acc = g (treefoldr f y g z t) acc

degree :: (Eq a, Show a) => Tree a -> Integer
degree t = treefoldr auxNode 0 auxChildren (0, 0) t
  where
    auxChildren deg (ccnt, cmax) = (ccnt + 1, max deg cmax)
    auxNode _ (ccnt, cmax) = max ccnt cmax

t1 = Node 5 [
    Node 1 [Node 3 []],
    Node 2 [],
    Node 8 [Node 9 []]
  ]
