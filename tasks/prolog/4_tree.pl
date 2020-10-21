% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

pivot(_, [], [], []).
pivot(Pivot, [L|Tail], [L|LessOrEqualThan], GreaterThan) :- Pivot >= L, pivot(Pivot, Tail, LessOrEqualThan, GreaterThan). 
pivot(Pivot, [L|Tail], LessOrEqualThan, [L|GreaterThan]) :- pivot(Pivot, Tail, LessOrEqualThan, GreaterThan).

qsort([], []).
qsort([L|Tail], K) :- pivot(L, Tail, List1, List2), qsort(List1, KList1), qsort(List2, KList2), append(KList1, [L|KList2], K).

split(L, Left, Right):- 
    append(Left, Right, L),
    length(L, LeftSize),
    Mid is div(LeftSize, 2),
    length(Left, Mid).

balanced_tree([], empty).

balanced_tree(L, instant(Root, LeftSub, RightSub)) :- 
    split(L, Left, [Root|Right]),
    balanced_tree(Left, LeftSub),
    balanced_tree(Right, RightSub).

balanced_tree(L, T) :- 
    qsort(L, S),
    balanced_tree(S, T).