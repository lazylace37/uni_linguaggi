data Tree a = Void | Node a [Tree a]
  deriving (Eq, Show)

treefoldr :: (Eq a, Show a) => (a -> b -> c) -> c -> (c -> b -> b) -> b -> Tree a -> c
treefoldr _ y _ _ Void        = y
treefoldr f y g z (Node x ts) = f x (foldr aux z ts)
  where
    aux t acc = g (treefoldr f y g z t) acc

g :: Char -> [String]
g 'S' = ["AB"]
g 'A' = ["0B"]
g 'B' = ["1B", ""]
g _   = [""]         -- terminali

inList :: (Eq a) => a -> [a] -> Bool
inList _ []      = False
inList el (x:xs) = (el == x) || inList el xs

iscorrect :: Tree Char -> Bool
iscorrect t = snd (treefoldr auxTree (Nothing, True) auxNodes ([], True) t)
  where
    auxNodes t (symbols, accValid) = (newSymbols, b && accValid)
      where
        (symbol, b) = t
        newSymbols = case symbol of 
          Just s -> s:symbols
          Nothing -> symbols

    auxTree s (str, b) = (Just s, b && inList str (g s))

-- S -> AB -> 0Be -> 01B -> 01e -> 01
t1 = Node 'S' [
    Node 'A' [
      Node '0' [],
      Node 'B' [
        Node '1' [],
        Node 'B' []
      ]
    ],
    Node 'B' []
  ]

t2 = Node 'S' [
    Node 'B' [],
    Node 'A' []
  ]
