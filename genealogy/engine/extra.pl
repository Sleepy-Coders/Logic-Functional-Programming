:- module(extra_engine,
	[
	sibling/2,
	child/3
	]).

child(C,X,Y) :- father(X,C),mother(Y,C),\==(X,Y).
sibling(X,Y) :-  
                (
                  (child(X,M,F),child(Y,M,F))
                  ;(child(X,P),child(Y,P),not((child(X,M,F),child(Y,M,F))))
                ),(X\=Y).