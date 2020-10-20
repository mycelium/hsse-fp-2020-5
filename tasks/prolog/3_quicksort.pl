% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

partition(_, [], [], []).

partition(P, [ H | T ], [ H | Left ], Right) :-
    H =< P, 
    partition(P, T, Left, Right).

partition(P, [ H | T ], Left, [ H | Right ]) :-
    H > P, 
    partition(P, T, Left, Right).

qsort([], []).

qsort([ H | T ], K) :-
    partition(H, T, L, R),
    qsort(L, Left),
    qsort(R, Right),
    append(Left, [ H | Right], K).

