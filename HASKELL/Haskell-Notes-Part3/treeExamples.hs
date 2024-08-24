---------------------------------
-- Example functions to process trees
---------------------------------

import Data.Char

-- Binary tree with data only in leaves
data Tree a = LEAF a | NODE (Tree a) (Tree a)  deriving (Show, Eq)

-- example Tree String
tree1 = NODE (NODE (LEAF 1) (LEAF 2)) (NODE (LEAF 3) (LEAF 4))
tree2 = NODE (NODE (LEAF "one") (LEAF "two")) (NODE (LEAF "three") (LEAF "four"))

------------------------------------------------------------------------------

{-  count the number of leaves in the tree -}
nLeaves (LEAF v) = 1
nLeaves (NODE left right) = (nLeaves left) + (nLeaves right)

{-  call nLeaves -}
-- l = nLeaves tree2   --returns 4
------------------------------------------------------------------------------
{-  count the number of nodes in the tree -}


nNodes (LEAF v) = 1
nNodes (NODE left right) = (nNodes left) + (nNodes right) +1

{- call nNodes -}
-- n = nNodes tree2   --returns 3

------------------------------------------------------------------------------

{-  define maxTree - finds the max value in the leaves.  -}

maxTree (LEAF v) = v
maxTree (NODE left right) = (maxTree left) `max` (maxTree right)


------------------------------------------------------------------------------

{-  make a copy of the tree -}

copyTree (LEAF v) = LEAF v
copyTree (NODE left right)  = NODE (copyTree left) (copyTree right)

-- call copyTree
-- tree2_copy = copyTree tree2

------------------------------------------------------------------------------

{- tree map -}

treeMap op (LEAF v) = LEAF (op v)
treeMap op (NODE left right)  = NODE (treeMap op left) (treeMap op right)

-- call treeMap
-- strUpper s = map toUpper s   --should import Data.Char
-- tree2_uppercase = treeMap strUpper tree2

------------------------------------------------------------------------------

{-  Pre-Order traversal; returns a list of the leaf values -}

preOrder (LEAF v) = [v]
preOrder (NODE left right) = (preOrder left) ++ (preOrder right)


{- the below functions us the following modified data type-}

-- data Tree a = LEAF a | NODE a (Tree a) (Tree a)  deriving (Show, Eq)

-- inOrder (LEAF v) = [v]
-- inOrder (NODE v left right) = (inOrder left) ++ [v] ++ (inOrder right)

-- preOrder (LEAF v) = [v]
-- preOrder (NODE v left right) = [v] ++ (preOrder left) ++ (preOrder right) 
--------------------------------------------------------------------------------

{- define createMTree ; the tree where the interior nodes store the max of the leaves' values in the subtree rooted at that node-}


-- -- -- Polymorphic binary tree where interior nodes store the max value in the underlying tree. 
data MTree a = MLEAF a | MNODE a  (MTree a) (MTree a)
                deriving (Show, Eq, Ord)

{- define createMTree ; the tree where the interior nodes store the max of the leaves' values in the subtree 
   rooted at that MyNODE-}


createMTree (LEAF v) = MLEAF v
createMTree (NODE left right)  = MNODE  max_value (createMTree left) (createMTree right)
      where max_value  = (maxTree left) `max` (maxTree right)

tree7 = NODE (NODE (LEAF 1) (LEAF 2)) (NODE (LEAF 8) (NODE (LEAF 4) (LEAF 5)))



--------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
--- Ternary Tree with data in leaves and nodes
data TriTree a = TriLEAF a | TriNODE a (TriTree a) (TriTree a)  (TriTree a)  deriving (Show, Eq)

--example TriTree
tree6 = TriNODE 0 (TriNODE 9 (TriLEAF 1) (TriLEAF 2) (TriLEAF 6) ) (TriNODE 8 (TriLEAF 3) (TriLEAF 4) (TriLEAF 7) ) (TriLEAF 5) 

-- count the number of leaves in the tree
nLeavesTri :: Num p => TriTree a -> p
nLeavesTri (TriLEAF _) = 1
nLeavesTri (TriNODE x t1 t2 t3) = (nLeavesTri t1) + (nLeavesTri t2) + (nLeavesTri t3)
-- call nLeavesTri
ll = nLeavesTri tree6   --returns 7

copyTreeTri :: TriTree a -> TriTree a
copyTreeTri (TriLEAF x) = TriLEAF x
copyTreeTri (TriNODE x t1 t2 t3) = TriNODE x (copyTreeTri t1)  (copyTreeTri t2) (copyTreeTri t3)
-- call copyTreeTri
tree6_copy = copyTreeTri tree6   --returns 3

treeMapTri :: (a -> a) -> TriTree a -> TriTree a
treeMapTri op (TriLEAF x) = TriLEAF (op x)
treeMapTri op (TriNODE x t1 t2 t3) = TriNODE x (treeMapTri op t1)  (treeMapTri op t2) (treeMapTri op t2)
-- call treeMapTri
myTriTree = treeMapTri (\x -> x*2) tree6

-- PRE-ORDER traversal; returns a list of the leaf values
preOrderTri :: TriTree a -> [a]
preOrderTri (TriLEAF x) =  [x]
preOrderTri (TriNODE x t1 t2 t3) = [x] ++ (preOrderTri t1) ++ (preOrderTri t2) ++ (preOrderTri t3) 
--call preOrderTri
ptList = preOrderTri tree6

-- myTriTree = TriNODE 0 (TriNODE 9 (TriLEAF 1) (TriLEAF 2) (TriLEAF 6) ) 
--                       (TriNODE 8 (TriLEAF 3) (TriLEAF 4) (TriLEAF 7) ) 
--                       (TriLEAF 5) 

-- myTree = NODE (NODE (LEAF "one") (LEAF "two")) (NODE (LEAF "three") (LEAF "four"))
