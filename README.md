# Midterm Questions 


## Sample Questions - Midterm 1


### 1) [22 pts] Short answer questions.

#### (a) [4 pts] What is the Haskell type of the below function last?

```c
last [] = Nothing
last [x] = x
last (x:xs) = last xs
```

#### (b) [3 pts] What is the type of the below value?

```c
("CptS355", [("Mon",3), ("Wed",2), ("Sat",2)])
```

#### (c) [15 pts] Which of the following Haskell expressions will give a type error? Circle the expressions that you think will give a type error. You will choose more than one. You don’t need to explain your answers.

1. filter (helper 2) [[1], [1,2], [1,2,3]]
  - where helper x y = x == y
2. filter (\x y -> x > y) [1,2,3,4,5]
3. filter (\x -> (x mod 2) == 0) [1,2,3,4,5]
4. map (\x -> (x == 4)) [1,2,3,4]
5. map (helper 2) [[1], [1,2], [1,2,3]]
  - where helper x y = x:y
6. map helper [1,2,3,4,5]
  - where helper x = x * 2
7. foldr (\x y -> x + 1) 0 [1,2,3,4,5]
8. foldr (\x xs -> x:xs) [] [1,2,3,4,5]
9. foldl (\x xs -> x:xs) [] [1,2,3,4,5]
10. foldr (\(x,y) z -> x:z) [] [(1,2), (3,4), (5,6)]

--- 

### 2) [13 pts] Consider the following Haskell function foo:

```
foo [] ind1 ind2 n = []
foo (x:xs) ind1 ind2 n | (n < ind1) || (n > ind2) = foo xs ind1 ind2 (n+1)
                       | otherwise = x:(foo xs ind1 ind2 (n+1))

```

#### (a) [3 pts] Is function foo tail recursive? (You don’t need to explain.)

#### (b) [6 pts] What will be assigned to `output1` and `output2` when the below expressions are evaluated?

- `output1 = foo [1,2,3,4,5,6,7,8,9,10] 3 8 1`
- `output2 = foo "abcdefgh" 1 4 1`
  
#### (c) [4 pts] Which of the following types is appropriate for the above foo function? (Choose one)

- `a) foo :: (Eq p, Num p) => [a] -> p -> p -> p -> [a]`
- `b) foo :: (Ord p, Num p) => [a] -> p -> p -> p -> [a]`
- `c) foo :: (Eq a, Num p) => [a] -> p -> p -> p -> [a]`
- `d) foo :: (Ord p, Num p) => [a] -> p -> p -> p -> [a]`
- `e) foo :: (Eq a, Num a) => [a] -> a -> a -> a -> [a]`
- `f) foo :: (Ord a, Num a) => [a] -> a -> a -> a -> [a]`

--- 

### 3) [5 pts] Consider the following MyList datatype.

```
data MyList a = EMPTY | CONS a (MyList a)
               deriving (Show, Eq)
```

#### What will be the value assigned to result when the following Haskell code is evaluated?

```
mystery a EMPTY = 0
mystery a (CONS x xs) | (x == a) = 1 + (mystery a xs)
                      | otherwise = mystery a xs
```

```
input = (CONS 'H' (CONS 'A' (CONS 'S' (CONS 'K' (CONS 'E' (CONS 'L' (CONS 'L' EMPTY)))))))
result = mystery 'L' input
```
---

### 4) [12 pts] Consider the ExprTree datatype we used in Lab2:

```
data ExprTree a = ELEAF a | ENODE Op (ExprTree a) (ExprTree a)
                deriving (Show, Read, Eq)

data Op = Add | Sub | Mul | Pow
        deriving (Show, Read, Eq)

```

#### In an ExprTree, interior nodes store operators and the leaves store values.

- Define a function opExists that takes an ExprTree Int tree and an operation (i.e., Op value) as input and checks if the given operation exists in the tree. It returns True if the operation exists, otherwise it returns False.

#### Example:

Given the tree:

```
      Mul
     /   \
   Sub   Sub
  /  \   /  \
Add  6  10  8
/ \
4  5
```



