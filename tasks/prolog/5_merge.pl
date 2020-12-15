% $ определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg(X, [], X) :-!.
mrg([], X, X) :-!.
mrg([], [], []) :-!.



mrg([Head1|Tail1], [Head2|Tail2], [Head1|Tail3]) :-
Head1 < Head2, 
    mrg(Tail1, [Head2|Tail2], Tail3).

mrg([Head1|Tail1], [Head2|Tail2], [Head2|Tail3]) :-
Head1 > Head2, 
    mrg([Head1|Tail1], Tail2, Tail3).

mrg([Head1|Tail1], [Head2|Tail2], [Head1, Head2|Tail3]) :-
    mrg(Tail1, Tail2, Tail3).



% mrg([2, 25, 34, 66, 81], [11, 44, 59, 75, 96], R).
% R = [2,11,25,34,44,59,66,75,81,96] ?