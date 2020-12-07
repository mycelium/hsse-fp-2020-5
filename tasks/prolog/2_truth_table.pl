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

xor(A, B) :- or(A,B), or(not(A), not(B)).

equ(A,B) :- not(xor(A, B)).

bool(true).
bool(fail).
my_expess(E, true) :- E, !.
my_expess(E, fail).

truth_table(A,B,Expression) :-
  bool(A), bool(B), my_expess(Expression, Result),
  write(A), write(' '),
  write(B), write(' '),
  write(Result),
  nl, fail.
  
%?- truth_table(A,B,equ(A,xor(A,B))).
%true	true	fail
%true	fail	true
%fail	true	fail
%fail	fail	true