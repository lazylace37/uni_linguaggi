data Tree a = Void | Node a [Tree a]
  deriving (Eq, Show)

treefoldl :: (Eq a, Show a) => (b -> a -> c) -> c -> (c -> b -> b) -> b -> Tree a -> c
treefoldl _ y _ _ Void        = y
treefoldl f y g z (Node x ts) = f (foldl aux z ts) x
  where
    aux acc t = g (treefoldl f y g z t) acc

diameter :: (Eq a, Show a) => Tree a -> Integer
diameter t = snd (treefoldl aux (0, 0) auxNodes (0, 0, 0) t)
  where
    auxNodes (h, d) (accH1, accH2, accD) = (h1, h2, newD)
      where
        h2
          | h > accH2 = h
          | otherwise = accH2
        h1
          | h > accH2 = accH2
          | h > accH1 = h
          | otherwise = accH1
        newD = max d accD
    aux (h1, h2, d) _ = (1 + max h1 h2, newD)
      where newD = max (h1 + h2) d

t1 = Node 'S' [
    Node 'A' [
      Node '0' [],
      Node 'B' [
        Node '1' [],
        Node 'B' []
      ]
    ],
    Node 'B' []
  ]
