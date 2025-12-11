data Tree a = Void | Node a [Tree a]
  deriving (Eq, Show)

treefoldl :: (Eq a, Show a) => (b -> a -> c) -> c -> (c -> b -> b) -> b -> Tree a -> c
treefoldl _ y _ _ Void        = y
treefoldl f y g z (Node x ts) = f (foldl aux z ts) x
  where
    aux acc t = g (treefoldl f y g z t) acc

transpose :: (Eq a, Show a) => Tree a -> Tree a
transpose t = treefoldl (\ts x -> Node x ts) Void (\t ts -> t:ts) [] t

t1 = Node 5 [
    Node 1 [Node 3 []],
    Node 2 [],
    Node 8 [Node 9 [], Node 10 []]
  ]
