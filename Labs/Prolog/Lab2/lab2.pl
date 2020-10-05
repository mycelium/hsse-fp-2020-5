and(A,B):-A,B.
or(A,_):-A.
or(_,B):-B.
not(A):- \+A.
equ(A,B):-or(and(A,B),and(not(A),not(B))).
xor(A,B):-not(equ(A,B)).

bool(true).
bool(fail).

est(Expression, true):-Expression,!.
est(_,false).

truth_table(A,B,Expression):-write('A'),write('\t'),write('B'),write('\t'),write('Result'),nl,
    bool(A),bool(B),write(A),write('\t'),write(B),write('\t'),est(Expression,Output),write(Output),nl,fail.

/*
 *  Output:
 *
?- truth_table(A,B,and(or(A,B),or(not(A),not(B)))).
A       B       Result
true    true    false
true    fail    true
fail    true    true
fail    fail    false
false.

?- truth_table(A,B,equ(A,B)).
A       B       Result
true    true    true
true    fail    false
fail    true    false
fail    fail    true
false.

?- truth_table(A,B,or(A,and(A,B))).
A       B       Result
true    true    true
true    fail    true
fail    true    false
fail    fail    false
false.

*/

