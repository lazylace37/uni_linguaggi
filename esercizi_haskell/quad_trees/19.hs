data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

fold :: (Eq a, Show a) => (b -> b -> b -> b -> b) -> (a -> b) -> QT a -> b
fold _ g (C a)           = g a
fold f g (Q q1 q2 q3 q4) = f (fold f g q1) (fold f g q2) (fold f g q3) (fold f g q4)

howManyPixels :: (Eq a, Show a) => QT a -> Integer
howManyPixels q = fold aux (\_ -> 1) q
  where
    aux n1 n2 n3 n4 = 4 * max n1 (max n2 (max n3 n4))
