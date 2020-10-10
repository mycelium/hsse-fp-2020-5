% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

balanced_tree(L, T) :-
	qsort(L, Sorted),
	build_subtree(Sorted, T).
	
build_subtree([], empty).

build_subtree(L, instant(Root, LeftSubtree, RightSubtree)) :-
	split_tree(L, Left, [Root|Right]),
	build_subtree(Left, LeftSubtree),
	build_subtree(Right, RightSubtree).

split_tree(L, Left, Right) :-
	length(L, Length),
	Middle is div(Length, 2),
	length(Left, Middle),
	append(Left, Right, L).