:-use_module(support).

generateCombos(RowCombos, ColCombos, Rows, Cols) :- 
		length(Rows, VSize),
		length(Cols, HSize),
		generate(RowCombos, Rows, HSize),
		generate(ColCombos, Cols, VSize).

generate(LineCombos, Lines, Size) :- generate_supp(1, LineCombos, Lines, Size).

generate_supp(_, [], [], _).
generate_supp(LineNumber, [line(LineNumber,Combos)|LineCombosTail], [Line|LinesTail], Size) :- 
		findall(Combo, combinate(Line, Size, Combo), Combos),
		NextLineNumber is LineNumber + 1,
		generate_supp(NextLineNumber, LineCombosTail, LinesTail, Size).

combinate(Line, Size, Combo) :- 
		sum(Sum, Line),
		length(Line, Length),
		CortegeLength is Sum + Length - 1,
		combinate_supp(Line, 1, CortegeLength, Size, [], Combo).

combinate_supp([0], _, _, _, _, []).
combinate_supp([Number], Start, _, Size, PreCombo, Combo) :- 
		End is Size - Number + 1,
		inRange(First, Start, End),
		Last is First + Number - 1,
		range(EndCombo, First, Last),
		append(PreCombo, EndCombo, Combo).
combinate_supp([Number|Tail], Start, CortegeLength, Size, PreCombo, Combo) :-
		End is Size - CortegeLength + 1,
		inRange(First, Start, End),
		Last is First + Number - 1,
		range(EndCombo, First, Last),
		NewCortegeLength is CortegeLength - Number - 1,
		NewStart is Last + 2,
		append(PreCombo, EndCombo, LowCombo),
		combinate_supp(Tail, NewStart, NewCortegeLength, Size, LowCombo, Combo).
%%
%	Takes combos that contains line Number.
%%
numberContainers(_, [], []).
numberContainers(Number, [List|Tails], Containers) :-
		member(Number,List), Containers = [List|CTail], numberContainers(Number, Tails, CTail), !;
		numberContainers(Number, Tails, Containers).

%%
%	Takes lines which numbers are members of specified comb and refines them.
%	Refination means taking only these combs which contains LineNumber.
%%
combMatch(_, [], _, []).
combMatch(LineNumber, [H|Tail], Lines, [MatchedLinesHead|MLTail]) :-
		member(line(H, Combs), Lines),
		numberContainers(LineNumber, Combs, MatchedCombs), MatchedCombs \= [],
		MatchedLinesHead = line(H, MatchedCombs),
		combMatch(LineNumber, Tail, Lines, MLTail).

linesMatch([], _, []).
linesMatch([line(RowNumber, [RowCombHead|RCTail])|RowsTail], Cols, MatchedLines) :-
		combMatch(RowNumber, RowCombHead, Cols, MatchedRefinedCols), MatchedRefinedCols \= [], replaceLines(Cols, MatchedRefinedCols, ColsWithMatchedRefinedCols), MatchedLines = [line(RowNumber, [RowCombHead])|MLTail], linesMatch(RowsTail, ColsWithMatchedRefinedCols, MLTail);
		linesMatch([line(RowNumber, RCTail)|RowsTail], Cols, MatchedLines).





%%
%	Tests data
%%
testData(windjammer,										% testName
	rows([[1], [3], [1, 2], [1, 3], [2, 4], [7], [1], [10], [8]]),				% rows
	cols([[1], [2, 2], [1, 2, 2], [1, 1, 2], [9], [5, 2], [3, 2], [2, 2], [1, 2], [1]])).	% columns
testData(smile,
	rows([[1, 1], [1, 1], [3]]),
	cols([[1], [1, 1], [1], [1, 1], [1]])).

testCombos(TestName, RowCombos, ColCombos) :-
		testData(TestName, rows(Rows), cols(Cols)),
		generateCombos(RowCombos, ColCombos, Rows, Cols).

execTestAndWriteRess(TestName):-
		nl,nl,write(TestName),write(':'),
		testData(TestName, rows(Rs), cols(Cs)),
		generateCombos(R, C, Rs, Cs),
		nl,write('Rows combinations:\t'),write(R),
		nl,write('Colums combinations:\t'),write(C),
		linesMatch(R, C, M),
		nl, write('Result:\t'), write(M).

execTest(TestName,M):-testData(TestName, rows(R), cols(C)),generateCombos(RC, CC, R, C),linesMatch(RC, CC, M).

:-nl,write('Tests start. Please wait for "Tests done." message.'),nl,nl.
:-execTestAndWriteRess(smile).
:-execTestAndWriteRess(windjammer).
:-nl,write('Tests done.').
:-nl,write('Tests profiling start. Please wait for "Tests profiling done" message.').
:-nl,write('smile:'),nl,	profile(execTest(smile,_)).
:-nl,write('windjammer:'),nl,	profile(execTest(windjammer,_)).
:-nl,write('Tests profiling done.'),nl,nl.
