% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

balanced_tree(L, T) :-
	qsort(L, Sort),
	make_balanced_tree(Sort, T).

split_middle(X, L, R):-
	length(X, Len),
	Mid is Len // 2,
	length(L, Mid),
	append(L, R, X).

make_balanced_tree([], empty).
make_balanced_tree(List, instant(Root, L_tree, R_tree)) :-
	split_middle(List, L, [Root|R]),
	balanced_tree(L, L_tree),
	balanced_tree(R, R_tree).


% ?-balanced_tree([5, 1, -5, 8, 0], T).
% T = instant(1, instant(0, instant(-5, empty, empty), empty), instant(8, instant(5, empty, empty), empty))
