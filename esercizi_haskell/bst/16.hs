data BST a = Void | Node a (BST a) (BST a)
  deriving (Eq, Ord, Read, Show)

fold :: ( Ord a ) => ( a -> b -> b -> b ) -> b -> BST a -> b
fold _ z Void = z
fold f z ( Node x l r ) = f x ( fold f z l ) ( fold f z r )

almostBalanced :: Ord a => BST a -> Bool
almostBalanced t = fst (fold aux (True, 0) t)
  where
    aux n (lb, lh) (rb, rh) =
      let
        b = lb && rb && (abs (lh - rh)) < 2
        h = 1 + max lh rh
      in (b, h)

t1 = Node 10
  (Node 5 (Node 2 Void Void) Void)
  (Node 15 (Node 12 Void Void) Void)

t2 = Node 1
  (Node 1 (Node 1 (Node 1 Void Void) Void) Void)
  (Node 1 (Node 1 Void Void) Void)
