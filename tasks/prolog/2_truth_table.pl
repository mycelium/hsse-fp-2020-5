% определить предикаты:
	% and(A,B)
and(A,B) :- A, B.

	% or(A, B)
or(A,B) :- A; B.

	% equ(A,B)
equ(A,B) :- A = B.
    
	% xor(A, B)
xor(A, B) :- not(equ(A,B)).

	% not(A)
%already defined. built-in.


% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail