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
action(state(BoxPlace, BoxPlace, onFloor, hasNot),jump,state(BoxPlace, BoxPlace, onBox, hasNot)).				%jump action
action(state(BoxPlaceX, BoxPlaceX, onFloor, hasNot),push(BoxPlaceX, BoxPlaceY),state(BoxPlaceY, BoxPlaceY, onFloor, hasNot)).	%push action
action(state(BoxPlace, PosX, onFloor, hasNot),goto(PosX,PosY),state(BoxPlace, PosY, onFloor, hasNot)).				%goto action

/*
*	action(goto(From, Where)) :- coordX(From), coordX(Where), (From\=Where).
*	action(push(From, Where)) :- coordX(From), coordX(Where), (From\=Where).
*	action(jump).
*	action(grab).
*	
*	coordX(atDoor).
*	coordX(atWindow).
*	coordX(atCenter).
*/

goal(state(_,_,_,has)).
%goal(OldState):-action(OldState,Action,NewState), action(Action), goal(NewState), (OldState\=NewState).
goal(OldState):-%(OldState = state(_,_,_,has));
                action(OldState,Action,NewState), goal(NewState),writef("%w\t",[Action]).%, (OldState\=NewState).

/*
 *	Below is line for faster debugging or program starting.
 */
check(_) :- goal(state(atWindow, atDoor, onFloor, hasNot)).

