% определить предикаты:
and(A, B) :- A , B.
or(A, B) :- A ; B.
xor(A, B) :- or(and(not(A), B), and(A, not(B))).
not(A) :- \+A.
equ(A, B) :- or(and(A, B), not(or(A, B))).

eval(E, Res) :- E -> Res = true ; Res = false.

bool(true).
bool(false).

tab :- write('\t').

truth_table(A, B, E) :-
	write('A'), tab, write('B'), tab, write('Expression'), nl,
	bool(A), bool(B),
	write(A), tab, write(B), tab,
	eval(E, Res),
	write(Res), nl, fail.


% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности.

% ?- truth_table(A,B,xor(A, B)).
% A       B       Expression
% true    true    false
% true    false   true
% false   true    true
% false   false   false

% ?- truth_table(A,B,and(A, B)).
% A       B       Expression
% true    true    true
% true    false   false
% false   true    false
% false   false   false

% ?- truth_table(A,B,and(A, or(A, B))).
% A       B       Expression
% true    true    true
% true    false   true
% false   true    false
% false   false   false
