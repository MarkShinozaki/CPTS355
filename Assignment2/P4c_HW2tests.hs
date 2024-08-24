module P4c_HW2tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW2

                                   
{- either_filter1 tests 6% -}
p4c_test1 = TestCase (assertEqual "either_filter1 test-1" 
                                   [IString "15",IInt 8,IInt 9,IInt 8,IString "11"]
                                   (either_filter1 (IInt 8) [[IString "15",IInt 8,IInt 7], [IString "7",IInt 9], [IInt 8, IString "11"], [],[IString "4"]]) ) 
p4c_test2 = TestCase (assertEqual "either_filter1  test-2" 
                                   [IString "10",IInt 10] 
                                   (either_filter1 (IString "10") [[IString "10" , IInt 9],[],[IString "9", IInt 10],[]]) ) 
p4c_test3 = TestCase (assertEqual "either_filter1  test-3" 
                                   []
                                   (either_filter1 (IString "1") []) ) 

tests = TestList [ TestLabel "Problem 4c - test1 " p4c_test1,
                   TestLabel "Problem 4c - test2 " p4c_test2,
                   TestLabel "Problem 4c - test3 " p4c_test3              
                 ] 
                  

-- shortcut to run the tests
run = runTestTT  tests