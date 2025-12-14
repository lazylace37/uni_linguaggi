data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

simplify :: (Eq a, Show a) => QT a -> QT a
simplify (C x) = C x
simplify (Q q1 q2 q3 q4) = let
    t1 = simplify q1
    t2 = simplify q2
    t3 = simplify q3
    t4 = simplify q4
  in case (t1, t2, t3, t4) of
    (C c1, C c2, C c3, C c4)
      | c1 == c2 && c2 == c3 && c3 == c4 -> C c1
      | otherwise                        -> Q t1 t2 t3 t4
    _                                    -> Q t1 t2 t3 t4

t = Q v v w w
  where
    u = C 1
    v = Q u u u u
    w = Q (C 2) (C 2) (C 2) (C 2)
