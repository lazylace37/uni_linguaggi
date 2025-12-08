data BST a = Void | Node a (BST a) (BST a)
  deriving (Eq, Ord, Read, Show)
type BSTA a = BST (a, Maybe a)

diff2next :: Num a => BST a -> BSTA a
diff2next t = fst (visit t Nothing)
  where
    visit :: Num a => BST a -> Maybe a -> (BSTA a, Maybe a)
    visit Void succ         = (Void, succ)
    visit (Node v l r) succ =
      let
        (nl, minl) = visit l (Just v)

        (nr, minr) = visit r succ
        diff = case minr of
          Nothing -> Nothing
          Just s -> Just (s - v)
      in ((Node (v, diff) nl nr), minl)

t = Node 4 Void (Node 7 (Node 5 Void Void) Void)
