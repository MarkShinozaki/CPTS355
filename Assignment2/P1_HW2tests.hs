module P1_HW2tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW2



{- group_items (tail-recursive)  tests 10% -}

p1_test1 = TestCase (assertEqual "(group_items-test1)" 
                                  [[1],[2,3],[4,5,6],[7,8,9,10],[11,12]]  
                                  (group_items [1,2,3,4,5,6,7,8,9,10,11,12]) ) 
p1_test2 = TestCase (assertEqual "(group_items-test2)" 
                                  ["a","bc","def","ghij","klmno","pqrstu","wxyz012"]  
                                  (group_items "abcdefghijklmnopqrstuwxyz012") ) 
p1_test3 = TestCase (assertEqual "(group_items-test3)" 
                                  ([]::[[Int]])  
                                  (group_items []) ) 

tests = TestList [ TestLabel "Problem 1 - test1 " p1_test1,
                   TestLabel "Problem 1 - test2 " p1_test2,
                   TestLabel "Problem 1 - test3 " p1_test3
                 ] 

-- shortcut to run the tests
run = runTestTT  tests