:-use_module(support).

generateCombos(RowCombos, ColCombos, Rows, Cols) :- length(Rows, VSize), length(Cols, HSize), generate(RowCombos, Rows, HSize), generate(ColCombos, Cols, VSize).

generate(LineCombos, Lines, Size) :- generate_supp(1, LineCombos, Lines, Size).
generate_supp(_, [], [], _).
generate_supp(LineNumber, [line(LineNumber,Combos)|LineCombosTail], [Line|LinesTail], Size) :- findall(Combo, combinate(Line, Size, Combo), Combos), NextLineNumber is LineNumber + 1, generate_supp(NextLineNumber, LineCombosTail, LinesTail, Size).

combinate(Line, Size, Combo) :- sum(Sum, Line), length(Line, Length), CortegeLength is Sum + Length - 1, combinate_supp(Line, 1, CortegeLength, Size, [], Combo).
combinate_supp([0], _, _, _, _, []).
combinate_supp([Number], Start, _, Size, PreCombo, Combo) :- End is Size - Number + 1, inRange(First, Start, End), Last is First + Number - 1, range(EndCombo, First, Last), append(PreCombo, EndCombo, Combo).
combinate_supp([Number|Tail], Start, CortegeLength, Size, PreCombo, Combo) :- End is Size - CortegeLength + 1, inRange(First, Start, End), Last is First + Number - 1, range(EndCombo, First, Last), NewCortegeLength is CortegeLength - Number - 1, NewStart is Last + 2, append(PreCombo, EndCombo, LowCombo), combinate_supp(Tail, NewStart, NewCortegeLength, Size, LowCombo, Combo).
