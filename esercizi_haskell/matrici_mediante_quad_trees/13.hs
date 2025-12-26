data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

data Mat a = Mat {
  nexp :: Int,
  mat  :: QT a
} deriving (Eq, Show)

fold :: (Eq a, Show a) => (b -> b -> b -> b -> b) -> (a -> b) -> QT a -> b
fold _ g (C a)           = g a
fold f g (Q q1 q2 q3 q4) = f (fold f g q1) (fold f g q2) (fold f g q3) (fold f g q4)

transpose :: (Eq a, Show a) => Mat a -> Mat a
transpose m = Mat (nexp m) (transposeQT (mat m))
  where
    transposeQT q = fold (\q1 q2 q3 q4 -> Q q1 q3 q2 q4) (\x -> C x) q

tl = Q (C 1)  (C 2)  (C 5)  (C 6)
tr = Q (C 3)  (C 4)  (C 7)  (C 8)
bl = Q (C 9)  (C 10) (C 13) (C 14)
br = Q (C 11) (C 12) (C 15) (C 16)
m = Mat 2 (Q tl tr bl br)
