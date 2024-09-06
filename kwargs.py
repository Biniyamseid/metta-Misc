from hyperon import *
def print_all(*args):
    for a in args:
        print(a)
    return [Atoms.UNIT]
metta = MeTTa()
metta.register_atom("print-all", OperationAtom("print-all", print_all))
print(metta.run('!(print-all "Hello" (+ 40 2) "World")'))
