{-  To run the tests type "run" at the Haskell prompt.  -} 

module P6_HW1tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW1
                                                   
-- get_segment tests 
                                
p6_test1 = TestCase (assertEqual "(get_segment-test1)"  
                                 "flu"  
                                 (get_segment ('(',')') "I got the (flu) vaccine(!)" ) ) 
p6_test2 = TestCase (assertEqual "(get_segment-test2)"  
                                  []  
                                  (get_segment (0,9)  [1,2,3,4,5,6,7,8,9,10,11] ) ) 
p6_test3 = TestCase (assertEqual "(get_segment-test3)"  
                                  [5,6,7,8,10,11]  
                                  (get_segment (0,9)  [1,2,3,4,0,5,6,7,8,10,11] ) )                                 
                        

tests = TestList [                                      
                   TestLabel "Problem 6- test1 " p6_test1, 
                   TestLabel "Problem 6- test2 " p6_test2,
                   TestLabel "Problem 6- test3 " p6_test3
                 ] 
                  
-- shortcut to run the tests
run = runTestTT  tests