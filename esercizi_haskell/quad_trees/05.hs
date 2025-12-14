data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

limitQT :: (Eq a, Ord a) => a -> QT a -> QT a
limitQT color (C x) = C (min color x)
limitQT color (Q q1 q2 q3 q4) = Q (limitQT color q1) (limitQT color q2) (limitQT color q3) (limitQT color q4)

limitAll :: (Eq a, Ord a) => a -> [QT a] -> [QT a]
limitAll color qs = map (limitQT color) qs

q1 = Q (C 2) (C 8) (C 15) (Q (C 1) (C 5) (C 9) (C 11))
