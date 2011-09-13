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
 *	state(HorizontalMonkeyPosition, HorizontalBoxPosition, VerticalMonkeyPosition, BananaState)
 */

action(state(atCenter, atCenter, onBox, hasNot),grab,state(atCenter, atCenter, onBox, has)).					%jump action
action(state(BoxPos, BoxPos, onFloor, Banana),jump,state(BoxPos, BoxPos, onBox, Banana)).					%jump action
action(state(BoxPosX, BoxPosX, onFloor, Banana),push(BoxPosX, BoxPosY),state(BoxPosY, BoxPosY, onFloor, Banana)).		%push action
action(state(MonkeyPosX, BoxPos, onFloor, Banana),goto(MonkeyPosX,MonkeyPosY),state(MonkeyPosY, BoxPos, onFloor, Banana)).	%goto action

goal(state(_,_,_,has)).
goal(OldState):-action(OldState,Action,NewState), goal(NewState),writef("%w\t",[Action]).

/*
 *	Line below is for faster debugging or program starting.
 */
check(_) :- goal(state(atDoor, atWindow, onFloor, hasNot)).

