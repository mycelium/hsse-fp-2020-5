% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

balanced_tree(L, T) :-
	qsort(L, List_sort),
	create_tree(List_sort, T).
	
create_tree([], empty).
create_tree(List_sort, instant(Root, L, R)) :-
	split_tree(List_sort, List_sort_small, [Root|List_sort_big]),
	create_tree(List_sort_small, L),
	create_tree(List_sort_big, R).
	
split_tree(L, Left, Right) :-
	length(L, Len),
	M is div(Len, 2),
	length(Left, M),
	append(Left, Right, L).