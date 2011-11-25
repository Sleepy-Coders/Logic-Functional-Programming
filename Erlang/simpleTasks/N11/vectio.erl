-module(vectio).
-export([read_file/1,write_list/1]).

read_file(File)            ->
    {ok, Device} = file:open(File,read),
    read_to_list(Device, []).

read_to_list(Device, List) ->
    case io:fread(Device, "", "~d") of
	eof -> file:close(Device), lists:reverse(List);
	{ok, [Num]} -> read_to_list(Device, [Num|List])
    end.

write_list(List)          -> io:format("{~s}",format_vector(List)).

format_vector([])         -> "";
format_vector([Num])      -> io_lib:format("~d", Num);
format_vector([Num|Tail]) -> io_lib:format("~d, ~s", Num, format_vector(Tail)).
