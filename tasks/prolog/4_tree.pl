% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

:- consult('3_quicksort.pl').
empty().
instant(Root, L, R).
instant(Root, empty(), empty()).

removeLast([H], [], H).
removeLast([H|T], [H | L], R) :- removeLast(T, L, R).

mid([H], H, [], [], _).
mid([H|T], El, [H | L], R, 1) :- mid(T, El, L, R, 0).
mid(SL, El, L, R, 0) :- removeLast(SL, L1, R1), mid(L1, El, L, R2, 1), append(R2,[R1], R).

build([], empty()).
build([H], instant(H, empty(), empty())).
build(SL, instant(El, R1, R2)) :- mid(SL, El, Left, Right, 1), build(Left, R1), build(Right, R2).

balancedTree(L, R) :- quickSort(L, SL), build(SL, R).  

print(empty()).
print(instant(Root, L, R)) :- write(Root), write('\n'), print(L), print(R).

main:-
        balancedTree([4, 3, 2, 1, 10, 6, 5, 100], R),
        print(R),
        halt.


:- main.
