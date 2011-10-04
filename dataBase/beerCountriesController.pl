:-use_module(db/beerCountries).

contains([X|_],X).
contains([_|Tail],X):-contains(Tail,X).
:-op(500,xfx,contains).

typeIs(Beer,Type):-country(_,_,Y),Y contains brewery(_,Z,_),Z contains beer(Beer,Type).
:-op(500,xfx,typeIs).

drinksTheMostBeer(X):-country(X,Y1,_),not((country(_,Y2,_),Y2>Y1)).
:-op(500,xf,drinksTheMostBeer).