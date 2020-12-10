% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов

mrg([L | LT], [R | RT], M) :-  
	L < R, 
	append([L], M1, M), 
	mrg(LT, [R| RT], M1).
	
mrg([L | LT], [R | RT], M) :-  
	L >= R, 
	append([R], M1, M), 
	mrg([L| LT], RT, M1).
	
mrg([], R, M) :- 
	M = R.
	
mrg(L, [], M) :- 
	M = L.
