% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный
split(_, [], [], []).
split(Pivot, [X | T], [X | Xt], R) :- X < Pivot, split(Pivot, T, Xt, R).
split(Pivot, [X | T], Xt, [X | R]) :- X >= Pivot, split(Pivot, T, Xt, R).

qsort([], []).
qsort(L, K) :- L = [Pivot| Rest],
    split(Pivot, Rest, LeftL, RigthL),
    qsort(LeftL, LeftK),
    qsort(RigthL, RigthK),
    append(LeftK, [Pivot | RigthK], K).

% ?- qsort([1,5,32,6,7,32,67,-123],S).
% S = [-123, 1, 5, 6, 7, 32, 32, 67]
