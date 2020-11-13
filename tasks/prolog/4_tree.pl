% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

balanced_tree(L, T) :- qsort(L, K),listToTree(K, T).

% Метод делает обход лерева Корень-Левое-Праве. Не используется, т.к. только в конце заметил,
% что balanced_tree принимает список
treeToList(empty, []).
treeToList(instant(Root, L, R), [Root |Res]) :- treeToList(L, ResL),treeToList(R, ResR),
    append(ResL, ResR, Res).

listToTree([], empty).
listToTree(List, instant(Root, L, R)) :- getDecPivotIndex(List, LS),
    llength(LP, LS),
    append(LP, [Root|RP], List),
    listToTree(LP, L),
    listToTree(RP, R).

% Определяет значение опорного индекса - 1.
getDecPivotIndex(X,LL) :- llength(X, L), (L div 2) * 2 + 1 =:= L, LL is L div 2.
getDecPivotIndex(X,LL) :- llength(X, L), LL is L - L div 2 - 1.

% ?- balanced_tree([6,5,4,3,2,1], T).
% instant(3, instant(1, empty, instant(2, empty, empty)), instant(5, instant(4, empty, empty), instant(6, empty, empty)))

% ?- balanced_tree([3,2,1], T).
% T = instant(2, instant(1, empty, empty), instant(3, empty, empty))

% ?- balanced_tree([1], T).
% T = instant(1, empty, empty) 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Далее код прошлой лабы %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
getPivotIndex(X,I) :- llength(X, L), (L div 2) * 2 + 1 =:= L, I is L div 2 + 1.
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
