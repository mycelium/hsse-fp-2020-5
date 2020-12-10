% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

qsort([], []).
qsort([L|T], K) :- split(L, T, Less, Great), qsort(Less, LessSort), qsort(Great, GreatSort), append(LessSort, [L|GreatSort], K). 
split(_, [], [], []).
split(L, [Y|T], [Y|Less], Great) :- Y < L , split(L, T, Less, Great).
split(L, [Y|T], Less, [Y|Great]) :- Y >= L, split(L, T, Less, Great).


balanced_tree(L, T) :- qsort(L, S), branching_tree(S, T).

branching_tree([], empty).
branching_tree(List, instant(Root, Left, Right)) :- splitting_tree(List, L, [Root|R]), branching_tree(L, Left), branching_tree(R, Right).

splitting_tree(List, L, R) :- length(List, Lenght), Midl is div(Lenght, 2), length(L, Midl), append(L, R, List).	

% Результаты:
%
% ?- balanced_tree([2, 4, 3, 7], K).
% K = instant(4, instant(3, instant(2, empty, empty), empty), instant(7, empty, empty)) .
% 
% ?- balanced_tree([1, 5, 2, 4, 3, 6, 7], K).
% K = instant(4, instant(2, instant(1, empty, empty), instant(3, empty, empty)), instant(6, instant(5, empty, empty), instant(7, empty, empty))) .
