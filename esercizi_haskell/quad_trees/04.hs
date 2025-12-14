data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

howManyPixels :: (Eq a, Show a) => QT a -> Integer
howManyPixels (C _) = 1
howManyPixels (Q q1 q2 q3 q4) = 4 * max (howManyPixels q1) (max (howManyPixels q2) (max (howManyPixels q3) (howManyPixels q4)))
