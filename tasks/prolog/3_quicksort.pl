% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([],[]).

qsort([H|T], Sorted):-
	split(H, T, L1, L2),
	qsort(L1, Sorted1),
	qsort(L2, Sorted2),
	append(Sorted1, [H|Sorted2], Sorted).
   
split(H, [], [], []).
split(H, [X|T], [X|L], G):- X=<H, split(H, T, L, G).
split(H, [X|T], L, [X|G]):- X>H, split(H, T, L, G).