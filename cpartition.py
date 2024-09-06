def copy_insert(a, lst_of_lists):
    """
    Given `lst_of_lists`, a list of lists, insert `a` into each sublist
    of `lst_of_lists`, and return the list of all modifications.
    """
    if not lst_of_lists:
        return [[a]]
    
    result = []
    rest = copy_insert(a, lst_of_lists[1:])
    first = [[a] + lst_of_lists[0]] + lst_of_lists[1:]
    result.extend([first] + rest)
    
    for item in rest:
        result.append(lst_of_lists[0] + item)
    
    return result

def partitions(lst):
    """
    Given `lst`, a list of elements, produce all partitions of `lst`.
    """
    if not lst:
        return [[]]
    
    rest_partitions = partitions(lst[1:])
    return copy_insert(lst[0], rest_partitions)

# Test the function
example_list = [1, 2, 3]
print(partitions(example_list))
