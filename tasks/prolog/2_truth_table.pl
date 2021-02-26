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
  A, B.
  
/*
truth_table(A,B,and(A,B)).
true    true    true
true    fail    fail
fail    true    fail
fail    fail    fail
*/  
  
or(A, B) :- 
  A; B.
  
/*
truth_table(A,B,or(A,B)).
true    true    true
true    fail    true
fail    true    true
fail    fail    fail
*/
  
xor(A, B) :- 
  A \= B.
  
/*
truth_table(A,B,xor(A,B)).
true    true    fail
true    fail    true
fail    true    true
fail    fail    fail
*/
  
not(A) :- 
  \+A.
  
/*
truth_table(A,B,not(A)).
true    true    fail
true    fail    fail
fail    true    true
fail    fail    true
*/
  
equ(A, B) :- 
  A = B.
  
/*
truth_table(A,B,equ(A,B)).
true    true    true
true    fail    fail
fail    true    fail
fail    fail    true
*/

bool(true).
bool(fail).

evaluate(Ex, true) :- 
  Ex, !.
evaluate(_, fail).

truth_table(A, B, Ex) :-
  bool(A),
  bool(B),
  write(A),
  write('\t'),
  write(B),
  write('\t'),
  evaluate(Ex, Result),
  write(Result), 
  nl, 
  fail.
  
/*
truth_table(A,B,and(A,or(A,B))).
true    true    true
true    fail    true
fail    true    fail
fail    fail    fail
*/