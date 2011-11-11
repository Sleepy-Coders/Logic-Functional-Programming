-module(fico).
-export([read_file/1]).

read_file(File) ->
    {ok, Device} = file:open(File,read),
    read_to_list(Device, []).

read_to_list(Device, List) ->
    case io:fread(Device, "", "~d/~f") of
	eof -> file:close(Device), lists:reverse(List);
	{ok, [Num, Probability]} -> read_to_list(Device, [{Num,Probability}|List])
    end.
