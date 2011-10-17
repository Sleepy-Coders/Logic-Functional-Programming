:-use_module(db/beerCountries).

%library
contains([X|_],X).
contains([_|Tail],X):-contains(Tail,X).
:-op(500,xfx,contains).
%=======

%service
%=====================================================================
country(X):-country(X,_,_).
:-op(500,fx,country).

consumptionOfCountry(Y,X):-country(X,Y,_).
:-op(500,xfx,consumptionOfCountry).

breweriesOfCountry(L,N):-country(N,_,L).
:-op(500,xfx, breweriesOfCountry).
%---------------------------------------------------------------------
brewery(X):-country(_,_,Y),Y contains brewery(X,_,_).
:-op(500,fx,brewery).

yearOfBrewery(Z,X):-country(_,_,Y),Y contains brewery(X,_,Z).
:-op(500,xfx, yearOfBrewery).

beersOfBrewery(X,Y):-country(_,_,Z),Z contains brewery(Y,X,_).
:-op(500,xfx, beersOfBrewery).

breweryOfCountry(X,Z):-country(Z,_,Y),Y contains brewery(X,_,_).
:-op(500,xfx,breweryOfCountry).
%---------------------------------------------------------------------
beer(X):-country(_,_,Y),Y contains brewery(_,W,_),W contains beer(X,_).
:-op(500,fx,beer).

typeOfBeer(Type,Beer):-country(_,_,Y),Y contains brewery(_,Z,_),Z contains beer(Beer,Type).
:-op(500,xfx,typeOfBeer).

beerOfBrewery(X,Z):-country(_,_,Y),Y contains brewery(Z,W,_),W contains beer(X,_).
:-op(500,xfx,beerOfBrewery).

beerBreweryCountry(X,Z,C):-country(C,_,Y),Y contains brewery(Z,W,_),W contains beer(X,_).
%=====================================================================

%extremal
drinksTheMostBeer(X):-country(X,Y1,_),not((country(_,Y2,_),Y2>Y1)).
:-op(500,xf,drinksTheMostBeer).

beersInBreweries(0,[]).
beersInBreweries(N,[brewery(_,Beers,_)|Tail]):-beersInBreweries(K,Tail),length(Beers,H),N is K+H.
:-op(500,xfx,beersInBreweries).

hasMostBeers(X):-country(X,_,Y1),not((country(_,_,Y2),Beers1 beersInBreweries Y1, Beers2 beersInBreweries Y2,Beers2>Beers1)).
:-op(500,xf, hasMostBeers).