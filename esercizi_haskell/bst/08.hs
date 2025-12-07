data BST a = Null | Node { value :: a, left, right :: BST a }
  deriving (Eq, Ord, Read, Show)

filtertree :: Ord a => (a -> Bool) -> BST a -> [a]
filtertree _ Null = []
filtertree p (Node v l r) = filtertree p l ++ value ++ filtertree p r
  where value = if p v then [v] else []

t = Node { value = 10,
  left = Node {value = 5, left = Node {value = 2, left = Null, right = Null}, right = Null},
  right = Node {value = 15, left = Node {value = 12, left = Null, right = Null}, right = Null}
}
