data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

data Mat a = Mat {
  nexp :: Int,
  mat  :: QT a
} deriving (Eq, Show)

iszero :: (Num a, Eq a, Show a) => QT a -> Bool
iszero (C x) = x == 0
iszero (Q q1 q2 q3 q4) = iszero q1 && iszero q2 && iszero q3 && iszero q4

matSum :: (Num a, Show a) => Mat a -> Mat a -> Mat a
matSum (Mat n q1) (Mat _ q2) = (Mat n (qtSum q1 q2))
  where
    qtSum :: (Num a, Show a) => QT a -> QT a -> QT a
    qtSum (C x) (C y) = C (x + y)
    qtSum (Q q1 q2 q3 q4) (C x) = Q (qtSum q1 (C x)) (qtSum q2 (C x)) (qtSum q3 (C x)) (qtSum q4 (C x))
    qtSum (C x) (Q q1 q2 q3 q4) = Q (qtSum q1 (C x)) (qtSum q2 (C x)) (qtSum q3 (C x)) (qtSum q4 (C x))
    qtSum (Q q1 q2 q3 q4) (Q t1 t2 t3 t4) = Q (qtSum q1 t1) (qtSum q2 t2) (qtSum q3 t3) (qtSum q4 t4) 

m1 = Mat 1 (Q (C 1) (C 2) (C 3) (C 4))
m2 = Mat 1 (C 10)
