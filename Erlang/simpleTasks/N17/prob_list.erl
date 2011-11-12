-module(prob_list).
-export([contains/2,probability/2]).

contains([], _Item) -> 
    false;
contains([{First,_Probability}|Rest], Item) ->
    if
	First == Item -> true;
	true -> contains(Rest, Item)
    end.
				 
probability([], _Item) ->
    false;
probability([{First,Probability}|Rest], Item) ->
    if
	First == Item -> Probability;
	true -> probability(Rest, Item)
    end.

