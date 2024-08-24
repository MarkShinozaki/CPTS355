module P5a_HW2tests
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



t9 = BNode 100 (BNode 50 (BNode 25 (BLeaf 10) (BLeaf 40)) (BNode 75 (BLeaf 60) (BLeaf 90)))
               (BNode 150 (BNode 125 (BLeaf 110) (BLeaf 140)) (BNode 175 (BLeaf 160) (BLeaf 190)))

----------------------

-----------------------------------------------------------     
{- isBSTtree tests 10% -}
p5a_test1 = TestCase (assertEqual "isBSTtree test-1"  
                                   True
                                   (isBSTtree t1) ) 
p5a_test2 = TestCase (assertEqual "isBSTtree test-2" 
                                   False 
                                   (isBSTtree t2) ) 
p5a_test3 = TestCase (assertEqual "isBSTtree test-3"  
                                    True
                                   (isBSTtree t3) ) 
p5a_test4 = TestCase (assertEqual "isBSTtree test-4" 
                                   False  
                                   (isBSTtree t4) ) 
p5a_test5 = TestCase (assertEqual "isBSTtree test-5"  
                                   True
                                   (isBSTtree t5) ) 
p5a_test6 = TestCase (assertEqual "isBSTtree test-6" 
                                   False 
                                   (isBSTtree t6) ) 

-- MY OWN TESTS --
p5a_test7 = TestCase (assertEqual "isBSTtree test-7"
                                  True
                                  (isBSTtree t7) )

p5a_test9 = TestCase (assertEqual "isBSTtree test-9"
                                  True
                                  (isBSTtree t9) )

----------------------


tests = TestList [ TestLabel "Problem 5a - test1 " p5a_test1,
                   TestLabel "Problem 5a - test2 " p5a_test2,
                   TestLabel "Problem 5a - test3 " p5a_test3,
                   TestLabel "Problem 5a - test4 " p5a_test4,
                   TestLabel "Problem 5a - test5 " p5a_test5,
                   TestLabel "Problem 5a - test6 " p5a_test6,
                   TestLabel "Problem 5a - test7 " p5a_test7,
                   TestLabel "Problem 5a - test9 " p5a_test9
                 ]


-- shortcut to run the tests
run = runTestTT  tests