
from hyperon import *
metta = MeTTa()
expr1 = metta.parse_single('(+ 1 2)')
print(metta.evaluate_atom(expr1))
expr2 = E(OperationAtom('+', lambda a, b: a + b),
          ValueAtom(1), ValueAtom(2))
print(type(metta.evaluate_atom(expr2)))
print(sum(metta.evaluate_atom(expr2)+[1]))