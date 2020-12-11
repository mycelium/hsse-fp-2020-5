% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

part(X, [Comp_elem|X_tail], [Comp_elem|L], R):-
    Comp_elem =< X,
    part(X, X_tail, L, R).

part(X,[Comp_elem|X_tail],L,[Comp_elem|R]):-
    Comp_elem > X,
    part(X, X_tail, L, R).

part(X,[],[],[]).


qsort([X|X_tail], X_sorted):-
	part(X, X_tail, L, R),
    qsort(L, L_sorted),
    qsort(R, R_sorted),
	append(L_sorted, [X|R_sorted], X_sorted).

qsort([],[]).


% ?- qsort([2, 54, 72, 1, 13, 93, 45, 11], X).
% X = [1, 2, 11, 13, 45, 54, 72, 93];

% ?- qsort([9, 7, 5, 3, 1], [1, 3, 5, 7, 9]).
% true ;

% ?- qsort([9, 7, 5, 3, 1], [9, 7, 5, 3, 1]).
% false.