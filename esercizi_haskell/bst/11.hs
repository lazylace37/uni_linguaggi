data WBST a = Void | Node a Int (WBST a) (WBST a)
  deriving (Eq, Ord, Read, Show)

insert :: Ord a => a -> WBST a -> WBST a
insert n Void = Node n 0 Void Void
insert n (Node v h l r)
  | n <= v    = let
      nl = insert n l
      nlh = case nl of         -- altezza del (nuovo) nodo sinistro
        Node _ h _ _ -> h
        Void         -> 0
      rh = case r of           -- altezza del nodo destro
        Node _ h _ _ -> h
        Void         -> 0
      nh = (max nlh rh) + 1    -- altezza del nodo
    in Node v nh nl r
  | otherwise = let
      nr = insert n r
      nrh = case nr of         -- altezza del (nuovo) nodo destro
        Node _ h _ _ -> h
        Void         -> 0
      lh = case l of           -- altezza del nodo sinistro
        Node _ h _ _ -> h
        Void         -> 0
      nh = (max lh nrh) + 1    -- altezza del nodo
    in Node v nh l nr

t2 = Node 10 3
  (Node 
    5
    2
    Void
    (Node 8 1 (Node 7 0 Void Void) Void)
  )
  (Node 20 0 Void Void)
