-module(vect_client).
-compile(export_all).

ask(Srv_Node) ->
    {vector, Srv_Node} ! {{norm, [3,4]}, self()},
    receive
	A -> io:format("Received ~w.~n", [A]) 
    end,
    {vector, Srv_Node} ! {{asc, vectio:read_file("data.txt")}, self()},
    receive
	An -> io:format("Received ~w.~n", [An]) 
    end,
    {vector, Srv_Node} ! {{desc, vectio:read_file("data.txt")}, self()},
    receive
	Ans -> io:format("Received ~w.~n", [Ans]) 
    end,
    {vector, Srv_Node} ! {finish, self()}.

push_server(Srv_Node) ->
    spawn(vect_client, ask, [Srv_Node]).
