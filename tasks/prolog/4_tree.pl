% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

roman_empire([], SuppElem, [], []):-!.
roman_empire([Head|Tail], SuppElem, [Head|BigList], SmallList):-
  Head >= SuppElem, !, roman_empire(Tail, SuppElem, BigList, SmallList).
roman_empire([Head|Tail], SuppElem, BigList, [Head|SmallList]):-
  roman_empire(Tail, SuppElem, BigList, SmallList).
  
qsort([], []).
qsort([Elem], [Elem]).
qsort([SuppElem|Tail], ListSort):-
  roman_empire(Tail, SuppElem, BigList, SmallList),
  qsort(BigList, BigListSort),
  qsort(SmallList, SmallListSort),!,
  append(SmallListSort, [SuppElem|BigListSort], ListSort).
  
roman_empire_tree(L, Left, Right) :-
	length(L, Length),
	Middle is div(Length, 2),
	length(Left, Middle),
	append(Left, Right, L).
	
balanced_tree_continue([], empty).
balanced_tree_continue(L, instant(R, LSubtree, RSubtree)) :-
	roman_empire_tree(L, Left, [R|Right]),
	balanced_tree_continue(Left, LSubtree),
	balanced_tree_continue(Right, RSubtree).
  
balanced_tree(L, T) :-
	qsort(L, SortL),
	balanced_tree_continue(SortL, T).