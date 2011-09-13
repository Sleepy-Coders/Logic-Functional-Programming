:- module(katia_engine,
	[
	husband/2,
	father/2,
	mother/2,
	child/2,
	son/2,
	daughter/2,
	grandfather/2,
	gradnmother/2,
	grandson/2,
	brother/2,
	sister/2,
	grand/2,
	grandgrandson/2,
	grandgranddaughter/2,
	uncle/2
	]).

husband(X,Y):-pair(Y,X).
father(X,Y):-parent(X,Y),male(X).
mother(X,Y):-parent(X,Y),female(X).
grandfather(X,Y):-father(X,Z),(father(Z,Y);mother(Z,Y)).
gradnmother(X,Y):-mother(X,Z),(father(Z,Y);mother(Z,Y)).
child(Y,X):-parent(X,Y).
daughter(X,Y):-child(X,Y),female(X).
son(X,Y):-child(X,Y),male(X).
grandson(X,Y):-son(X,Z),parent(Y,Z).
brother(X,Y):-parent(Z,X),parent(Z,Y),male(X),X\=Y.
sister(X,Y):-female(X),father(Z,X),father(Z,Y),mother(W,X),mother(W,Y),\==(X, Y).
grand(X,Y):-parent(X,Z),parent(Z,Y).
grandgrandson(X,Y):-son(X,Z),parent(M,Z),parent(Y,M).
grandgranddaughter(X,Y):-daughter(X,Z),parent(M,Z),parent(Y,M).
uncle(X,Y):-brother(X,Z),(father(Z,Y);mother(Z,Y));husband(X,C),sister(C,Z),(father(Z,Y);mother(Z,Y)).