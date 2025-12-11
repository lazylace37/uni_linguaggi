data Tree a = Void | Node a [Tree a]
  deriving (Eq, Show)

treefoldl :: (Eq a, Show a) => (b -> a -> c) -> c -> (c -> b -> b) -> b -> Tree a -> c
treefoldl _ y _ _ Void        = y
treefoldl f y g z (Node x ts) = f (foldl aux z ts) x
  where
    aux acc t = g (treefoldl f y g z t) acc

normalize :: (Integral a, Show a, Fractional b) => Tree a -> Tree b
normalize t = fst(treefoldl aux1 (Void, 0) aux2 ([], 0) t)
  where
    aux2 (t, h) (ts, maxh) = (t:ts, max h maxh)
    aux1 (ts, h) x = (Node nodeval ts, nodeh)
      where
        nodeh = h + 1
        nodeval = fromIntegral x * (1 / fromIntegral nodeh)

t1 = Node 1 [
    Node 1 [Node 1 []],
    Node 1 [],
    Node 1 [Node 1 [], Node 1 []]
  ]

