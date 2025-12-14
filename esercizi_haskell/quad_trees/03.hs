data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

mapQT :: (Eq a, Show a, Eq b, Show b) => (a -> b) -> QT a -> QT b
mapQT f (C a) = C (f a)
mapQT f (Q q1 q2 q3 q4) = Q (mapQT f q1) (mapQT f q2) (mapQT f q3) (mapQT f q4)

t = Q v v w w
  where
    u = C 1
    v = Q u u u u
    w = Q (C 2) (C 2) (C 2) (C 2)
