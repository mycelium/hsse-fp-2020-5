% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

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
	
balanced_tree(L, T) :-
    qsort(L, Sorted),
    make_tree(Sorted, T).

make_tree([], empty).
make_tree(List, instant(Root, L, R)) :-
    make_middle(List, Left, [Root | Right]),
    make_tree(Left, L),
    make_tree(Right, R).

make_middle(List, L, R) :-
    length(List, Len),
    Middl is Len // 2,
    length(L, Middl),
    append(L, R, List).
	
% balanced_tree([6, 3, -1, 8, 1], Result).
% Result = instant(3, instant(1, instant(-1, empty, empty), empty), instant(8, instant(6, empty, empty), empty))
