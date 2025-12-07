-- data NodeValue a = SingleValue a | PairValue a Integer
--   deriving (Eq, Ord, Read, Show)
--
-- data BST a = Null | Node { value :: NodeValue a, left, right :: BST a }
--   deriving (Eq, Ord, Read, Show)
--
-- annotate :: Ord a => BST a -> BST a
-- annotate Null = Null
-- annotate (Node (SingleValue v) l r) = Node { value = PairValue v ((max lh rh) + 1), left = annotate l, right = annotate r }
--   where
--     lh = case annotate l of
--       Node { value = PairValue _ lh } -> lh
--       _                               -> -1
--     rh = case annotate r of
--       Node { value = PairValue _ rh } -> rh
--       _                               -> -1
--
-- t = Node { value = SingleValue 10,
--   left = Node {value = SingleValue 5, left = Node {value = SingleValue 2, left = Null, right = Null}, right = Null},
--   right = Node {value = SingleValue 15, left = Node {value = SingleValue 12, left = Null, right = Null}, right = Null}
-- }

-- Variante con un nuovo tipo di albero
data BST a = Null | Node { value :: a, left, right :: BST a }
  deriving (Eq, Ord, Read, Show)
data BSTA a = NullA | NodeA { valueA :: (a, Integer), leftA, rightA :: BSTA a }
  deriving (Eq, Ord, Read, Show)

annotate :: Ord a => BST a -> BSTA a
annotate Null = NullA
annotate (Node v l r) = NodeA { valueA = (v, newHeight), leftA = ln, rightA = rn }
  where
    ln = annotate l
    rn = annotate r

    lh = case ln of
      NodeA { valueA = (_,lh) } -> lh
      _                         -> -1
    rh = case rn of
      NodeA { valueA = (_,rh) } -> rh
      _                         -> -1

    newHeight = (max lh rh) + 1

t = Node { value = 10,
  left = Node {value = 5, left = Node {value = 2, left = Null, right = Null}, right = Null},
  right = Node {value = 15, left = Node {value = 12, left = Null, right = Null}, right = Null}
}
