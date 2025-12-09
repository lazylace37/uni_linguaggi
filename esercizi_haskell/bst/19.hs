data BST a = Void | Node a (BST a) (BST a)
  deriving (Eq, Ord, Read, Show)

data Bal = BLeft | Bal | BRight deriving (Eq, Ord, Read, Show)

fold :: ( Ord a ) => ( a -> b -> b -> b ) -> b -> BST a -> b
fold _ z Void = z
fold f z ( Node x l r ) = f x ( fold f z l ) ( fold f z r )

isAVL :: Ord a => BST a -> Bool
isAVL Void = True
isAVL t    = fst(fold aux (Bal, 0) t) == Bal
  where
    aux _ (lb, lh) (rb, rh) =
      let
        b
          | lb == Bal && rb == Bal && abs(lh - rh) <= 1 = Bal
          | lh < rh                                     = BRight
          | otherwise                                   = BLeft
        h = 1 + max lh rh
      in (b, h)

t1 = Node 10
  (Node 5 (Node 2 Void Void) Void)
  (Node 15 (Node 12 Void Void) Void)

t2 = Node 10
  (Node 5 Void Void)
  (Node 100 
    (Node 90 (Node 80 (Node 70 (Node 60 Void Void) Void) Void) Void)
    (Node 10 Void (Node 120 Void (Node 130 Void (Node 140 Void Void))))
  )
