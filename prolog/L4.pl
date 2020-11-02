qsort([],[]).
qsort([X], [X]).
qsort([Head, Pivot|Tail],Sorted):-
    divide(Pivot,[Head|Tail],FirstList,SecondList),
    qsort(FirstList,SortedFirstList),
    qsort(SecondList,SortedSecondList),
    append(SortedFirstList,[Pivot|SortedSecondList],Sorted).

divide(_,[],[],[]).
divide(Pivot,[X|T],[X|FirstList],SecondList):-
    X=<Pivot,divide(Pivot,T,FirstList,SecondList).
divide(Pivot,[X|T],FirstList,[X|SecondList]):-
    X>Pivot,divide(Pivot,T,FirstList,SecondList).

balanced_tree(L,T):-
    qsort(L,R),
    construct_tree(R,T).

construct_tree([],empty).

construct_tree(L,instant(Root,Left,Right)) :-
    divide_tree(L,X1,[Root|X2]),
    construct_tree(X1,Left),
    construct_tree(X2,Right).

divide_tree(L,X1,X2):-
    append(X1,X2,L),
    length(L,Lng),
    Mid is Lng div 2,
    length(X1,Mid).
