%определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
%определяет список R, составленный из этих элементов

mrg([], [], []).
mrg([], [Head|L2], [Head|Tail]):- mrg([], L2, Tail).
mrg([Head|L1], [], [Head|Tail]):- mrg(L1, [], Tail).
mrg([H1|L1], [H2|L2], Result):- 
    H1 < H2 -> Result = [H1|R], mrg(L1, [H2|L2], R);
    H1 >= H2 -> Result = [H2|R], mrg([H1|L1], L2, R);
    Result = [H1,H2|R], mrg(L1,L2,R).

    
%mrg([-4,1,2,3,100],[3,4,5,102],X).
%X = [-4, 1, 2, 3, 3, 4, 5, 100, 102]
%false
