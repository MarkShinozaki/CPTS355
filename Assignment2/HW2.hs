-- CptS 355 - Fall 2023 -- Homework2 - Haskell
-- Name: Mark Strong-Shinozaki
-- Collaborators: 


module HW2

     where

------------------------------------------------------------------------------------------------------
{- 1 - group_items  (Tail-recursive)  10%-}
------------------------------------------------------------------------------------------------------
-- WORKS & DONE

-- Summary: 
-- group_items is a function that takes a list of items and returns a list of lists of items
-- the function groups the items in the input list into sublists of increasing size


group_items :: [a] -> [[a]] -- is a function that takes a list 
                            -- of items and returns a list of lists of items [[a]]

group_items xs = reverse (groupItemsHelper xs []) -- group_items calls groupItemsHelper 
                                                  -- with the list and an empty list

groupItemsHelper :: [a] -> [[a]] -> [[a]] -- groupItemsHelper is helper functio that takes two 
                                          -- arguements: a list 'xs' and accumulator 
                                          -- list 'acc' for grouped elements

groupItemsHelper [] acc = acc -- basecase of the recursion checks if the input list is empty
                              -- and returns the accumulator list 'acc' 

groupItemsHelper xs acc = groupItemsHelper remaining (group : acc)
     where
          (group, remaining) = splitAt (length acc + 1) xs

-- Notes:
-- recursive case of the function takes the input list 'xs' into two parts: 'group' 
-- and 'remaining'. group is formed by taking first '(length acc + 1)' elements from 
-- the input list 'xs' and remaining is formed by taking the rest of the elements 

-- 'group' is then added to the front of the accumulator list 'acc' using 'group : acc'
-- this means that the first group will be added to the front of the accumulator list
-- the function continues to recurse with the 'remaining' part of original list and the 
-- updated accululator list, effectively grouping elements progessively

-- Further Notes:
-- the 'groupItemHlper' function processes the input list, progressively forming groups, 
-- and the final result is obtained by reversing the accumulator list in the 'group_items' 
-- function. This approach ensures the grouped elements are in ascending order of size. 


------------------------------------------------------------------------------------------------------
{-2 - get_latest_nested (Higher-order) 10% -}
------------------------------------------------------------------------------------------------------
-- WORKS & DONE

-- Summary: This code allows you to compare and find the latest date among a list of dates
-- without recursion and returns the latest date in a nested list of dates.


type Date = (Int, Int, Int) -- Date for representing a date as a tuple of three integers: 
                            -- (day, month, year)

laterDate :: Date -> Date -> Date -- laterDate that takes two dates and 
                                  -- returns the later (more recent) date

laterDate (d1, m1, y1) (d2, m2, y2) -- Starts a guard clause, if the year ('y1') of the first
    | y1 > y2 = (d1, m1, y1)        -- date is greater than the year ('y2') of the second date                    
    | y1 < y2 = (d2, m2, y2)        -- if year of first date is less than year of second date
    | m1 > m2 = (d1, m1, y1)        -- checks if years are same but month is greater than month of second date 
    | m1 < m2 = (d2, m2, y2)
    | d1 >= d2 = (d1, m1, y1)
    | otherwise = (d2, m2, y2)     -- if none of the above conditions are met, return second date is later


latestDateInList :: [Date] -> Date -- defines 'latestDateInList' uses foldl, to find latest date in list 
latestDateInList = foldl laterDate (0, 0, 0)


get_latest_nested :: [[Date]] -> Date -- 'get_latest_nested' takes nested list of dates, flattens nestedlist into single list 
get_latest_nested nestedList = latestDateInList (concat nestedList) -- finds the latest date in the combined list using 'latestDateInList' function



-- Notes: this code allows  you to compare and find the latest date among a list of dates 
-- without recursion and returns the latest date in a nested list of dates


------------------------------------------------------------------------------------------------------
{-3 - study_list (Higher-order) 15% -}
------------------------------------------------------------------------------------------------------
-- WORKS & DONE


-- Summary: This code allows you to filter and retrieve a list of courses based on a given 
-- day using list comprehensions and higher-order functions


-- These lines define the data types used in the program 
-- 'Course' represents a course as a string
-- 'Schedule' represents a list of pairs where each pair consists of a day (string) and number of hours for that day 
-- 'CourseLog' is a list of pairs where each pair represents a course and its schedule
type Course = String
type Schedule = [(String, Int)]
type CourseLog = [(Course, Schedule)]

-- 'filterCoursesByDay' function takes 'CourseLog' and 'String' as a representation of a day
-- it uses a list comprehension to filter the courses in the 'CourseLog' based on whether the specified 
-- day exists in the schedule for each course. It iterates through each course and its schedule in 'logInput'
-- 'any' function checks if any of the pairs in the schedule for a course match the specified day using 
-- a lambda function. '(\(d, _) -> d == day)'

