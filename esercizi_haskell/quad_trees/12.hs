data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

fold :: (Eq a, Show a) => (b -> b -> b -> b -> b) -> (a -> b) -> QT a -> b
fold _ g (C a)           = g a
fold f g (Q q1 q2 q3 q4) = f (fold f g q1) (fold f g q2) (fold f g q3) (fold f g q4)

simplify :: (Eq a, Show a) => QT a -> QT a
simplify q = fold aux (\x -> (C x)) q
  where
    aux q1 q2 q3 q4 = case (q1, q2, q3, q4) of
      (C c1, C c2, C c3, C c4)
        | c1 == c2 && c2 == c3 && c3 == c4 -> C c1
        | otherwise                        -> Q q1 q2 q3 q4
      _                                    -> Q q1 q2 q3 q4

t = Q v v w w
  where
    u = C 1
    v = Q u u u u
    w = Q (C 2) (C 2) (C 2) (C 2)
