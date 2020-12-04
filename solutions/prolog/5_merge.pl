mrg([ A | L1 ], [ B | L2 ], [ A | R ]):- A =< B, mrg(L1, [ B | L2 ], R ).
mrg([ A | L1 ], [ B | L2 ], [ B | R ]):- A > B, mrg([ A | L1 ], L2, R) .

mrg([], [ B | L2 ], [ B | R ]):- mrg([], L2, R).
mrg([ A | L1 ], [], [ A | R ]):- mrg(L1, [], R).

mrg([], [], []).