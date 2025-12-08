data BST a = Void | Node a (BST a) (BST a)
  deriving (Eq, Ord, Read, Show)

fold :: ( Ord a ) => ( a -> b -> b -> b ) -> b -> BST a -> b
fold _ z Void = z
fold f z ( Node x l r ) = f x ( fold f z l ) ( fold f z r )

isBST :: Ord a => BST a -> Bool
isBST Void = True
isBST t    =
  let
    (ok, _, _) = (fold aux (True, Nothing, Nothing) t)
  in ok
    where
      -- aux _ (False, _, _) _ = (False, Nothing, Nothing)
      -- aux _ _ (False, _, _) = (False, Nothing, Nothing)
      aux x (lb, lmin, lmax) (rb, rmin, rmax) =
        let
          lbok = case lmax of
            Just lmax -> lmax < x
            Nothing   -> True
          rbok = case rmin of
            Just rmin -> x < rmin
            Nothing   -> True
          b = lb && rb && lbok && rbok

          mi = case lmin of
            Just lmin -> Just lmin
            Nothing   -> Just x

          ma = case rmax of
            Just rmax -> Just rmax
            Nothing   -> Just x
        in (b, mi, ma)

t2 = Node 10
  (Node 5 Void Void)
  (Node 100 
    (Node 90 (Node 80 (Node 70 (Node 60 Void Void) Void) Void) Void)
    (Node 10 Void (Node 120 Void (Node 130 Void (Node 140 Void Void))))
  )

t3 = Node 10
  (Node 5 Void Void)
  (Node 100 
    (Node 90 (Node 80 (Node 70 (Node 60 Void Void) Void) Void) Void)
    (Node 110 Void (Node 120 Void (Node 130 Void (Node 140 Void Void))))
  )
