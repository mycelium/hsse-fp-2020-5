% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

balanced_tree(L,T):-
    qsort(L,L_sort),
    build_tree(L_sort,T).
    
build_tree([],empty).
build_tree(L_sort,instant(Root,L,R)):-
    split_tree(L_sort,A,[Root|B]),
    build_tree(A,L),
    build_tree(B,R).
    
split_tree(L, Left, Right) :-
	length(L, Len),
	M is div(Len, 2),
	length(Left, M),
	append(Left, Right, L).