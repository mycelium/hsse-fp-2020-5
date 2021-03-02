% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный


max_val(X,Y) :- X > Y.

split(_, [], [], []).
split(X, [Y | T], [Y | Left], Right):-
  max_val(X,Y),
  !,
  split(X, T, Left, Right).
split(X, [Y | T], Left, [Y | Right]):-
  split(X, T, Left, Right).

qsort([], []).
qsort([X | T], K):-
    split(X, T, Left, Right),
    qsort(Left, LeftPart),
    qsort(Right, RightPart),
    append(LeftPart, [X | RightPart], K).


% Проверка:
% 1. Положительные числа
%    ?- qsort([14, 7, 54, 102, 430, 10, 54, 101, 19, 219], K).
%    K = [7, 10, 14, 19, 54, 54, 101, 102, 219, 430]

% 2. Неотрицательные числа
%    ?- qsort([14, 7, 54, 0, 430, 10, 54, 101, 19, 0], K).
%    K = [0, 0, 7, 10, 14, 19, 54, 54, 101, 430]

% 3. Целые числа
%    ?- qsort([14, 7, -54, 102, 430, 10, 54, 101, 19, -219], K).
%    K = [-219, -54, 7, 10, 14, 19, 54, 101, 102, 430]