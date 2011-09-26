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
check(Moves,X) :- length(X,7), goal([shore,shore,shore,shore],X).