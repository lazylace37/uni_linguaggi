data BST a = Null | Node { value :: a, left, right :: BST a }
  deriving (Eq, Ord, Read, Show)

inorder :: Ord a => BST a -> [a]
inorder Null = []
inorder (Node v l r) = inorder l ++ (v : inorder r)

t = Node { value = 10,
  left = Node {value = 5, left = Node {value = 2, left = Null, right = Null}, right = Null},
  right = Node {value = 15, left = Node {value = 12, left = Null, right = Null}, right = Null}
}
