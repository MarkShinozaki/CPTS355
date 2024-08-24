module P2_HW2tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW2

---------------------------------------------------------
{-Test inputs for get_latest_nested -}

nestedDateList1 = [[(31,8,2022),(20,7,2023),(25,9,2023)],[(1,10,2023)],[(30,12,2022),(6,7,2021),(6,7,2023)]]
nestedDateList2 = [[(31,8,2021),(20,8,2021),(1,8,2021),(30,12,2020)],[(6,7,2019),(6,8,2021)],[(30,12,2020),(1,9,2021),(6,7,2019),(6,8,2021)]]

-----------------------------------------------------------     

{- get_latest_nested (higher-order)  tests 10% -}

p2_test1 = TestCase (assertEqual "(get_latest_nested test 1)" 
                                   (1,10,2023)  
                                   (get_latest_nested nestedDateList1) ) 
p2_test2 = TestCase (assertEqual "(get_latest test 2)" 
                                   (1,9,2021)  
                                   (get_latest_nested nestedDateList2) ) 


tests = TestList [ TestLabel "Problem 2  - test1 " p2_test1,
                   TestLabel "Problem 2  - test2 " p2_test2
                 ] 
                  

-- shortcut to run the tests
run = runTestTT  tests