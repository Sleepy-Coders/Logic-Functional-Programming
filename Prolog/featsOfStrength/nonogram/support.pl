:-module(support,[
	sum/2,
	inRange/3,
	range/3,
	replaceLines/3
	]).

% sum(Summ, List) - Summ of elements of List
sum(0, []).
sum(Sum,[Head|Tail]):-sum(K,Tail),Sum is K+Head.

% inRange(I, Low, Hi) I is between Low and Hi
inRange(Low, Low, High) :- Low =< High.
inRange(I, Low, High) :- Low < High, LessLow is Low + 1, inRange(I, LessLow, High).

range([N], N, N).
range([Low|Tail], Low, High) :- Low < High, LesLow is Low + 1, range(Tail, LesLow, High).

replaceLines([], _, []).
replaceLines([line(N, Combs)|LTail], Lines, [ListWithReplacedLinesHead|LWRLTail]) :-
		(member(line(N, C), Lines), ListWithReplacedLinesHead = line(N, C), !; ListWithReplacedLinesHead = line(N, Combs)),
		replaceLines(LTail, Lines, LWRLTail).
