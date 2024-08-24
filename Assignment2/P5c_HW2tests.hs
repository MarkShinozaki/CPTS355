module P5c_HW2tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW2

-- Sample tree examples given in the assignment prompt; 
-- make sure to provide your own tree examples when you write your own tests. 
-- Your trees should have minimum 4 levels (including the leaves). 

level_t1 = LNode (1,9) (LNode (2,6) (LNode (3,4) (LLeaf (4,2)) (LLeaf (4,5))) (LLeaf (3,8))) (LNode (2,13) (LLeaf (3,11)) (LLeaf (3,14)))
level_t3 = LNode (1,'M') (LNode (2,'D') (LLeaf (3,'A')) (LNode (3,'G') (LLeaf (4,'F')) (LLeaf (4,'K')))) (LNode (2,'W') (LNode (3,'T') (LNode (4,'Q') (LLeaf (5,'P')) (LLeaf (5,'S'))) (LLeaf (4,'U'))) (LLeaf (3,'Z')))
level_t5 = LNode (1,8) (LLeaf (2,5)) (LNode (2,20) (LNode (3,15) (LNode (4,11) (LLeaf (5,9)) (LLeaf (5,14))) (LLeaf (4,17))) (LNode (3,25) (LLeaf (4,21)) (LLeaf (4,30))))

-- MY OWN TESTS --
level_t7 = LNode (1,50) (LNode (2,30) (LNode (3,20) (LLeaf (4,10)) (LLeaf (4,25))) (LLeaf (3,40))) (LNode (2,70) (LLeaf (3,60)) (LNode (3,80) (LLeaf (4,75)) (LLeaf (4,90))))
level_t9 = LNode (1,100) (LNode (2,50) (LNode (3,25) (LLeaf (4,10)) (LLeaf (4,40))) (LNode (3,75) (LLeaf (4,60)) (LLeaf (4,90)))) (LNode (2,150) (LNode (3,125) (LLeaf (4,110)) (LLeaf (4,140))) (LNode (3,175) (LLeaf (4,160)) (LLeaf (4,190))))


-----------------------------------------------------------     
{- binarysearch tests 12% -}
p5c_test1 = TestCase (assertEqual "binarysearch test-1"  
                                   (Just (4,2))
                                   (binarysearch level_t1 2) ) 

p5c_test2 = TestCase (assertEqual "binarysearch test-2" 
                                   (Just (3,4))
                                   (binarysearch level_t1 4) ) 
p5c_test3 = TestCase (assertEqual "binarysearch test-3"  
                                   (Just (4,'U'))
                                   (binarysearch level_t3 'U') ) 
p5c_test4 = TestCase (assertEqual "binarysearch test-4" 
                                   (Nothing) 
                                   (binarysearch level_t3 'X') ) 
p5c_test5 = TestCase (assertEqual "binarysearch test-5"  
                                   (Just (5,14))
                                   (binarysearch level_t5 14) ) 
p5c_test6 = TestCase (assertEqual "binarysearch test-6" 
                                   (Nothing)
                                   (binarysearch level_t5 99) ) 
-- MY OWN TESTS --
p5c_test7 = TestCase (assertEqual "binarysearch test-7"
                                  (Just (4,25))
                                  (binarysearch level_t7 25) )

p5c_test9 = TestCase (assertEqual "binarysearch test-9"
                                  (Just (4,60))
                                  (binarysearch level_t9 60) )
p5c_test10 = TestCase (assertEqual "binarysearch test-10"
                                   (Nothing)
                                   (binarysearch level_t9 99) )

tests = TestList [ TestLabel "Problem 5a - test1 " p5c_test1,
                   TestLabel "Problem 5a - test2 " p5c_test2,
                   TestLabel "Problem 5a - test3 " p5c_test3,
                   TestLabel "Problem 5a - test4 " p5c_test4,
                   TestLabel "Problem 5a - test5 " p5c_test5,
                   TestLabel "Problem 5a - test6 " p5c_test6,
                   -- MY OWN TESTS --
                   TestLabel "Problem 5c - test7 " p5c_test7,
                   TestLabel "Problem 5c - test9 " p5c_test9,
                   TestLabel "Problem 5c - test10 " p5c_test10
                 ] 
                  

-- shortcut to run the tests
run = runTestTT  tests