data QT a = C a | Q (QT a) (QT a) (QT a) (QT a)
  deriving (Eq, Show)

fold :: (Eq a, Show a) => (b -> b -> b -> b -> b) -> (a -> b) -> QT a -> b
fold _ g (C a)           = g a
fold f g (Q q1 q2 q3 q4) = f (fold f g q1) (fold f g q2) (fold f g q3) (fold f g q4)

flipHorizontal :: (Eq a, Show a) => QT a -> QT a
flipHorizontal (C a) = (C a)
flipHorizontal (Q q1 q2 q3 q4) = Q (flipHorizontal q2) (flipHorizontal q1) (flipHorizontal q4) (flipHorizontal q3)

isHorizontalSymmetric :: (Eq a, Show a) => QT a -> Bool
isHorizontalSymmetric (C _)           = True
isHorizontalSymmetric (Q q1 q2 q3 q4) = (q1 == flipHorizontal q3) && (q2 == flipHorizontal q4)

flipVertical :: (Eq a, Show a) => QT a -> QT a
flipVertical (C a) = (C a)
flipVertical (Q q1 q2 q3 q4) = Q (flipVertical q3) (flipVertical q4) (flipVertical q1) (flipVertical q2)

isVerticalSymmetric :: (Eq a, Show a) => QT a -> Bool
isVerticalSymmetric (C _)           = True
isVerticalSymmetric (Q q1 q2 q3 q4) = (q1 == flipVertical q2) && (q3 == flipVertical q4)

rotate180 :: (Eq a, Show a) => QT a -> QT a
rotate180 (C a) = (C a)
rotate180 (Q q1 q2 q3 q4) = Q (rotate180 q4) (rotate180 q3) (rotate180 q2) (rotate180 q1)

isCenterSymmetric :: (Eq a, Show a) => QT a -> Bool
isCenterSymmetric (C _)           = True
isCenterSymmetric (Q q1 q2 q3 q4) = (q1 == rotate180 q4) && (q2 == rotate180 q3)

t = Q v v w w
  where
    u = C 1
    v = Q u u u u
    w = Q (C 2) (C 2) (C 2) (C 2)
