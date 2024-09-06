def plus(atom1, atom2):
    from hyperon import ValueAtom
    sum = atom1.get_object().value + atom2.get_object().value
    print("sum", sum)
    return [ValueAtom(sum, 'Number')]

from hyperon import OperationAtom, MeTTa
plus_atom = OperationAtom("plus", plus,
    ['Number', 'Number', 'Number'], unwrap=False)
metta = MeTTa()
metta.register_atom("plus", plus_atom)
print(metta.run('! (plus 3 5)'))
