% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

split(X,[],[],[]).
split(X,[Y|Remainder],[Y|Smaller],Bigger):- X>Y, split(X,Remainder,Smaller,Bigger).
split(X,[Y|Remainder],Smaller,[Y|Bigger]):- split(X,Remainder,Smaller,Bigger).

qsort([],[]).
qsort([L|Remainder],K) :-
    split(L,Remainder,Smaller,Bigger),
    qsort(Smaller,KSmaller),
    qsort(Bigger,KBigger),
    append(KSmaller,[L|KBigger],K).

% ?- qsort([24,3,8,5],X).
% X = [3, 5, 8, 24] .

% ?- qsort([75,10,13],X).
% X = [10, 13, 75]
