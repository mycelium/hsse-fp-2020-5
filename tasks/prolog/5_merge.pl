$ определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg([],[], []).
mrg(L1, [], L1).
mrg([], L2, L2).
mrg([First|L1], [Second|L2], [First|R]) :- 
                            First < Second, 
                            mrg(L1, [Second|L2], R).
mrg([First|L1], [Second|L2], [Second|R]) :- 
                            First >= Second, 
						    mrg([First|L1], L2, R).
