data RBT a = Void | Node a Color (RBT a) (RBT a)
  deriving (Eq , Ord , Read , Show)

data Color = Red | Black
  deriving (Eq , Ord , Read , Show)

fold :: ( Ord a ) => ( a -> Color -> b -> b -> b ) -> b -> RBT a -> b
fold _ z Void = z
fold f z ( Node x c l r ) = f x c ( fold f z l ) ( fold f z r )

data NodeData a = NodeData {
  valid       :: Bool,
  mi, ma      :: Maybe a,
  color       :: Color,
  nblacks     :: Integer
} deriving (Eq, Ord, Read, Show)

isRBT :: Ord a => RBT a -> Bool
isRBT Void             = True
-- isRBT (Node _ Red _ _) = False
isRBT t                = 
  let
    (NodeData valid _ _ c _) = fold aux (NodeData True Nothing Nothing Black 0) t
  in valid && c == Black
    where
      aux x c (NodeData lvalid lmin lmax lc ln) (NodeData rvalid rmin rmax rc rn) =
        let
          validBstLeft = case lmax of
            Just lmax -> lmax <= x
            Nothing -> True
          validBstRight = case rmin of
            Just rmin -> x < rmin
            Nothing -> True
          validBst = validBstLeft && validBstRight

          validRbt = ln == rn &&                         -- le altezze nere sono uguali
            (if lc == Red then c == Black else True) &&  -- i nodi Red hanno genitore Black
            (if rc == Red then c == Black else True)

          valid = lvalid && rvalid && validBst && validRbt

          mi = case lmin of
            Just lmin -> Just lmin
            Nothing   -> Just x
          ma = case rmax of
            Just rmax -> Just rmax
            Nothing   -> Just x

          nblacks = (max ln rn) +        -- se è valido, ln == rn
            if c == Black then 1 else 0
        in (NodeData valid mi ma c nblacks)

t1 = Node 20 Black 
  (Node 10 Black 
    (Node 5 Red Void Void) 
    (Node 15 Red Void Void)
  )
  (Node 30 Black Void Void)

t2 = Node 10 Black
  (Node 5 Black Void Void)
  (Node 20 Black 
    Void 
    (Node 25 Black Void Void)
  )
