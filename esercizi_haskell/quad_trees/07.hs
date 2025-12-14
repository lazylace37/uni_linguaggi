data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

calcdepth :: QT a -> Integer
calcdepth (C _) = 0
calcdepth (Q q1 q2 q3 q4) =
  1 + max (calcdepth q1) (max (calcdepth q2) (max (calcdepth q3) (calcdepth q4)))

difference :: (Eq a, Ord a) => a -> QT a -> Integer
difference color q = aux color q (calcdepth q)
  where
    aux color (C x) depth
      | color == x = 0
      | color >  x = -(4 ^ depth)
      | otherwise  = 4 ^ depth

    aux color (Q q1 q2 q3 q4) depth =
      aux color q1 (depth - 1) +
      aux color q2 (depth - 1) +
      aux color q3 (depth - 1) +
      aux color q4 (depth - 1)
