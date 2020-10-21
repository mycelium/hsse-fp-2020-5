$ определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg(L1, [], L1).
mrg([], L2, L2).
mrg([StartL1|EndL1], [StartL2|EndL2], R) :- StartL1 =< StartL2, mrg(EndL1, [StartL2|EndL2], Mrg), R = [StartL1|Mrg].
mrg([StartL1|EndL1], [StartL2|EndL2], R) :- StartL1 > StartL2, mrg(EndL2, [StartL1|EndL1], Mrg), R = [StartL2|Mrg].

% ?- mrg([2,4,6],[1,3,5],X).
% X = [1, 2, 3, 4, 5, 6].

% ?- mrg([2,55,66],[44,55,55],X).
% X = [2, 44, 55, 55, 55, 66] .

% ?- mrg([2,22,88],[4,33,100],X).
% X = [2, 4, 22, 33, 88, 100] .
