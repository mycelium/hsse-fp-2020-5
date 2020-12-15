% определить предикаты:
not(A) :- \+ A.
and(A, B) :- A,	B.

or(A, B) :- not(and(not(A),	not(B))).

xor(A, B) :- or(and(A, not(B)), and(not(A), B)).

equ(A, B) :- not(xor(A, B)).

bool(true).
bool(fail).

eval(Expression, true) :- Expression, !.
eval(Expression, false) :- not(Expression), !.

truth_table(A, B, Expression) :-
    bool(A),
    bool(B),
	eval(Expression, Out),
    write(A),
    write(' '),
    write(B),
    write(' '),
	write(Out),
    nl, fail.

% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
%?- truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

%?- truth_table(A, B, or(not(A), xor(A, B))).
