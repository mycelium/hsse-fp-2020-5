% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:-['3_quicksort'].

balanced_tree(L,T) :- qsort(L, S), create_tree(S, T).

create_tree([], empty).
create_tree(S, instant(ROOT, L, R)) :- divide(S, LEFT, [ROOT | RIGHT]), create_tree(LEFT, L), create_tree(RIGHT, R).

divide(S, L, R) :-  length(S, LEN), RLEN is LEN - LEN // 2, length(R, RLEN), append(L, R, S).

'
?- create_tree([0, 1, 2], T).
T = instant(1, instant(0, empty, empty), instant(2, empty, empty)) ;
false.

?- balanced_tree([25, 14, -5, 18, 85, 2, 0, 12, 15], T).
T = instant(14, instant(2, instant(0, instant(-5, empty, empty), empty), instant(12, empty, empty)), instant(25, instant(18, instant(15, empty, empty), empty), instant(85, empty, empty))) ;
false.


'
