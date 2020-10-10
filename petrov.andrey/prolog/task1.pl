
father(a, b).
father(a, c).
father(b, d).
father(b, e).
father(c, f).

brother(X, Y) :- father(F,Y), father(F,X), X \= Y.
cousin(X, Y) :- father(F1, X), father(F2, Y), brother(F1, F2), X \= Y, F1 \= F2.
grandson(X, Y) :- father(F, X), father(Y, F).
descendent(X,Y) :- father(Y, X).
descendent(X,Y) :- father(Z, X), descendent(Z, Y).


