% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

% функция из прошлой лабороторной
qsort([],[]).
qsort([Head|Tail],Sorted) :-
    partition(Head,Tail,Less,Greater),
    qsort(Less,SortedLess),
    qsort(Greater,SortedGreater),
    append(SortedLess,[Head|SortedGreater],Sorted).

partition(_,[],[],[]).
partition(Pivot,[Head|Tail], [Head|Less], Greater) :-
    Head =< Pivot, partition(Pivot,Tail,Less,Greater).

partition(Pivot,[Head|Tail], Less, [Head|Greater]) :-
    partition(Pivot,Tail,Less,Greater).

% если дерево пустое - пустое дерево вывода
balanced_tree([], empty).

balanced_tree(List, Tree) :-
    qsort(List, SortedList),
    % переобразование в сбалансированное дерево
    list2tree(SortedList, Tree).

% если входной список пуст, то ветка пуста
list2tree([],empty).

% выбираем корень как начало списка правой части
list2tree(List, instant(Root, Left, Right)) :-
    % рекурсивно преобразуем левую часть списка в левую ветку
    % (соответсвенно так же и правую часть)
    divide(List, LeftPart, [Root | RightPart]),
    % переобразование в сбалансированное дерево
    list2tree(LeftPart, Left),
    list2tree(RightPart, Right).

% делим входной список на две части
divide(List, LeftPart, RightPart) :-
    append(LeftPart, RightPart, List),
    length(List, ListLength),
    % для целочисленного деления используем div
    Middle is ListLength div 2,
    length(LeftPart, Middle).

%?- balanced_tree([8,1,0,11,7,-2,2,8],Tree).
%Tree = instant(7,
%      instant(1,
%          instant(0,
%            instant(-2, empty, empty), empty),
%              instant(2, empty, empty)),
%       instant(8,
%            instant(8, empty, empty),
%          instant(11, empty, empty)))
