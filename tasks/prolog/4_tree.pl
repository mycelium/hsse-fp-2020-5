% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

balanced_tree(L, T) :-
	qsort(L, Sorted),
	balanced(Sorted, T).
	
balanced([], empty).

balanced(L, instant(R, LSub, RSub)) :-
	splittree(L, Left, [R|Right]),
	balanced(Left, LSub),
	balanced(Right, RSub).

splittree(L, Left, Right) :-
	length(L, Length),
	Mid is div(Length, 2),
	length(Left, Mid),
	append(Left, Right, L).
