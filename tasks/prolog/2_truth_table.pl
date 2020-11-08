bool(true).
bool(fail).

and(A,B) :- A,B.
or(A,B) :- A;B.
not(A) :- \+A.
xor(A,B) :- or(and(not(A),B), and(A,not(B))).
equ(A,B) :- not(xor(A, B)).

evaluate(E, true) :- E, !.
evaluate(_, fail).


truth_table(A,B,E) :-
  bool(A),
  bool(B),
  write(A),
  write(' \t '),
  write(B),
  write(' \t '),
  evaluate(E, Result),
  write(Result),nl, fail.