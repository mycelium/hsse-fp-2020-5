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


and(A, B) :-
    A,
    B.

or(A, B) :-
    A;
    B.

equ(A, B) :-
    A = B.

not(A) :-
    \+ A.

xor(A, B) :-
    A \= B.

bool(true).
bool(fail).

eval(Expression, true) :-
  Expression, !. eval(_, fail).

truth_table(A, B, Expression) :-
  bool(A),  bool(B),
  eval(Expression, Res),
  write(A),  write('\t'),  write(B),  write('\t'),
  write(Res),
  nl, fail.



% truth_table(A,  B,  and(A, or(A, not(B)))).
% | ?- true	true	true
% true	fail	true
% fail	true	fail
% fail	fail	fail

% truth_table(A,  B,  and(not(A), or(A, xor(B, B)))).
% | ?- true	true	fail
% true	fail	fail
% fail	true	fail
% fail	fail	fail