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

and(A, B) :- A,B.

or(A, B) :- A;B.
xor(A, B) :- and(or(A,B), rnot(and(A, B))).
rnot(A) :- not(A).
equ(A, B) :- not(xor(A,B)).

evaluate(E, true) :- E, !.
evaluate(_, false).

bool(true).
bool(false).

tableBody(A,B,E) :-
  bool(A),
  bool(B),
  evaluate(E, R),
  write(A),
  write(' \t '),
  write(B),
  write(' \t '),
  write(R),nl, fail.

% ?- truth_table(A, B, or(and(A, B), xor(A, B))).
% true    true    true
% true    false   true
% false   true    true
% false   false   false
% false.
