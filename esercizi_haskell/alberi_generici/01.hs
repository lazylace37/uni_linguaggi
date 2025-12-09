data Tree a = Void | Node a [Tree a]
  deriving (Eq, Show)

treefold :: (Eq a, Show a) => (a -> [b] -> b) -> b -> Tree a -> b
treefold _ z Void        = z
treefold f z (Node x ts) = f x [treefold f z t | t <- ts]
