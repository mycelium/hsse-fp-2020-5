% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').

balanced_tree(L, T) :- qsort(L, S), create_node(S, T).

create_node([], empty).
create_node(X, instant(Root, L, R)) :- cut(X, A, [Root|B]), create_node(A, L), create_node(B, R).

cut(L, A, B) :- length(L, N), H is N - N // 2, length(B, H), append(A, B, L).