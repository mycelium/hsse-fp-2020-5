% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

qsort(L, K) :- quicksort(L, K).
quicksort([],[]).
quicksort([H | T], Res) :-
  part(T, H, Left, Right),
  quicksort(Left, Ls),
  quicksort(Right, Rs),
  append(Ls, [H | Rs], Res).

part([], _, [], []).
part([H | T], Y, [H | Ls], Rs) :-
  (H < Y; H = Y), part(T, Y, Ls, Rs).
part([H | T], Y, Ls, [H | Rs]) :-
  H > Y, part(T, Y, Ls, Rs).

balanced_tree(L, T):- qsort(L, SortedL), bt(SortedL, T).

split_at(0,L,[],L) :- !.
split_at(N,[H|T],[H|L1],L2) :- M is N -1, split_at(M,T,L1,L2).

bt([], empty).
bt(List, instant(Root, Left, Right)):-
  length(List, Length),
  Middle is Length // 2,
  split_at(Middle, List, LeftList, [Root|RightList]),
  bt(LeftList, Left),
  bt(RightList, Right).
	
%?-balanced_tree([4, 3, 2, 1, 5], T)
%T = instant(3, instant(2, instant(1, empty, empty), empty), instant(5, instant(4, empty, empty), empty))

%?-balanced_tree([57, 143, 5, 78, 43, 1, 22], T)
%T = instant(43,
% instant(5, instant(1, empty, empty), instant(22, empty, empty)), 
% instant(78, instant(57, empty, empty), instant(143, empty, empty)))

%?-balanced_tree([-5, 22, -4, 3, 54], T)
%T = instant(3, instant(-4, instant(-5, empty, empty), empty), instant(54, instant(22, empty, empty), empty))

