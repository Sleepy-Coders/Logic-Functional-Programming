:-use_module(support).
:-use_module(data).
		
%%		
%	Generates all possible combos for passed lines conditions, and length
%%
generate(LineCombos, Lines, Size) :- generate_supp(1, LineCombos, Lines, Size).

%%
%	Supportive predicate for generate/3 to include line number
%%
generate_supp(_, [], [], _).
generate_supp(LineNumber, [line(LineNumber,Combos)|LineCombosTail], [Line|LinesTail], Size) :- 
		findall(Combo, combinate(Line, Size, Combo), Combos),
		NextLineNumber is LineNumber + 1,
		generate_supp(NextLineNumber, LineCombosTail, LinesTail, Size).

%%
%	Returns possible line for passed conditions and size
%%
combinate(Line, Size, Combo) :- 
		sum(Sum, Line),
		length(Line, Length),
		CortegeLength is Sum + Length - 1,
		combinate_supp(Line, 1, CortegeLength, Size, [], Combo).

%%
%	Supportive predicate for combinate/3
%%
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
		combMatch(RowNumber, RowCombHead, Cols, MatchedRefinedCols), MatchedRefinedCols \= [], replaceLines(Cols, MatchedRefinedCols, ColsWithMatchedRefinedCols), MatchedLines = [/*line(RowNumber, [*/RowCombHead/*])*/|MLTail], linesMatch(RowsTail, ColsWithMatchedRefinedCols, MLTail);
		linesMatch([line(RowNumber, RCTail)|RowsTail], Cols, MatchedLines).

%%
%	Nonogram printing.
%%
printlist([]).
printlist([H|T]) :- number(H), swritef(S, '~` t#~%w|', [H]), format(S, []), printlist(T).

printNonogram([]).
printNonogram([H|T]):- printlist(H), nl, printNonogram(T).


%%
%	Solving nonograns.
%%
solveNonogram(Rows,Cols,Solution):-
		length(Rows, VSize),
		length(Cols, HSize),
		generate(RowCombos, Rows, HSize),
		generate(ColCombos, Cols, VSize),
		linesMatch(RowCombos, ColCombos, Solution).
solveNonogram(Nonogram):-nonogram(Nonogram,Rows,Cols),solveNonogram(Rows,Cols,Solution),printNonogram(Solution).
