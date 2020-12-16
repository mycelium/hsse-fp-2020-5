% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)


        division(_, [], [], []).
        division(Selected, [Current|Tail], [Current|Less], Greater) :-
                Current < Selected,
                division(Selected, Tail, Less, Greater).
        division(Selected, [Current|Tail], Less, [Current|Greater]) :-
                Current >= Selected,
                division(Selected, Tail, Less, Greater).

        qsort([], []).
        qsort([Head|Tail], Sorted) :-
                division(Head, Tail, Less, Greater),
                qsort(Less, Sorted1),
                qsort(Greater, Sorted2),
                append(Sorted1, [Head|Sorted2], Sorted).

	balanced_tree(L, T) :- qsort(L, K), create_tree(K, T).
	create_tree([], empty).
	create_tree(Source, instant(Root, L, R)) :-
		divide(Source, Left, [Root|Right]),
		create_tree(Left, L),
		create_tree(Right, R).
	divide(S, L, R) :-
		length(S, Len),
		RLen is Len - Len // 2,
		length(R, RLen),
		append(L, R, S).

	% ?- balanced_tree([6,5,4,3,2,1], T).
	% T = instant(4, instant(2, instant(1, empty, empty), instant(3, empty, empty)), instant(6, instant(5, empty, empty), empty)) .
