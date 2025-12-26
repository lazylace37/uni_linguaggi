data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

data Mat a = Mat {
  nexp :: Int,
  mat  :: QT a
} deriving (Eq, Show)

colSums :: (Num a, Show a) => Mat a -> [a]
colSums (Mat n (C x)) = [2^n * x | _ <- [1..2^n]]
colSums (Mat n (Q q1 q2 q3 q4)) =
  sumLists (colSums (Mat (n-1) q1)) (colSums (Mat (n-1) q3)) ++
  sumLists (colSums (Mat (n-1) q2)) (colSums (Mat (n-1) q4))
    where
      sumLists [] []         = []
      sumLists (x:xs) (y:ys) = (x + y) : sumLists xs ys
