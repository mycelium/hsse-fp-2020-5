% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg([Start|L1], [End|L2], [Start|R]):- Start=<End, mrg(L1, [End|L2], R).

mrg([Start|L1], [End|L2], [End|R]):- Start>End, mrg([Start|L1], L2, R).

mrg([], [End|L2], [End|R]):- mrg([], L2, R).

mrg([Start|L1], [], [Start|R]):- mrg(L1, [], R).

mrg([], [], []).
