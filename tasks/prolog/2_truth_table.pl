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

not(A) :- A, !, fail.
not(A).

xor(A, B) :- or(A,B), not(and(A, B)).

equ(A,B) :- A = B.

ab_value(true).
ab_value(fail).

expr(E, true) :- E, !.
expr(E, fail).

truth_table(A,B,Expression) :-
  ab_value(A),
  ab_value(B),
  write(A),
  write(' '),
  write(B),
  write(' '),
  expr(Expression, Res),
  write(Res),
  nl, 
  fail.
  
%?- truth_table(A,B,and(A,or(A,B))).
%true	true	true
%true	fail	true
%fail	true	fail
%fail	fail	fail