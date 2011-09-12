/*
 *	atDoor, atWindows, atCenter
 *	onFloor, onBox
 *	has, hasNot
 *
 *	goto(X, Y).
 *	push(X, Y).
 *	jump
 *	grab
 */

action(state(atCenter, atCenter, onBox, hasNot),grab,state(atCenter, atCenter, onBox, has)).					%jump action
action(state(atCenter, atCenter, onFloor, hasNot),jump,state(atCenter, atCenter, onBox, hasNot)).				%jump action
action(state(BoxPlaceX, BoxPlaceX, onFloor, hasNot),push(BoxPlaceX, BoxPlaceY),state(BoxPlaceY, BoxPlaceY, onFloor, hasNot)).	%push action
action(state(PosX, BoxPlace, onFloor, hasNot),goto(PosX,PosY),state(PosY, BoxPlaceX, onFloor, hasNot)).				%goto action

action(goto(From, Where)) :- coordX(From), coordX(Where), (From\=Where).
action(push(From, Where)) :- coordX(From), coordX(Where), (From\=Where).
action(jump).
action(grab).

coordX(atDoor).
coordX(atWindow).
coordX(atCenter).

goal(state(_,_,_,has)).
goal(OldState):-action(OldState,Action,NewState), action(Action), goal(NewState), (OldState\=NewState).

/*
 *	Below is line for faster debugging or program starting.
 */
check(X) :- (X=state(atWindow, atDoor, onFloor, hasNot)), goal(X).

