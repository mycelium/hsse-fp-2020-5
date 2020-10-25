% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

build_sub_tree([], empty).

build_sub_tree(L, instant(Root, LSubtree, RSubtree)) :-
	split_tree(L, Left, [Root | Right]),
	build_sub_tree(Right, RSubtree),
	build_sub_tree(Left, LSubtree).

split_tree(L, Left, Right) :-
	length(L, Len),
	Center is div(Len, 2),
	length(Left, Center),
	append(Left, Right, L).

balanced_tree(L, T) :-
	qsort(L, SortedList),
	build_sub_tree(SortedList, T).