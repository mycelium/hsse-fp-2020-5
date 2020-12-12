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


% 1. Определение предикатов
and(A,B) :- A, B.
or(A,B) :- A; B.
not(A) :- \+ A.
xor(A,B) :- and(or(not(A),not(B)) , or(A,B)).
equ(A,B) :- not(xor(A,B)).


% 2. Определение дополнительных предикатов для построения таблицы истинности:

boolean(true).
boolean(fail).

eval(A,B,_):-
	write(A), write('  '), write(B), write('  ').

eval(_, _, E):-
	E,
	!,
	write(true), nl.

eval(_, _, _):-
	write(fail),
	nl.

truth_table(A, B, E):-
	boolean(A), boolean(B),
	eval(A, B, E),
	false.


% 4. Построение таблиц истинности:

% 1) truth_table(A,B,and(A, or(A,B)))
%	true  true  true
%	true  fail  true
%	fail  true  fail
%	fail  fail  fail

% 2) truth_table(A,B,xor(A,and(A,B)))
%	true  true  fail
%	true  fail  true
%	fail  true  fail
%	fail  fail  fail

% 3) truth_table(A,B,equ(A,and(A,B)))
%	true  true  true
%	true  fail  fail
%	fail  true  true
%	fail  fail  true
