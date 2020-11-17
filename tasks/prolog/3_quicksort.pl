% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный
qsort([], []).
qsort([H], [H]).
qsort([LH|LT], K) :-
   partition(LH, LT, Left, Right),
   qsort(Left, LeftRes), qsort(Right, RightRes),
   append(LeftRes, [LH|RightRes], K).


partition(_, [], [], []).
partition(Pivot, [H|T], Left, Right) :-  H < Pivot
    -> Left = [LH|LT], LH = H, partition(Pivot, T, LT, Right)
    ;Right = [RH|RT], RH = H, partition(Pivot, T, Left, RT).


% ?- qsort([2, 5, 1, 2, 7, 19, 4, 9, 100], R).
% R = [1, 2, 2, 4, 5, 7, 9, 19, 100]

% ?- qsort([9, 8, 7, 6, 5, 4, 3, 2, 1], R).
% R = [1, 2, 3, 4, 5, 6, 7, 8, 9]
