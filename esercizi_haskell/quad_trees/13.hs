data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

fold :: (Eq a, Show a) => (b -> b -> b -> b -> b) -> (a -> b) -> QT a -> b
fold _ g (C a)           = g a
fold f g (Q q1 q2 q3 q4) = f (fold f g q1) (fold f g q2) (fold f g q3) (fold f g q4)

mapQT :: (Eq a, Show a, Eq b, Show b) => (a -> b) -> QT a -> QT b
mapQT f q = fold (Q) (\x -> (C (f x))) q

t = Q v v w w
  where
    u = C 1
    v = Q u u u u
    w = Q (C 2) (C 2) (C 2) (C 2)
