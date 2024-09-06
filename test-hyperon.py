from hyperon import *
metta = MeTTa()
expr1 = metta.parse_single('(+ 1 S)')
for i in expr1.get_children():
    print(f'type({i})={type(i)}')
expr2 = E(S('+'), S('1'), S('S'))
print('Expr1: ', expr1)
print('Expr2: ', expr2)
print('Equal: ', expr1 == expr2)
for atom in expr1.get_children():
    print(f'type({atom})={type(atom)}')
