data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

fold :: (Eq a, Show a) => (b -> b -> b -> b -> b) -> (a -> b) -> QT a -> b
fold _ g (C a)           = g a
fold f g (Q q1 q2 q3 q4) = f (fold f g q1) (fold f g q2) (fold f g q3) (fold f g q4)

height :: (Eq a, Show a) => QT a -> Integer
height q = fold (\h1 h2 h3 h4 -> 1 + max h1 (max h2 (max h3 h4))) (\_ -> 0) q

q1 = Q 
  (C 1)
  (Q (C 2) (C 3) (C 4) (C 5))
  (C 6)
  (C 7)
