data BST a = Void | Node a (BST a) (BST a)
  deriving (Eq, Ord, Read, Show)

filterVoid :: [BST a] -> [BST a]
filterVoid [] = []
filterVoid (t:ts) = case t of
  Void -> filterVoid ts
  _ -> t : (filterVoid ts)

level :: Ord a => BST a -> [a]
level t = aux [t]
  where
    aux :: [BST a] -> [a]
    aux [] = []
    aux ts = values ++ aux tchildren
      where
        vts = filterVoid ts                    -- rimuoviamo i nodi Void
        values = map (\(Node v _ _) -> v) vts

        tchildren = [ c | (Node _ l r) <- vts, c <- [l, r] ] -- sia l che r

t = Node 1
  (Node 2 (Node 4 Void Void) (Node 5 Void Void))
  (Node 3 (Node 6 Void Void) (Node 7 Void Void))
