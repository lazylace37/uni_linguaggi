data Tree a = Void | Node a [Tree a]
  deriving (Eq, Show)

treefold :: (Eq a, Show a) => (a -> [b] -> b) -> b -> Tree a -> b
treefold _ z Void        = z
treefold f z (Node x ts) = f x [treefold f z t | t <- ts]

filterVoid :: [Tree a] -> [Tree a]
filterVoid []     = []
filterVoid (t:ts) = case t of
  Void -> filterVoid ts
  _    -> t : filterVoid ts

simplify :: (Eq a, Show a) => Tree a -> Tree a
simplify ts = treefold (\t ts -> (Node t (filterVoid ts))) Void ts

t1 = Node 10 [
    Node 11 [Void, Void], Void,
    Node 12 [Node 13 [Node 14 [Void]], Void]
  ]
