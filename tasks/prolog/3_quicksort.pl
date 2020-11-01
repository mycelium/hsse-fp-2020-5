% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([],[]).
qsort([Current | Rest], Sort) :-
    partition(Current, Rest, LList, RList),
    qsort(LList, LSort),
    qsort(RList, RSort),
    append(LSort, [Current | RSort], Sort).

partition(_, [], [], []).
partition(Current, [Num | Rest], [Num | Left], Right) :-
    Num < Current,
    partition(Current, Rest, Left, Right).

partition(Current, [Num | Rest], Left, [Num |Right]) :-
    Num >= Current,
    partition(Current, Rest, Left, Right).

% ?-qsort([2,3,-5,55,666,0,-4],List).
% List = [-5, -4, 0, 2, 3, 55, 666]
