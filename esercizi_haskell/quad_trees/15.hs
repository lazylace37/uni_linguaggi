data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

fold :: (Eq a, Show a) => (b -> b -> b -> b -> b) -> (a -> b) -> QT a -> b
fold _ g (C a)           = g a
fold f g (Q q1 q2 q3 q4) = f (fold f g q1) (fold f g q2) (fold f g q3) (fold f g q4)

rotate90Right :: (Eq a, Show a) => QT a -> QT a
rotate90Right (C a) = (C a)
rotate90Right (Q q1 q2 q3 q4) = Q (rotate90Right q3) (rotate90Right q1) (rotate90Right q4) (rotate90Right q2)

rotate90Left :: (Eq a, Show a) => QT a -> QT a
rotate90Left (C a) = (C a)
rotate90Left (Q q1 q2 q3 q4) = Q (rotate90Left q2) (rotate90Left q4) (rotate90Left q1) (rotate90Left q3)

rotate180 :: (Eq a, Show a) => QT a -> QT a
rotate180 (C a) = (C a)
rotate180 (Q q1 q2 q3 q4) = Q (rotate180 q4) (rotate180 q3) (rotate180 q2) (rotate180 q1)

t = Q v v w w
  where
    u = C 1
    v = Q u u u u
    w = Q (C 2) (C 2) (C 2) (C 2)
