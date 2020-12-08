% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

divide([], _P, [], []).
divide([H|T], P, [H|GL], SL):- H >= P, !, divide(T, P, GL, SL).
divide([H|T], P, GL, [H|SL]):- divide(T, P, GL, SL).

qsort([],[]).
qsort([P|T], SortedList):- divide(T, P, GL, SL),
  qsort(GL, SGL),
  qsort(SL, SSL),!,
  append(SSL, [P|SGL], SortedList).

% ?- qsort([-4,-10,0,2,1,15,11], Res).
% Res = [-10, -4, 0, 1, 2, 11, 15].