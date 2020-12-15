% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)


part([], _, [], []).
part([Head|Tail], Pivot, [Head|LessOrEqualThan], GreaterThan) :-
  (Head < Pivot; Head = Pivot),
  part(Tail, Pivot, LessOrEqualThan, GreaterThan).
part([Head|Tail], Pivot, LessOrEqualThan, [Head|GreaterThan]) :-
  Head > Pivot,
  part(Tail, Pivot, LessOrEqualThan, GreaterThan).

qsort(L, K) :- quicksort(L, K).
quicksort([],[]).
quicksort([Head|Tail], SortedArray) :-
  part(Tail, Head, Left, Right),
  quicksort(Left, LessOrEqualThan),
  quicksort(Right, GreaterThan),
  append(LessOrEqualThan, [Head|GreaterThan], SortedArray).



build_balanced_tree([], empty).
build_balanced_tree(List, node(Root, Left_tree, Right_Tree)) :-
    build_middle(List, Left, [Root | Right]), build_balanced_tree(Left, Left_tree), build_balanced_tree(Right, Right_Tree).

build_middle(List, L, R) :-
    length(List, Leng), Middle is div(Leng, 2), length(L, Middle),
    append(L, R, List).

balanced_tree(L, T) :-
    qsort(L, Sorted),
    build_balanced_tree(Sorted, T).



% balanced_tree([3, 7, 9, 5, 1, 2, 8, 4, 6], BalancedTree).
% BalancedTree = node(5,node(3,node(2,node(1,empty,empty),empty),node(4,empty,empty)),node(8,node(7,node(6,empty,empty),empty),node(9,empty,empty))) ?