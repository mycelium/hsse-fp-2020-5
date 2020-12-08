% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

split([], Pivot, [], []):-!.
split([Head|Tail], Pivot, Bigger, [Head|Smaller]):-
  Head < Pivot, !, split(Tail, Pivot, Bigger, Smaller).
split([Head|Tail], Pivot, [Head|Bigger], Smaller):-
  split(Tail, Pivot, Bigger, Smaller).
  
qsort([], []).
qsort([E], [E]).
qsort([Pivot|Tail], ListSorted):-
  split(Tail, Pivot, Bigger, Smaller),
  qsort(Smaller, SmallerSorted),
  qsort(Bigger, BiggerSorted),!,
  append(SmallerSorted, [Pivot|BiggerSorted], ListSorted).