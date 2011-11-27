-module('n11').
-export([euclidean_norm/1,
	longest_ascendings_length/1,
	longest_descendings_length/1]).

euclidean_norm(Vector) ->
    math:sqrt(sqr_summ(Vector)).

sqr_summ([Head]) -> Head*Head;
sqr_summ([Head|Tail]) -> Head*Head+sqr_summ(Tail).

longest_ascendings_length(Vector) ->
    longest_cendings_length(fun lt/2, Vector).
longest_descendings_length(Vector) ->
    longest_cendings_length(fun gt/2, Vector).

longest_cendings_length(_, []) ->    0;
longest_cendings_length(Fun, Vector) ->
    L = cendings_length(Fun, Vector),
    max(L, longest_cendings_length(Fun, lists:nthtail(L, Vector))).

cendings_length(_, []) ->    0;
cendings_length(_, [_]) ->    1;
cendings_length(Fun, [Head|Tail]) ->
    case Fun(Head, lists:nth(1, Tail)) of
	true -> 1 + cendings_length(Fun, Tail);
	false -> 1
    end.

gt(X,Y) when X>Y -> true;
gt(_,_) -> false.

lt(X,Y) when X<Y -> true;
lt(_,_) -> false.
