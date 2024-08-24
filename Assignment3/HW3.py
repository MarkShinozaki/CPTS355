# CptS 355 - Fall 2023 - Assignment 3
# Mark Shinozaki
# 11672355


## problem 1(a) cat_diet  - 10%
def cat_diet(feeding_log):
    # Initalize an empty dictionary to store the result
    result = {}
    
    # Iterate through the months in the input dictionary
    months = set() 
    cat_flavors = set()
    
    for cat_data in feeding_log.values():
        months.update(cat_data.keys()) 
        cat_flavors.update(cat_data.keys())
        
    for month in months:
        month_data = {} 
        
        for cat, diet in feeding_log.items():
            # Check if the cat has data for the current month 
            if month in diet:
                month_data[cat] = diet[month]
                
        # Add the month data to the result dictionary
        if month_data:
            result[month] = month_data

    return result 


from functools import reduce

## problem 1(b) cats_favorite - 15%
def cats_favorite(feeding_log):
    def add_counts(flavor_data):
        return sum(count for _, count in flavor_data.items())

    return reduce(lambda x, y: x if x[1] >= y[1] else y, [(flavor, add_counts(counts)) for flavor, counts in feeding_log.items()])


## problem 2 unzip - 15%
def unzip(L):
    transposed = zip(*L)

    result = tuple(map(list, transposed))

    return result


## problem 3(a) - connected - 15%
def connected(graph):
    connected_pairs = []

    for node, neighbors in graph.items():
        for neighbor in neighbors:
            if neighbor in graph and node in graph[neighbor]:
                connected_pairs.append((node, neighbor))

    return connected_pairs

## problem 3(b) - connected2 - 10%
def connected2(graph):
    return [(node, neighbor) for node in graph for neighbor in graph[node] if neighbor in graph and node in graph[neighbor]]


## problem 3(c) - has_path - 15%
def has_path(graph, node1, node2, visited=None):
    # Initialize the visited set if it's not provided
    if visited is None:
        visited = set()

    # Base case: If the nodes are the same, there is a path.
    if node1 == node2:
        return True

    # Mark the current node as visited
    visited.add(node1)

    # Iterate through the neighbors of node1
    for neighbor in graph.get(node1, set()):
        if neighbor not in visited:
            # Recursively check if there's a path from the neighbor to node2
            if has_path(graph, neighbor, node2, visited):
                return True

    # If no path is found, return False
    return False


## problem 4 - str_to_list - 15%
def str_to_list(input_str):
    result = []
    stack = []
    current = result

    for char in input_str:
        if char == '(':
            stack.append(current)
            current.append([])
            current = current[-1]
        elif char == ')':
            current = stack.pop()
        else:
            current.append(char)

    return result
