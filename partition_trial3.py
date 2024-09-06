def partitions(lst):
    if not lst:
        return [[]]
    
    result = []
    for xs, rest in select(lst):
        for p in partitions(rest):
            result.append([xs] + p)
    return result

def select(lst):
    if not lst:
        return []
    
    x = lst[0]
    rest = lst[1:]
    
    result = [([x], rest)]
    for ys, zs in select(rest):
        result.append(([x] + ys, zs))
    return result

# Example usage
print(partitions([1, 2, 3]))
