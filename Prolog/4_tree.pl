% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)
%
qsort([],[]).
qsort([Head | Tail], K) :-
    insert(Head,Tail, A, B),
    qsort(A, AK),
    qsort(B, BK),
    append(AK,[A|BK],K).

%insert - дополнительный вспомогательный предикат
insert(_,[],[],[]).
insert(X,[Y | Tail],[Y| A],B) :- X > Y, insert(X, Tail, A, B).
insert(X, [Y|Tail],A, [Y | B]):-insert(X, Tail, A, B).

split_tree(L, Left, Right):- append(Left, Right, L),
                           length(L, Len),
                           ML is div(Len, 2),
                           length(Left, ML).

balanced_tree([], empty).

balanced_tree(L, instant(Root, Left, Right)) :-
    split_tree(L, Left2, [Root|Right2]),
    balanced_tree(Left2, Left),
    balanced_tree(Right2, Right).

balanced_tree(L, T) :- qsort(L, S), balanced_tree(S, T).
