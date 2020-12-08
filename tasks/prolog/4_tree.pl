% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

split([], Pivot, [], []):-!.
split([Head|Tail], Pivot, Bigger, [Head|Smaller]):-
  Head < Pivot, !, split(Tail, Pivot, Bigger, Smaller).
split([Head|Tail], Pivot, [Head|Bigger], Smaller):-
  split(Tail, Pivot, Bigger, Smaller).
  
qsort([], []).
qsort([E], [E]).
qsort([Pivot|Tail], ListSorted):-
  split(Tail, Pivot, Bigger, Smaller),
  qsort(Smaller, SmallerSorted),
  qsort(Bigger, BiggerSorted),!,
  append(SmallerSorted, [Pivot|BiggerSorted], ListSorted).
  
tree_split(SortedL, Left, Right) :-
	length(SortedL, Len),
	Mid is div(Len, 2),
	length(Left, Mid),
	append(Left, Right, SortedL).
	
balanced_tree_create([], empty).
balanced_tree_create(SortedL, instant(Root, LeftSubtree, RightSubtree)) :-
	tree_split(SortedL, Left, [Root|Right]),
	balanced_tree_create(Left, LeftSubtree),
	balanced_tree_create(Right, RightSubtree).
  
balanced_tree(L, T) :-
	qsort(L, SortedL),
	balanced_tree_create(SortedL, T).