module Datatypes_lecture
   where

type Point = (Float, Float)
type Line  = (Point, Point)

type Node a = (a,a)
type Edge a = (Node a, Node a)

n1 = (1,2)::(Node Int)
n2 = (4,8)::(Node Int)
n3 = (6,9)::(Node Int)
e1 = (n1,n2)::(Edge Int)
e2 = (n2,n3)::(Edge Int)

type Graph a = [Edge a]

g = [e1,e2]

---------------------------------------------------------------------------------
-- Data types

data Days = Sunday  | Monday  | Tuesday  | Wednesday  | Thursday  | Friday  | Saturday  deriving (Eq, Show, Ord )

---------------------------------------------------------------------------------------
-- Pattern matching for data types 

{- isWeekday Sunday  -> returns False
   isWeekday Saturday  -> returns False
   isWeekday Monday  -> returns True
-}

isWeekday :: Days -> Bool
isWeekday d | d == Saturday = False 
            | d == Sunday = False
            | otherwise = True

{- Solution using patterns -}

isWeekday2 Saturday = False
isWeekday2 Sunday  = False
isWeekday2 _ = True

isWeekday3 day = not (day `elem` [Saturday, Sunday])


----------------------------------------------------------------

data Money = NONE | COIN Int | BILL Int 
             deriving (Eq, Show, Ord)

c1 = (COIN 10)
b1 = (BILL 20)
novalue = NONE

----------------------------------------------------------------------
{- Functions to process parametrized data constructors -}

{- amount (COIN 10) -> returns 10
   amount (BILL 10) -> returns 1000 -}

amount NONE = 0
amount (COIN x) = x
amount  (BILL x) =  x * 100


{- amount2 (COIN 10) -> returns (COIN 10)
   amount2 (BILL 10) -> returns (COIN 1000) -}

amount2 NONE = COIN 0
amount2 (COIN x) = (COIN x)
amount2  (BILL x) =  COIN (x*100)

{-addMoney (COIN 10) (BILL 1) -> returns 110 -} 

-- addMoney1 x  y = 

addMoney::Money -> Money -> Int
addMoney (NONE)   (NONE)   = 0
addMoney (COIN x) (COIN y) = x+y
addMoney (BILL x) (BILL y) = (x+y)*100         
addMoney (NONE)   (COIN y) = y
addMoney (COIN x) (NONE)   = x
addMoney (BILL x) (NONE)   = x*100
addMoney (NONE)   (BILL y) = y*100
addMoney (COIN x) (BILL y) = x+y*100 
addMoney (BILL x) (COIN y) = y+x*100 

-- addMoney (COIN 25) (BILL 1) 

addMoney2 (NONE)   (NONE)   = fromIntegral(0)
addMoney2 (COIN x) (COIN y) = fromIntegral(x+y)/100
addMoney2 (BILL x) (BILL y) = fromIntegral(x+y)             
addMoney2 (NONE)   (COIN y) = fromIntegral(y)/100
addMoney2 (COIN x) (NONE)   = fromIntegral(x)/100
addMoney2 (BILL x) (NONE)   = fromIntegral(x)
addMoney2 (NONE)   (BILL y) = fromIntegral(y)
addMoney2 (COIN x) (BILL y) = fromIntegral(x+100*y)/100  
addMoney2 (BILL x) (COIN y) = fromIntegral(x*100+y)/100

-- addMoney2 (COIN 25) (BILL 1) 

-----------------------------------------------------------------------------------

data MaybeInt = JustInt Int | NoInt deriving (Show, Eq)
data MaybeStr = JustStr String | NoStr deriving (Show, Eq)
data MaybeDouble = JustDouble Double | NoDouble  deriving (Show, Eq)

-- data Maybe a = Just a  | Nothing  
--                deriving (Show, Eq, Ord)

a = (Just 10)      -- :t a  returns a :: Num a => Maybe a
b = (Just "ten")   -- :t b  returns b :: Maybe [Char] 
c = Nothing        -- :t d  returns d :: Maybe a
d = (Just [1,2,3]) -- :t e  returns e :: Num a => Maybe [a]

head' :: [a] -> Maybe a
head' [] = Nothing 
head' (x:xs) = (Just x)

-- head' [[1],[2,3]]  -- returns Just [1]
-- head' [] -- returns Nothing

last' :: [a] -> Maybe a
last' [] = Nothing
last' [x] = (Just x)
last' (x:xs) = last' xs

-- last [[1],[2,3]]  -- returns Just [2,3]
-- last [] -- returns Nothing

------------------------------------------------------------------------------------

{- How to add two (Maybe Int) values and have the sum as an Int ? -}

add_maybe_1::Maybe Integer-> Maybe Integer-> Integer
add_maybe_1 Nothing Nothing  = 0
add_maybe_1 Nothing (Just y) = y
add_maybe_1 (Just x) (Nothing) = x
add_maybe_1 (Just x) (Just y) = x+y


------------------------------------------------------------------------------------

{- How to add two (Maybe Integer) values and have the sum as a (Maybe Integer) ? -}

