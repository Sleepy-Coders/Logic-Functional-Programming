-module(vectio).
-export([read_file/1,
	 write_vector/1]).

read_file(File)            ->
    {ok, Device} = file:open(File,read),
    read_to_list(Device, []).

read_to_list(Device, List) ->
    case io:fread(Device, "", "~d") of
	eof -> file:close(Device), lists:reverse(List);
	{ok, [Num]} -> read_to_list(Device, [Num|List])
    end.

write_vector(Vector)      -> io:format("(~s)", [preformat_vector(Vector)]).

preformat_vector([])         -> "";
preformat_vector([Num])      -> io_lib:format("~w", [Num]);
preformat_vector([Num|Tail]) -> 
    io_lib:format("~w, ~s", [Num, preformat_vector(Tail)]).
