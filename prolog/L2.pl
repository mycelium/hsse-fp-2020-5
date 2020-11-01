and(A, B) :- A, B.
or(A,B):- A;B.
not(A):- \+A.
xor(A,B):- or(A,B), not(and(A,B)).
equ(A,B):- not(xor(A,B)).

evaluate(E, true) :- E, !.
evaluate(_, false).

bool(true).
bool(false).

truthTable(A,B,E) :-
  bool(A),
  bool(B),
  write(A),
  write(' | '),
  write(B),
  write(' | '),
  evaluate(E, Result),
  write(Result),nl,fail.
