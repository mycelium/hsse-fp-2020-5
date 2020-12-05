% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)


:- consult('3_quicksort.pl').

balanced_tree(L, T) :-
	qsort(L, L_sorted),
	make_balanced_tree(L_sorted, T).

split_middle(X, L, R):-
	length(X, Len),
	Mid is div(Len, 2),
	length(L, Mid),
	append(L, R, X).

make_balanced_tree([], empty).
make_balanced_tree(List, instant(Root, L_subtree, R_subtree)) :-
	split_middle(List, L, [Root|R]),
	balanced_tree(L, L_subtree),
	balanced_tree(R, R_subtree).


% ?-balanced_tree([8, 5, -2, 9, 1], T).
% T = instant(5, instant(1, instant(-2, empty, empty), empty), instant(9, instant(8, empty, empty), empty))