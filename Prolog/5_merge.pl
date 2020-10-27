% определить предикат mrg(L1, L2, R) который для двух отсортированных
% списков L1 и L2 определяет список R, составленный из этих элементов


mrg([L1H | L1T], [L2H | L2T], R) :-
    L1H < L2H,
    append([L1H], R2, R),
    mrg(L1T, [L2H| L2T], R2).

mrg([L1H  | L1T], [L2H  | L2T], R) :-
    L1H >= L2H,
    append([L2H], R2, R),
    mrg([ L1H| L1T], L2T, R2).

mrg([], L2, R) :-
    R = L2.
mrg(L1, [], R) :-
    R = L1.

