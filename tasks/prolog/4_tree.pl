% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)
:- consult('3_quicksort.pl').

balanced_tree(List,T) :- qsort(List,Sorted),branching(Sorted,T).

branching([],empty).
branching(List,instant(Root,LTree,RTree)) :- splitting(List,L,[Root|R]),branching(L,LTree),branching(R,RTree).

splitting(List,L,R) :- length(List,Length),Center is Length//2,length(L,Center),append(L,R,List).

% ?- balanced_tree([1,5,2,6,3,8],K).
% K = instant(5, instant(2, instant(1, empty, empty), instant(3, empty, empty)), instant(8, instant(6, empty, empty), empty))
