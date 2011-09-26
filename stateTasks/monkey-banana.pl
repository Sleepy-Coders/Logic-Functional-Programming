%There is a monkey at the door into a room. In the middle of the room a banana is hanging from the ceiling. The monkey is hungry and wants to get the banana, but he cannot stretch high enough from the floor. At the window of the room there is a box the monkey may use.

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
 *		[HorizontalMonkeyPosition, HorizontalBoxPosition, VerticalMonkeyPosition, BananaState]
 */

action([atCenter, atCenter, onBox, hasNot],grab,[atCenter, atCenter, onBox, has]).					%grab action
action([BoxPos, BoxPos, onFloor, Banana],jump,[BoxPos, BoxPos, onBox, Banana]).						%jump action
action([BoxPosX, BoxPosX, onFloor, Banana],push(BoxPosX, BoxPosY),[BoxPosY, BoxPosY, onFloor, Banana]).			%push action
action([MonkeyPosX, BoxPos, onFloor, Banana],goto(MonkeyPosX,MonkeyPosY),[MonkeyPosY, BoxPos, onFloor, Banana]).	%goto action


goal([_,_,_,has],[]).
goal(OldState, [Action|L]):-action(OldState,Action,NewState), goal(NewState, L).

/*
 *	Line below is for faster debugging or program starting.
 */
check(L) :- goal([atDoor, atWindow, onFloor, hasNot],L).

