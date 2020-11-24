% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

qsort([],[]).   
qsort([X|Tail], Sorted) :-         
   split(X, Tail, Small, Big),
   qsort(Small, SortedSmall),
   qsort(Big, SortedBig),
   append(SortedSmall, [X|SortedBig], Sorted).

split(_, [],[],[]).
split(X, [Y|Tail], [Y|Small], Big) :-
    X > Y,
    split(X, Tail, Small, Big).
split(X, [Y|Tail], Small, [Y|Big]) :-
    split(X, Tail, Small, Big).


partion(L, LEFT, RIGHT) :-
   length(L, LEN),
   MIDDLE is div(LEN, 2) + mod(LEN, 2),
   length(RIGHT, MIDDLE),
   append(LEFT, RIGHT, L).
   

balanced_tree_rec(LIST, instant(X, T_LEFT, T_RIGHT)) :- 
    partion(LIST, L_LIST, [X|R_LIST]),
	balanced_tree_rec(L_LIST, T_LEFT), 
	balanced_tree_rec(R_LIST, T_RIGHT).

balanced_tree_rec(_, empty).

balanced_tree(L,T) :- 
	qsort(L, S),
	balanced_tree_rec(S, T).
