data BST a = Void | Node a (BST a) (BST a)
  deriving (Eq, Ord, Read, Show)

fold :: ( Ord a ) => ( a -> b -> b -> b ) -> b -> BST a -> b
fold _ z Void = z
fold f z ( Node x l r ) = f x ( fold f z l ) ( fold f z r )

filtertree :: Ord a => (a -> Bool) -> BST a -> [a]
filtertree f t = (fold aux (\x -> x) t) []
  where
    aux x l r = if f x then l . (x :) . r else l . r

t = Node 10
  (Node 5 (Node 2 Void Void) Void)
  (Node 15 (Node 12 Void Void) Void)

