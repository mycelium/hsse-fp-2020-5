% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([],[]).

qsort([L|M], Sorted):-
	split(L, M, N1, N2),
	qsort(N1, Sorted1),
	qsort(N2, Sorted2),
	append(Sorted1, [L|Sorted2], Sorted).
   
split(L, [], [], []).
split(L, [X|M], [X|N], O):- X=<L, split(L, M, N, O).
split(L, [X|M], N, [X|O]):- X>L, split(L, M, N, O).
