% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

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

balanced_tree(L, T) :-
    qsort(L, Sorted),
    make_tree(Sorted, T).

make_balanced_tree([], empty).
make_balanced_tree(List, instant(Root, L, R)) :-
    make_middle(List, Left, [Root | Right]),
    make_balanced_tree(Left, L),
    make_balanced_tree(Right, R).

make_middle(List, L, R) :-
    length(List, Len),
    Middl is Len // 2,
    length(L, Middl),
    append(L, R, List).
	
% balanced_tree([5, 1, -5, 8, 0], Result).
% Result = instant(1, instant(0, instant(-5, empty, empty), empty), instant(8, instant(5, empty, empty), empty))
