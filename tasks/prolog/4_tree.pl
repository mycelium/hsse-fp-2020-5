% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

divide([], _P, [], []).
divide([H|T], P, [H|GL], SL):- H >= P, !, divide(T, P, GL, SL).
divide([H|T], P, GL, [H|SL]):- divide(T, P, GL, SL).

qsort([],[]).
qsort([P|T], SortedList):- divide(T, P, GL, SL),
  qsort(GL, SGL),
  qsort(SL, SSL),!,
  append(SSL, [P|SGL], SortedList).

tree_split(L, Left, Right):- append(Left, Right, L),length(L, Length),Middle is div(Length, 2),length(Left, Middle).

balanced_tree([], empty).
balanced_tree(L, instant(Root, Left, Right)) :- tree_split(L, LeftL, [Root|RightL]), balanced_tree(LeftL, Left), balanced_tree(RightL, Right).
balanced_tree(L, T) :- qsort(L, S), balanced_tree(S, T).