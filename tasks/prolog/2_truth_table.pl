
% определить предикаты:
	% and(A,B)
	% or(A, B)
	% xor(A, B)
	% not(A)
	% equ(A,B)
	
not(A) :- \+ A.

and(A, B) :- A, B.

or(A, B) :- not(and(not(A),	not(B))).

xor(A, B) :- or(and(A, not(B)), and(not(A), B)).

equ(A, B) :- not(xor(A, B)).

eval(Term, true) :- Term, !.
eval(Term, false) :- not(Term), !.

truth_table(A, B, Term) :-
	bool(A), 
	bool(B),
	eval(Term, Res),
	write(A), 
	write('\t'), 
	write(B), 
	write('\t'),
	write(Res),
	nl, fail.

?- truth_table(A, B, and(and(A, B), and(A, B))).
% true true true
% true false false
% false true false
% false false false
% false.

% truth_table(A, B, xor(or(A, B), and(A, B)))
% true	true	false
% true	false	true
% false	true	true
% false	false	false
% false.