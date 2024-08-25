# Assignments 


## [Assignment 0](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Assignments/Assignment0)
### Purpose:

The main purpose of this assignment is to ensure that students can successfully set up their Haskell development environment, write simple Haskell functions, and test these functions using HUnit, a unit testing framework for Haskell.

### Key Topics Covered:

#### 1. Haskell Setup and Configuration:

- Installation and configuration of the GHC (Glasgow Haskell Compiler) and HUnit library.

#### 2. Basic Haskell Programming:

- Writing and compiling simple Haskell programs.
- Understanding how to load Haskell modules and run Haskell functions using the GHCi (GHC interactive) environment.

#### 3. Unit Testing with HUnit:

- Introduction to the HUnit testing framework for Haskell.
- Writing and running unit tests for Haskell functions.
- Understanding the output of test cases (e.g., cases tried, errors, failures).

---

## [Assignment 1](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Assignments/Assignment1)

### Overview:

The assignment consists of multiple Haskell files, including function implementations and corresponding unit tests. The assignment is structured to guide students through a series of problems that focus on core functional programming concepts using Haskell. The problems are designed to progressively challenge students, reinforcing concepts such as recursion, higher-order functions, list manipulation, and type handling.

### Assignment Breakdown:

#### 1. HW1.hs:

This file likely contains the implementations of the functions required for the assignment. Each problem is expected to be solved using Haskell's functional programming paradigms, including recursion, pattern matching, and higher-order functions.

#### 2. HW1Tests.hs and P1_HW1Tests.hs to P6_HW1Tests.hs:

These files are test scripts written using HUnit, a unit testing framework for Haskell. Each of these test files corresponds to a specific problem in the assignment (P1 to P6), providing automated tests to ensure that the solutions implemented in HW1.hs work correctly.
The tests help students verify the correctness of their code by comparing the output of their functions to the expected results.

### Summary of Topics Covered:

#### 1. Recursion:

- The problems likely require recursive approaches to solve, which is a fundamental concept in functional programming. Recursion replaces traditional iterative loops and is essential for processing lists and other data structures in Haskell.

#### 2. Higher-Order Functions:

- Functions that take other functions as arguments or return them as results are central to Haskell programming. This assignment may include problems that utilize functions like map, fold, and filter.

#### 3. List Manipulation:

- Many functional programming problems involve processing lists. Students are expected to manipulate lists, apply transformations, and accumulate results using both built-in and custom functions.

#### 4. Pattern Matching:

- Pattern matching is a powerful feature in Haskell that simplifies the process of handling different data structures or conditions. It is likely used throughout the assignment to decompose data structures and handle edge cases.

#### 5. Type Handling:

- Understanding and using Haskell’s strong, static type system is critical. The problems likely emphasize defining functions with specific types, ensuring type safety, and leveraging type inference.

#### 6. Unit Testing with HUnit:

- The test files provide an opportunity to practice writing and running unit tests. Understanding how to create test cases and interpret the results is crucial for verifying the correctness of Haskell code.

--- 

## [Assignment 2](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Assignments/Assignment2)

#### 1. Problem 1: group_items (Tail-Recursive) - 10%

- **Task**: Implement a function that groups items in a list based on increasing group sizes.

- **Example**:
```
> group_items [1,2,3,4,5,6,7,8,9,10,11,12]
[[1],[2,3],[4,5,6],[7,8,9,10],[11,12]]
```
- **Concepts Covered**: Tail recursion, list processing, and grouping algorithms.

#### 2. Problem 2: `get_latest_nested` (Higher-Order Function) - 10%

- **Task**: Find the most recent date from a nested list of dates without using recursion.
Example:

```
> get_latest_nested [[(31,8,2022),(20,7,2023)], [(1,10,2023)], [(6,7,2023)]]
(1,10,2023)
```

- **Concepts Covered**: Higher-order functions (`map`, `foldr`, `filter`), list manipulation.

#### 3. Problem 3: study_list (Higher-Order Function) - 12%

- **Task**: Given a study log, find all courses studied on a specific day using higher-order functions.

- **Example**:

```
> study_list log_input "Sat"
["CptS355", "CptS322"]
```

