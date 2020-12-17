% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

consult("3_quicksort.pl").

split(L, Left, Right):- 
    append(Left, Right, L),
    length(L, LeftSize),
    Median is div(LeftSize, 2),
    length(Left, Median).

balanced_tree([], empty).

balanced_tree(L, instant(Root, LeftPart, RightPart)) :- 
    split(L, X, [Root | Y]),
    balanced_tree(X, LeftPart),
    balanced_tree(Y, RightPart).

balanced_tree(L, T) :- 
    qsort(L, S),
    balanced_tree(S, T).\

% ?- balanced_tree([4, 8, 15, 16, 23, 42, 108], A).
% A = instant(16, instant(8, instant(4, empty, empty), instant(15, empty, empty)), instant(42, instant(23, empty, empty), instant(108, empty, empty))) ;
%      16
%     /  \                  
%    8    42
%   / \   / \
%  4  15 23 108
