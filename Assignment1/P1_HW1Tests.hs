{-  To run the tests type "run" at the Haskell prompt.  -} 

module P1_HW1tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW1

-- merge_sorted tests
p1_test1 = TestCase (assertEqual "running_totals - test 1" 
                                  ([1,3,6,10,15,21,28,36,45,55]) 
                                  (runningTotals [1,2,3,4,5,6,7,8,9,10])) 
p1_test2 = TestCase (assertEqual "running_totals - test 2" 
                                  ([5,10,15,20,25,30,35]) 
                                  (runningTotals [5,5,5,5,5,5,5])) 
p1_test3 = TestCase (assertEqual "running_totals - test 3" 
                                  ([]) 
                                  (runningTotals []))
p1_test4 = TestCase (assertEqual "running_totals - test 4" 
                                 ([0,-2,1,5,1,0,2]) 
                                 (runningTotals [0,-2,3,4,-4,-1,2]))
                       
 
tests = TestList [ TestLabel "Problem 1- test1 " p1_test1,
                   TestLabel "Problem 1- test2 " p1_test2,  
                   TestLabel "Problem 1- test3 " p1_test3,
                   TestLabel "Problem 1- test4 " p1_test4
                 ] 
                  
-- shortcut to run the tests
run = runTestTT  tests