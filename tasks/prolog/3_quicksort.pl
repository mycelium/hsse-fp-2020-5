% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([],[]).
qsort(L,K):-
    L = [Head|Tail],
    partition(Head, Tail, L1, L2),
    qsort(L1, Sort1),
    qsort(L2, Sort2),
    append(Sort1, [Head|Sort2], K).

partition(_, [], [], []).
partition(N, [Head|Tail], [Head|Left], Right) :-
    Head =< N,
    partition(N, Tail, Left, Right).

partition(N, [Head|Tail], Left, [Head|Right]) :-
    Head > N,
    partition(N, Tail, Left, Right).
	
% ?- qsort([-200,0,1746,1,42,-30,98],Result).
% Result = [-200, -30, 0, 1, 42, 98, 1746] 
