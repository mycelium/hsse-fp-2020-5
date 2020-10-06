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

not(A) :-
    \+ A.

and(A, B) :-
    A,
    B.

or(A, B) :-
    not(and(not(A), not(B))).

xor(A, B) :-
    or(and(A, not(B)), and(not(A), B)).

equ(A, B) :-
    not(xor(A, B)).

bool_value(true).
bool_value(fail).

equals(Expr, true) :-
    Expr,
    !.

equals(Expr, fail) :-
    not(Expr),
    !.

truth_table(A, B, Expr) :-
	bool_value(A),
	bool_value(B),
	equals(Expr, Result),
	write(A),
	write(' '),
	write(B),
	write(' '),
	write(Result),
	nl,
	fail.


%    ?- truth_table(A,B,and(A,or(A,B))).
%    true true true
%    true fail true
%    fail true fail
%    fail fail fail
%    false.
%
%    ?- truth_table(A,B,xor(A,B)).
%    true true fail
%    true fail true
%    fail true true
%    fail fail fail
%    false.