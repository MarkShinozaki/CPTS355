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
--- 

### 5) [25 pts]

Define a Haskell function, fix_order, that takes a list of 2-tuples and returns a copy of the list:

- if the first element in a tuple is greater than the second, then the order of the elements in the tuple are swapped in the output;
- otherwise, the tuple is kept as it is.
For example,

```
fix_order [(3,6), (4,2), (2,1), (5,10)] returns [(3,6), (2,4), (1,2), (5,10)]
fix_order [('H','A'),('S','K'),('E','L')] returns [('A','H'),('K','S'),('E','L')]
```

#### (a) [10 pts] Give a recursive definition of the fix_order function.

#### (b) [12 pts] Re-define the fix_order function using higher order functions (map, filter, and/or foldr/foldl). Your solution should not use explicit recursion. You may need to define additional non-recursive helper function(s).

#### (c) [3 pts] Which of the following types is appropriate for the above `fix_order` function? (Choose one)

- a) `fix_order :: (Eq a, Eq b) => [(a, b)] -> [(b, a)]`
- b) `fix_order :: (Ord a, Ord b) => [(a, b)] -> [(b, a)]`
- c) `fix_order :: Eq b => [(b, b)] -> [(b, b)]`
- d) `fix_order :: Ord b => [(b, b)] -> [(b, b)]`

---

### 6) [23 pts] Consider the following datatype that we used in HW2:

```
data IEither = IString String | IInt Int
               deriving (Show, Read, Eq)
```
#### (a) [8 pts] We define a function `max_either` which takes a list of `IEither` values and returns the maximum argument value among all `IInt` and `IString` values as an `Int`.

For example:

`max_either [IString "1", IInt 2, IInt 3, IString "4", IInt 5] returns 5.`

Assume all `IEither` arguments in the input list are positive. We define the `max_either` function using recursion as follows. This solution uses the `emax` helper function.

```
max_either [] = 0
max_either (x:xs) = x `emax` (max_either xs)
```

Give the definition of the `emax` function we used above.

You can use the below `getInt` function to convert string values to `Int`:

```
getInt x = read x::Int
```

#### (b) [7 pts] Re-define the `max_either` function above using `emax` and higher order functions (`map`, `filter`, and/or `foldr/foldl`). Your solution should not use explicit recursion.

#### (c) [8 pts] Assume the following nested list of `IEither` values:

```
[[IString "1", IInt 2, IInt 3], [IString "4", IInt 5], [IInt 6, IString "7"], [IString "8"]]
```

Write a function `max_nested` which takes a nested list of `IEither` values (similar to the above list) and returns the maximum argument value among all `IInt` and `IString` values as an Int.

For example:

```
max_nested [[IString "1", IInt 2, IInt 3], [IString "4", IInt 5], [IInt 6, IString "7"], [IString "8"]]
```

returns 8.

---

## Sample Questions - Midterm 2

### 1. Matching and multiple choice questions:

#### (a) [5 pts] Match each of the following statements with the correct Python terms. If none of the terms apply to the expression, choose "None." You may choose a term for more than one expression.

1. Higher-order function
2. Anonymous function
3. List comprehension
4. None

| Python Statement                                               | Python Term              |
|----------------------------------------------------------------|--------------------------|
| `[(a+b) for a in [1,2,3] for b in [10,20,30,40,50]]`           |                          |
| `(lambda a,b: (a,b) if (a<b) else (b,a) )`                     |                          |
| `def foo(a,b,c): return (a,b,c)`                               |                          |
| `n = 2; def bar(x): n = x; return x*n`                         |                          |
| `def fun(n): return (lambda y: y*n)`                           |                          |

#### (b) [12 pts] Which of the following Haskell expressions will give a type error? Circle the ones that you think will give a type error. You may choose more than one. You don't need to explain your answers.
#### Assume Python reduce function is already imported.

- [A] list( map (lambda x: (x,x[1]), [1,2,3]) )
- [B] list( map (lambda t: t[1], [(1,2),(3,3),(5,6)]) )
- [C] list( map (lambda x,y: x+y, [1,2,3,4,5]) )
- [D] reduce (lambda x,y : x + y, [[1],[2,3,4],[5,6]])
- [E] reduce (lambda x,y : x * y, [(1,2),(3,4),(5,6)])
- [F] reduce (lambda x,y: x + 1, [(1,2),(3,4),(5,6)], 0)
- [G] list( filter (lambda x,y: x < y, [1,2,3,4,5]) )
- [H] list( filter (lambda t: t[0] == t[1] , [(1,2),(4,4),(5,6)]) )

--- 

### 2. Short answer questions:

#### (a) [8 pts] What will the following Python code print when executed?

```
z = 1
x = 11
def foo():
    z = 4
    x = 10
    def bar():
        global z
        nonlocal x
        z = 10
        x = 20
        return
    bar()
    print("x", x)
    print("z", z)
    return

foo()
print("x", x)
print("z", z)
```

#### (b) [8 pts] What will the following Python code print when executed?

```
def foo(it, fn):
    buf = []
    for c in it:
        if fn(c):
            buf.append(c)
        else:
            buf.append(c)
    return buf

it = iter([5, 2, 8, 3, -1, -3, -4, 5, 2, 0, 7])
print(foo(it, lambda x: x > 0))    # [5, 2, 8, 3, -1]
print(foo(it, lambda x: x < 0))    # [-3, -4, 5]
print(foo(it, lambda x: x == 0))   # [2, 0]

```

#### (c) [8 pts] What will the following Python code print when executed?
```
def foo(input, target, x):
    if target in input[x][1]:
        return input[x][1][target]
    else:
        if x == 0:
            return None
        else:
            return foo(input, target, input[x][0])

input = [
    (0, {"a": 10, "b": 9, "c": 10}),
    (0, {"a": 14}),
    (1, {"c": 9}),
    (1, {"a": 11, "c": 15}),
    (2, {"b": 8})
]

output1 = foo(input, "a", len(input) - 1)
output2 = foo(input, "c", len(input) - 1)
print(output1)
print(output2)
```

### 3. Python functions

Consider the following Python dictionary (`wsu_games`) we used in class exercises. In this dictionary, keys are years and values are dictionaries including the scores of WSU’s football games. The keys in these dictionaries are opponent team names and values are tuples of (WSU score, opponent score) values.

```
wsu_games = {
    2018: {"USC": (36, 39), "UTAH": (28, 24), "ORE": (34, 20), "STAN": (41, 38)},
    2019: {"ASU": (34, 38), "ORE": (35, 37), "STAN": (49, 22)},
    2020: {"ORE": (29, 43), "USC": (13, 38)},
    2021: {"USC": (14, 45), "UTAH": (13, 24), "STAN": (34, 31), "ASU": (34, 21), "ORE": (24, 38)}
}
```
#### (a) [14 pts] Define a Python function `organize_by_team` that takes a dictionary like `wsu_games` as input and reorganizes the game data. It returns a dictionary that includes opponent team names as keys and the list of score tuples as values. For example, when you organize the above dictionary, you will get the following:

```
teams = {
    'USC': [(36, 39), (13, 38), (14, 45)],
    'UTAH': [(28, 24), (13, 24)],
    'ORE': [(34, 20), (35, 37), (29, 43), (24, 38)],
    'STAN': [(41, 38), (49, 22), (34, 31)],
    'ASU': [(34, 38), (34, 21)]
}

```
your solution may use loops.

**def organize_by_team(games):**

#### (b) [14 pts] Write a Python function `count_wins` that takes the output of the `organize_by_team` function as input and counts the games WSU won against its opponents. ***Your solution may use higher order functions (map, filter, and/or reduce) and it should not use any loops.***

For example, for the `teams` dictionary below, `count_wins` should return 6.
- WSU won 6 games : 1 against UTAH, 1 against STAN, and 1 against ASU

```
teams = {
    'USC': [(36, 39), (13, 38), (14, 45)],
    'UTAH': [(28, 24), (13, 24)],
    'ORE': [(34, 20), (35, 37), (29, 43), (24, 38)],
    'STAN': [(41, 38), (49, 22), (34, 31)],
    'ASU': [(34, 38), (34, 21)]
}
```

#### (c) [9 pts] Consider the following Python code.

```
def mystery(teams):
    helper = lambda x: reduce(lambda base, s: base and s[0] > s[1], x, True)
    return list(filter(lambda t: helper(t[1]), teams.items()))
```

What will the following mystery call return for the above teams dictionary (from part b)? Write the output it will return.

`myserty(teams)`

---

### 4. [22 pts]

(a) [10 pts] Describe what occurs when each `def`, `dict`, `begin`, `end`, and `add` operation is executed in the following PostScript program. You must list the operations in the order they are executed. For each one, write which line number it occurs on and what operands it uses. The first one is done for you as an example.

#### PostScript Program:

```
/x 9 def
x
/myf {
  /x def
  x 1 add def
  1 dict
  begin
    /y x def
    y
  end
  x add
} def
myf add
```

```
Line Operation Operands 
0      def       x/ 9
__     ___       ____
__     ___       ____
__     ___       ____
__     ___       ____
__     ___       ____
__     ___       ____
__     ___       ____
__     ___       ____
__     ___       ____
```

#### (b) [6 pts] What values are on the operand stack when the program finishes execution?

#### (c) [6 pts] What is on the dictionary stack when the program finishes execution?






