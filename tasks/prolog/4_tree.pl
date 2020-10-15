% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

balanced_tree(List, Tree) :-
    qsort(List,Sorted),
    create_node(Sorted,Tree).

create_node([], empty).
create_node(List, instant(Key, LeftTree, RightTree)) :-
    mediana(List, LeftList, [Key | RightList]),
    create_node(LeftList, LeftTree),
    create_node(RightList, RightTree).

mediana(List, LeftList, RightList) :-
    length(List, Len),
    MedLen is Len // 2,
    length(LeftList, MedLen),
    append(LeftList, RightList, List).
