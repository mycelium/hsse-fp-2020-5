% определить предикат mrg(L1, L2, R) который для двух отсортированных списков L1 и L2
% определяет список R, составленный из этих элементов

mrg([], X, X).
mrg(Y, [], Y).

mrg([X|T_X], [Y|T_Y], [X|T_Merged]) :-
	X =< Y,
	mrg(T_X, [Y|T_Y], T_Merged).
	
mrg([X|T_X], [Y|T_Y], [Y|T_Merged]) :-
	X > Y,
	mrg([X|T_X], T_Y, T_Merged).

mrg([X|T_X], [], [X|T_Merged]):- 
	mrg(T_X, [], T_Merged).

mrg([], [Y|T_Y], [Y|T_Merged]):- 
	mrg([], T_Y, T_Merged).

mrg([], [], []).
