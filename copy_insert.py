def copy_insert(a, l):
    """
    Given `l`, a list of lists, insert `a` in each sublist of `l`,
    and return the list of all modifications of `l`.
    """
    if not l:
        return [[a]]
    
    first_list = l[0]
    rest_lists = l[1:]

    # Recursive call to handle the rest of the lists
    rest_modifications = copy_insert(a, rest_lists)

    # Generate modifications where `a` is inserted into each sublist of `rest_modifications`
    modified_with_first = [ [a] + first_list ] + rest_lists
    rest_results = [ [first_list] + result for result in rest_modifications ]

    return [modified_with_first] + rest_results

# Example usage
a = 4
l = [[1], [2, 3]]
print(copy_insert(a, l))
