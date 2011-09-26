%There is a monkey at the door into a room. In the middle of the room a banana is hanging from the ceiling. The monkey is hungry and wants to get the banana, but he cannot stretch high enough from the floor. At the window of the room and near the tree there are two boxes the monkey may use.

/*
 *	Horizontal positions:
 *		atDoor, atWindows, atCenter
 *	Vertical positions:
 *		onFloor, onBox
 *	Boxes States:
 *		stacked, separate
 *	Banana state:
 *		has, hasNot
 *
 *	Actions:
 *		goto(X, Y)
 *		push(X, Y)
 *		jump
 *		grab
 *	
 *	state(HorizontalMonkeyPosition, HorizontalBox1Position, HorizontalBox2Position, BoxsState, VerticalMonkeyPosition, BananaState)
 */

action(state(atCenter, atCenter, atCenter, BoxsState, onBox, hasNot),grab,state(atCenter, atCenter, atCenter, BoxsState, onBox, has)).					%grab action
action(state(atCenter, atCenter, atCenter, stacked, onFloor, Banana),jump,state(atCenter, atCenter, atCenter, stacked, onBox, Banana)).					%jump action
action(state(BoxPos, BoxPos, BoxPos, separate, onFloor, Banana),stack,state(BoxPos, BoxPos, BoxPos, stacked, onFloor, Banana)).						%stack action
action(state(Box1PosX, Box1PosX, Box2Pos, separate, onFloor, Banana),pushBox1(Box1PosX, Box1PosY),state(Box1PosY, Box1PosY, Box2Pos, separate, onFloor, Banana)).	%pushBox1 action
action(state(Box2PosX, Box1Pos, Box2PosX, separate, onFloor, Banana),pushBox2(Box2PosX, Box2PosY),state(Box2PosY, Box1Pos, Box2PosY, separate, onFloor, Banana)).	%pushBox2 action
action(state(MonkeyPosX, Box1Pos, Box2Pos, separate, onFloor, Banana),goto(MonkeyPosX,MonkeyPosY),state(MonkeyPosY, Box1Pos, Box2Pos, separate, onFloor, Banana)).	%goto action


goal(state(_,_,_,_,_,has),[]).
goal(OldState, [Action|L]):-action(OldState,Action,NewState), goal(NewState, L).

/*
 *	Line below is for faster debugging or program starting.
 */
check(L) :- goal(state(atDoor, atWindow, nearTree, separate, onFloor, hasNot),L).

