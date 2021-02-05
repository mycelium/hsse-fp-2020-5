% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

qsort([], []).
qsort([H|T], S) :-
    partition(H, T, L, R),
    qsort(L, LS),
    qsort(R, RS),
    append(LS, [H|RS], S).

partition(_, [], [], []).
partition(P, [H|T], [H|L], R) :- H =< P, partition(P, T, L, R).
partition(P, [H|T], L, [H|R]) :- H > P, partition(P, T, L, R).