% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([], []).
qsort([List], [List]).
qsort([Head|List_tail], ListSort):-
  list_split(List_tail, Head, Smaller, Biggest),
  qsort(Smaller, SmallerSort),
  qsort(Biggest, BiggestSort),!,
  append(SmallerSort, [Head|BiggestSort], ListSort).
  
  
list_split([], Z, [], []):-!.
list_split([Head|List_tail], Z, [Head|Smaller], Biggest):-
  Head < Z, list_split(List_tail, Z, Smaller, Biggest).
list_split([Head|List_tail], Z, Smaller, [Head|Biggest]):-
  Head >=Z, list_split(List_tail, Z, Smaller, Biggest).