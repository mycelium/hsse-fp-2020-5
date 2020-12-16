% определить предикаты:
and(A,B) :- A,B.
or(A,B) :- A ; B.
xor(A, B) :- A \= B.
not(A) :- \+A.
equ(A,B) :- A=B.
% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
evaluate(E, true) :- E, !.
evaluate(_, false).

bool(true).
bool(false).

truth_table(A,B,E) :-
  bool(A),
  bool(B),
  write(A),
  write(' \t '),
  write(B),
  write(' \t '),
  evaluate(E, Result),
  write(Result),nl, fail.

% ?- truth_table(A,B, xor(A,B)).
% true     true    false
% true     false   true
% false    true    true
% false    false   false
% false.

% ?- truth_table(A,B, equ(A,B)).
% true     true    true
% true     false   false
% false    true    false
% false    false   true
% false.
