% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

last([H], H).
last([_|T], R) :- last(T, R).

append([], L, L).
append([X|Y], L2, [X|L3]) :- append(Y, L2, L3).

compareAndAppend([_], _, [], []).
compareAndAppend([H|T], Pivot, [H | Left], Right) :-
    H =< Pivot,
    compareAndAppend(T, Pivot, Left, Right).

compareAndAppend([H|T], Pivot, Left, [H| Right]) :-
    compareAndAppend(T, Pivot, Left, Right).
    
partition([], _, [], []).
partition(L, Pivot, Left, Right) :-
    last(L, Pivot),
    compareAndAppend(L, Pivot, Left, Right).

quickSort([], []).
quickSort([H], [H]).
quickSort(L, R) :-
    partition(L, Pivot, Left, Right),
    quickSort(Left, R1),
    quickSort(Right, R2),
    append(R1, [Pivot | R2], R).

%quickSort([8,0,3,100,19,25,9], R)
%R = [0, 3, 8, 9, 19, 25, 100]
