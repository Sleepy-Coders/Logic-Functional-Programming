-module(prob_list).
-export([intersection/2,union/2]).

intersection([], _List) -> [];
intersection(_List, []) -> []; 
intersection([{Item, Probability}|Rest1], List2) -> Contains = contains(List2, Item),
    if
	Contains -> [{Item,Probability*probability(List2, Item)}|intersection(Rest1, List2)];
	true     -> intersection(Rest1, List2)
    end.

union([], List) -> List;
union(List, []) -> List;
union([{Item, Probability}|Rest1], List2) -> Contains = contains(List2, Item),
    if
	Contains -> [{Item,Probability+probability(List2, Item)-Probability*probability(List2, Item)}|union(Rest1, lesslist(List2, Item))];
	true     -> [{Item,Probability}|union(Rest1, List2)]
    end.

%%   SSS U  U PPP  PPP   OO  RRR  TTTTT
%%  S    U  U P  P P  P O  O R  R   T
%%   SS  U  U PPP  PPP  O  O RRR    T
%%     S U  U P    P    O  O R R    T
%%  SSS   UU  P    P     OO  R  R   T

contains([], _Item) -> 
    false;
contains([{First,_Probability}|Rest], Item) ->
    if
	First == Item -> true;
	true          -> contains(Rest, Item)
    end.
				 
probability([], _Item) ->
    false;
probability([{First,Probability}|Rest], Item) ->
    if
	First == Item -> Probability;
	true          -> probability(Rest, Item)
    end.

lesslist([], _Item) -> [];
lesslist([{First,Probability}|Rest], Item) ->
    if
        First == Item -> Rest;
	true -> [{First,Probability}|lesslist(Rest,Item)]
    end.
