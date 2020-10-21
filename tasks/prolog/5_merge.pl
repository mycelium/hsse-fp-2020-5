$ определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2
% определяет список R, составленный из этих элементов

mrg([Arr | ListOne], [Brr | ListTwo], [Arr | Res]) :- Arr =< Brr,
    mrg(ListOne, [Brr | ListTwo], Res).

mrg([Arr | ListOne], [Brr | ListTwo], [Brr | Res]) :- Arr > Brr,
    mrg([Arr | ListOne], ListTwo, Res).

mrg([], [Brr | ListTwo], [Brr | Res]) :- mrg([], ListTwo, Res).

mrg([Arr | ListOne], [], [Arr | Res]):-  mrg(ListOne, [], Res).

mrg([],[],[]).
