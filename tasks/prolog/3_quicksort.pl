% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort(L, K):- qsort(L, K, []). 
qsort([], K, K).
qsort([X|L], K, Z):-
  partition(L, X, M, N),
  qsort(N, W, Z),
  qsort(M, K, [X|W]).
  
partition([K|L], X, M, [K|N]):-
  X < K, !,
  partition(L, X, M, N).
  
partition([K|L], X, [K|M], N):-
  partition(L, X, M, N).
  
partition([], _, [], []).
