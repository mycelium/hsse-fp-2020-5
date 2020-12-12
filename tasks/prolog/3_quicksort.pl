% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([],[]).

qsort([Pivot | Rest], Sorted) :-
    append(LeftSorted, [Pivot | RightSorted], Sorted),
    partition(Pivot, Rest, Left, Right),
    qsort(Left, LeftSorted),
    qsort(Right, RightSorted).

partition(_, [], [], []).

partition(Pivot, [Number | Rest], [Number | Left], Right) :-
    Number =< Pivot,
    partition(Pivot, Rest, Left, Right).

partition(Pivot, [Number | Rest], Left, [Number |Right]) :-
    Number > Pivot,
    partition(Pivot, Rest, Left, Right).
