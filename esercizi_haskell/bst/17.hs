data BST a = Void | Node a (BST a) (BST a)
  deriving (Eq, Ord, Read, Show)

fold :: ( Ord a ) => ( a -> b -> b -> b ) -> b -> BST a -> b
fold _ z Void = z
fold f z ( Node x l r ) = f x ( fold f z l ) ( fold f z r )

diameter :: (Ord a) => BST a -> Integer
diameter t = snd (fold aux (0, 0) t)
  where
    aux :: a -> (Integer, Integer) -> (Integer, Integer) -> (Integer, Integer)
    aux _ (lh, ld) (rh, rd) = (h, d)
      where
        h = 1 + max lh rh
        d = max (max (lh + rh) ld) rd

maxDiameter :: (Ord a) => [BST a] -> Integer
maxDiameter [] = -1
maxDiameter (t:ts) = foldl (\md d -> max md d) (diameter t) (map diameter ts)

t1 = Node 10
  (Node 5 (Node 2 Void Void) Void)
  (Node 15 (Node 12 Void (Node 13 Void Void)) Void)

t2 = Node 10
  (Node 5 (Node 2 Void Void) Void)
  (Node 15 (Node 12 Void (Node 13 (Node 14 Void Void) Void)) Void)

t3 = Node 10
  (Node 5 Void Void)
  (Node 100 
    (Node 90 (Node 80 (Node 70 (Node 60 Void Void) Void) Void) Void)
    (Node 110 Void (Node 120 Void (Node 130 Void (Node 140 Void Void))))
  )
