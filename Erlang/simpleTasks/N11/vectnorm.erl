-module(vectnorm).
-export([sqr_summ/1, euclidean_norm/1]).

sqr_summ([Head]) -> Head*Head;
sqr_summ([Head|Tail]) -> Head*Head+sqr_summ(Tail).

euclidean_norm(Vector) ->
    math:sqrt(sqr_summ(Vector)).
