% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

balanced_tree(L, T) :- qsort(L, SorD),
	balanced(SorD, T).
balanced([], empty).
balanced(L, instant(R, BeneathL, BeneathR)) :- splittree(L, LTree, [R|RTree]),
	balanced(LTree, BeneathL), balanced(RTree, BeneathR).

splittree(L, LTree, RTree) :- length(L, LOfTree),
	Mid is div(LOfTree, 2), length(LTree, Mid),
	append(LTree, RTree, L).
