% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg([], [], []).
mrg(L1, [], L1).
mrg([], L2, L2).

% weirdly enough <= / >= clauses are not allowed in if else. So "if; if else; else" is used instead adding weird condition for 
% ... equal elements. But works.

mrg([LeftListHead | LeftListTail], [RightListHead | RightListTail], Res) :- 
  LeftListHead < RightListHead -> append([LeftListHead], TempRes, Res), mrg(LeftListTail, [RightListHead | RightListTail], TempRes);
  LeftListHead > RightListHead -> append([RightListHead], TempRes, Res), mrg([LeftListHead | LeftListTail], RightListTail, TempRes);
    append([LeftListHead | [RightListHead]], TempRes, Res), mrg(LeftListTail, RightListTail, TempRes).


% mrg([1, 2, 3], [4,5,6], R).
% R = [1, 2, 3, 4, 5, 6]

% mrg([1, 1, 3], [2,2,3], R).
% R = [1, 1, 2, 2, 3, 3]
