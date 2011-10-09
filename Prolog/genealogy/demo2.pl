:- use_module(engine/main,except([sibling/2,brother/2,sister/2,uncle/2,aunt/2])).
:- use_module(engine/extra).

male('syn').
male('tato').
male('dido').
female('sestra').
female('o.sestra').
female('mama').
female('baba').
female('tsiotsia').
female('d.sestra').

parent('tato','syn').
parent('mama','syn').
parent('mama','sestra').
parent('tato','sestra').
parent('mama','o.sestra').
parent('dido','tato').
parent('baba','tato').
parent('dido','tsiotsia').
parent('baba','tsiotsia').
parent('tsiotsia','d.sestra').
