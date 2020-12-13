% Определить предикат qsort(L,K) который для заданного списка целых чисел возвращает отсортированный 

% ?- qsort([10, 1,2, 3, -40, 12], K).
% K = [-40, 1, 2, 3, 10, 12] 


qsort([],[]).   

qsort([X|T], Res) :- split(X, T, L, R), qsort(L, Left), qsort(R, Right), append(Left, [X|Right], Res).

split(X, [],[],[]).
split(X, [Y|T], [Y|L], R) :- X > Y, split(X, T, L, R).
split(X, [Y|T], L, [Y|R]) :- split(X, T, L, R).
