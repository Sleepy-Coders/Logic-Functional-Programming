-module(prob_list_tests).
-include_lib("eunit/include/eunit.hrl").

-define(TEST_LIST,[{3,0.2},{4,0.6},{5,1.0},{6,0.5}]).
-define(TEST_LIST1,[{2,0.9},{3,0.6},{6,0.1},{8,0.5}]).
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

lesslist_test() -> ?assertEqual([],prob_list:lesslist([],3)).

intersection_test() -> ?assertEqual([],prob_list:intersection([],[])),
		       ?assertEqual([],prob_list:intersection([],?TEST_LIST)),
		       ?assertEqual([],prob_list:intersection(?TEST_LIST,[])),
		       ?assertEqual([],prob_list:intersection(?TEST_LIST, ?TEST_UNO_LIST)),
		       ?assertEqual([{2,0.45}],prob_list:intersection(?TEST_UNO_LIST, ?TEST_LIST1)),
		       ?assertEqual([{3,0.12},{6,0.05}],prob_list:intersection(?TEST_LIST, ?TEST_LIST1)).

union_test() -> ?assertEqual([],prob_list:union([],[])),
		?assertEqual(?TEST_LIST,prob_list:union(?TEST_LIST,[])),
		?assertEqual(?TEST_LIST,prob_list:union([],?TEST_LIST)),
		?assertEqual([{2,0.5},{3,0.2},{4,0.6},{5,1.0},{6,0.5}],prob_list:union(?TEST_UNO_LIST, ?TEST_LIST)),
		?assertEqual([{2,0.95},{3,0.6},{6,0.1},{8,0.5}],prob_list:union(?TEST_UNO_LIST, ?TEST_LIST1)).
