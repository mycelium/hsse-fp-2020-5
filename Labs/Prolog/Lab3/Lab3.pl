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

/*
Output:

?- qsort([7, 6, 3, 99, 8, 23], Sorted).
Sorted = [3, 6, 7, 8, 23, 99] ;
false.

?- qsort([-23, -2352, 254, 245, 22, 57, 22], Sorted).
Sorted = [-2352, -23, 22, 22, 57, 245, 254] ;
false.

*/
