% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

% подключаем функцию быстрой сортировки из предыдущей лабораторной
:- consult('3_quicksort.pl').

% создание узлов дерева
create_tree([], empty).
create_tree(List, instant(Root, LeftTree, RightTree)) :-
    divide(List, A, [Root | B]),
    create_tree(A, LeftTree),
    create_tree(B, RightTree).

% разбиаение списка для дальнейшего построения дерева
divide(List, A, B) :-
   length(List, ListLength),
   % исп-ся // т.к. нужно число без остатка
   B_length is ListLength - ListLength // 2,
   length(B, B_length),
   append(A, B, List).
   
% ф-ция построения сбалансированного дерева
balanced_tree(List, Tree) :-
	qsort(List, SortedList),
	create_tree(SortedList, Tree).
 
% Example 
% ?- balanced_tree([-2, 5, 6, 3, 9, 15], X).
% X = instant(6, instant(3, instant(-2, empty, empty), instant(5, empty, empty)), instant(15, instant(9, empty, empty), empty)) .