data BST a = Void | Node a (BST a) (BST a)
  deriving (Eq, Ord, Read, Show)

fold :: ( Ord a ) => ( a -> b -> b -> b ) -> b -> BST a -> b
fold _ z Void = z
fold f z ( Node x l r ) = f x ( fold f z l ) ( fold f z r )

treeheight :: Ord a => BST a -> Integer
treeheight t = fold (\x lh rh -> (max lh rh) + 1) 0 t

t = Node 1
  (Node 2 (Node 4 Void Void) (Node 5 Void Void))
  (Node 3 (Node 6 Void Void) (Node 7 Void Void))
