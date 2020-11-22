% Определить предикат qsort(L, K) который для заданного списка целых чисел возвращает отсортированный 
qsort([Pivot|L], K) :- split(Pivot, L, Left, Rigth), 
                   qsort(Left, KLeft), 
                   qsort(Rigth, KRigth), 
                   append(KLeft, [Pivot | KRigth], K). 

split(_, [], [], []).
split(Pivot, [H | T], [H | Ls], Rs) :- H < P, 
                                   split(Pivot, T, Ls, Rs).
split(Pivot, [H | T], Ls, [H | Rs]) :- H >= Pivot, 
                                   split(Pivot, T, Ls, Rs).
