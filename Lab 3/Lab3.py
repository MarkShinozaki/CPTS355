# CptS 355 - Fall  2023 - Lab 3
# Mark Strong-Shinozaki


## problem 1 getNumCases 
def getNumCases(data, counties, months):
    total_count = 0
    for county in counties:
        for month in months:
            total_count += data.get(county,{}).get(month,0)
    return total_count

## problem 2 getMonthlyCases
def getMonthlyCases(data):
    mylog = {}
    for county,log in data.items():
        for month,count in log.items():
            if month not in mylog:
                mylog[month] = {}
            mylog[month][county] = count
    return mylog


from functools import reduce

## problem 3 mostCases 
def mostCases(data):
    monthly_cases = getMonthlyCases(data)
    max_month = ''
    max_count = 0
    for month,log in monthly_cases.items():
        total_cases = reduce(lambda x,y: x+y, log.values())
        if total_cases > max_count:
            max_count = total_cases
            max_month = month
    return (max_month, max_count)

## problem 4a) searchDicts(L,k)
def searchDicts(L,k):
    for d in reversed(L):
        if k in d:
            return d[k]
    return None

## problem 4b) searchDicts2(L,k)
def searchDicts2(tL, k):
    def searchDicts2_helper(tL, k, i):

        index, dictionary = tL[i]
        if k in dictionary:
            return dictionary[k]
        if i <= 0:
            return None
        return searchDicts2_helper(tL, k, index)

    # Start the search from the end of the list (the last tuple)
    return searchDicts2_helper(tL, k, len(tL) - 1)


## problem 5 - getLongest
def getLongest(L):
    longest = None
    for item in L:
        if isinstance(item, str):
            if longest is None or len(item) >= len(longest):
                longest = item
        elif isinstance(item, list):
            sub_longest = getLongest(item)
            if sub_longest is not None and (longest is None or len(sub_longest) > len(longest)):
                longest = sub_longest
    return longest