- **Concepts Covered**: Data filtering, list processing with higher-order functions.

#### Problem 4: IEither Data Type Manipulations

- Part (a): `either_sum1` (Recursive Solution) - 7%

  - **Task**: Sum the values from a list of IEither elements using recursion.
    
  - **Example**:
```
> either_sum1 [[IString "1", IInt 2], [IString "4", IInt 5]]
IInt 12
```
- Part (b): `either_sum2` (Higher-Order Solution) - 7%
  - **Task**: Perform the same summation using higher-order functions instead of recursion.

- Part (c): `either_filter1` (Recursive Solution) - 7%
  - **Task**: Filter elements from nested lists based on a criterion using recursion.

- Part (d): `either_filter2` (Higher-Order Solution) - 7%
  - **Task**: Perform the same filtering using higher-order functions.

- **Concepts Covered**: Data type manipulation, recursion, higher-order functions.

#### Problem 5: Binary Search Tree Operations

- Part (a): `isBSTtree` - 12%

  - **Task**: Check if a given binary tree is a Binary Search Tree (BST).
    
- **Concepts Covered**: Tree traversal, validation algorithms.

- Part (b): `createtree` - 12%
  - **Task**: Convert a standard tree into an LTree (labeled tree) with levels stored in nodes.

- Part (c): `binarysearch` - 12%
  - **Task**: Implement a search function for the LTree data structure.

- Concepts Covered: Tree construction, tree traversal, search algorithms.

### Summary of Topics Covered:
#### 1. Recursion and Tail-Recursion:

- Emphasis on recursive problem-solving, including both regular and tail-recursive functions.

#### 2. Higher-Order Functions:

- Extensive use of map, filter, foldr, and foldl to manipulate lists and data structures without recursion.

#### 3. Custom Data Types and Pattern Matching:

- Working with custom data types (IEither, BTree, LTree), focusing on data encapsulation, manipulation, and type-safe programming.

#### 4. Tree Data Structures:

- Introduction to binary trees and specialized labeled trees (LTree), covering tree construction, traversal, and searching.

#### 5. Algorithm Design:

- Application of various algorithms for data processing, tree validation, and searching, highlighting the use of functional programming paradigms in algorithmic contexts.

--- 

## [Assignment 3](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Assignments/Assignment3)

#### 1. Problem 1: Cat Diet Analysis

- Part a: `cat_diet(feeding_log)` (10%)
  - **Task**: Reorganize a dictionary that tracks a cat's feeding log into a format where months are the keys, and the values are dictionaries containing the food flavors and their respective counts.

  - **Key Concepts**: Dictionary manipulation, data transformation, nested data structures.

- Part b: `cats_favorite(feeding_log)` (15%)
  - **Task**: Identify the most popular cat food flavor based on the total number of cans consumed. The solution must use higher-order functions like map and reduce.

  - **Key Concepts**: Higher-order functions, dictionary aggregation, functional programming.

#### 2. Problem 2: Unzip Operation

= **Task**: unzip(L) (15%)
  - **Task**: Implement a function that reverses the zip operation, taking a list of 3-tuples and returning a tuple of lists, where each list contains the first, second, or third elements of the input tuples.
    
  - Key Concepts: List manipulation, higher-order functions (map, reduce), tuple operations.

#### Problem 3: Graph Analysis

- Part a: `connected(graph)` (15%)
  - **Task**: Identify pairs of nodes in a directed graph that are connected in both directions (i.e., there is an edge from node1 to node2 and from node2 to node1).

  - **Key Concepts**: Graph traversal, dictionary operations, edge detection.

- Part b: `connected2(graph)` (10%)
  - **Task**: Rewrite the connected function using list comprehension.
  - **Key Concepts**: List comprehension, graph traversal.

- Part c: `has_path(graph, node1, node2)` (15%)
  - **Task**: Recursively determine if there is a path between two nodes in a directed graph.
  - **Key Concepts**: Recursion, graph traversal, depth-first search.

#### Problem 4: String to Nested List Conversion

