module P3_HW2tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW2

---------------------------------------------------------
{-Test inputs for study_list -}
log_input = [("CptS355", [("Mon",3), ("Wed",2), ("Sat",2)]) ,
             ("CptS360", [("Mon",3), ("Tue",2), ("Wed",2), ("Fri",10)]),
             ("CptS321", [("Tue",2), ("Wed",2), ("Thu",3)]),
             ("CptS322", [("Tue",1), ("Thu",5), ("Sat",2)]) ]
---------------------------------------------------------

{- study_list (higher-order)  tests 10% -}

p3_test1 = TestCase (assertEqual "study_list-test1" 
                                  ["CptS355", "CptS322"]
                                  (study_list log_input "Sat") ) 
p3_test2 = TestCase (assertEqual "study_list-test2" 
                                  ["CptS360", "CptS321", "CptS322"]
                                  (study_list log_input "Tue") ) 
p3_test3 = TestCase (assertEqual "study_list-test3" 
                                  []
                                  (study_list log_input "Sun") ) 

tests = TestList [ 
                   TestLabel "Problem 3- test1 " p3_test1, 
                   TestLabel "Problem 3- test2 " p3_test2, 
                   TestLabel "Problem 3- test3 " p3_test3
                 ] 

-- shortcut to run the tests
run = runTestTT  tests