% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

% подключаем функцию быстрой сортировки из предыдущей лабораторной
:- consult('3_quicksort.pl').

% M - Merged
% L - LeftList
% R - RightList
mrg([], R, M) :- M = R.
mrg(L, [], M) :- M = L.
mrg([], [], empty).

mrg(L, R, M) :-
	append(L, R, Temp),
	qsort(Temp, M).