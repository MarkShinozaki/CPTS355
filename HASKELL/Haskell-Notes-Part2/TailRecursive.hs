-- CptS 355 - Sample Functions

module TailRecursive
     where

import Data.Char

---------------------------------------------------------------------------------------------------

-- non-tail recursive "reverse"
myreverse [] = []
myreverse (x:xs) = x `snoc` (myreverse xs)
                  where 
                     snoc x xs = xs `myappend` [x]
                     myappend [] list = list
                     myappend (x:xs) list = x:(myappend xs list)

-- tail recursive "reverse"

fastreverse iL =  revappend iL []
           where         
                revappend [] buf =  buf
                revappend (x:xs) buf = revappend xs (x:buf)                   

---------------------------------------------------------------------------------------------------

-- "numbers2Sum" that takes an Int list "iL" and a Int value "n", 
-- and returns the ordered values from the input list that add up to less than or equal to  n.

-- Examples:
-- l1 = numbers2Sum [1,2,3,4,5,6,7]  15   -- [1,2,3,4,5]
-- l2 = numbers2Sum [1,2,3,4,5,6,7]  14   --  [1,2,3,4]

numbers2Sum [] n = []
numbers2Sum  (x:xs) n | (n-x) < 0 = []
                      | otherwise = x: (numbers2Sum xs (n-x))


-- tail recursive "numbers2Sum"
numbers2Sum2 list n = reverse (helper list n [])
  where 
     helper [] n acc = acc
     helper  (x:xs) n acc | (n-x) < 0 = acc
                         | otherwise =  (helper xs (n-x) (x:acc))

-- Examples:
-- l1 = numbers2SumTail [1,2,3,4,5,6,7]  15  []  -- [1,2,3,4,5]
-- l2 = numbers2SumTail [1,2,3,4,5,6,7]  14  [] --  [1,2,3,4]

---------------------------------------------------------------------------------------------------

minList []     = error "list is empty"
minList [x] = x
minList (x:xs) = x `min` (minList xs)

-- l4 = minList [4,-2,5,7,-1,0,8]


minList2 [] = error "list is empty"
minList2 (x:xs) = helper xs  x
  where 
     helper [] acc = acc
     helper (x:xs) acc =  (helper xs (acc `min` x))