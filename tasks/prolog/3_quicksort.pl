% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

	division(_, [], [], []).
	division(Selected, [Current|Tail], [Current|Less], Greater) :-
		Current < Selected,
		division(Selected, Tail, Less, Greater).
	division(Selected, [Current|Tail], Less, [Current|Greater]) :-
		Current >= Selected,
		division(Selected, Tail, Less, Greater).

	qsort([], []).
	qsort([Head|Tail], Sorted) :-
		division(Head, Tail, Less, Greater),
		qsort(Less, Sorted1),
		qsort(Greater, Sorted2),
		append(Sorted1, [Head|Sorted2], Sorted).

	% ?- qsort([7,6,4,8,3,2,5,1], X).
	% X = [1, 2, 3, 4, 5, 6, 7, 8] .
