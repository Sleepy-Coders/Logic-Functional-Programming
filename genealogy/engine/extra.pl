:- module(extra_engine,
	[
	sibling/2,
	child/3,
	brother/2,
	sister/2,
	uncle/2,
	aunt/2
	]).

child(C,X,Y) :- father(X,C),mother(Y,C),\==(X,Y).
sibling(X,Y) :- ( 
                  (child(X,M,F),child(Y,M,F))
                  ;(child(X,P),child(Y,P),not((child(X,M,F),child(Y,M,F))))
                ),(X\=Y).

brother(X,Y):-sibling(X,Y),male(X).
sister(X,Y):-sibling(X,Y),female(X).

uncle(X,Y):-parent(Z,Y),brother(X,Z).
aunt(X,Y):-parent(Z,Y),sister(X,Z).
