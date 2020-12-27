% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

split(X, [],[],[]).
split(X, [Y|T], [Y|S], M) :- X > Y, split(X, T, S, M).
split(X, [Y|T], S, [Y|M]) :- split(X, T, S, M).

qsort([], []).
qsort([L|T], K) :- split(L, T, S, M),
	qsort(S, KS),
	qsort(M, KM),
	append(KS, [L|KM], K).