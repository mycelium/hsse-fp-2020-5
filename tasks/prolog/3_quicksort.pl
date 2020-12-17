% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

pivot(_, [], [], []).
pivot(Pivot, [L | X], [L | BottomPart], UpperPart) :- Pivot >= L, pivot(Pivot, X, BottomPart, UpperPart). 
pivot(Pivot, [L | X], BottomPart, [L | UpperPart]) :- pivot(Pivot, X, BottomPart, UpperPart).

qsort([], []).
qsort([L | Tail], Result) :-
    pivot(L, Tail, BottomPart, UpperPart),
    qsort(BottomPart, SortedBottomPart),
    qsort(UpperPart, SortedUpperPart),
    append(SortedBottomPart, [L | SortedUpperPart], Result).

% ?- qsort([15, 8, 4, 23, 42, 16, 108], K).
% K = [4, 8, 15, 16, 23, 42, 108]
