module P5b_HW2tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW2

-- Sample tree examples given in the assignment prompt; 
-- make sure to provide your own tree examples when you write your own tests. 
-- Your trees should have minimum 4 levels (including the leaves). 

t1 = BNode 9 (BNode 6 (BNode 4 (BLeaf 2) (BLeaf 5)) (BLeaf 8)) (BNode 13 (BLeaf 11) (BLeaf 14))
t2 = BNode 9 (BNode 6 (BNode 4 (BLeaf 2) (BLeaf 5)) (BLeaf 10)) (BNode 13 (BLeaf 11) (BLeaf 14))

t3 =  BNode 'M' (BNode 'D' (BLeaf 'A') (BNode 'G' (BLeaf 'F') (BLeaf 'K'))) 
                    (BNode 'W' (BNode 'T' (BNode 'Q' (BLeaf 'P') (BLeaf 'S')) (BLeaf 'U')) (BLeaf 'Z'))
t4 =  BNode 'M' (BNode 'D' (BLeaf 'A') (BNode 'G' (BLeaf 'F') (BLeaf 'K'))) 
                    (BNode 'W' (BNode 'T' (BNode 'O' (BLeaf 'P') (BLeaf 'S')) (BLeaf 'U')) (BLeaf 'Z'))
                  
t5 = BNode 8 (BLeaf 5) 
          (BNode 20 (BNode 15 (BNode 11 (BLeaf 9) (BLeaf 14)) (BLeaf 17)) (BNode 25 (BLeaf 21) (BLeaf 30)))

t6 = BNode 8 (BLeaf 5) 
          (BNode 20 (BNode 15 (BNode 11 (BLeaf 9) (BLeaf 14)) (BLeaf 17)) (BNode 25 (BLeaf 19) (BLeaf 30)))

-- MY OWN TESTS --
t7 = BNode 50 (BNode 30 (BNode 20 (BLeaf 10) (BLeaf 25)) (BLeaf 40))
              (BNode 70 (BLeaf 60) (BNode 80 (BLeaf 75) (BLeaf 90)))

t8 = BNode 'X' (BNode 'D' (BNode 'A' (BLeaf 'A') (BLeaf 'C')) (BNode 'G' (BLeaf 'F') (BLeaf 'K')))
               (BNode 'W' (BNode 'T' (BNode 'Q' (BLeaf 'P') (BLeaf 'S')) (BLeaf 'U')) (BLeaf 'Z'))

t9 = BNode 100 (BNode 50 (BNode 25 (BLeaf 10) (BLeaf 40)) (BNode 75 (BLeaf 60) (BLeaf 90)))
               (BNode 150 (BNode 125 (BLeaf 110) (BLeaf 140)) (BNode 175 (BLeaf 160) (BLeaf 190)))


------------------

level_t1 = LNode (1,9) (LNode (2,6) (LNode (3,4) (LLeaf (4,2)) (LLeaf (4,5))) (LLeaf (3,8))) (LNode (2,13) (LLeaf (3,11)) (LLeaf (3,14)))
level_t3 = LNode (1,'M') (LNode (2,'D') (LLeaf (3,'A')) (LNode (3,'G') (LLeaf (4,'F')) (LLeaf (4,'K')))) (LNode (2,'W') (LNode (3,'T') (LNode (4,'Q') (LLeaf (5,'P')) (LLeaf (5,'S'))) (LLeaf (4,'U'))) (LLeaf (3,'Z')))
level_t5 = LNode (1,8) (LLeaf (2,5)) (LNode (2,20) (LNode (3,15) (LNode (4,11) (LLeaf (5,9)) (LLeaf (5,14))) (LLeaf (4,17))) (LNode (3,25) (LLeaf (4,21)) (LLeaf (4,30))))

-- MY OWN TESTS --
level_t7 = LNode (1,50) (LNode (2,30) (LNode (3,20) (LLeaf (4,10)) (LLeaf (4,25))) (LLeaf (3,40))) (LNode (2,70) (LLeaf (3,60)) (LNode (3,80) (LLeaf (4,75)) (LLeaf (4,90))))
level_t8 = LNode (1,'X') (LNode (2,'D') (LNode (3,'A') (LLeaf (4,'A')) (LLeaf (4,'C'))) (LNode (3,'G') (LLeaf (4,'F')) (LLeaf (4,'K')))) (LNode (2,'W') (LNode (3,'T') (LNode (4,'Q') (LLeaf (5,'P')) (LLeaf (5,'S'))) (LLeaf (4,'U'))) (LLeaf (3,'Z')))
level_t9 = LNode (1,100) (LNode (2,50) (LNode (3,25) (LLeaf (4,10)) (LLeaf (4,40))) (LNode (3,75) (LLeaf (4,60)) (LLeaf (4,90)))) (LNode (2,150) (LNode (3,125) (LLeaf (4,110)) (LLeaf (4,140))) (LNode (3,175) (LLeaf (4,160)) (LLeaf (4,190))))
-----------------------------------------------------------     
{- createtree tests 10% -}
p5b_test1 = TestCase (assertEqual "createtree test-1"  
                                   level_t1
                                   (createtree t1) ) 
p5b_test2 = TestCase (assertEqual "createtree test-2" 
                                   level_t3
                                   (createtree t3) ) 
p5b_test3 = TestCase (assertEqual "createtree test-3"  
                                    level_t5
                                   (createtree t5) ) 

-- MY OWN TESTS --
p5b_test7 = TestCase (assertEqual "createtree test-7"
                                  level_t7
                                  (createtree t7) )
p5b_test8 = TestCase (assertEqual "createtree test-8"
                                  level_t8
                                  (createtree t8) )
p5b_test9 = TestCase (assertEqual "createtree test-9"
                                  level_t9
                                  (createtree t9) )

tests = TestList [ TestLabel "Problem 5a - test1 " p5b_test1,
                   TestLabel "Problem 5a - test2 " p5b_test2,
                   TestLabel "Problem 5a - test3 " p5b_test3,
                   -- MY OWN TESTS --
                   TestLabel "Problem 5b - test7 " p5b_test7,
                   TestLabel "Problem 5b - test8 " p5b_test8,
                   TestLabel "Problem 5b - test9 " p5b_test9
                 ] 
                  

-- shortcut to run the tests
run = runTestTT  tests