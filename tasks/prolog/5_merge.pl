% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg([],[], []).
mrg(L1, [], L1).
mrg([], L2, L2).
mrg([L1_Head|L1_Tail], [L2_Head|L2_Tail], [L1_Head|Result_Tail]) :- L1_Head < L2_Head, !, mrg(L1_Tail, [L2_Head|L2_Tail], Result_Tail).
mrg([L1_Head|L1_Tail], [L2_Head|L2_Tail], [L2_Head|Result_Tail]) :- mrg([L1_Head|L1_Tail], L2_Tail, Result_Tail).