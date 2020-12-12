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

% Проверка работы:
% 1. Проверка работы предиката положительных чисел
%    ?- qsort([1, 34, 45, 1494, 2, 0], K)
%    K = [0, 1, 2, 34, 45, 1494]

% 2. Проверка работы предиката положительных + отрицательных чисел
%    ?- qsort([1, -34, 45532, 1494, -1039], K).
%    K = [-1039, -34, 1, 1494, 45532]
