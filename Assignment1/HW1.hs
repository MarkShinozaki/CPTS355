-- CptS 355 - Fall 2023 -- Homework1 - Haskell
-- Name: Mark Strong-Shinozaki
-- Collaborators: 

module HW1
     where



-- P1 - running_totals – 10%
     
-- Working code
runningTotals :: Num a => [a] -> [a] -- Num a => [a] -> [a] is the type signature
runningTotals = tail . scanl (+) 0 -- tail . scanl (+) 0 is the function definition



-- P2  (a)  later_day – 8%


-- later_day function (used by both get_latest and get_latest_nested)
later_day :: (Int, Int, Int) -> (Int, Int, Int) -> (Int, Int, Int)
later_day date1@(d1, m1, y1) date2@(d2, m2, y2)
  | y1 > y2 = date1
  | y1 == y2 && m1 > m2 = date1
  | y1 == y2 && m1 == m2 && d1 > d2 = date1
  | otherwise = date2


-- P2  (b)  get_latest – 8%

get_latest :: [(Int, Int, Int)] -> (Int, Int, Int)
get_latest [] = error "Empty list provided."
get_latest [date] = date
get_latest (date:dates) = later_day date (get_latest dates)



-- P2  (c)  get_latest_nested – 10%

get_latest_nested :: [[(Int, Int, Int)]] -> (Int, Int, Int)
get_latest_nested [] = error "Empty list provided."
get_latest_nested dateLists = get_latest (concat dateLists)


-- P3  study_list ; 10%
type Course = (String, [(String, Int)])

study_list :: [Course] -> String -> [String]
study_list courses day =
  [course | (course, schedule) <- courses, (d, _) <- schedule, d == day]

-- Example usage:
logInput :: [Course]
logInput =
  [ ("CptS355", [("Mon", 3), ("Wed", 2), ("Sat", 2)]),
    ("CptS360", [("Mon", 3), ("Tue", 2), ("Wed", 2), ("Fri", 10)]),
    ("CptS321", [("Tue", 2), ("Wed", 2), ("Thu", 3)]),
    ("CptS322", [("Tue", 1), ("Thu", 5), ("Sat", 2)])
  ]



-- P4  get_indexes – 12%

get_indexes :: Eq a => [a] -> a -> [Int]
get_indexes list element = 
    [index | (item, index) <- zip list [0..], item == element]


-- P5  group_items – 14 %

group_items :: [a] -> [[a]] -- is a function that takes a list 
                            -- of items and returns a list of lists of items [[a]]

group_items xs = reverse (groupItemsHelper xs []) -- group_items calls groupItemsHelper 
                                                  -- with the list and an empty list

groupItemsHelper :: [a] -> [[a]] -> [[a]] -- groupItemsHelper is helper functio that takes two 
                                          -- arguements: a list 'xs' and accumulator 
                                          -- list 'acc' for grouped elements

groupItemsHelper [] acc = acc -- basecase of the recursion checks if the input list is empty
                              -- and returns the accumulator list 'acc' 

groupItemsHelper xs acc = groupItemsHelper remaining (group : acc) 
     where
          (group, remaining) = splitAt (length acc + 1) xs



-- P6  get_segment – 18%



get_segment :: (Eq a) => (a, a) -> [a] -> [a]
get_segment _ [] = []
get_segment (start, end) list = go list []
  where
    go [] [] = []
    go [] acc = reverse acc
    go (x:xs) acc
      | x == start = go xs [x]
      | not (null acc) && x == end = reverse acc
      | not (null acc) = go xs (x : acc)
      | otherwise = go xs []





-- Assignment rules ; 4%
-- Your own tests ; 6%



