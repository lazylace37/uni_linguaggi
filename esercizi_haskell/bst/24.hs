data BST a = Void | Node a (BST a) (BST a)
  deriving (Eq, Ord, Read, Show)

fold :: ( Ord a ) => ( a -> b -> b -> b ) -> b -> BST a -> b
fold _ z Void = z
fold f z ( Node x l r ) = f x ( fold f z l ) ( fold f z r )

limitedVisit :: (Ord a) => a -> a -> BST a -> [a]
limitedVisit x y t = (fold aux (\_ _ -> []) t) x y
  where
    aux :: (Ord a) => a -> (a -> a -> [a]) -> (a -> a -> [a]) -> a -> a -> [a]
    aux x l r minVal maxVal
      | x < minVal = r minVal maxVal
      | x > maxVal = l minVal maxVal
      | otherwise  =
        (if x > minVal then l minVal maxVal else []) ++
        [x] ++
        (if x < maxVal then r minVal maxVal else [])
