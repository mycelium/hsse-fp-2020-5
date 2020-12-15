% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').
build_balanced_tree([], empty).

build_balanced_tree(List, instant(Root, L_tree, R_tree)) :-
	split_middle(List, L, [Root|R]),
	balanced_tree(L, L_tree),
	balanced_tree(R, R_tree).

split_middle(X, L, R):-
	length(X, Len),
	Mid is div(Len, 2),
	length(L, Mid),
	append(L, R, X).

balanced_tree(L, T) :-
	qsort(L, L_sorted),
	build_balanced_tree(L_sorted, T).

% ?- balanced_tree([3,2,4],instant(3, instant(2, empty, empty), instant(4, empty, empty)))
% true
