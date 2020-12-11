% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

% Предикат qsort(L, K) из предыдущего задания

part(X, [Comp_elem|X_tail], [Comp_elem|L], R):-
    Comp_elem =< X,
    part(X, X_tail, L, R).

part(X,[Comp_elem|X_tail],L,[Comp_elem|R]):-
    Comp_elem > X,
    part(X, X_tail, L, R).

part(X,[],[],[]).


qsort([X|X_tail], X_sorted):-
	part(X, X_tail, L, R),
    qsort(L, L_sorted),
    qsort(R, R_sorted),
	append(L_sorted, [X|R_sorted], X_sorted).

qsort([],[]).

% Предикат для построения сбалансированного бинарного дерева поиска

balanced_tree(L, T) :-
	qsort(L, L_sorted),
	build(L_sorted, T).


split_middle(X, L, R):-
	length(X, Len),
	Mid is div(Len, 2),
	length(L, Mid),
	append(L, R, X).


build(List, instant(Root, L_tree, R_tree)) :-
	split_middle(List, L, [Root|R]),
	balanced_tree(L, L_tree),
	balanced_tree(R, R_tree).

build([], empty).

% Проверка

% ?- balanced_tree([50, 75, 100], X).
% X = instant(75, instant(50, empty, empty), instant(100, empty, empty)) ;


% ?- balaced_tree([50, 75, 100, 1, 4, 90], X).
% X = instant(75, instant(4, instant(1, empty, empty), instant(50, empty, empty)), instant(100, instant(90, empty, empty), empty)) 