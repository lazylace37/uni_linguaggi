data Tree a = Void | Node a [Tree a]
  deriving (Eq, Show)

treefoldl :: (Eq a, Show a) => (b -> a -> c) -> c -> (c -> b -> b) -> b -> Tree a -> c
treefoldl _ y _ _ Void        = y
treefoldl f y g z (Node x ts) = f (foldl aux z ts) x
  where
    aux acc t = g (treefoldl f y g z t) acc

annotate :: (Eq a, Show a) => Tree a -> Tree (a, Integer)
annotate t = treefoldl (\(h, ts) x -> (Node (x, h) ts)) Void auxNode (0, []) t
  where
    auxNode t (h, ts) = (max (h + 1) m, t:ts)
      where (Node (_, m) _) = t

t1 = Node 5 [
    Node 1 [Node 3 []],
    Node 2 [],
    Node 8 [Node 9 [], Node 10 []]
  ]
