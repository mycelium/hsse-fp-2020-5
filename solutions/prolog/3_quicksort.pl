% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

pivot(_, [], [], []).
pivot(Pivot, [L|Tail], [L|less_or_equal], greater) :- Pivot >= L, pivot(Pivot, Tail, less_or_equal, greater). 
pivot(Pivot, [L|Tail], less_or_equal, [L|greater]) :- pivot(Pivot, Tail, less_or_equal, greater).

qsort([], []).
qsort([L|Tail], K) :- pivot(L, Tail, List1, List2), qsort(List1, KList1), qsort(List2, KList2), append(KList1, [L|KList2], K).

% qsort([10,4,-99,23,33], K).
% K = [-99, 4, 10, 23, 33].