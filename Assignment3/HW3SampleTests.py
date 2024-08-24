import unittest
from HW3 import *

class HW3SampleTests(unittest.TestCase):
    def setUp(self):
        self.myCatsLog = { 
            'Beef': {"Jul": 2, "Sep": 2, "Oct": 3, "Nov": 2, "Dec": 2, "June": 3}, 
            'Chicken': {"Jul": 4, "Aug": 6, "Sep": 5, "Oct": 7, "Nov": 4, "Dec": 4, "June": 7}, 
            'Oceanfish': {"Jul": 7, "Aug": 6, "Nov": 3}, 
            'Salmon': {"Aug": 3, "Sep": 2, "Nov": 2, "Dec": 2}, 
            'Sardines': {"Sep": 1, "Oct": 3, "Dec": 1, "June": 2}, 
            'Tuna': {"Jul": 1, "Aug": 2, "Sep": 3, "Nov": 2, "Dec": 2}, 
            'Turkey': {"Sep": 1, "Nov": 1, "Dec": 4, "June": 4}, 
            'Whitefish': {"Jul": 3, "Aug": 1, "Sep": 3, "Oct": 5, "Nov": 2, "Dec": 2, "June": 1}
        } 
        self.graph = {'A':{'B','C','D'},'B':{'C'},'C':{'B','E','F','G'},'D':{'A','E','F'},'E':{'F'}, 'F':{'E', 'G'},'G':{}, 'H':{'F','G'}}

    #--- Problem 1(a)----------------------------------
    def test_cat_diet(self):
        output = {"June":{"Chicken":7,"Beef":3, "Turkey":4, "Whitefish":1, "Sardines":2}, "Jul":{"Oceanfish":7, "Tuna":1, "Whitefish":3, "Chicken":4, "Beef":2}, "Aug":{"Oceanfish":6, "Tuna":2, "Whitefish":1, "Salmon":3, "Chicken":6}, "Sep":{"Tuna":3, "Whitefish":3, "Salmon":2, "Chicken":5, "Beef":2, "Turkey":1, "Sardines":1}, "Oct":{"Whitefish":5, "Sardines":3, "Chicken":7, "Beef":3}, "Nov":{"Oceanfish":3, "Tuna":2, "Whitefish":2, "Salmon":2, "Chicken":4, "Beef":2, "Turkey":1}, "Dec":{"Tuna":2, "Whitefish":2, "Salmon":2, "Chicken":4, "Beef":2, "Turkey":4, "Sardines":1}}      
        self.assertDictEqual(cat_diet(self.myCatsLog),output)

    #--- Problem 1(b)----------------------------------
    def test_cats_favorite(self):
        self.assertEqual(cats_favorite(self.myCatsLog),('Chicken', 37) )

    #--- Problem 2 ----------------------------------
    def test_1_unzip(self):
        self.assertEqual(unzip ([(1,"a",10),(2,"b",11),(3,"c",12),(4,"d",13)]),([1, 2, 3, 4], ['a', 'b', 'c', 'd'], [10, 11, 12, 13]))
        self.assertEqual(unzip ([("CptS",355,{"CptS":355}),("EE",451,{"EE":451}),("CptS",322,{"CptS":322})]) , (["CptS", "EE", "CptS"], [355,451,322], [{"CptS":355},{"EE":451},{"CptS":322}]))


    def test_2_unzip(self):
        self.assertEqual(unzip([(1, 2, 3), ("a", "b", "c"), (10, 20, 30)]), ([1, "a", 10], [2, "b", 20], [3, "c", 30]))
        self.assertEqual(unzip([("apple", "banana", "cherry"), (1, 2, 3), (True, False, True)]), (["apple", 1, True], ["banana", 2, False], ["cherry", 3, True]))

    
    #--- Problem 3(a)----------------------------------
    def test_1_connected(self):
        output = [('A', 'D'), ('B', 'C'), ('C', 'B'), ('D', 'A'), ('E', 'F'), ('F', 'E')]
        self.assertListEqual(connected(self.graph),output )

    def test_2_connected(self):
        # Provide your own test here. Create your own graph dictionary for this test (similar to self.graph). 
        graph = {
        'A': {'B', 'C', 'D'},
        'B': {'C'},
        'C': {'B', 'E', 'F', 'G'},
        'D': {'A', 'E', 'F'},
        'E': {'F'},
        'F': {'E', 'G'},
        'G': {},
        'H': {'F', 'G'}
        }
        output = [('A', 'D'), ('B', 'C'), ('C', 'B'), ('D', 'A'), ('E', 'F'), ('F', 'E')]

        self.assertListEqual(connected(graph), output)
    
    #--- Problem 3(b)----------------------------------
    def test_1_connected2(self):
        output = [('A', 'D'), ('B', 'C'), ('C', 'B'), ('D', 'A'), ('E', 'F'), ('F', 'E')]
        self.assertListEqual(connected2(self.graph),output )

    def test_2_connected2(self):
        # Provide your own test here. Create your own graph dictionary for this test (similar to self.graph). 
        # You can re-use the data dictionary you created for connected test.
        graph = {
        'P': {'Q', 'R'},
        'Q': {'R', 'S'},
        'R': {'S'},
        'S': {},
        'T': {'U'},
        'U': {'V'},
        'V': {'W'},
        'W': {'X'},
        'X': {}
    }

        self.assertTrue(has_path(graph, 'P', 'S'))
        self.assertTrue(has_path(graph, 'U', 'X'))
        self.assertTrue(has_path(graph, 'T', 'X'))
        self.assertFalse(has_path(graph, 'P', 'W'))
        
        
    #--- Problem 3 (c)  ------------------------------
    def test_1_has_path(self):
        graph = {
        'A': {'B', 'C', 'D'},
        'B': {'C'},
        'C': {'B', 'E', 'F', 'G'},
        'D': {'A', 'E', 'F'},
        'E': {'F'},
        'F': {'E', 'G'},
        'G': {},
        'H': {'F', 'G'}
        }
        self.assertTrue(has_path(graph, 'A' ,'F'))
        self.assertFalse(has_path(graph, 'E' ,'A'))
        self.assertFalse(has_path(graph, 'A' ,'H'))
        self.assertTrue(has_path(graph, 'H' ,'E'))

    def test_2_has_path(self):
        graph = {
        'X': {'Y', 'Z'},
        'Y': {'Z'},
        'Z': {'X', 'Y'},
        'W': {'X', 'Y'},
        'V': {},
        'U': {'X', 'Z'}
    }
        self.assertTrue(has_path(graph, 'X', 'Z'))
        self.assertTrue(has_path(graph, 'W', 'Z'))
        self.assertTrue(has_path(graph, 'U', 'Y'))
        self.assertFalse(has_path(graph, 'V', 'X'))

#--- Problem 4  ------------------------------
    def test_1_str_to_list(self):
        input1 = "ab(c(def)(gh(ijk(lm)nop)qr)st(uv)x"
        output1  = ['a','b',['c',['d','e','f'],['g','h',['i','j','k',['l','m'],'n','o','p'],'q','r'],'s','t',['u','v'],'x']]
        self.assertListEqual(str_to_list(input1), output1)
    
    def test_2_str_to_list(self):
        input2 = "1()(((2))())()(3)4"
        output2 = ['1', [], [[['2']], []], [], ['3'], '4']
        self.assertListEqual(str_to_list(input2), output2)
        
    def test_3_str_to_list(self):
        
        # Provide your own test here. 
        input3 = "abcd"
        output3 = ['a', 'b', 'c', 'd']
        self.assertListEqual(str_to_list(input3), output3)


if __name__ == '__main__':
    unittest.main()

