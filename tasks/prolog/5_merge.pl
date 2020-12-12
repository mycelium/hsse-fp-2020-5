% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg([], [], []).
mrg(L1, [], L1).
mrg([], L2, L2).

mrg([LeftListHead | LeftListTail], [RightListHead | RightListTail], Res) :- 
  LeftListHead < RightListHead -> append([LeftListHead], Res, Res), mrg(LeftListTail, [RightListHead | RightListTail], Res);
  append([RightListHead], Res, Res), mrg([LeftListHead | LeftListTail], RightListTail, Res).

