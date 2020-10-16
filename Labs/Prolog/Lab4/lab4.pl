qsort([],[]).
qsort([X|Tail],Sorted) :- split(X,Tail,Less,Greater),
	qsort(Less,SortedLess),
	qsort(Greater,SortedGreater),
	append(SortedLess,[X|SortedGreater],Sorted).

great(X,Y) :- X > Y.

split(_,[],[],[]).
split(X,[Y|Tail],[Y|Less],Greater) :- great(X,Y),!,
	split(X,Tail,Less,Greater).
split(X,[Y|Tail],Less,[Y|Greater]) :- split(X,Tail,Less,Greater).

split_tree(L, Left, Right):- append(Left, Right, L),
                           length(L, LenL),
                           MidL is div(LenL, 2),
                           length(Left, MidL).

balanced_tree_recurs([], empty).
balanced_tree_recurs(L, instant(Root, Left, Right)) :- split_tree(L, LeftL, [Root|RightL]),
                                              balanced_tree_recurs(LeftL, Left),
                                              balanced_tree_recurs(RightL, Right).

balanced_tree(L, T) :- qsort(L, S), balanced_tree_recurs(S, T).

/*
 * Output
?- balanced_tree([3,6,2,9,10,1],L).
L = instant(6, instant(2, instant(1, empty, empty), instant(3, empty, empty)), instant(10, instant(9, empty, empty), empty))

?- balanced_tree([56,3,8,90,23,1,7],L).
L = instant(8, instant(3, instant(1, empty, empty), instant(7, empty, empty)), instant(56, instant(23, empty, empty), instant(90, empty, empty)))
*/
