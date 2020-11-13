% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 
qsort([], []).
qsort([X|[]], [X]).
qsort(L, K) :- getPivotIndex(L, P), 
    getByIndex(P, L, PV),
    removeByIndex(P, L, LS),
    ldevision(LS, PV, LA, RA),
    qsort(LA, LAS),
    qsort(RA, RAS),
    append(LAS, [PV|RAS], K).

% определить длину списка
llength([], 0).
llength([_|T], R) :- llength(T, R1), R is R1+1.

% определить индекс опорного элемента
getPivotIndex(X,I) :- llength(X, L), I is L div 2.

% получить элемент списка по его индексу (1-ый элемент имеет индекс 1)
getByIndex(1, [X|_], X).
getByIndex(I, [_|L], Y) :- I1 is I - 1, getByIndex(I1, L, Y).

% разбить список на два листа L и R
% в L элементы < E
% в R элементы >= E
ldevision([], _, [],[]).
ldevision([H|X], E, [H|L], R) :- H < E, ldevision(X, E, L, R).
ldevision([H|X], E, L, [H|R]) :- H >= E, ldevision(X, E, L, R).

% соединить списки
append([], L, L).
append([H|X], L, [H|R]) :- append(X, L, R).

% удалить элемент списка по его индексу
removeByIndex(1, [_|L], L).
removeByIndex(I, [H|L], [H|Y]) :- I1 is I - 1, removeByIndex(I1, L, Y).

% ?- qsort([9, 8, 7, 6, 5, 4, 3, 2, 1], R)
% R = [1, 2, 3, 4, 5, 6, 7, 8, 9]
