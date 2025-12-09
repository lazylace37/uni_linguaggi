data Tree a = Void | Node a [Tree a]
  deriving (Eq, Show)

treefold :: (Eq a, Show a) => (a -> [b] -> b) -> b -> Tree a -> b
treefold _ z Void        = z
treefold f z (Node x ts) = f x [treefold f z t | t <- ts]

maxL :: (Ord a) => [a] -> a
maxL (x:xs) = foldl (\m x -> max m x) x xs

height :: (Eq a, Show a) => Tree a -> Integer
height Void = -1
height t    = treefold aux (-1) t
  where
    aux :: a -> [Integer] -> Integer
    aux _ [] = 0
    aux _ hs = 1 + maxL hs

t1 = Node 5 [
    Node 1 [Node 3 []],
    Node 2 [],
    Node 8 [Node 9 []]
  ]

t2 = Node 10 [
    Node 11 [],
    Node 12 [Node 13 [Node 14 []]]
  ]
