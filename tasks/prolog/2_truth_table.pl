% определить предикаты:
	% and(A,B)
	% or(A, B)
	% xor(A, B)
	% not(A)
	% equ(A,B)

and(A, B) :- A, B.
or(A, B) :- A; B.
not(A) :- \+ A.
xor(A, B) :- or(and(A, not(B)), and(not(A), B)).
equ(A, B) :- not(xor(A, B)).

% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:

bool(true).
bool(false).

eval(Expression, true) :- Expression, !.
eval(Expression, false) :- not(Expression), !.

truth_table(A, B, Expression) :- bool(A), bool(B), eval(Expression, Result), 
	write(A), write(" | "), write(B), write(" | "), write(Result), nl, fail.

% Sheffer stroke
% ?- truth_table(A,B,or(not(A),not(B))).
% true | true | false
% true | false | true
% false | true | true
% false | false | true
% false.

% Logical NOR
% ?- truth_table(A,B,not(or(A, B))).
% true | true | false
% true | false | false
% false | true | false
% false | false | true
