:- use_module(engine).

male('syn').
male('tato').
male('dido').
female('sestra').
female('mama').
female('baba').
female('tsiotsia').
female('d.sestra').

parent('tato','syn').
parent('mama','syn').
parent('mama','sestra').
parent('tato','sestra').
parent('dido','tato').
parent('baba','tato').
parent('dido','tsiotsia').
parent('baba','tsiotsia').
parent('tsiotsia','d.sestra').
