% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный


part([], _, [], []).
part([Head|Tail], Pivot, [Head|LessOrEqualThan], GreaterThan) :-
  (Head < Pivot; Head = Pivot),
  part(Tail, Pivot, LessOrEqualThan, GreaterThan).
part([Head|Tail], Pivot, LessOrEqualThan, [Head|GreaterThan]) :-
  Head > Pivot,
  part(Tail, Pivot, LessOrEqualThan, GreaterThan).

qsort(L, K) :- quicksort(L, K).
quicksort([],[]).
quicksort([Head|Tail], SortedArray) :-
  part(Tail, Head, Left, Right),
  quicksort(Left, LessOrEqualThan),
  quicksort(Right, GreaterThan),
  append(LessOrEqualThan, [Head|GreaterThan], SortedArray).



% qsort([34, 47, 90, 59, 1, 73, 5, 31, 22, 18], SortedArray).
% SortedArray = [1,5,18,22,31,34,47,59,73,90] ?