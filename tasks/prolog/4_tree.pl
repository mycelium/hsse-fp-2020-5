% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

% ?- balanced_tree([1,2,5,9,6,2,3], T).
% T = instant(3, instant(2, instant(1, empty, empty), instant(2, empty, empty)), instant(6, instant(5, empty, empty), instant(9, empty, empty))) 

qsort([],[]).   

qsort([X|T], Res) :- split(X, T, L, R), qsort(L, Left), qsort(R, Right), append(Left, [X|Right], Res).

split(X, [],[],[]).
split(X, [Y|T], [Y|L], R) :- X > Y, split(X, T, L, R).
split(X, [Y|T], L, [Y|R]) :- split(X, T, L, R).

partion(L, LEFT, RIGHT) :-
   length(L, LEN),
   MID is div(LEN, 2) + mod(LEN, 2),
   length(RIGHT, MID),
   append(LEFT, RIGHT, L).

b_tree(LIST, instant(X, T_LEFT, T_RIGHT)) :- 
    partion(LIST, L_LIST, [X|R_LIST]),
	b_tree(L_LIST, T_LEFT), 
	b_tree(R_LIST, T_RIGHT).

b_tree(_, empty).

balanced_tree(L,T) :- 
	qsort(L, S),
	b_tree(S, T).
