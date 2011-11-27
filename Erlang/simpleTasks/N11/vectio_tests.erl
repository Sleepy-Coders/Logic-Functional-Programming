-module(vectio_tests).
-include_lib("eunit/include/eunit.hrl").

read_file_test() ->
    ?assert([1,2,3,4,5,4,3,2,1,0,-1] == vectio:read_file("data.txt")).
