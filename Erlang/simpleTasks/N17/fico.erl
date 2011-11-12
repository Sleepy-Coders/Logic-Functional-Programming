-module(fico).
-export([read_file/1,write_list/1]).

read_file(File) ->
    {ok, Device} = file:open(File,read),
    read_to_list(Device, []).

read_to_list(Device, List) ->
    case io:fread(Device, "", "~d/~f") of
	eof -> file:close(Device), lists:reverse(List);
	{ok, [Num, Probability]} -> read_to_list(Device, [{Num,Probability}|List])
    end.

write_list(List)                       -> io:format("{~s}",[compose_list(List)]).

compose_list([])                       -> "";
compose_list([{Num,Probability}])      -> io_lib:format("~b/~3.1f", [Num, Probability]); 
compose_list([{Num,Probability}|Tail]) -> io_lib:format("~b/~3.1f, ~s", [Num, Probability, compose_list(Tail)]).
