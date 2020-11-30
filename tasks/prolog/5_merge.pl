% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2 
% определяет список R, составленный из этих элементов


mrg([LeftHead | LeftList], [RightHead | RightList], M) :-  
	LeftHead < RightHead, 
	append([LeftHead], M1, M), 
	mrg(LeftList, [RightHead | RightList], M1).
	
mrg([LeftHead | LeftList], [RightHead | RightList], M) :-  
	LeftHead >= RightHead, 
	append([RightHead], M1, M), 
	mrg([LeftHead | LeftList], RightList, M1).
	
mrg([], R, M) :- 
	M = R.
	
mrg(L, [], M) :- 
	M = L.
