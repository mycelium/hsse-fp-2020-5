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

and(A,B):- A,B.
or(A, B) :- not(and(not(A),not(B))).
xor(A, B):- or(and(A,not(B)),and(not(A),B)).
not(A):- \+A.
equ(A,B):- not(xor(A, B)).

bool(true).
bool(fail).

evaluation(Expression,true) :- Expression,!.
evaluation(Expression,fail) :- not(Expression),!.

truth_table(A, B, Expression) :- bool(A),bool(B),evaluation(Expression, Result),
	write(A),
	write('\t'),
	write(B),
	write('\t'),
	write(Result),
	nl, fail.

% ?- truth_table(A,B,and(A,or(A,B))).
% true    true    true
% true    fail    true
% fail    true    fail
% fail    fail    fail

% ?- truth_table(A,B,and(A,not(B))).
% true    true    fail
% true    fail    true
% fail    true    fail
% fail    fail    fail

% ?- truth_table(A,B,equ(A,B)).
% true    true    true
% true    fail    fail
% fail    true    fail
% fail    fail    true

% ?- truth_table(A,B,not(and(A,B))).
% true    true    fail
% true    fail    true
% fail    true    true
% fail    fail    true

% ?- truth_table(A,B,(or(not(A),not(B)))).
% true    true    fail
% true    fail    true
% fail    true    true
% fail    fail    true

