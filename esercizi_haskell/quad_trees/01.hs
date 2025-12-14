data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

buildNSimplify :: (Eq a, Show a) => QT a -> QT a -> QT a -> QT a -> QT a
buildNSimplify q1 q2 q3 q4 = case (q1, q2, q3, q4) of
  (C f1, C f2, C f3, C f4)
    | f1 == f2 && f2 == f3 && f3 == f4 -> C f1
    | otherwise                        -> Q q1 q2 q3 q4
  _                                    -> Q q1 q2 q3 q4
