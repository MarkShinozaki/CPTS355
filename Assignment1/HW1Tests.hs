{- Example of using the HUnit unit test framework.  See  http://hackage.haskell.org/package/HUnit for additional documentation.
To run the tests type "run" at the Haskell prompt.  -} 

module HW1Tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW1

log_input = [("CptS355", [("Mon",3), ("Wed",2), ("Sat",2)]) ,
             ("CptS360", [("Mon",3), ("Tue",2), ("Wed",2), ("Fri",10)]),
             ("CptS321", [("Tue",2), ("Wed",2), ("Thu",3)]),
             ("CptS322", [("Tue",1), ("Thu",5), ("Sat",2)]) ]

-- Create  two test cases for each problem 

-- P1 - running_totals – 10%

p1_test1 = TestCase (assertEqual "running_totals - test 1" 
                                  ([2,4,7,11,16,22,29,37,46,56]) 
                                  (runningTotals [2,2,3,4,5,6,7,8,9,10])) 

p1_test2 = TestCase (assertEqual "running_totals - test 2" 
                                  ([-1,-3,-6,-10,-15,-21,-28,-36,-45,-55]) 
                                  (runningTotals [-1,-2,-3,-4,-5,-6,-7,-8,-9,-10]))



-- P2  (a)  later_day – 8%  (b)  get_latest – 8%   (c)  get_latest_nested – 10%

-- (a)
p2a_test3 = TestCase (assertEqual "(later_day test 4)" 
                                  (1,8,2023)  
                                  (later_day (20,7,2023) (1,8,2023)) ) 

p2a_test4 = TestCase (assertEqual "(later_day test 5)" 
                                  (20,7,2023)  
                                  (later_day (1,8,2023) (20,7,2023)) ) 

-- (b)

dateList6 = [(5,5,2023),(10,10,2023),(15,15,2023)]
dateList7 = [(1,1,2023),(2,2,2023)]

p2b_test5 = TestCase (assertEqual "(get_latest test 6)" 
                                  (15,15,2023)  
                                  (get_latest dateList6) ) 

p2b_test6 = TestCase (assertEqual "(get_latest test 7)" 
                                  (2,2,2023)  
                                  (get_latest dateList7) ) 


-- (c)

nestedDateList6 = [[(5,5,2023),(10,10,2023),(15,15,2023)], [(1,1,2023)]]
nestedDateList7 = [[(1,1,2023),(2,2,2023)], [(3,3,2023)], []]

p2c_test7 = TestCase (assertEqual "(get_latest_nested test 6)" 
                                  (15,15,2023)  
                                  (get_latest_nested nestedDateList6) ) 

p2c_test8 = TestCase (assertEqual "(get_latest_nested test 7)"  
                                  (3,3,2023)  
                                  (get_latest_nested nestedDateList7) ) 



-- P3  study_list ; 10%


p3_test9 = TestCase (assertEqual "study_list-test3" 
                                  ["CptS101"]
                                  (study_list log_input "Mon") ) 

p3_test10 = TestCase (assertEqual "study_list-test4" 
                                  ["CptS101", "CptS202", "CptS303", "CptS404"]
                                  (study_list log_input "Sat") ) 



-- P4  get_indexes – 12%
p4_test11 = TestCase (assertEqual "get_indexes-test4" 
                          [0,6,9]  
                          (get_indexes "banana" 'b') ) 

p4_test12 = TestCase (assertEqual "get_indexes-test5" 
                          [3,4,5]  
                          (get_indexes [5,5,5,5,5,5,5] 5) ) 


-- P5  group_items – 14 %
p5_test13 = TestCase (assertEqual "group_items-test4" 
                          [[1,2,3,4,5,6,7,8,9,10,11,12]]  
                          (group_items [1,2,3,4,5,6,7,8,9,10,11,12]) ) 

p5_test14 = TestCase (assertEqual "group_items-test5" 
                          ["abcdefghijklmno", "pqrstuwxyz012"]  
                          (group_items "abcdefghijklmnopqrstuwxyz012") ) 


-- P6  get_segment – 18%

p6_test15 = TestCase (assertEqual "get_segment-test4"  
                         "flu"  
                         (get_segment ('(',')') "I got the (flu) vaccine(!)" ) ) 

p6_test16 = TestCase (assertEqual "get_segment-test5"  
                          [5,6,7,8,10,11]  
                          (get_segment (0,9) [0,1,2,3,4,0,5,6,7,8,10,11] ) ) 


-- add the test cases you created to the below list. 
tests = TestList [ TestLabel "Problem 1- test1 " p1_test1,
                   TestLabel "Problem 1- test2 " p1_test2,
                   TestLabel "Problem 2a- test3 " p2a_test3,
                   TestLabel "Problem 2a- test4 " p2a_test4,  
                   TestLabel "Problem 2b- test5 " p2b_test5,
                   TestLabel "Problem 2b- test6 " p2b_test6,
                   TestLabel "Problem 2c- test7 " p2c_test7,  
                   TestLabel "Problem 2c- test8 " p2c_test8,
                   TestLabel "Problem 3- test9 " p3_test9,
                   TestLabel "Problem 3- test10 " p3_test10,
                   TestLabel "Problem 4- test11 " p4_test11,
                   TestLabel "Problem 4- test12 " p4_test12,
                   TestLabel "Problem 5- test13 " p5_test13,
                   TestLabel "Problem 5- test14 " p5_test14,
                   TestLabel "Problem 6- test15 " p6_test15,
                   TestLabel "Problem 6- test16 " p6_test16
                   
                 ] 
                  
-- shortcut to run the tests
run = runTestTT  tests