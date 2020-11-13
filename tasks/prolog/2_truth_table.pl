% определить предикаты:
	% and(A,B)
	% or(A, B)
	% xor(A, B)
	% not(A)
	% equ(A,B)

and(A, B) :- A, B.
or(A, B) :- A; B.
xor(A, B) :- A \= B.
not(A) :- \+ A.
equ(A, B) :- A = B.

% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

val_bool(true).
val_bool(false).

write_expr_eval(A) :- A, write(true), !.
write_expr_eval(_) :- write(fail).

write_bool(true) :- write(true).
write_bool(false) :- write(fail).

truth_table(A, B, EXP) :- val_bool(A), val_bool(B), 
    write_bool(A), write(' '), write_bool(B), write(' '), write_expr_eval(EXP), nl, false.

% ?- truth_table(A,B,and(not(A),xor(A,B))).
% true true fail
% true fail fail
% fail true true
% fail fail fail
