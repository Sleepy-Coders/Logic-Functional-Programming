-module(n11_tests).
-include_lib("eunit/include/eunit.hrl").

euclidean_norm_test() ->
    ?assert(5 == n11:euclidean_norm([3,-4])),
    ?assert(5 == n11:euclidean_norm([5])),
    ?assert(0 == n11:euclidean_norm([0,0,0])),
    ?assert(2 == n11:euclidean_norm([-1,1,-1,1])).

longest_ascendings_length_test() ->
    ?assert(5 == n11:longest_ascendings_length(vectio:read_file("data.txt"))),
    ?assert(7 == n11:longest_descendings_length(vectio:read_file("data.txt"))).
