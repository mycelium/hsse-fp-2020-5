% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

% Для пустого списка сортировка не требуется
qsort([],[]).

% Быстрая сортировка
% Pivot - стержень (опорный элемент)
% Rest - остаток списка
% SortedList - Отсортированыый список
% Left, Right - вспомогательные элементы
qsort([Pivot | Rest], SortedList) :-
    append(LeftSorted, [Pivot | RightSorted], SortedList),
    partition(Pivot, Rest, Left, Right),
    qsort(Left, LeftSorted),
    qsort(Right, RightSorted).

% Разбиения
partition(_, [], [], []).
partition(Pivot, [Number | Rest], [Number | Left], Right) :-
    Number =< Pivot,
    partition(Pivot, Rest, Left, Right).
partition(Pivot, [Number | Rest], Left, [Number |Right]) :-
    Number > Pivot,
    partition(Pivot, Rest, Left, Right).
	
% Example
% ?- qsort([5,4,2,7,3,1], X).
% X = [1, 2, 3, 4, 5, 7] .