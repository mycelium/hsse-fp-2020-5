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

bool(true).
bool(fail).

and(A, B) :- A, B.

or(A, B) :- A; B.

xor(A, B) :- not(equ(A, B)).

not(A) :- \+ A.

equ(A, B) :- A = B.


expr(Expression, true) :- Expression, !.
expr(Expression, fail).

truth_table(A, B, Expression) :-
	bool(A), 
	bool(B),
	expr(Expression, Res),
	write(A), write('\t'),  write(B), write('\t'), write(Res), nl, 
    fail.

% пример из задания:
% ?- truth_table(A,B,and(A,or(A,B))).
% true    true    true
% true    false   true
% false   true    false
% false   false   false

% свой пример:
% ?- truth_table(A, B, not(or(A, or(A, not(B))))).
% true    true    false
% true    false   false
% false   true    true
% false   false   false