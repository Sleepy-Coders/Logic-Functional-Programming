:-use_module(support).

generateCombos(RowCombos, ColCombos, Rows, Cols) :- length(Rows, VSize), length(Cols, HSize), generate(RowCombos, Rows, HSize), generate(ColCombos, Cols, VSize).

%### 1st gen ###
/*generate(LineCombos, Lines, Size) :- generate_supp(1, LineCombos, Lines, Size).
generate_supp(_, [], [], _).
generate_supp(LineNumber, [line(LineNumber,Combos)|LineCombosTail], [Line|LinesTail], Size) :- findall(Combo, combinate(Line, Size, Combo), Combos), NextLineNumber is LineNumber + 1, generate_supp(NextLineNumber, LineCombosTail, LinesTail, Size).

combinate(Line, Size, Combo) :- sum(Sum, Line), length(Line, Length), CortegeLength is Sum + Length - 1, combinate_supp(Line, 1, CortegeLength, Size, [], Combo).
combinate_supp([0], _, _, _, _, []).
combinate_supp([Number], Start, _, Size, PreCombo, Combo) :- End is Size - Number + 1, inRange(First, Start, End), Last is First + Number - 1, range(EndCombo, First, Last), append(PreCombo, EndCombo, Combo).
combinate_supp([Number|Tail], Start, CortegeLength, Size, PreCombo, Combo) :- End is Size - CortegeLength + 1, inRange(First, Start, End), Last is First + Number - 1, range(EndCombo, First, Last), NewCortegeLength is CortegeLength - Number - 1, NewStart is Last + 2, append(PreCombo, EndCombo, LowCombo), combinate_supp(Tail, NewStart, NewCortegeLength, Size, LowCombo, Combo).
*/

%### 2st gen ###
generate([], [], _):-!.
generate([Combo|CombosTail],[Line|LinesTail], Size) :- combine(Line, Size, Combo), generate(CombosTail, LinesTail, Size).

% combine(Cortege, FrameSize, Combo).
combine([0], FrameSize, Combo):-!,genList(Combo, FrameSize, 0).

combine([X], FrameSize, Combo):-!,
	FreeSpace is FrameSize - X,
	inRange(Start, FreeSpace),
	End is FreeSpace - Start,
	genList(Part1, Start, 0),
	genList(Part2, X, 1),
	genList(Part3, End, 0),
	append([Part1, Part2, Part3], Combo).
combine([X|Cortage], FrameSize, Combo):-
	sumContents(Cortage, CortageSum),
	length(Cortage, CortageLength), 
	FreeSpace is (FrameSize - CortageSum - CortageLength - X),
	inRange(Start, FreeSpace),
	genList(Part1,Start,0),
	genList(Part2,X,1),
	CortageFrame is (FrameSize - Start - X - 1),
	combine(Cortage, CortageFrame, Part4),
	append([Part1,Part2,[0],Part4],Combo).
	
nonogram(Rows,Cols):-length(Rows, VSize), length(Cols, HSize), generate(RowCombo, Rows, HSize), generate(ColCombo, Cols, VSize), rotate(RowCombo,ColCombo), writeNono(RowCombo).
allCombos(Rows,Cols,X,Y):-length(Rows, VSize), length(Cols, HSize), findall(RowCombo,generate(RowCombo, Rows, HSize),X), findall(ColCombo,generate(ColCombo, Cols, VSize),Y).
genRot(RowCombo, Cols, VSize):-generate(X, Cols, VSize),rotate(X,RowCombo).
allCombosT(Rows,Cols,X,Y):-length(Rows, VSize), length(Cols, HSize), findall(RowCombo,genRot(RowCombo, Rows, HSize),X), findall(ColCombo,generate(ColCombo, Cols, VSize),Y).

writeNono([]).
writeNono([X|Tail]):-writeLine(X),write('\n'),writeNono(Tail).

writeLine([]).
writeLine([X|Tail]):-(X=:=1,write('#');X=:=0,write(' ')),writeLine(Tail).

%sth(Rows,Cols):-length(Rows, VSize), length(Cols, HSize), generate(RowCombos, Rows, HSize), generate(_, Cols, VSize), matrix(ZZZ,RowCombos), transpose(ZZZ,XXX),write(XXX).