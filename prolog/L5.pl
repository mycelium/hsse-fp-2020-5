mrg([],[], _).
mrg([], L2, L2).
mrg(L1, [], L1).
mrg([L1H|L1T], [L2H|L2T], [L1H|Tail]) :-
    L1H =< L2H, mrg(L1T, [L2H|L2T], Tail).
mrg([L1H|L1T], [L2H|L2T], [L2H|Tail]) :-
    L2H < L1H, mrg([L1H|L1T], L2T, Tail).