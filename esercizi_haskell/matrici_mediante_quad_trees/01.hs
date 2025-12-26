data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

data Mat a = Mat {
  nexp :: Int,
  mat  :: QT a
} deriving (Eq, Show)

iszero :: (Num a, Eq a, Show a) => QT a -> Bool
iszero (C x) = x == 0
iszero (Q q1 q2 q3 q4) = iszero q1 && iszero q2 && iszero q3 && iszero q4

lowertriangular :: (Integral a, Show a) => Mat a -> Bool
lowertriangular (Mat 0 _)     = True
lowertriangular (Mat _ (C x)) = x == 0
lowertriangular (Mat n (Q q1 q2 q3 q4)) =
  lowertriangular (Mat (n-1) q1) &&
  iszero          q2             &&
  lowertriangular (Mat (n-1) q3)
