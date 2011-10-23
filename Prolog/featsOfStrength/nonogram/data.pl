:-module(data,[nonogram/3]).

nonogram(windjammer,																% nonogramName
	[[1], [3], [1, 2], [1, 3], [2, 4], [7], [1], [10], [8]],						% rows
	[[1], [2, 2], [1, 2, 2], [1, 1, 2], [9], [5, 2], [3, 2], [2, 2], [1, 2], [1]]).	% columns
nonogram(smile,
	[[1, 1], [1, 1], [3]],
	[[1], [1, 1], [1], [1, 1], [1]]).
nonogram(snoopie, 
	[[3],[2,1],[1,1],[1,4],[1,1,1,1],[2,1,1,1],[2,1,1],[1,2],[2,3],[3]], 
	[[3],[2,1],[2,2],[2,1],[1,2,1],[1,1],[1,4,1],[1,1,2],[3,1],[4]]).
nonogram(flover,
	[[2],[1,1],[1,1],[2],[2,1],[1,2,2],[4,1],[3]],
	[[2],[1,1],[2],[2,4],[1,1,2],[1,1,1,1],[2,2],[0]]).
	