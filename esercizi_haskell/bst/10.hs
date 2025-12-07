data BST a = Null | Node { value :: a, left, right :: BST a }
  deriving (Eq, Ord, Read, Show)
data BSTA a = NullA | NodeA { valueA :: (a, Integer), leftA, rightA :: BSTA a }
  deriving (Eq, Ord, Read, Show)

almostBalanced :: Ord a => BST a -> Bool
almostBalanced t = fst (almostBalancedAux t)
  where
    almostBalancedAux :: Ord a => BST a -> (Bool, BSTA a)
    almostBalancedAux Null = (True, NullA)
    almostBalancedAux (Node v l r) = (lb && rb && (abs (lh - rh)) < 2, NodeA { valueA = (v, newHeight), leftA = ln, rightA = rn })
      where
        la = almostBalancedAux l
        ra = almostBalancedAux r

        (lb, ln) = la
        (rb, rn) = ra

        lh = case ln of
          NodeA { valueA = (v,lh) } -> lh
          _                         -> -1
        rh = case rn of
          NodeA { valueA = (v,rh) } -> rh
          _                         -> -1

        newHeight = (max lh rh) + 1

t1 = Node { value = 10,
  left = Node {value = 5, left = Node {value = 2, left = Null, right = Null}, right = Null},
  right = Node {value = 15, left = Node {value = 12, left = Null, right = Null}, right = Null}
}

t2 = Node { value = 1,
  left = Node {value = 1,
    left = Node {value = 1, left = Node {value = 1, left = Null, right = Null}, right = Null},
    right = Null
  },
  right = Node {value = 1, left = Node {value = 1, left = Null, right = Null}, right = Null}
}

