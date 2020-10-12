qsort([], []).
qsort([P|L], K) :- partition(P, L, L1, L2), qsort(L1, K1), qsort(L2, K2), append(K1, [P | K2], K). 

partition(_, [], [], []).
partition(P, [H | T], [H | O1], O2) :- H < P, partition(P, T, O1, O2).
partition(P, [H | T], O1, [H | O2]) :- H >= P, partition(P, T, O1, O2).	

% Example
'	?- partition(2, [3, 5, 7, 0], L, R).
	L = [0],
	R = [3, 5, 7] ;
	false.

	?- qsort([5, -8, 1, 0, 7, 6, 2, 8, -54, 65], K).
	K = [-54, -8, 0, 1, 2, 5, 6, 7, 8|...] ;
	false.

	?- qsort([5, -8, 1, 0, 7], K).
	K = [-8, 0, 1, 5, 7] ;
	false.

	?- qsort([5, -8, 1, 0, 7, 5, 32], K).
	K = [-8, 0, 1, 5, 5, 7, 32] ;
	false.

	?- qsort([5, -8, 1, 0, 7, 5, 32, -9889], K).
	K = [-9889, -8, 0, 1, 5, 5, 7, 32] ;
	false.

	?- qsort([5, -8, 1, 0, 7, 5, 32, -9889, 478], K).
	K = [-9889, -8, 0, 1, 5, 5, 7, 32, 478] ;
'
