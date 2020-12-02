% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 

qsort([],[]).
qsort([Head|Tail],Sorted) :-

    % резделяем массив на две части, используя pivot (первое значение)
    partition(Head,Tail,Less,Greater),

    % используем qsort() для левой стороны, где элементы меньше pivot
    qsort(Less,SortedLess),

    % далее повторяем с правой стороной, где элементы больше pivot
    qsort(Greater,SortedGreater),

    % получаем отсортированные части
    append(SortedLess,[Head|SortedGreater],Sorted).

partition(_,[],[],[]).

    % сравниваем все элементы с pivot
    % если элемент больше, чем pivot, помещаем в меньшую часть
    partition(Pivot,[Head|Tail], [Head|Less], Greater) :-
    Head =< Pivot, partition(Pivot,Tail,Less,Greater).

partition(Pivot,[Head|Tail], Less, [Head|Greater]) :-


%?- qsort([9,1,0,-1,-20,11,100,-22],Sorted).
%Sorted = [-22, -20, -1, 0, 1, 9, 11, 100]