filterCoursesByDay :: CourseLog -> String -> [Course]
filterCoursesByDay logInput day =
    [course | (course, schedule) <- logInput, any (\(d, _) -> d == day) schedule]

-- 'study_list' function is a simpler version of 'filterCoursesByDay' function, which 
-- calls the 'filterCoursesByDay' function with the 'CourseLog' and 'String' as a representation of a day
-- it returns the result of the 'filterCoursesByDay' function which is a list of courses that
-- have classes on the specified day
study_list :: CourseLog -> String -> [Course]
study_list logInput day = filterCoursesByDay logInput day



------------------------------------------------------------------------------------------------------
{- 4 - (a) either_sum1  6%, (b) either_sum2 6%, and (c) filter_either1 6% (d) filter_either2 6% - 24% -}
------------------------------------------------------------------------------------------------------

-- This line defines a Haskell data type 'IEither'. It has two constructors,
-- 'IString' and 'IInt'. 'IString' takes a string and 'IInt' takes an integer
data IEither = IString String | IInt Int
    deriving (Show, Read, Eq)

------------------------------------------------------------------------------------------------------
{- (a) either_sum1 6%  -}
------------------------------------------------------------------------------------------------------
-- WORKS & DONE


-- Summary: This code defines a data type, functions to convert strings to integers,
-- and functions to recursively sum the integer values within lists of 'IEither' values
-- it is designed to work with nested lists of 'IEither' and returns the sum as an 'IEither' value

-- 'getInt' function takes a string as input and returns an 'Int'. It uses the 
-- 'read' function to parse the string and convert it to an 'Int'
getInt :: String -> Int
getInt x = read x :: Int


-- 'either_sum1' takes a list of lists of 'IEither' as input and returns
-- an 'IEither' as the result. 

-- 'either_sum1' is defined using function composition, it first applies 'map sumIEithers'
-- to each innter list, which maps the 'sumIEithers' function to sum the integer values
-- within each inner list.

-- the result is a list of integers, then uses 'sum' function to sum those
-- the result of the summation is wrapped in an 'IInt' constructor to match the data type

either_sum1 :: [[IEither]] -> IEither
either_sum1 = IInt . sum . map sumIEithers
    where
        sumIEithers :: [IEither] -> Int
        sumIEithers [] = 0
        sumIEithers (IString str : rest) = getInt str + sumIEithers rest
        sumIEithers (IInt num : rest) = num + sumIEithers rest

-- 'sumIEithers' is used by 'map sumIEithers' in the main function
-- the base case is when the list of empty, it returns 0
-- if it encounters 'IString' constructor, it uses the 'getInt' function 
-- to convert the string to an integer and adds it to the sum. 
-- If it encounters 'IInt' constructor, it adds the integer to the sum


------------------------------------------------------------------------------------------------------
{- (b) either_sum2 6%  -}
------------------------------------------------------------------------------------------------------
-- WORKS & DONE

-- Summary: This code defines the 'either_sum2' function to sum the intger values
-- within list of 'IEither' using higher-order functions and functional programming techniques
-- The 'sumIEithers' function is responsible for mapping 'IEither' values and collecting them
-- in a list. 


-- 'either_sum2' is the main function that takes a list of lists of 'IEither' as input
-- and returns an 'IEither' as the result.
either_sum2 :: [[IEither]] -> IEither
either_sum2 input = IInt (sum (concatMap sumIEithers input)) -- 'concatMap sumIEithers' to the input list to flatten the nested list
    where
        sumIEithers :: [IEither] -> [Int]
        sumIEithers = map (\either -> case either of
                                      IString str -> getInt str
                                      IInt num -> num)

-- 'sumIEithers' is a helper function used within 'either_sum2' function
-- the map function is used to apply a function to each element in the input list 
-- 'map' function is used to apply a function to each element in the input list 
-- the 'map' function is a lambda function that pattern matches on each 'IEither' value
-- If the value is of type 'IString', it uses the 'getInt' function to convert the string
-- to an integer. If the value is of type 'IInt', it returns the integer 


------------------------------------------------------------------------------------------------------
{- (c) either_filter1 6%  -}
------------------------------------------------------------------------------------------------------

either_filter1 :: IEither -> [[IEither]] -> [IEither] 
either_filter1 _ [] = [] 
either_filter1 rest (innerList:target) = 
  filter (contentEqual rest) innerList ++ either_filter1 rest target 

  where -- either_filter1 takes an IEither and a list of lists of IEither and returns a list of IEither
    contentEqual :: IEither -> IEither -> Bool -- contentEqual takes two IEither and returns a Bool
    contentEqual (IString str1) (IString str2) = (getInt str1) <= (getInt str2) -- contentEqual pattern matches on the IEither
    contentEqual (IInt num1) (IInt num2) = num1 <= num2 -- contentEqual pattern matches on the IEither

    contentEqual (IString x)(IInt y) = (getInt x) <= y -- contentEqual pattern matches on the IEither 
    contentEqual (IInt x)(IString y) = x <= (getInt y) -- contentEqual pattern matches on the IEither 

    

