data BST a = Void | Node a (BST a) (BST a)
  deriving (Eq, Ord, Read, Show)

fold :: ( Ord a ) => ( a -> b -> b -> b ) -> b -> BST a -> b
fold _ z Void = z
fold f z ( Node x l r ) = f x ( fold f z l ) ( fold f z r )

type BSTA a = BST (a, Integer)

annotate :: Ord a => BST a -> BSTA a
annotate t = fold aux Void t
  where
    aux n l r = Node (n, 1 + max lh rh) l r
      where
        lh = case l of
          Node (_, lh) _ _ -> lh
          _                -> -1
        rh = case l of
          Node (_, rh) _ _ -> rh
          _                -> -1
        
t = Node 10
  (Node 5 (Node 2 Void Void) Void)
  (Node 15 (Node 12 Void Void) Void)
