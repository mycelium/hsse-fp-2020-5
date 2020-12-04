% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

balanced_tree(List, Tree) :-
    qsort(List, Sorted),
    add_branch(Sorted, Tree).

add_branch([], empty).

add_branch(List, instant(Key, Left_Tree, Right_Tree)) :-
    mediana(List, Left_List, [Key | Right_List]),
    add_branch(Left_List, Left_Tree),
    add_branch(Right_List, Right_Tree).

split(List, Left_List, Right_List) :-
    length(List, Length),
    Dived_Len is Length // 2,
    length(Left_List, Dived_Len),
    append(Left_List, Right_List, List).