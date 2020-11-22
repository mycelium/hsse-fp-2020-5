% определить предикаты:
	% and(A,B)
	% or(A, B)
	% xor(A, B)
	% not(A)
	% equ(A,B)
% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail
        and(A,B) :- A, B.
	or(A,B) :- A; B.
	xor(A,B) :- \+(equ(A,B)).
	equ(A,B) :- A=B.

	boolean(X) :- X=True.
	boolean(X) :- X=False.

	evaluation(E, True):- E, !.
	evaluation(_, False).

	truth_table(A, B, E):- boolean(A),boolean(B),
					write(A), write(' '), write(B), write(' '),
					evaluation(E, R), writeln(R), False.
	truth_table(_,_,_):- nl, True.

	%truth_table(A, B, and(A,B)).
%True True True
%True False False
%False True False
%False False False

	% truth_table(A, B, or(A,B)).
%True True True
%True False True
%False True True
%False False False

	%truth_table(A, B, xor(A,B)).
%True True False
%True False True
%False True True
%False False False

	%truth_table(A, B, equ(A,B)).
%True True True
%True False False
%False True False
%False False True
        % truth_table(A,B,and(A,or(A,B))).
%True True True
%True False True
%False True False
%False False False
