% используя предикат qsort(L,K) из предыдущего задания 

qsort([],[]).
qsort([H|T], K):-
	pivot(H,T,L1,L2),
        qsort(L1,S1),
        qsort(L2,S2),
	append(S1,[H|S2], K).

pivot(_,[],[],[]).
pivot(H,[X|T],[X|L],G):-
    X=<H,
    pivot(H,T,L,G).
pivot(H,[X|T],L,[X|G]):-
    X>H,
    pivot(H,T,L,G).

% разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска

balanced_tree(L,T) :- qsort(L, S), treeList(S, T).

% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

balanced_tree(L,T) :- qsort(L, S), treeList(S, T).

treeList([], empty).
treeList(S, instant(ROOT, L, R)) :-
	length(S, LENGTH),
	RIGHT_LENGTH is LENGTH - LENGTH // 2,
	length([ROOT | RIGHT], RIGHT_LENGTH),
	append(LEFT, [ROOT | RIGHT], S),
	treeList(LEFT, L),
	treeList(RIGHT, R).

% Вывод
% [6]  ?- balanced_tree([2,1,30,3,89,34,19,74,63], X).
% X = instant(30, instant(3, instant(2, instant(1, empty, empty), empty), instant(19, empty, empty)), instant(74, instant(63, instant(34, empty, empty), empty), instant(89, empty, empty))) 
