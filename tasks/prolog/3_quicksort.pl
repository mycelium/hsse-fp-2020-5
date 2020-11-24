qsort([],[]).   
qsort([X|Tail], Sorted) :-         
   split(X, Tail, Small, Big),
   qsort(Small, SortedSmall),
   qsort(Big, SortedBig),
   append(SortedSmall, [X|SortedBig], Sorted).

split(X, [],[],[]).
split(X, [Y|Tail], [Y|Small], Big) :-
    X > Y,
    split(X, Tail, Small, Big).
split(X, [Y|Tail], Small, [Y|Big]) :-
    split(X, Tail, Small, Big).
	