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

and(A, B) :- A, B.

or(A, B) :- A; B.

not(A) :- \+ A.

xor(A, B) :- or(and(not(A), B), and(A, not(B))).

equ(A, B) :- not(xor(A, B)).

bool(true).
bool(fail).

truth_table(A, B, Expression) :- bool(A), bool(B), eval(A, B, Expression), false.

eval(A,B,_) :- write(A), write('  '), write(B), write('  ').
eval(_, _, Expression) :- Expression, !, write(true), nl.
eval(_, _, _) :- write(fail), nl.

%?-truth_table(A, B, and(A, B)).
%true  true  true
%true  fail  fail
%fail  true  fail
%fail  fail  fail
%false.

%?-truth_table(A, B, and(A, or(A, B))).
%true  true  true
%true  fail  true
%fail  true  fail
%fail  fail  fail
%false.

%?-truth_table(A, B, and(B, or(not(A), not(B)))).
%true  true  fail
%true  fail  fail
%fail  true  true
%fail  fail  fail
%false.