------------------------------------------------------------------------------------------------------
{- (d) either_filter2 6%  -}
------------------------------------------------------------------------------------------------------
either_filter2 :: IEither -> [[IEither]] -> [IEither]
either_filter2 _ [] = [] 
either_filter2 rest target = concat $ map (filter (contentEqual rest)) target
contentEqual :: IEither -> IEither -> Bool
contentEqual (IString str1) (IString str2) = getInt str1 <= getInt str2
contentEqual (IInt num1) (IInt num2) = num1 <= num2
contentEqual (IString x) (IInt y) = getInt x <= y
contentEqual (IInt x) (IString y) = x <= getInt y





------------------------------------------------------------------------------------------------------
{-5 - isBSTtree, createtree, binarysearch - 32 %-}
------------------------------------------------------------------------------------------------------

data Btree a = BLeaf a | BNode a (Btree a) (Btree a)
              deriving (Show, Read, Eq)

data Ltree a = LLeaf (Int,a) | LNode (Int,a) (Ltree a) (Ltree a)
              deriving (Show, Read, Eq)

------------------------------------------------------------------------------------------------------
{-(a) - isBSTtree  10% -}
------------------------------------------------------------------------------------------------------
-- WORKS & DONE
-- Summary: This code defines a function to check if a Btree is a Binary Search Tree (BST)

isBSTtree :: Ord a => Btree a -> Bool -- isBSTtree takes a Btree and returns a Bool
isBSTtree tree = isBSTtree' tree Nothing Nothing -- isBSTtree calls isBSTtree' with the tree and two Nothings
  where
    isBSTtree' :: Ord a => Btree a -> Maybe a -> Maybe a -> Bool -- isBSTtree' takes a Btree and two Maybe values and returns a Bool
    isBSTtree' (BLeaf x) minVal maxVal = -- isBSTtree' pattern matches on the Btree
      case (minVal, maxVal) of -- case statement to check if the minVal and maxVal are Nothing
        (Just minV, Just maxV) -> minV <= x && x <= maxV -- if minVal and maxVal are not Nothing, it checks if the value of the BLeaf is between the minVal and maxVal
        (Just minV, Nothing)   -> minV <= x -- if minVal is not Nothing, it checks if the value of the BLeaf is greater than or equal to the minVal
        (Nothing, Just maxV)   -> x <= maxV -- if maxVal is not Nothing, it checks if the value of the BLeaf is less than or equal to the maxVal
        _                      -> True -- if both minVal and maxVal are Nothing, it returns True
    isBSTtree' (BNode x left right) minVal maxVal = -- isBSTtree' pattern matches on the Btree
      let leftValid = isBSTtree' left minVal (Just x) -- leftValid is a Bool that calls isBSTtree' with the left subtree and minVal and maxVal
          rightValid = isBSTtree' right (Just x) maxVal
      in leftValid && rightValid

------------------------------------------------------------------------------------------------------
-- {- (b) createtree - 12%-}
------------------------------------------------------------------------------------------------------
-- WORKS & DONE

createtree :: Ord a => Btree a -> Ltree a -- createtree takes a Btree and returns a Ltree
createtree tree = createtree' tree 1 -- createtree calls createtree' with the tree and 1
  where -- createtree' takes a Btree and an Int and returns a Ltree
    createtree' :: Ord a => Btree a -> Int -> Ltree a -- createtree' takes a Btree and an Int and returns a Ltree
    createtree' (BLeaf x) level = LLeaf (level, x) -- createtree' pattern matches on the Btree
    createtree' (BNode x left right) level = -- createtree' pattern matches on the Btree
      LNode (level, x) (createtree' left (level + 1)) (createtree' right (level + 1)) -- createtree' calls itself with the left subtree and level + 1 and the right subtree and level + 1


------------------------------------------------------------------------------------------------------
{- (c) binarysearch - 10%-}
------------------------------------------------------------------------------------------------------
-- WORKS & DONE


-- A function to search for a value in a left-biased binary tree given a key
binarysearch :: Ord a => Ltree a -> a -> Maybe (Int, a)
binarysearch (LLeaf (k, v)) target -- If the tree is a leaf, compare the target with the leaf value
  | target == v = Just (k, v) -- If they are equal, return the leaf key and value
  | otherwise = Nothing -- If they are not equal, return Nothing
binarysearch (LNode (k, v) left right) target -- If the tree is a node, compare the target with the node value
  | target == v = Just (k, v) -- If they are equal, return the node key and value
  | target < v = binarysearch left target -- If the target is smaller, search in the left subtree
  | target > v = binarysearch right target -- If the target is larger, search in the right subtree
