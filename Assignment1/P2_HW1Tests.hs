{-  To run the tests type "run" at the Haskell prompt.  -} 

module P2_HW1tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW1


-- later_day tests
p2a_test1 = TestCase (assertEqual "(later_day test 1" 
                                   (1,8,2023)  
                                   (later_day (1,8,2023) (20,7,2023)) ) 
p2a_test2 = TestCase (assertEqual "(later_day test 2)" 
                                   (6,7,2023) 
                                   (later_day (6,7,2023) (30,12,2021)) ) 
p2a_test3 = TestCase (assertEqual "(later_day test 3)" 
                                   (1,1,2023) 
                                  (later_day (1,1,2023) (1,1,2023)) ) 



-- get_latest tests
dateList1 = [(31,8,2023),(20,7,2023),(1,9,2023),(30,12,2021),(6,7,2020),(6,7,2023)]
dateList2 = [(31,8,2023),(20,8,2023),(1,8,2023),(30,12,2021),(6,7,2020),(6,8,2023)]
dateList3 = [(31,8,2023),(20,8,2023),(1,8,2023),(30,12,2021),(6,7,2020),(6,8,2023),(30,12,2021),(1,9,2023),(6,7,2020),(6,8,2023)]
p2b_test1 = TestCase (assertEqual "(get_latest test 1)" 
                                   (1,9,2023)  
                                   (get_latest dateList1) ) 
p2b_test2 = TestCase (assertEqual "(get_latest test 2)" 
                                   (31,8,2023)  
                                   (get_latest dateList2) ) 
p2b_test3 = TestCase (assertEqual "(get_latest test 3)" 
                                   (1,9,2023)  
                                   (get_latest dateList3) ) 

-- get_latest_nested tests

nestedDateList1 = [[(31,8,2022),(20,7,2023),(25,9,2023)],[(1,10,2023)],[(30,12,2022),(6,7,2021),(6,7,2023)]]
nestedDateList2 = [[(31,8,2021)],[(20,8,2021),(1,8,2021),(30,12,2020)],[(6,7,2019),(6,8,2021)]]
nestedDateList3 = [[(31,8,2021),(20,8,2021),(1,8,2021),(30,12,2020)],[(6,7,2019),(6,8,2021)],[(30,12,2020),(1,9,2021),(6,7,2019),(6,8,2021)]]

p2c_test1 = TestCase (assertEqual "(get_latest_nested test 1)" 
                                   (1,10,2023)  
                                   (get_latest_nested nestedDateList1) ) 
p2c_test2 = TestCase (assertEqual "(get_latest test 2)" 
                                   (1,9,2021)  
                                   (get_latest_nested nestedDateList3) ) 

                            
tests = TestList [                  
                   TestLabel "Problem 2a- test1 " p2a_test1,
                   TestLabel "Problem 2a- test2 " p2a_test2,  
                   TestLabel "Problem 2a- test3 " p2a_test3,
                   TestLabel "Problem 2b- test1 " p2b_test1,
                   TestLabel "Problem 2b- test2 " p2b_test2,  
                   TestLabel "Problem 2b- test3 " p2b_test3,
                   TestLabel "Problem 2c- test1 " p2c_test1,
                   TestLabel "Problem 2c- test2 " p2c_test2
                 ] 
                  
-- shortcut to run the tests
run = runTestTT  tests