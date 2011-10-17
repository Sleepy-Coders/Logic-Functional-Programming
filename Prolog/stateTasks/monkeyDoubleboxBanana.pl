/*
 *	Horizontal positions:
 *		atDoor, atWindows, atCenter
 *	Vertical positions:
 *		onFloor, onBox
 *	Banana state:
 *		has, hasNot
 *
 *	Actions:
 *		goto(X, Y)
 *		push(X, Y)
 *		jump
 *		grab
 *	
 *	State
 *		[HorizontalMonkeyPosition, [HorizontalBox1Position,HorizontalBox2Position], [VerticalBoxPosition, VerticalBox2Position], VerticalMonkeyPosition, BananaState]
 */

action([atCenter, [atCenter,atCenter], [onFloor, onBox], on2Box, hasNot],
       grab,
       [atCenter, [atCenter,atCenter], [onFloor, onBox], on2Box, has]).			%grab action
action([atCenter, [atCenter,atCenter], [onBox, onFloor], on2Box, hasNot],
       grab,
       [atCenter, [atCenter,atCenter], [onBox, onFloor], on2Box, has]).			%grab action

action([BHPos, [BHPos,BHPos], [onFloor, onBox], onBox, Banana],
       jump,
       [BHPos, [BHPos,BHPos], [onFloor, onBox], on2Box, Banana]).			%jump action
action([BHPos, [BHPos,BHPos], [onBox, onFloor], onBox, Banana],
       jump,
       [BHPos, [BHPos,BHPos], [onBox, onFloor], on2Box, Banana]).			%jump action

action([BHPos, [BHPos,B2HPos], [onFloor, B2VPos], onFloor, Banana],
       jump,
       [BHPos, [BHPos,B2HPos], [onFloor, B2VPos], onBox, Banana]).			%jump action
action([B2HPos, [BHPos,B2HPos], [BVPos, onFloor], onFloor, Banana],
       jump,
       [B2HPos, [BHPos,B2HPos], [BVPos, onFloor], onBox, Banana]).			%jump action

action([BHPos, [BHPos,BHPos], [onFloor, onFloor], onFloor, Banana],
       put,
       [BHPos, [BHPos,BHPos], [onFloor, onBox], onFloor, Banana]).			%put action
action([BHPos, [BHPos,BHPos], [onFloor, onFloor], onFloor, Banana],
       put,
       [BHPos, [BHPos,BHPos], [onBox, onFloor], onFloor, Banana]).			%put action

action([BHPosX, [BHPosX,B2HPos], [onFloor, B2VPos], onFloor, Banana],
       push(BHPosX, BHPosY),
       [BHPosY, [BHPosY,B2HPos], [onFloor, B2VPos], onFloor, Banana]).			%push action
action([B2HPosX, [BHPos,B2HPosX], [BVPos, onFloor], onFloor, Banana],
       push(B2HPosX, B2HPosY),
       [B2HPosY, [BHPos,B2HPosY], [BVPos, onFloor], onFloor, Banana]).			%push action

action([MonkeyPosX, [BHPos,B2HPos], [BVPos, B2VPos], onFloor, Banana],
       goto(MonkeyPosX,MonkeyPosY),
       [MonkeyPosY, [BHPos,B2HPos], [BVPos, B2VPos], onFloor, Banana]).			%goto action

%present(Elem, [Elem|_]).
%present(Elem, [_|Tail]) :- present(Elem, Tail).

%goal([_,_,_,_,has],[],_).
%goal(OldState, [Action|L], PrevStates) :- action(OldState,Action,NewState), 
%						     not(present(NewState,[OldState|PrevStates])),	Here needed concrete variable value.
%						     goal(NewState, L, [OldState|PrevStates]).
goal([_,_,_,_,has],[]).
goal(OldState, [Action|L]) :- action(OldState,Action,NewState), goal(NewState, L).

/*
 *	Line below is for faster debugging or program starting.
 */
%check(L) :- goal([atDoor, [atWindow, atLamp], [onFloor, onFloor], onFloor, hasNot],L,[]).
check(L, N) :- length(L,N), goal([atDoor, [atWindow, atLamp], [onFloor, onFloor], onFloor, hasNot],L); M is N+1, check(L,M).
check(L) :- check(L, 0).
