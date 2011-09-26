%A man once had to travel with a wolf, a goat and a cabbage. He had to take good care of them, since the wolf would like to taste a piece of goat if he would get the chance, while the goat appeared to long for a tasty cabbage. After some traveling, he suddenly stood before a river. This river could only be crossed using the small boat laying nearby at a shore. The boat was only good enough to take himself and one of his loads across the river. The other two subjects/objects he had to leave on their own. How must the man row across the river back and forth, to take himself as well as his luggage safe to the other side of the river, without having one eating another?

/*
 *	State
 *		[Farmer, Wolf, Goat, Cabbage]
 */



action([X,X,Goat,Cabbage],transferWolf(X,Y),[Y,Y,Goat,Cabbage]).	%transfer wolf
action([X,Wolf,X,Cabbage], transferGoat(X,Y),[Y,Wolf,Y,Cabbage]).	%transfer goat
action([X,Wolf,Goat,X], transferCabbage(X,Y),[Y,Wolf,Goat,Y]).		%transfer cabbage
action([X,Wolf,Goat,Cabbage], swimAlone(X,Y),[Y,Wolf,Goat,Cabbage]).	%swim without any object

equals(X,X).

willSurvive([Man,Wolf,Goat,Cabbage]) :- equals(Man,Goat);(equals(Man,Wolf),equals(Man,Cabbage)).

goal([island,island,island,island],[]).
goal(OldState,[Action|Tail]) :-action(OldState,Action, NewState), willSurvive(NewState),goal(NewState,Tail).

/*
 *	Line below is for faster debugging or program starting.
 */
check(Moves,X) :- length(X,Moves), goal([shore,shore,shore,shore],X).