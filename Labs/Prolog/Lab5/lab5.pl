conc([],[],_).
conc([X],[],[X]).
conc([],[X],[X]).
conc([X|A],[Y|B],[Y|C]):-X>Y,!,conc([X|A],B,C).
conc([X|A],[Y|B],[Y|C]):-X>=Y,!,conc(A,[X|B],C).
conc([X|A],B,[X|C]):-conc(A,B,C),!.

/*
 * Output
?- conc([3,6,7],[1,2,9],T).
T = [1, 2, 3, 6, 7, 9].
*/
