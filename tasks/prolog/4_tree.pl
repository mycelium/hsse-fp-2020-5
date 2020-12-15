  
% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([],[]).

qsort([H|T], Sorted):-
	split(H, T, L1, L2),
	qsort(L1, Sorted1),
	qsort(L2, Sorted2),
	append(Sorted1, [H|Sorted2], Sorted).
   
split(H, [], [], []).
split(H, [X|T], [X|L], G):- X=<H, split(H, T, L, G).
split(H, [X|T], L, [X|G]):- X>H, split(H, T, L, G).


% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)


balanced_tree(L, T) :-
	qsort(L, Sorted),
	build_subtree(Sorted, T).
	
build_subtree([], empty).

build_subtree(L, instant(Root, LeftSubtree, RightSubtree)) :-
	split_tree(L, Left, [Root|Right]),
	build_subtree(Left, LeftSubtree),
	build_subtree(Right, RightSubtree).

split_tree(L, Left, Right) :-
	length(L, Length),
	Middle is div(Length, 2),
	length(Left, Middle),
	append(Left, Right, L).
