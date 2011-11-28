-module(server).
-export([start/0,service/0]).

service() ->
	receive
		finish -> io:format("server:service() finished~n", []);
		{{Message, {Set1,Set2}}, PID} ->
			io:format("~w ",[Message]),
	    fico:write_list(Set1),
			fico:write_list(Set2),
	    io:format("~n",[]),
	    case Message of
				unity -> PID ! prob_list:union(Set1,Set2);
				intersection -> PID ! prob_list:intersection(Set1,Set2)
			end,
	    service()
	end.

start() ->
    register(set, spawn(server, service, [])).