data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

data Mat a = Mat {
  nexp :: Int,
  mat  :: QT a
} deriving (Eq, Show)

foldMat :: (Num a) => (Int -> b -> b -> b -> b -> b) -> (Int -> a -> b) -> Mat a -> b
foldMat f g (Mat n q) = aux f g n q
  where
    aux _ g n (C x)           = g n x
    aux f _ n (Q q1 q2 q3 q4) = f n 
      (aux f g (n-1) q1)
      (aux f g (n-1) q2)
      (aux f g (n-1) q3)
      (aux f g (n-1) q4)
