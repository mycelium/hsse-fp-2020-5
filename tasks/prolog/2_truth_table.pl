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

% ?- truth_table(A,B,xor(A,and(A,B))).
% true true fail
% true fail true
% fail true fail
% fail fail fail
% 
?- truth_table(A,B,not(xor(A,B))).
% true true true
% true fail fail
% fail true fail
% fail fail true
% 

bool(true).
bool(false).

and(A, B) :- A, B.
or(A,B) :- A; B.
not(A) :- \+ A.
xor(A,B) :- and(or(A, B), not(and(A, B))).
equ(A,B) :- not(xor(A,B)).

value(true).
value(fail).

expr(E, true) :- E, !.
expr(E, fail).

truth_table(A,B,Expression) :-
  value(A),
  value(B),
  write(A),
  write(' '),
  write(B),
  write(' '),
  expr(Expression, Res),
  write(Res),
  nl, 
  fail.

