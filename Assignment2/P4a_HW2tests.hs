module P4a_HW2tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW2


{- either_sum1 tests 6% -}
p4a_test1 = TestCase (assertEqual "either_sum1 test-1" 
                                   (IInt 36) 
                                   (either_sum1  [[IString "1",IInt 2,IInt 3], [IString "4",IInt 5], [IInt 6, IString "7"], [],[IString "8"]]) ) 
p4a_test2 = TestCase (assertEqual "either_sum1  test-2" 
                                   (IInt 30) 
                                   (either_sum1  [[IString "10" , IInt 10],[],[IString "10"],[]]) ) 
p4a_test3 = TestCase (assertEqual "either_sum1  test-3" 
                                   (IInt 0)
                                   (either_sum1  []) ) 

tests = TestList [ TestLabel "Problem 4a - test1 " p4a_test1,
                   TestLabel "Problem 4a - test2 " p4a_test2,  
                   TestLabel "Problem 4a - test3 " p4a_test3
                 ] 
                  

-- shortcut to run the tests
run = runTestTT  tests