% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный
max(X,Y) :- X > Y.

pivot(_,[],[],[]).
pivot(X,[Y|T],[Y|Min],Max) :- max(X,Y),!,pivot(X,T,Min,Max).
pivot(X,[Y|T],Min,[Y|Max]) :- pivot(X,T,Min,Max).

qsort([],[]).
qsort([X|T],List) :- pivot(X,T,Min,Max),qsort(Min,SortedMin),qsort(Max,SortedMax),append(SortedMin,[X|SortedMax],List).

% ?- qsort([43,-10,10,1,32,-10,-23,84,279],K).
% K = [-23, -10, -10, 1, 10, 32, 43, 84, 279]