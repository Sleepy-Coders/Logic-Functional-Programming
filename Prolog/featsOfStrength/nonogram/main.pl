:-use_module(support).

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

%solves and prints	
nonogram(Rows,Cols):-length(Rows, VSize), length(Cols, HSize), generate(RowCombo, Rows, HSize), generate(ColCombo, Cols, VSize), rotate(RowCombo,ColCombo), writeNono(RowCombo).
%time of solution rizes aproximately exponentialy to the size of task………


%stack overflow here
allCombos(Rows,Cols,X,Y):-length(Rows, VSize), length(Cols, HSize), findall(RowCombo,`generate(RowCombo, Rows, HSize)`,X), findall(ColCombo,generate(ColCombo, Cols, VSize),Y).
genRot(RowCombo, Cols, VSize):-generate(X, Cols, VSize),rotate(X,RowCombo).
%and here
allCombosT(Rows,Cols,X,Y):-length(Rows, VSize), length(Cols, HSize), findall(RowCombo,genRot(RowCombo, Rows, HSize),X), findall(ColCombo,generate(ColCombo, Cols, VSize),Y).

%output stuff
writeNono([]).
writeNono([X|Tail]):-writeLine(X),write('\n'),writeNono(Tail).

writeLine([]).
writeLine([X|Tail]):-(X=:=1,write('#');X=:=0,write(' ')),writeLine(Tail).