data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

zipWithQT :: (Eq a, Show a, Eq b, Show b, Eq c, Show c) => (a -> b -> c) -> QT a -> QT b -> QT c
zipWithQT f (C x) (C y) = C (f x y)
zipWithQT f (Q q1 q2 q3 q4) (Q t1 t2 t3 t4) =
  Q (zipWithQT f q1 t1) (zipWithQT f q2 t2) (zipWithQT f q3 t3) (zipWithQT f q4 t4)


t1 = Q (Q (C 1) (C 1) (C 2) (C 3)) (C 5) (C 8) (C 13)
t2 = Q (Q (C 1) (C 2) (C 3) (C 5)) (C 8) (C 13) (C 21)
