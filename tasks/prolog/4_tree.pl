% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

qsort([], []).
qsort(L, K):-
    L = [Pivot | Tail],
    split(Tail, Pivot, LeftSlice, RightSlice),
    qsort(LeftSlice, LeftSorted),
    qsort(RightSlice, RightSorted),
    append(LeftSorted, [Pivot | RightSorted], K).

% argueable what should go first array or regex, but for me this notation is closer to myString.split(" ")
split([], _, [], []).

split([ArrayHead | Tail], Pivot, [ArrayHead | LeftSlice], RightSlice) :- ArrayHead =< Pivot,
    split(Tail, Pivot, LeftSlice, RightSlice).

split([ArrayHead | Tail], Pivot, LeftSlice, [ArrayHead | RightSlice]) :- ArrayHead > Pivot,
    split(Tail, Pivot, LeftSlice, RightSlice).

balanced_tree(L, T):- qsort(L, SortedArray), create_bt(SortedArray, T).

create_bt([], empty).

create_bt(List, instant(Root, Left, Right)):-
    split_half(List, LeftSlice, [Root | RightSlice]),
    create_bt(LeftSlice, Left),
    create_bt(RightSlice, Right).

split_half(List, LeftSlice, RightSlice) :- 
	length(List, ListLength),
    Midpoint is div(ListLength, 2),
    length(LeftSlice, Midpoint),
	append(LeftSlice, RightSlice, List).

% as good as it can get for an even number of leaves
% balanced_tree([1, 2, 3, 4, 5, 6], K).
% K = instant(4, instant(2, instant(1, empty, empty), instant(3, empty, empty)), 
%	...instant(6, instant(5, empty, empty), empty))

% balanced_tree([1, 2, 3, 4, 5], K).
% K = instant(3, instant(2, instant(1, empty, empty), empty), instant(5, instant(4, empty, empty), empty))

% balanced_tree([5, 5, 2, 2, 5], K).
% K = instant(5, instant(2, instant(2, empty, empty), empty), instant(5, instant(5, empty, empty), empty))

% balanced_tree([17, 3, 25, 1, 9, 4, 13], K).
% K = instant(9, instant(3, instant(1, empty, empty), instant(4, empty, empty)), 
%	...instant(17, instant(13, empty, empty), instant(25, empty, empty)))
