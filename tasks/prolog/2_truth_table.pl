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
xor(A, B) :- A \= B.
equ(A, B) :- A = B.
not(A) :- \+ A.

truth_value(true).
truth_value(false).

% Таблица истинности для бинарного предиката
truth_table(A, B, Expression) :- write("A\tB\tResult"), nl, truth_value(A), truth_value(B), 
								write(A), write('\t'), write(B), write('\t'), (Expression -> write(true); write(false)), nl, false.
								
% Таблица истиности для унарного предиката								
truth_table(A, Expression) :- write("A\tResult"), nl, truth_value(A), write(A), write('\t'), (Expression -> write(true); write(false)), nl, false.

% ?- truth_table(A, B, and(A, B)).
% A       B       Result
% true    true    true
% true    false   false
% false   true    false
% false   false   false
% false.

% ?- truth_table(A, B, or(A, B)).
% A       B       Result
% true    true    true
% true    false   true
% false   true    true
% false   false   false
% false.

etc...