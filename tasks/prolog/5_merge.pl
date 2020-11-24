$ определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

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

% Нигде не сказано, что так нельзя :)
mrg0(L1, L2, R) :- append(L1, L2, Res), qsort(Res, R).

mrg([], L, L).
mrg(L, [], L).
mrg([H1 | T1], [H2 | T2], L) :- 
  H1 < H2 -> nth0(0, L, H1, R), mrg(T1, [H2 | T2], R) ;
  H1 > H2 -> nth0(0, L, H2, R), mrg([H1 | T1], T2, R) ;
  nth0(0, L, [H1, H2], R), mrg(T1, T2, R).
  
%?-mrg([1, 4, 5], [2, 23, 53], Res).
%Res = [1, 2, 4, 5, 23, 53]

%?-mrg([22, 33, 66], [11, 25, 46], Res).
%Res = [11, 22, 25, 33, 46, 66]

%?-mrg([1, 1, 5, 5, 8, 8], [2, 2, 4, 4, 7, 7], Res)
%Res = [1, 1, 2, 2, 4, 4, 5, 5, 7, 7, 8, 8]

