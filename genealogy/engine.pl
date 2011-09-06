:- module(engine,
	[
	father/2,
	mother/2,
	child/2,
	son/2,
	daughter/2,
	grandparent/2,
	grandchild/2,
	predecessor/2,
	descendant/2,
	sibling/2,
	brother/2,
	sister/2,
	uncle/2,
	aunt/2,
	nephew/2,
	niece/2,
	cousin2/2,
	cousin/2
	]).

father(X,Y):-parent(X,Y),male(X).
mother(X,Y):-parent(X,Y),female(X).

child(X,Y):-parent(Y,X).
son(X,Y):-child(X,Y),male(X).
daughter(X,Y):-child(X,Y),female(X).

grandparent(X,Z):-parent(X,Y),parent(Y,Z).
grandchild(X,Z):-grandparent(Z,X).

predecessor(X,Z):-parent(X,Z);parent(X,Y),predecessor(Y,Z).
descendant(X,Z):-predecessor(Z,X).

sibling(X,Z):-father(Y,X),father(Y,Z),mother(W,X),mother(W,Z),\==(X,Z).
brother(X,Y):-sibling(X,Y),male(X).
sister(X,Y):-sibling(X,Y),female(X).

uncle(X,Y):-parent(Z,Y),brother(X,Z).
aunt(X,Y):-parent(Z,Y),sister(X,Z).

nephew(X,Y):-sibling(Z,Y),son(X,Z).
niece(X,Y):-sibling(Z,Y),sister(X,Z).

cousin2(X,Y):-parent(Z,X),sibling(W,Z),child(Y,W).
cousin(X,Y):-sibling(X,Y);parent(Z,X),cousin(W,Z),child(Y,W).