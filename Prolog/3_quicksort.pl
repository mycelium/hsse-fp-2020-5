% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный
qsort([],[]).
qsort([Head | Tail], K) :-
    insert(Head,Tail, A, B),
    qsort(A, AK),
    qsort(B, BK),
    append(AK,[A|BK],K).

%insert - дополнительный вспомогательный предикат
insert(_,[],[],[]).
insert(X,[Y | Tail],[Y| A],B) :- X > Y, insert(X, Tail, A, B).
insert(X, [Y|Tail],A, [Y | B]):-insert(X, Tail, A, B).


/*
Пример результатов работы:
?- qsort([1,4,3,2,8,16,1,-18,30],K).
K = [-18, 1, 1, 2, 3, 4, 8, 16, 30]

?- qsort([-2,10,16,8,11,4,-1,0,9],K).
K = [-2, -1, 0, 4, 8, 9, 10, 11, 16]
*/
