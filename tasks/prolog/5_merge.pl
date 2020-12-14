$ определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg([],[], []).
mrg(L1, [], L1).
mrg([], L2, L2).
mrg([Head1|L1], [Head2|L2], [Head1|R]) :- Head1 < Head2, mrg(L1, [Head2|L2], R).
mrg([Head1|L1], [Head2|L2], [Head2|R]) :- Head1 >= Head2, mrg([Head1|L1], L2, R).