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

goal(state(_,_,_,has)).
goal(OldState):-action(OldState,Option,NewState),goal(NewState).