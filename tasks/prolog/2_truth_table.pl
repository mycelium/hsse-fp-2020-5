% определить предикаты:
	% and(A,B)
	% or(A, B)
	% xor(A, B)
	% not(A)
	% equ(A,B)
	
	
and(A,B):- A, B.
or(A,B):- A; B.
not(A):- \+ A.
xor(A,B):- \+ (A = B).
equ(A,B):- (A = B).


% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail


bool(true).
bool(fail).

expr(C, true):- C, !.
expr(C, fail) :- not(C), !.

truth_table(A, B, C):- bool(A), bool(B), 
			write(A), write(" "), 
			write(B), write(" "), 
			expr(C, E), write(E), 
			nl, fail.

% Результаты:

% ?- truth_table(A, B, and(A, or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail
% false.

% ?- truth_table(A, B, or(A, xor(A,B))).
% true true true
% true fail true
% fail true true
% fail fail fail
% false.
