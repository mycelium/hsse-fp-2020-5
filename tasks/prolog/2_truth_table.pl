% определить предикаты:
	% and(A,B)
and(A,B) :- A, B.
% still have no idea why and(true,true) works as standalone, but fails in or(true,and(true,false)). 

	% or(A, B)
or(A,B) :- A; B.

	% equ(A,B)
equ(A,B) :- A = B.
    
	% xor(A, B)
xor(A, B) :- not(equ(A,B)).

	% not(A)
%already defined. built-in.

% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

boolean(X) :- (X = false); (X = true).
%bind(true).
%bind(false).

%SOF solution: https://stackoverflow.com/questions/2102514/prolog-first-order-logic-printing-a-truth-table
% ! for backtracking. and is not needed for my solution
evaluate(E, true) :- E.
evaluate(_, false).

%truth_table(A,B,E) :- bind(A), bind(B), write(A), write(" "), write(B), write(" "),
%  evaluate(E, Result), write(Result),nl, fail.

%seems cooler than sof solution
%funnily enough SWISH does not work with this solution or solution from sof. regtexter.com does.
truth_table(A,B,E) :- forall((boolean(A), boolean(B)),(write(A), write(" "), 
                                                write(B), write(" "),evaluate(E,R),writeln(R))).
                                                
%truth_table(A,B,and(A,or(A,and(A,not(b))))).                                                
%false false false
%false true false
%true false true
%true true true

%truth_table(A,B,and(not(and(A,B)),or(A,not(B)))).
%false false true
%false true false
%true false true
%true true false

%truth_table(A,B,or(and(not(A),or(A,B)),or(not(B),and(A,B)))).
%false false true
%false true true
%true false true
%true true true