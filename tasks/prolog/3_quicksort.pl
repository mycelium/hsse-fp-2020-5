% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

roman_empire([], SuppElem, [], []):-!.
roman_empire([Head|Tail], SuppElem, [Head|BigList], SmallList):-
  Head >= SuppElem, !, roman_empire(Tail, SuppElem, BigList, SmallList).
roman_empire([Head|Tail], SuppElem, BigList, [Head|SmallList]):-
  roman_empire(Tail, SuppElem, BigList, SmallList).
  
qsort([], []).
qsort([Elem], [Elem]).
qsort([SuppElem|Tail], ListSort):-
  roman_empire(Tail, SuppElem, BigList, SmallList),
  qsort(BigList, BigListSort),
  qsort(SmallList, SmallListSort),!,
  append(SmallListSort, [SuppElem|BigListSort], ListSort).