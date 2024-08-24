-- CptS 355 - Lab 1 (Haskell) - Fall 2023
-- Name: Mark Strong-Shinozaki
-- Collaborated with: 

module Lab1
     where


-- 1.insert 
--main :: IO()

--insert :: (Eq t1, Num t1) => t1 -> t2 -> [t2] -> [t2]
insert 0 item [] = item:[]
insert n item [] = [] 
insert n item (x:xs) | (n==0) = item:x:xs
                     | otherwise = x:(insert (n-1) item xs)


-- 2. insertEvery

insertEvery n item iL = insertEveryHelper n n item iL
                         where 
                              insertEveryHelper m 0 item [] = item:[]
                              insertEveryHelper m n item [] = []
                              insertEveryHelper m n item (x:xs) | (n==0) = item:x:(insertEveryHelper m (m-1) item xs)
                                                                | otherwise = x: (insertEveryHelper m (n-1) item xs)


-- 3. getSales

getSales :: (Num a, Eq t) => t -> [(t, a)] -> a
getSales day [] = 0
getSales day ((x,y):xs) | (day == x) = y + (getSales day xs)
                        | otherwise = (getSales day xs)                                                  
-- 4. sumSales
sumSales store day [] = 0
sumSales store day ((x,y):xs) | (store == x) = getSales day y + (sumSales store day xs)
                              | otherwise = (sumSales store day xs)

-- 5. split
split :: Eq a => a -> [a] -> [[a]]
split c [] = []
split c iL = splitHelper c iL []
     where
     splitHelper c [] buf | (buf == []) = []
                          | otherwise = (reverse buf):[]
     splitHelper c (x:xs) buf | (c == x) = (reverse buf) : (splitHelper c xs [])
                         |otherwise = splitHelper c xs (x:buf)

-- 6. nSplit
-- Write a function nSplit that takes a delimiter value "c", an integer "n",
-- and a list "iL", and it splits the input list with respect to the delimiter "c"
-- up to "n" times. Unlike split, it should not split the input list at every 
-- delimiter occurence, but only for the first "n" occurances of it

nSplit :: (Ord a1, Num a1, Eq a2) => a2 -> a1 -> [a2] -> [[a2]]
nSplit c n [] = []
nSplit c n iL = nSplitHelper c n iL []
     where
     nSplitHelper c 0 [] buf     | (buf == []) = []
                                 | otherwise = (reverse buf) : []
     nSplitHelper c n [] buf     | (buf == []) = []
                                 | otherwise = (reverse buf) : []
     nSplitHelper c n (x:xs) buf | (c == x) && (n > 0) = (reverse buf) : (nSplitHelper c (n-1) xs [])
                                 | (c /= x) && (n > 0)= nSplitHelper c n xs (x:buf)
                                 | otherwise = (x:xs):[]