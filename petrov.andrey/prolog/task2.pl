and(A,B) :- A, B.
or(A, B) :- A; B.
xor(A, B) :- A \= B.
not(A) :- \A.
equ(A,B) :- A = B.

bool(true).
bool(false).

truth_table(A,B, Z) :- write('A'), write('\t'), write('B'), write('\t'), write('Res'), nl, bool(A), bool(B), 
			write(A), write('\t'), write(B), write('\t'), count(Z, C), write(C), write('*\n'), nl, false.


count(A, true) :- A, !.

count(_, false).
