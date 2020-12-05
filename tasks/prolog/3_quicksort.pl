% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 
max(X,Y) :- X > Y.

pivot(_,[],[],[]).
pivot(X,[Y|T],[Y|Min],Max) :- max(X,Y),!,pivot(X,T,Min,Max).
pivot(X,[Y|T],Min,[Y|Max]) :- pivot(X,T,Min,Max).

qsort([],[]).
qsort([X|T],List) :- pivot(X,T,Min,Max),qsort(Min,SortedMin),qsort(Max,SortedMax),append(SortedMin,[X|SortedMax],List).

% ?- qsort([10,9,8,7,6,5,4,3,2,1],K).
% K = [1,2,3,4,5,6,7,8,9,10]
