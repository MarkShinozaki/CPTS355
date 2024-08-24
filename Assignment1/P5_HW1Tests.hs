{-  To run the tests type "run" at the Haskell prompt.  -} 

module P5_HW1tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW1
                                                   
-- group_items  tests 
                                
p5_test1 = TestCase (assertEqual "(group_items-test1)" 
                                  [[1],[2,3],[4,5,6],[7,8,9,10],[11,12]]  
                                  (group_items [1,2,3,4,5,6,7,8,9,10,11,12]) ) 
p5_test2 = TestCase (assertEqual "(group_items-test2)" 
                                  ["a","bc","def","ghij","klmno","pqrstu","wxyz012"]  
                                  (group_items "abcdefghijklmnopqrstuwxyz012") ) 
p5_test3 = TestCase (assertEqual "(group_items-test3)" 
                                  ([]::[[Int]])  
                                  (group_items []) ) 

tests = TestList [                                      
                   TestLabel "Problem 5- test1 " p5_test1, 
                   TestLabel "Problem 5- test2 " p5_test2,
                   TestLabel "Problem 5- test3 " p5_test3
                 ] 
                  
-- shortcut to run the tests
run = runTestTT  tests