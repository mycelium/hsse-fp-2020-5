% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

balanced_tree(List,T) :- qsort(List,K),tree(K,T).

tree([],empty).
tree(List,instant(Root,L,R)) :- split(List,Left,[Root|Right]),
    tree(Left,L),tree(Right,R).

split(List,Left,Right) :- length(List,Length),length(Left,Center),Center is Length//2,
    append(Left,Right,List).