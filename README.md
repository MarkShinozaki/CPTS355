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

Reflection on Functional Programming:

Discussion Points: Students are encouraged to reflect on their biggest takeaways from learning Haskell, challenges faced, and future plans to explore functional programming further.
Importance of Functional Programming:

Key Features:
Heavy reliance on recursion.
Functions as first-class objects.
Use of higher-order functions.
Unique data types via constructs like data.
Reasons for Study: Functional programming helps in writing correct, elegant, and efficient software and has historically been ahead of its time, influencing many modern programming practices.
Historical Impact of Functional Languages:

Pioneering Features: Concepts such as garbage collection, generics, higher-order functions, and type inference were pioneered by functional languages long before they became mainstream in languages like Java, C#, and Python.
Recursion: Initially controversial in the 1960s, recursion is now a fundamental concept in many modern programming languages.
Future of Functional Programming:

Emerging Trends: The lecture predicts that pattern-matching, currying, and other functional paradigms may become more mainstream in the future.
Recent Developments in Functional Programming:

Popular Functional Languages: The lecture mentions several modern functional languages such as Clojure, Erlang, F#, Haskell, OCaml, and Scala, highlighting their industry adoption and use cases.
Adoption of Functional Concepts: Languages like C#, Java, and frameworks like MapReduce/Hadoop are increasingly adopting functional programming features.
Combining Languages:

Haskell, Python, Java, and Postscript: These languages are presented as a complementary set, each excelling in different paradigms (functional, dynamic, and object-oriented programming).
Real-World Programming Considerations:

Real Programming Needs: The lecture acknowledges that real programming extends beyond language constructs to include file I/O, string operations, floating-point arithmetic, graphics, project management, testing frameworks, and more.
Practical Considerations:

Choosing a Language: When deciding on a programming language, factors such as available libraries, tools, job prospects, industry standards, and personal familiarity are important considerations.
Key Takeaways:
Functional Programming's Influence: Functional programming has significantly influenced modern software development, introducing many features now common in mainstream languages.
Industry Adoption: The concepts pioneered by functional languages are increasingly being integrated into widely-used programming languages, demonstrating the relevance of functional programming principles.
Language Choice: The choice of programming language depends not only on its features but also on practical considerations like available tools, industry demand, and job opportunities.



### [Higher Order Functions Class Excercise](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Lecture-Notes/HASKELL/Higher-Order-Functions-Class-Excercises)

Higher-Order Functions:

Definition: Functions that take other functions as arguments or return them as results.
Key Functions:
map: Applies a function to each element in a list.
filter: Selects elements from a list that satisfy a predicate.
foldr/foldl: Reduces a list to a single value by recursively applying a function.
Class Exercises:

get_seconds:

Task: Extract the second element from each tuple in a list.
Key Function: map
Example:

```
> get_seconds [(1,'H'),(2,'A'),(3,'S'),(4,'K'),(5,'E'),(6,'L'),(7,'L')]
"HASKELL"
```
get_outof_range:

Task: Return elements from a list that are less than a minimum value or greater than a maximum value.
Key Function: filter
Example:

```
> get_outof_range (-5) 5 [10,5,0,1,2,-5,-10]
[10,-10]
```
count_outof_range:

Task: Count the number of elements in a list that are out of a specified range.
Key Function: filter, length
Example:

```
> count_outof_range (-5) 5 [10,5,0,1,2,-5,-10]
2
```
nested_count_outof_range:

Task: Count the number of out-of-range elements in a nested list structure.
Key Function: map, filter, length
Example:

```
> nested_count_outof_range (-5) 5 [[10,5,0,1,2,-5,-10],[4,2,-1,3,-4,8,5,9,4,10],[-5,-6,7,8]]
8
```

find_routes:

Task: Identify bus routes that stop at a specified location using higher-order functions.
Key Function: filter, elem
Example:


### [Sample Functions](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Lecture-Notes/HASKELL/Sample-Functions)

#### Sample Functions:

- The `SampleFunctions.hs` file contains various Haskell functions that perform simple computations or data manipulations. These functions are the target of the test cases defined in the HUnit test file.
- **Examples of Possible Functions**:
  - A function to calculate the sum of a list.
  - A function to find the maximum value in a list.
  - A function to reverse a string.

### Key Takeaways:
- Elimination of Explicit Recursion: Haskell's higher-order functions allow for elegant solutions to common programming problems without resorting to explicit recursion.
- Function Composition: By combining functions like map, filter, and fold, complex operations can be expressed in a clear and concise manner.
Abstraction: Higher-order functions encapsulate common patterns of computation, enabling code that is both reusable and easy to reason about.

---


## [Python](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Lecture-Notes/PYTHON)

### [Python - Part 1 - Basics](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Lecture-Notes/PYTHON/Python%20-%20Part1%20-%20Basics)

Python Lists:
What is a List?

Definition: A list is an ordered sequence of elements, which can be of any type (integers, strings, etc.).
Indexing: Lists are zero-indexed, meaning the first element has an index of 0.
Slicing: Allows extraction of sublists using the syntax mylist[start:end].
List Operations:

Creation: Lists can be created using square brackets ([]) or the list() constructor.
Querying:
Access single elements using mylist[index].
Retrieve sublists using slicing.
Check membership using in.
Count occurrences of an element using mylist.count(x).
Modification:
Insertion: Use append(), extend(), or insert().
Removal: Use remove(), pop().
Replacement: Replace elements or sublists by assigning to an index or slice.
Rearrangement: Sort with sort() or reverse with reverse().
Looping and Iteration:

Iterate over lists using for loops.
Use the range() function for generating sequences of numbers.
Anonymous Functions (lambda):

Create small, unnamed functions using lambda for quick, in-place operations.
Python Dictionaries:
What is a Dictionary?

Definition: A dictionary is a collection of key-value pairs, where keys are unique and map to values.
Key Characteristics:
Keys must be immutable (e.g., integers, strings, tuples).
Values can be of any type.
No duplicate keys are allowed.
Dictionary Operations:

Creation: Create using {} or dict().
Accessing: Access values using dict[key].
Modification: Add or update key-value pairs using dict[key] = value.
Iteration: Use for loops to iterate over keys, values, or key-value pairs.
Deletion: Remove pairs using del dict[key] or pop(key).
Common Use Cases:

Lookup Tables: Quickly find a value based on a unique key.
Grouping Data: Organize related information into key-value pairs.
Counting Elements: Use dictionaries to count occurrences of items.
Key Takeaways:
Lists are versatile and can handle various types of data, making them ideal for sequences where order matters.
Dictionaries are optimized for quick lookups and are essential for situations where data is associated with unique keys.
Both lists and dictionaries support various operations that allow for easy data manipulation, querying, and iteration, making them powerful tools in Python programming.



### [Python Part 2](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Lecture-Notes/PYTHON/Python%20-%20Part2)





















### [Python Intro](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Lecture-Notes/PYTHON/Python%20Intro)








