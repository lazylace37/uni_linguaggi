data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

calcdepth :: QT a -> Integer
calcdepth (C _) = 0
calcdepth (Q q1 q2 q3 q4) =
  1 + max (calcdepth q1) (max (calcdepth q2) (max (calcdepth q3) (calcdepth q4)))

occurrencies :: (Eq a, Show a) => QT a -> a -> Integer
occurrencies q color = aux q color (calcdepth q)
  where
    aux (C x) color depth
      | color == x = 4 ^ depth
      | otherwise  = 0

    aux (Q q1 q2 q3 q4) color depth =
      aux q1 color (depth - 1) +
      aux q2 color (depth - 1) +
      aux q3 color (depth - 1) +
      aux q4 color (depth - 1)
