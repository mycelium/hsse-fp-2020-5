% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort(L, K) :- quicksort(L, K).
quicksort([],[]).
quicksort([H | T], Res) :-
  part(T, H, Left, Right),
  quicksort(Left, Ls),
  quicksort(Right, Rs),
  append(Ls, [H | Rs], Res).

part([], _, [], []).
part([H | T], Y, [H | Ls], Rs) :-
  (H < Y; H = Y), part(T, Y, Ls, Rs).
part([H | T], Y, Ls, [H | Rs]) :-
  H > Y, part(T, Y, Ls, Rs).

%?-qsort([1,1,5,2,31,22], Result).
%Result = [1, 1, 2, 5, 22, 31]
%false

%?-qsort([1054, 12, 22356, 10100], Result).
%Result = [12, 1054, 10100, 22356]
%false

%?-qsort([1, 2, 3, 4, 5], [1, 2, 3, 4, 5]).
%true

