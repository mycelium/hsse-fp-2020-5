% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

  split(X,[],[],[]).
  split(X,[Y|Tail],[Y|Less],Greater):- X>Y, split(X,Tail,Less,Greater).
  split(X,[Y|Tail],Less,[Y|Greater]):- split(X,Tail,Less,Greater).

  qsort([],[]).
  qsort([L|Tail],K) :- split(L,Tail,Less,Greater),
                       qsort(Less,KLess),
                       qsort(Greater,KGreater),
                       append(KLess,[L|KGreater],K).

  tree_split(L, Left, Right):- append(Left, Right, L),
                           length(L, LenL),
                           MidL is div(LenL, 2),
                           length(Left, MidL).

  balanced_tree([], empty).

  balanced_tree(L, instant(Root, Left, Right)) :- tree_split(L, LeftL, [Root|RightList]),
                                              balanced_tree(LeftL, Left),
                                              balanced_tree(RightList, Right).

  balanced_tree(L, T) :- qsort(L, S), balanced_tree(S, T).



































