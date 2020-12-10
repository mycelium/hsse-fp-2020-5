% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2
% определяет список R, составленный из этих элементов

mrg([],[],[]).
mrg(L1,[],L1).
mrg([],L2,L2).

mrg(L1,L2,R) :- L1 = [RootL1|RestL1], L2 = [RootL2|RestL2], R = [RootL1|RestR],
    RootL1 =< RootL2,
    mrg(RestL1,L2,RestR).

mrg(L1,L2,R) :- L1 = [RootL1|RestL1], L2 = [RootL2|RestL2], R = [RootL2|RestR],
    RootL1 > RootL2,
    mrg(L1,RestL2,RestR).

% ?- mrg([1,2,5,7,16],[-6,4,15,22],R).
% R = [-6, 1, 2, 4, 5, 7, 15, 16, 22]
