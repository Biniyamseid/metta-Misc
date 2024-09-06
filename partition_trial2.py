from itertools import combinations

def partitions(lst):
    if not lst:
        return [[]]
    result = []
    for i in range(1, len(lst) + 1):
        for combination in combinations(lst, i):
            remaining = [x for x in lst if x not in combination]
            for part in partitions(remaining):
                result.append([list(combination)] + part)
    return result

# Example usage
input_list = [1, 2, 3]
output = partitions(input_list)
print(output)
