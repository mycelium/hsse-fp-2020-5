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
  A , B.

/*
?- truth_table(A,B,and(A,B)).
A	    B	    result
true	true	true
true	false	false
false	true	false
false	false	false
*/

not(A) :-
  \+A.

/*
?- truth_table(A,true,not(A)).
A	    B	    result
true	true	false
false	true	true
*/

or(A,B) :-
   A ; B.

/*
?-truth_table(A,B,or(A,B)).
A	    B	    result
true	true	true
true	false	true
false	true	true
false	false	false
*/

xor(A,B) :-
  or(and(not(A),B),and(A,not(B))).
  
/*
?- truth_table(A,B,xor(A,B)).
A	    B	    result
true	true	false
true	false	true
false	true	true
false	false	false
*/  

equ(A,B) :-
  or(and(A,B),and(not(A),not(B))).

/*
?- truth_table(A,B,equ(A,B)).
A	    B	    result
true	true	true
true	false	false
false	true	false
false	false	true
*/

evaluate(E, true) :- E, !.
evaluate(_, false).

bool(true).
bool(false).

truth_table(A,B,Expr):-
  write('A'),
  write('\t'),
  write('B'),
  write('\t'),
  write('result'),
  nl,
  table(A,B,Expr).

table(A,B,Expr) :-
  bool(A),
  bool(B),
  write(A),
  write('\t'),
  write(B),
  write('\t'),
  evaluate(Expr, Result),
  write(Result),nl,fail.
 
 /*
?- truth_table(A,B,and(A,or(A,B))).
A	    B	    result
true	true	true
true	false	true
false	true	false
false	false	false
*/
