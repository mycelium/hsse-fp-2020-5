% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)


:- ['3_quicksort.pl'].

sub_tree([], empty).
sub_tree(L, instant(Root, LeftTree, RightTree)):-
  tree_splitter(L, Left, [Root | Right]),
  sub_tree(Left, LeftTree),
  sub_tree(Right, RightTree).

tree_splitter(L, LeftPart, RightPart):-
  length(L, Length),
  Mid is div(Length, 2),
  length(LeftPart, Mid),
  append(LeftPart, RightPart, L).

balanced_tree(L, T):-
  qsort(L, S),
  sub_tree(S, T).


% Проверка:
% 1. ?- balanced_tree([1, 2, 5, 6, 8], K).
%    K = instant(5, instant(2, instant(1, empty, empty), empty), instant(8, instant(6, empty, empty), empty))
% 2. ? - balanced_tree([664, 312, 113, 139, 122], K).
%    K = instant(139, instant(122, instant(113, empty, empty), empty), instant(664, instant(312, empty, empty), empty))
% 3. ?- balanced_tree([-4, 43, -64, -23, 126, 13, 8], K).
%    K = instant(8, instant(-23, instant(-64, empty, empty), instant(-4, empty, empty)), instant(43, instant(13, empty, empty), instant(126, empty, empty)))