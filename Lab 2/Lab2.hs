-- CptS 355 - Lab 2 (Haskell) - Fall 2023
-- Name: Mark Shinozaki
-- Date: 10/5/21


module Lab2

     where


-- 1
{- (a) merge2 -}
merge2 :: [a] -> [a] -> [a]
merge2 [] [] = [] -- base case
merge2 [] (y:ys) = y:(merge2 [] ys) -- if first list is empty, return second list
merge2 (x:xs) [] = x:(merge2 xs []) -- if second list is empty, return first list
--merge2 :: [a] -> [a] -> [a]
merge2 (x:xs) (y:ys) = x:y:(merge2 xs ys) -- if both lists are not empty, return both lists
                         

{- (b) merge2Tail -}
merge2Tail :: [a] -> [a] -> [a]
merge2Tail list1 list2 = mergeTHelper list1 list2 [] -- call helper function with empty buffer list, mergeThelper , T = Tail
                   where mergeTHelper [] [] buf = reverse buf
                         mergeTHelper [] (y:ys) buf = mergeTHelper [] ys (y:buf) -- if first list is empty, return second list
                         mergeTHelper (x:xs) [] buf = mergeTHelper xs [] (x:buf) -- if second list is empty, return first list
                         mergeTHelper (x:xs) (y:ys) buf = mergeTHelper xs ys (y:x:buf) -- if both lists are not empty, return both lists




{- (c) mergeN -}
mergeN :: [[a]] -> [a]
mergeN [] = [] -- base case
mergeN (x:xs) = foldl merge2 x xs -- foldl takes a function, a starting value, and a list to fold over. 
                                  -- In this case, the function is merge2, 
                                  -- the starting value is x, and the list to fold over is xs. 
                                  -- This will merge all the lists in xs into x, which is the first list in the list of lists.



-- 2
{- (a) count -}
count :: (Eq a) => a -> [a] -> Int
count i [] = 0 -- base case
count i (x:xs) = length(filter (==i) (x:xs)) -- if list is not empty, return length of filtered list, 
                                             -- where filtered list is the list of elements that are equal to i in the list (x:xs



{- (b) histogram  -}

uniqElement :: Eq a => [a] -> [a]
uniqElement [] = [] -- base case
uniqElement (x:xs) | (elem x xs == True) = uniqElement xs -- if element is in list, return list without element
                   | otherwise = x:(uniqElement xs) -- if element is not in list, return list with element
                   
histogram :: (Eq a) => [a] -> [(a, Int)]
histogram list = histogramHelper (uniqElement list) list -- call helper function with list of unique elements and original list
             where histogramHelper (x:xs) list = map(\s -> (s, count s list)) (x:xs) -- map function to list of unique elements, 
                                                                                     -- where the function is a lambda function that takes a list and returns a 
                                                                                     -- tuple of the element and the count of the element in the list
                                                                                     -- the list is the list of unique elements
                                                                                     -- the list is the original list


-- 3                
{- (a) concatAll -}

concatAll :: [[String]] -> String
concatAll xs = concatAllhelper (map concatAllhelper xs)
               where concatAllhelper xs = foldr (++) "" xs -- if list is not empty, return list with first 
                                                           -- element of list appended to rest of list

{- (b) concat2Either -}               
data AnEither  = AString String | AnInt Int
                deriving (Show, Read, Eq)


concat2Either :: [[AnEither]] -> AnEither
concat2Either [] = AString "" -- base case
concat2Either xs = concat2Helper (map concat2Helper xs) 
                    where concat2Helper xs = foldr (maybeConcat2) (AString "") xs -- (AString "") becuase it is a nested list 
                          maybeConcat2 (AString x) (AString y) = AString (x ++ y) -- AString "String String" app x and y
                          maybeConcat2 (AString x) (AnInt y) = AString (x ++ (show y)) -- Astring "string int" convert y and app x
                          maybeConcat2 (AnInt x) (AnInt y) = AString ((show x) ++ (show y)) --Astring int int convert x and y and app
                          maybeConcat2 (AnInt x) (AString y) = AString ((show x) ++ y) -- Astring int string convert x and app y
                                                            
{- (c) concat2Maybe -}

-- Not Sure I could see test cases for this one 
-- And it was a bit confusing to me 



-- 4      
{-  concat2Str -}               

concat2Str:: [[AnEither]] -> String
concat2Str list = foldr convert "" $ concat list
     where concat l = foldr (++) [] l
           convert (AString x) y = (x ++ y)
           convert (AnInt x) y = (show(x) ++ y)




-- 5 
{- evaluateTree -}

data Op = Add | Sub | Mul | Pow
          deriving (Show, Read, Eq)

evaluate :: Op -> Int -> Int -> Int
evaluate Add x y =  x+y
evaluate Sub   x y =  x-y
evaluate Mul x y =  x*y
evaluate Pow x y = x^y

data ExprTree a = ELEAF a | ENODE Op (ExprTree a) (ExprTree a)
                  deriving (Show, Read, Eq)

evaluateTree :: ExprTree Int -> Int
evaluateTree (ELEAF x) = x -- base case
evaluateTree (ENODE op left right) = evaluate op (evaluateTree left) (evaluateTree right) -- if not base case, evaluate tree

-- 6
{- printInfix -}
printInfix :: Show a => ExprTree a -> String
printInfix (ELEAF x) = show x -- base case
printInfix (ENODE l r c) = "(" ++ (printInfix r) ++ " `" ++ (show l) ++ "` " ++ (printInfix c) ++ ")"


--7
{- createRTree -}
data ResultTree a  = RLEAF a | RNODE a (ResultTree a) (ResultTree a)
                     deriving (Show, Read, Eq)


createRTree :: ExprTree Int -> ResultTree Int
createRTree (ELEAF r) = (RLEAF r) -- base case
createRtree (ENODE l r c) = RNODE (evaluateTree (ENODE l r c)) (createRTree r) (createRtree c) -- if not base case, create result tree



