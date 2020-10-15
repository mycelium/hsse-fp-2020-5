% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный

split(X,[],[],[]).
split(X,[Y|Remember],[Y|Little],Larger):- X>Y, split(X,Remember,Little,Larger).
split(X,[Y|Remember],Little,[Y|Larger]):- split(X,Remember,Little,Larger).

qsort([],[]).qsort([L|Remember],K) :-
split(L,Remember,Little,Larger),
    qsort(Little,KSmaller),
    qsort(Larger,KBigger),
    append(KLittle,[L|KLarger],K).

$ ?- qsort([6,2,0,1,-5], K).
% K = [-5, 0, 1, 2, 6] .
	