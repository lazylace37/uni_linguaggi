data Tree a = Void | Node a [Tree a]
  deriving (Eq, Show)

treefoldr :: (Eq a, Show a) => (a -> b -> c) -> c -> (c -> b -> b) -> b -> Tree a -> c
treefoldr _ y _ _ Void        = y
treefoldr f y g z (Node x ts) = f x (foldr aux z ts)
  where
    aux t acc = g (treefoldr f y g z t) acc

frontier :: (Eq a, Show a) => Tree a -> [a]
frontier t = (treefoldr f id g Nothing t) []
  where
    g xs Nothing   = Just xs
    g xs (Just ys) = Just (xs . ys)

    f x Nothing    = (x:)
    f x (Just xs)  = xs

t1 = Node 5 [
    Node 1 [Node 3 []],
    Node 2 [],
    Node 8 [Node 9 [], Node 10 []]
  ]

