:- module(marriage,
	[
	spouse/2,
	husband/2,
	wife/2,
	uncle/2,
	aunt/2
	]).

spouse(X,Y):-husband(X,Y);wife(X,Y).
husband(X,Y):-married(X,Y).
wife(X,Y):-married(Y,X).

uncle(X,Y):-parent(Z,Y),brother(X,Z);parent(Z,Y),sister(M,Z),husband(X,M).
aunt(X,Y):-parent(Z,Y),sister(X,Z);parent(Z,Y),brother(M,Z),wife(X,M).