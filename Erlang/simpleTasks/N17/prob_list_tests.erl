-module(prob_list_tests).
-include_lib("eunit/include/eunit.hrl").

-define(TEST_LIST,[{3,0.2},{4,0.6},{5,1.0},{6,0.5}]).
-define(TEST_UNO_LIST,[{2,0.5}]).

contains_test() -> ?assertNot(prob_list:contains([],3)),
		    ?assert(prob_list:contains(?TEST_UNO_LIST,2)),
		    ?assertNot(prob_list:contains(?TEST_UNO_LIST,3)),
		    ?assert(prob_list:contains(?TEST_LIST,3)),
		    ?assert(prob_list:contains(?TEST_LIST,5)),
		    ?assertNot(prob_list:contains(?TEST_LIST,7)).

probability_test() -> ?assertNot(prob_list:probability([],3)),
		      ?assertEqual(0.5,prob_list:probability(?TEST_UNO_LIST,2)),
		      ?assertNot(prob_list:probability(?TEST_UNO_LIST,3)),
		      ?assertEqual(0.2,prob_list:probability(?TEST_LIST,3)),
		      ?assertEqual(1.0,prob_list:probability(?TEST_LIST,5)),
		      ?assertNot(prob_list:probability(?TEST_LIST,7)).
