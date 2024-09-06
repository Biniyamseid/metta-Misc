from hyperon import *
from hyperon.ext import register_atoms
import re
import sys
import os
import random
import string
import time

from hyperon.atoms import ExpressionAtom, E, GroundedAtom, OperationAtom, ValueAtom, NoReduceError, AtomType, MatchableObject, VariableAtom,\
    G, S,V, Atoms, get_string_value, GroundedObject, SymbolAtom
from hyperon.base import Tokenizer, SExprParser
from hyperon.ext import register_atoms, register_tokens
import hyperonpy as hp

metta = MeTTa()

# Getting a reference to a native GroundingSpace,
# implemented by the MeTTa core library.
grounding_space = GroundingSpaceRef()
grounding_space.add_atom(E(S("A"), S("B")))
space_atom = G(grounding_space)

# Registering a new custom token based on a regular expression.
# The new token can be used in a MeTTa program.
metta.register_atom("&space", space_atom)
A = "A"
print(metta.run("! (match &space (A $x) $x)"))
print(metta.run("! (match &space $x  $x)"))
