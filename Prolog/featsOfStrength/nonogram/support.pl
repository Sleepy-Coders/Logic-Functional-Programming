:-module(support,[
	sumContents/2,
	inRange/2,
	inRange/3,
	append/2,
	range/3,
	genList/3,
	reverse/2,
	rotate/2,
	rotate/3
	]).

reverse([],[]).
reverse([X|R],Reversed) :- reverse(R, RevRest), append(RevRest,[X],Reversed).

sumContents([], 0):-!.
sumContents([Head|Tail],Sum):-sumContents(Tail,K),Sum is K+Head.

% inRange(I, Low, Hi) X is between Low and Hi
inRange(X, High) :- inRange(X, 0, High).
inRange(Low, Low, High) :- Low =< High.
inRange(X, Low, High) :- Low < High, LessLow is Low + 1, inRange(X, LessLow, High).

append([],[]):-!.
append([X|Tail],Z) :- append(X,Y,Z), append(Tail,Y).

range([N], N, N).
range([Low|Tail], Low, High) :- Low < High, LesLow is Low + 1, range(Tail, LesLow, High).

genList([],0,_).
genList(L,Size,Fill) :- length(L,Size),containsOnly(L,Fill).

containsOnly([X],X).
containsOnly([X|Tail],X) :- containsOnly(Tail,X).

contains([X|_],X).
contains([_|Tail],X):-contains(Tail,X).

matrix(A,Rows):-matrix_p(1,A,Rows),length(Rows,Length),length(A, Length).
matrix_p(0,[],_).
matrix_p(N,[X],A):-contains(A,line(N,Y)),contains(Y,X).
matrix_p(N,[X|Tail],A):-contains(A,line(N,Y)),contains(Y,X),N1 is N+1,matrix_p(N1,Tail,A).

rotate([], []).
rotate([F|Fs], Ts) :-
    rotate(F, [F|Fs], Ts).

rotate([], _, []).
rotate([_|Rs], Ms, [Ts|Tss]) :-
        lists_firsts_rests(Ms, Ts, Ms1),
        rotate(Rs, Ms1, Tss).

lists_firsts_rests([], [], []).
lists_firsts_rests([[F|Os]|Rest], [F|Fs], [Os|Oss]) :-
        lists_firsts_rests(Rest, Fs, Oss).