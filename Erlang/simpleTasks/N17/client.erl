-module(client).
-export([poke/1,ask/1]).

ask(Srv_Node) ->
    {set, Srv_Node} ! {{unity, {fico:read_file("data.txt"),fico:read_file("data1.txt")}}, self()},
    receive
			An -> io:format("Received ~w.~n", [An]) 
    end,
    {set, Srv_Node} ! {{intersection, {fico:read_file("data.txt"),fico:read_file("data1.txt")}}, self()},
    receive
			Ans -> io:format("Received ~w.~n", [Ans]) 
    end,
    {set, Srv_Node} ! finish.

poke(Srv_Node) ->
    spawn(client, ask, [Srv_Node]).