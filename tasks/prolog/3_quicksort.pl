% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([], []).
qsort([L|T], K) :- split(L, T, Less, Great), qsort(Less, LessSort), qsort(Great, GreatSort), 							   append(LessSort, [L|GreatSort], K). 

split(_, [], [], []).
split(L, [Y|T], [Y|Less], Great) :- Y < L , split(L, T, Less, Great).
split(L, [Y|T], Less, [Y|Great]) :- Y >= L, split(L, T, Less, Great).

% Результаты:
%
% ?- qsort([37, 5, 0, -7], X).
% X = [-7, 0, 5, 37] .
%
% ?- qsort([50, -8], X).
% X = [-8, 50] .

