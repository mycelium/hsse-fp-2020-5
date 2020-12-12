% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

% 1. as prolog allows to easily extract the head but not the tail
% ...we'll implement head pivot algorithm

qsort([], []).
qsort(L, K):-
    L = [Pivot | Tail],
    split(Tail, Pivot, LeftSlice, RightSlice),
    qsort(LeftSlice, LeftSorted),
    qsort(RightSlice, RightSorted),
    append(LeftSorted, [Pivot | RightSorted], K).

% argueable what should go first array or regex, but for me this notation is closer to myString.split(" ")
split([], _, [], []).

split([ArrayHead | Tail], Pivot, [ArrayHead | LeftSlice], RightSlice) :- ArrayHead =< Pivot,
    split(Tail, Pivot, LeftSlice, RightSlice).

split([ArrayHead | Tail], Pivot, LeftSlice, [ArrayHead | RightSlice]) :- ArrayHead > Pivot,
    split(Tail, Pivot, LeftSlice, RightSlice).

% qsort([1, 2, 3, 4, 5, 6], K).
% K = [1, 2, 3, 4, 5, 6]

% qsort([6, 5, 4, 3, 2, 1], K).
% K = [1, 2, 3, 4, 5, 6]


% qsort([6, 3, 1, 2, 4, 5, 2], K).
% K = [1, 2, 2, 3, 4, 5, 6]