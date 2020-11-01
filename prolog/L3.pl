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