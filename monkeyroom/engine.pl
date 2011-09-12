/*
 *	atDoor, atWindows, atCenter
 *	onFloor, onBox
 *	state(BoxPlace, MonkeyH, MonkeyV, Has).
 *	goal(state(_,_,_,has)).
 *	mave(state(BoxPlace, X, onFloor, _),
 *	     goto(X,Y),
 *	     state(BoxPlace, Y, onFloor, _)).
 *
 *	goto(X, Y).
 *	push(X, Y).
 *	jump
 *	grab
 */
