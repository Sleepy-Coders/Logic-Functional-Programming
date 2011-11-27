-module(vect_server).
-compile(export_all).

service() ->
    receive
	finish ->
	    io:format("vect_server:service() finished~n", []);
	{{Message, Vector}, PID} ->
	    io:format("~w ",[Message]),
	    vectio:write_vector(Vector),
	    io:format("~n",[]),
	    case Message of
		norm -> PID ! n11:euclidean_norm(Vector);
		asc -> PID ! n11:longest_ascendings_length(Vector);
		desc -> PID ! n11:longest_descendings_length(Vector)
	    end,
	    service()
    end.

start_service() ->
    register(vector, spawn(vect_server, service, [])).
