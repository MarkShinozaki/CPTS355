# Lecture Notes


## [Haskell](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Lecture-Notes/HASKELL)

### [Functional Programming in Haskell](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Lecture-Notes/HASKELL/Functional-Programming-in-Haskell) 

##### 1. History of Functional Programming:
- Originates from lambda calculus by Alonzo Church (1930s).
- Notable languages: Lisp, ML, Miranda, and Haskell.
##### 2. Haskell Language Overview:
- Purely functional: no side effects.
- Lazy evaluation: computations occur only when needed.
- Statically typed with type inference.
##### 3. Installing Haskell:
- Instructions for setting up Haskell using the Haskell Platform, including GHC (Glasgow Haskell Compiler).
##### 4. Getting Started with Haskell:
- Basic syntax for writing and running Haskell programs.
- Introduction to the GHCi interpreter.
##### 5. Functions in Haskell:
- Functions are first-class citizens, meaning they can be passed as arguments and returned from other functions.
- Function types, type signatures, and function application (currying).
##### 6. Data Types:
- Basic types include `Bool`, `Char`, `Int`, `Integer`, `Double`, `String`.
- Composite types: tuples and lists.
##### 7. Bindings and Variables:
- Haskell uses immutable bindings.
- Bindings are order-independent and lazy.
##### 8. Pattern Matching:
- A powerful feature in Haskell used for decomposing data structures like lists and tuples.
##### 9. Conditional Expressions:
- `if/else` statements and guards for conditionally executing code.
##### 10. Recursion:
- Central to Haskell, used for iteration and list processing.
- Examples include calculating factorials, summing lists, and more complex recursive functions like `reverse` and `append`.
##### 11. Higher-Order Functions:
- Functions that take other functions as arguments or return them as results.
- Examples include map, filter, and fold.
##### 12. Let Expressions and Where Clauses:
- Scoping mechanisms to introduce local bindings within expressions and functions.
### Key Takeaways:
- Haskell’s Purity: Haskell is a pure functional language, which means functions do not have side effects, and variables are immutable.
- **Recursion Over Iteration**: In Haskell, loops are replaced by recursion.
- **Lazy Evaluation**: Haskell’s lazy evaluation allows for more efficient programs and the creation of infinite data structures.
- **Strong Typing**: Haskell’s type system catches many errors at compile time, reducing runtime bugs.


### [Haskell Notes Part 2](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Lecture-Notes/HASKELL/Haskell-Notes-Part2)

##### 1, Tail Recursion:
- **Memory Efficiency**: Discussion on how recursion can be optimized using tail recursion to reduce stack space usage.
- **Tail Call Optimization**: Explanation of how Haskell handles tail recursive calls by reusing stack frames, making them as efficient as loops.
- **Example**: The transformation of a simple recursive addup function into a tail-recursive version to enhance performance.

##### 2. Recursive Functions:

- **Reverse Function**: Comparison between a basic recursive reverse function and an optimized version using tail recursion.
- **Length of Sublists**: Introduction to functions that calculate the lengths of sublists within a list using recursion.

##### 3. Higher-Order Functions:

- **Map**: How the map function applies a given operation to each element in a list, transforming it into a new list.
- **Filter**: Usage of the filter function to extract elements from a list based on a predicate function.
- **Fold (foldr and foldl)**: Introduction to the foldr and foldl functions, which reduce a list to a single value by applying a function recursively.

##### 4. Anonymous Functions (Lambdas):

- Introduction to defining anonymous functions using the \ syntax.
- Use of lambdas in conjunction with higher-order functions to create more concise and readable code.

##### 5. Function Composition and Application:

- **Function Composition**: Use of the (.) operator to combine multiple functions into a single pipeline, allowing for more elegant and concise expressions.
- **Function Application with Lower Precedence**: Introduction to the $ operator to reduce parentheses in complex expressions, improving readability.

##### 6. Combining Recursive Patterns:

- How to combine map, filter, and fold to perform complex operations, such as summing the square roots of positive numbers in a list or nested lists.

### Key Takeaways:
- **Tail Recursion**: Optimizes recursive functions by reusing stack frames, leading to more memory-efficient code.
- **Higher-Order Functions**: Haskell’s built-in higher-order functions like `map`, `filter`, and `fold` simplify many common programming patterns.
- **Function Composition**: Enables the creation of pipelines of operations, leading to more elegant and modular code.


### [Haskell Notes Part 3](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Lecture-Notes/HASKELL/Haskell-Notes-Part3)

##### 1. Type Synonyms:
- Definition: Type synonyms allow the creation of new names for existing types, making code more readable and semantically meaningful.
**Examples**:

```
type Point = (Float, Float)
type Line = (Point, Point)
```

##### 2. Data Type Mechanism:

- **Custom Data Types**: Introduction to Haskell's data type mechanism, which allows the creation of new types using value constructors.
- **Pattern Matching**: Utilization of pattern matching to scrutinize and decompose values of custom data types.

##### 3. Parameterized Data Types:

- **Polymorphism**: Data types can be parameterized, allowing them to hold values of any type.

- **Examples**:

```
data Maybe a = Just a | Nothing
```

##### 4. The 'Maybe' Type:
- Optional Values: The Maybe type is used to represent computations that might fail or return no result, similar to null in other languages but safer.

- **Usage Examples**:

```
head' :: [a] -> Maybe a
head' [] = Nothing
head' (x:xs) = Just x
```

##### 5. Recursive Data Types:

- Recursive Structures: Recursive data types enable the creation of complex data structures like lists and trees without explicit pointers.
  
- **Tree Example**:

```
data Tree a = Leaf a | Node (Tree a) (Tree a)
```

##### 6. Processing Recursive Types:
- **Pattern Matching and Recursion**: Recursive functions are used to traverse and process recursive data types.
- **Examples**:
  - **Counting Leaves**:
```
nLeaves :: Tree a -> Int
nLeaves (Leaf _) = 1
nLeaves (Node t1 t2) = nLeaves t1 + nLeaves t2
```
**Preorder Traversal**:
```
preOrderTri :: TriTree a -> [a]
preOrderTri (TriLeaf x) = [x]
preOrderTri (TriNode x t1 t2 t3) = [x] ++ preOrderTri t1 ++ preOrderTri t2 ++ preOrderTri t3
```
### Key Takeaways:
- **Type Synonyms**: Enhance code readability by giving meaningful names to complex types.
- **Recursive Data Types**: Crucial for representing data structures like trees, lists, and graphs in a functional paradigm.
- **Pattern Matching**: Integral to processing and deconstructing data types in a clean and efficient manner.
- **The 'Maybe' Type**: Provides a safe way to handle optional values, avoiding the pitfalls of null references found in other languages.













### [Why Funcional Programming](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Lecture-Notes/HASKELL/Why-Functional-Programming)

### [Higher Order Functions Class Excercise](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Lecture-Notes/HASKELL/Higher-Order-Functions-Class-Excercises)

### [Sample Functions](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Lecture-Notes/HASKELL/Sample-Functions)




---


## [Python](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Lecture-Notes/PYTHON)

### [Python - Part 1 - Basics](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Lecture-Notes/PYTHON/Python%20-%20Part1%20-%20Basics)

### [Python Part 2](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Lecture-Notes/PYTHON/Python%20-%20Part2)

### [Python Intro](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Lecture-Notes/PYTHON/Python%20Intro)








