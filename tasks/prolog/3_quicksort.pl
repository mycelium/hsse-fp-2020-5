% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([],[]).
qsort(L, K) :-
	L = [H|T],
	partition(H, T, L, R),
	qsort(L, L_sorted),
	qsort(R, R_sorted),
	append(L_sorted, [Head|R_sorted], K).

partition(_,[],[],[]).
partition(X, [H|T], [H|L], R) :-
	H =< X,
	partition(X, T, L, R).

partition(X, [H|T], L, [H|R]) :-
	H > X,
	partition(X, T, L, R).


% ?- qsort([15,0,-5,-99,8],Result).
% Result = [-99, -5, 0, 8, 15] 