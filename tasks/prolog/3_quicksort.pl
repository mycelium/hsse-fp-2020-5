% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([],[]).

qsort(L,K):-
    L = [Head|Tail],
    partition(Head, Tail, List1, List2),
    qsort(List1, Sort1),
    qsort(List2, Sort2),
    append(Sort1, [Head|Sort2], K).

partition(_, [], [], []).
partition(N, [Head|Tail], [Head|Left], Right) :-
    Head =< N,
    partition(N, Tail, Left, Right).

partition(N, [Head|Tail], Left, [Head|Right]) :-
    Head > N,
    partition(N, Tail, Left, Right).
	
% ?- qsort([3,-22,0,1,-7,600,55],Result).
% Result = [-22, -7, 0, 1, 3, 55, 600] 