% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)
:- consult("3_quicksort").

balanced_tree(L, T) :- qsort(L, R), build_tree(R, T).

build_tree([], empty).
build_tree(List, R) :-
  length(List, N),
  divmod(N, 2, LHalf, Remainder),
  RHalf is LHalf + Remainder,
  length(A, LHalf),
  length([Middle|B], RHalf),
  append(A, [Middle|B], List),
  build_tree(A, LeftSubtree),
  build_tree(B, RightSubtree),
  R = instant(Middle, LeftSubtree, RightSubtree).


% ?- balanced_tree([7, 2, 1, 5, 4, 3, 6], R).
% R = instant(4, instant(2, instant(1, empty, empty), instant(3, empty, empty)),
%                instant(6, instant(5, empty, empty), instant(7, empty, empty))).
