$ определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

:- consult('3_quicksort.pl').

sorted([]).
sorted([L]).
sorted([X,Y|Tail]) :-
    order(X,Y),
    sorted([Y|Tail]).

order(X, Y) :-
    X =< Y.

mrg(L1, L2, R) :-
    sorted(L1),
    sorted(L2),
    append(L1, L2, Unsorted),
    qsort(Unsorted, R).