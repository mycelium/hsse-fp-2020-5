%$ определить предикат mrg(L1, L2, R) который
% для двух отсортированных списков L1 и L2
% определяет список R, составленный из
% этих элементов

mrg(L1, [], L1).
mrg([], L2, L2).
mrg([HeadL1|TailL1], [HeadL2|TailL2], R) :- HeadL1 =< HeadL2, mrg(TailL1, [HeadL2|TailL2], Mrg), R = [HeadL1|Mrg].
mrg([HeadL1|TailL1], [HeadL2|TailL2], R) :- HeadL1 > HeadL2, mrg(TailL2, [HeadL1|TailL1], Mrg), R = [HeadL2|Mrg].

% ?- mrg([1,3,6],[2,4,8],X).
% X = [1, 2, 3, 4, 6, 8] .
