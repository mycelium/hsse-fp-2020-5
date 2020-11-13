qsort([],[]).
qsort([H|T],Sorted) :-
    pivot(H,T,Less,Greater),
    qsort(Less,SortedLess),
    qsort(Greater,SortedGreater),
    append(SortedLess,[H|SortedGreater],Sorted).

pivot(_,[],[],[]).
pivot(P,[H|T],[H|Less],Greater) :-
    H =< P,
    pivot(P,T,Less,Greater).
pivot(P,[H|T],Less,[H|Greater]) :-
    H > P,
    pivot(P,T,Less,Greater).

/* ?- qsort([11,-11,-12,0,9,2,100,51,4],K).
K = [-12, -11, 0, 2, 4, 9, 11, 51, 100] . */
