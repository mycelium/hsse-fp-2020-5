% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

partition(X, [], [], []).

partition(X, [Elem | Tail], [Elem | L], R) :-
    Elem =< X,
    partition(X, Tail, L, R).
partition(X, [Elem | Tail], L, [Elem | R]) :-
    Elem > X,
    partition(X, Tail, L, R).

qsort([], []).

qsort([X | Tail], X_sorted) :-
    partition(X, Tail, L, R),
    qsort(L, L_sorted),
    qsort(R, R_sorted),
    append(L_sorted, [X | R_sorted], X_sorted).

% ?- qsort([3, 2, 1], [1, 2, 3])
% true