- **Task**: `str_to_list(input_str)` (15%)
  - **Task**: Convert a string with nested parentheses into a nested list structure. Each pair of matching parentheses should create a new sublist.

  - **Key Concepts**: Recursion, string parsing, list construction, handling nested data structures.

#### 5. Testing (5%)

- **Task**: Rename the provided `HW3SampleTests.py` file to `HW3Tests.py`, add additional test cases, and ensure that your solutions pass all tests. Test cases should cover boundary conditions and edge cases.

- **Key Concepts**: Unit testing with Python’s unittest framework, writing comprehensive test cases.

### Summary of Topics Covered:

#### 1. Dictionary Manipulation:

- The assignment emphasizes creating, transforming, and analyzing data stored in Python dictionaries, which is crucial for handling structured data.

#### 2. Higher-Order Functions:

- Problems require the use of `map`, `reduce`, and list comprehensions to perform operations without traditional loops, reinforcing functional programming practices in Python.

#### 3. Recursion:

- Recursive strategies are employed in several problems, particularly for graph traversal and string parsing, demonstrating the power of recursion in handling complex structures.

#### 4. Graph Theory:

- Problems involving graph traversal and connectivity strengthen your understanding of how to represent and analyze graphs using dictionaries and sets in Python.

#### 5. String Parsing and List Construction:

- Parsing strings to construct nested lists introduces techniques for handling hierarchical data and converting flat data into structured formats.

#### 6. Unit Testing:

- The assignment encourages rigorous testing through the unittest framework, emphasizing the importance of validating code correctness across a variety of input scenarios.

---

## [Assignment 4 - SPS interpreter - Project ](https://github.com/MarkShinozaki/CPTS355-ProgramLanguageDesign/tree/Assignments/Assignment4%20-%20SPS%20interpreter)


#### 1. Skeleton Code Files:

- psItems.py: Defines the Value, ArrayValue, and FunctionValue classes, which are used to represent different types of values in the interpreter. This file does not require modification in Part 1.

- psOperators.py: This is the main file where you will implement the operators for the PostScript-like language. It includes the `Operators` class, which manages the operand and dictionary stacks and contains the implementations of the various operators.

- tests_part1.py: Contains unit tests that will automatically verify the correctness of your implementations in `psOperators.py`.

- colors.py: Provides color codes for output formatting; no changes are required for this file.

#### 2. Key Components to Implement:

- Operand Stack (`opstack`) and Dictionary Stack (`dictstack`):
  - The `opstack` is used to store evaluated values, while the dictstack holds the dictionaries for variable and function definitions.

- Helper Functions:
  - `define(name, value)`: Adds a name-value pair to the top dictionary in dictstack.
  - `lookup(name)`: Searches for a name in the `dictstack` and returns its value.

- PostScript Operators:
  - Arithmetic Operators: `add`, `sub`, `mul`, `mod`
  - Comparison Operators: `eq`, `lt`, `gt`
  - Array Operators: `array`, `length`, `getinterval`, `putinterval`, `aload`, `astore`
  - Stack Operators: `pop`, `dup`, `exch`, `roll`, `copy`, `count`, `clear`, `stack`
  - Dictionary Operators: `dict`, `begin`, `end`, `psDef`

#### 3. Testing:

- The `tests_part1.py` file contains comprehensive unit tests that cover various scenarios for each operator implemented in `psOperators.py`. Running these tests will help ensure that your code works as expected and handles edge cases correctly.

### Summary of Topics Covered:

#### 1. Stack-Based Language Concepts:

- Understanding how to implement a language that relies on a stack-based evaluation model, similar to PostScript. This includes managing an operand stack for intermediate results and a dictionary stack for variable and function definitions.

#### 2. Operator Implementation:

- Implementing various operators, such as arithmetic, comparison, and array operations. The assignment reinforces how to manage stack operations and apply error checking for different data types and operation scenarios.

#### 3. Data Structures:

- Using Python lists to implement stacks and dictionaries to manage variable scopes. This assignment provides practical experience with list manipulation, including pushing, popping, and slicing lists.

#### 4. Unit Testing:

- The assignment emphasizes the importance of automated testing. By running the provided tests, students can verify the correctness of their code and ensure that it meets the specified requirements.










