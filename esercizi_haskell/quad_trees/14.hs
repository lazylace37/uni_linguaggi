data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

fold :: (Eq a, Show a) => (b -> b -> b -> b -> b) -> (a -> b) -> QT a -> b
fold _ g (C a)           = g a
fold f g (Q q1 q2 q3 q4) = f (fold f g q1) (fold f g q2) (fold f g q3) (fold f g q4)

flipHorizontal :: (Eq a, Show a) => QT a -> QT a
flipHorizontal (C a) = (C a)
flipHorizontal (Q q1 q2 q3 q4) = Q (flipHorizontal q2) (flipHorizontal q1) (flipHorizontal q4) (flipHorizontal q3)

flipVertical :: (Eq a, Show a) => QT a -> QT a
flipVertical (C a) = (C a)
flipVertical (Q q1 q2 q3 q4) = Q (flipVertical q3) (flipVertical q4) (flipVertical q1) (flipVertical q2)

t = Q v v w w
  where
    u = C 1
    v = Q u u u u
    w = Q (C 2) (C 2) (C 2) (C 2)
