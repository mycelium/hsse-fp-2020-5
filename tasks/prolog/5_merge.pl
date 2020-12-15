% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg([LH | LT], [RH | RT], R) :-
    LH < RH,
    append([LH], TMP, R),
    mrg(LT, [RH | RT], TMP).

mrg([LH | LT], [RH | RT], R) :-
    LH >= RH,
    append([RH], TMP, R)
    mrg([LH | LT], RT, TMP).

mrg([], RL, R) :- R = RL.
mrg(LL, [], R) :- R = LL.

% ?- mrg([1,3],[2,4],[1,2,3,4])
% true