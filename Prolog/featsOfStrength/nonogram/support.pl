:-module(support,[
	sum/2,
	inRange/3,
	range/3
	]).

sum(0, []).
sum(Sum,[Head|Tail]):-sum(K,Tail),Sum is K+Head.

% inRange(I, Low, Hi) I is between Low and Hi
inRange(Low, Low, High) :- Low =< High.
inRange(I, Low, High) :- Low < High, LessLow is Low + 1, inRange(I, LessLow, High).

range([N], N, N).
range([Low|Tail], Low, High) :- Low < High, LesLow is Low + 1, range(Tail, LesLow, High).


