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

or(A, B) :- A ; B.

not(A) :- \+ A.

xor(A, B) :- or(and(A, not(B)), and(not(A), B)).

equ(A, B) :- not(xor(A, B)).

bool_value(true).
bool_value(fail).

equals(E, true) :- E, !.
equals(E, fail) :- not(E), !.

truth_table(A, B, E) :-
    bool_value(A),
    bool_value(B),
    equals(E, R),
    write(A),
    write(' '),
    write(B),
    write(' '),
    write(R),
    nl,
    fail.

%?- truth_table(A, B, and(A, or(A, B))).
%true true true
%true fail true
%fail true fail
%fail fail fail
%false.

%?- truth_table(A, B, equ(A, B)).
%true true true
%true fail fail
%fail true fail
%fail fail true
%false.