add_maybe_2::Maybe Integer-> Maybe Integer-> Maybe Integer
add_maybe_2 Nothing Nothing  = Nothing
add_maybe_2 Nothing (Just y) = Just y
add_maybe_2 (Just x) (Nothing) = Just x
add_maybe_2 (Just x) (Just y) = Just (x+y)

------------------------------------------------------------------------------------

{- How to add an Integer and a (Maybe Integer) value and have the sum as an Integer ? -}

add_maybe_3:: Integer-> Maybe Integer-> Integer
add_maybe_3 x (Nothing) = x
add_maybe_3 x (Just y) = x+y

add_maybe_4:: Maybe Integer-> Integer -> Integer
add_maybe_4 (Nothing) x = x
add_maybe_4 (Just y) x = x+y

------------------------------------------------------------------------------------

maybe_list =  [Nothing , Just 5, Just 10, Just 12, Nothing, Just (-1)]   

add [] = 0
add (x:xs) = x + (add xs)
 
sum_maybe_rec [] = Just 0
sum_maybe_rec (x:xs) = x  `add_maybe_2`  (sum_maybe_rec xs)

{- How to sum the list of (Maybe Integer) values using foldr/foldl and have the total sum as (Maybe Integer)? -}

sum_maybe xs = foldr add_maybe_2 (Just 0) xs


{- How to sum the list of (Maybe Integer) values using foldr/foldl and have the total sum as Integer? -}

sum_maybe2 xs = foldr add_maybe_4 0 xs

sum_maybe3 xs = foldl add_maybe_3 0 xs

--------------------------------------------------------------
-- Recursive Data types
---------------------------------------------------------------

data MyList a = EMPTY | CONS a (MyList a)  deriving (Show, Eq)

list1 = 1:2:3:4:[]
(x:xs) = list1

mylist1 = CONS 1 (CONS 2 (CONS 3 (CONS 4 EMPTY)))
(CONS y ys) = mylist1


-- implement mylength to calculate the length of a MyList value.

length' [] = 0
length' (x:xs)  =  1+ length' xs

-- mylength' 
mylength' EMPTY = 0
mylength' (CONS x xs)  =  1+ mylength' xs


mymap op EMPTY = EMPTY
mymap op (CONS y ys) = CONS (op y) (mymap op ys)

-- :t (:)
-- (:) :: a -> [a] -> [a]
-- :t CONS
-- CONS :: a -> MyList a -> MyList a


-- Binary Int Tree

data IntTree = Leaf Int | Node (IntTree)  (IntTree)  deriving (Show, Eq)

l1 = (Leaf 3)
l2 = Leaf 4
node1 = Node l1 l2

(Node child1 child2) = node1

-- example IntTree values 
tree1 = Node (Leaf 3) (Leaf 4)
tree2 = Node (Node (Leaf 5) (Leaf 6)) (Leaf 4)
tree3 = Node (Leaf 5) (Node (Leaf 1) (Leaf 2))


-- Polymorphic binary tree
data Tree a = LEAF a | NODE (Tree a) (Tree a)
              deriving (Show, Eq, Ord)

l1' = (LEAF "three");
l2' = (LEAF "four");
tree4 = NODE l1' l2'
tree5 = NODE (NODE (LEAF "one") (LEAF "two")) (NODE (LEAF "three") (LEAF "four"))
tree6 = NODE (NODE (LEAF 1) (LEAF 2)) (NODE (LEAF 3) (LEAF 4))

-- Different tree types: 
{- Polymorhic binary tree which stores tuples both  in leaves  and nodes. -}


{- Polymorhic binary tree which stores data both in leaves and nodes. -}
data MyBTree a = BLEAF a | BNODE a (MyBTree a) (MyBTree a)
              deriving (Show, Eq, Ord)

{- Polymorhic ternary tree which stores data both in leaves and nodes. -}
data MyTTree a = TLEAF a | TNODE a (MyTTree a) (MyTTree a) (MyTTree a)
              deriving (Show, Eq, Ord)

{- Polymorhic binary tree which stores lists  in leaves only. -}
data MyLTree a = LLEAF [a] | LNODE [(MyLTree a)]
              deriving (Show, Eq, Ord)


data MyTBTree a b = TBLEAF (a,b)  | TBNODE  (a,b) (MyTBTree a b) (MyTBTree a b)
              deriving (Show, Eq, Ord)


---------------------------------------------------------------------------------
-- EXERCISE
---------------------------------------------------------------------------------

-- Polymorphic binary tree
-- data Tree a = LEAF a | NODE (Tree a) (Tree a)
--               deriving (Show, Eq, Ord) 

-- -- -- Polymorphic binary tree where interior nodes store the max value in the underlying tree. 
data MTree a = MLEAF a | MNODE a  (MTree a) (MTree a)
                deriving (Show, Eq, Ord)

{- define createMTree ; the tree where the interior nodes store the max of the leaves' values in the subtree rooted at that node-}

tree7 = NODE (NODE (LEAF 1) (LEAF 2)) (NODE (LEAF 8) (NODE (LEAF 4) (LEAF 5)))












