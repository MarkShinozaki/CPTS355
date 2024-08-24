{-  To run the tests type "run" at the Haskell prompt.  -} 

module P4_HW1tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW1

-- Problem-4 tests

-- get_indexes tests       

p4_test1 = TestCase (assertEqual "get_indexes  test1" 
                                  [1,4,7,11]  
                                  (get_indexes [1,2,3,4,2,5,6,2,4,7,8,2,9] 2) ) 
p4_test2 = TestCase (assertEqual "get_indexes  test2" 
                                  [1,7,10,16,19,25]  
                                  (get_indexes "Was it a car or a cat I saw?" 'a') )  
p4_test3 = TestCase (assertEqual "get_indexes  test3" 
                                  []  
                                  (get_indexes [] "355") )                            

                                                          

tests = TestList [                                      
                   TestLabel "Problem 4- test1 " p4_test1, 
                   TestLabel "Problem 4- test2 " p4_test2,
                   TestLabel "Problem 4- test3 " p4_test3
                 ] 
                  
-- shortcut to run the tests
run = runTestTT  tests