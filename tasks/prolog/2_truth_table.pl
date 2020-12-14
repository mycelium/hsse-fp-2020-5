% определить предикаты:
	and(A,B) :- A,B.
	or(A, B) :- A;B.
	xor(A, B) :- A\=B.
	not(A) :- \A.
	equ(A,B) := A=B.
	
% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail

bool(true).
bool(false).

run(C, true) :- C, !.
run(_, false).

truth_table(A, B, C) :- bool(A), bool(B), 
	write(A), write(', '), 
	write(B), write(', '), 
	run(C, T), 
	write(T), write(';\n'), 
	false.
	
% truth_table(A,B,and(A,or(A,B))).
% true, true, true;
% true, false, true;
% false, true, false;
% false, false, false;
