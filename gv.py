# Function to generate a single variable with prefix and index
def gen_variable(prefix, i):
    # Create a variable as prefix + "-" + i (number)
    return f"{prefix}-{i}"

# Recursive function to generate a list of variables with prefix
def gen_variables(prefix, n):
    # Base case: if n is 0, return an empty list
    if n == 0:
        return []
    else:
        # Recursive case: generate the variables for n-1, append the current variable
        return gen_variables(prefix, n - 1) + [gen_variable(prefix, n - 1)]

# Example usage:
prefix = "$X"
n = 5
variables = gen_variables(prefix, n)
print(variables)
