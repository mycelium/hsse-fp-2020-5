father(a, b).
father(a, c).
father(b, d).
father(b, e).
father(c, f).

brother(X, Y) :- (father(L, X) : father(L, Y))

