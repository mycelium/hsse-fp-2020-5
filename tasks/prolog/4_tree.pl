% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

balanced_tree(List, Tree) :-
	qsort(List, SortedList),
	balanced_tree(SortedList, Tree).

balanced_tree([], empty).

balanced_tree(List, instant(Root, L, R)) :-
	split_tree(List, LeftList, [Root|RightList]),
	balanced_tree(LeftList, L),
	balanced_tree(RightList, R).

split_tree(List, L, R):-
    append(L R, List),
    length(List, ListLength),
    LengthHalf is div(ListLength, 2),
    length(L, LengthHalf).
