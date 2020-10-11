###### ?- brother(X,Y)
X = c,
Y = b ;
X = b,
Y = c ;
X = e,
Y = d ;
X = d,
Y = e ;
###### ?- cousin(X,Y).
X = d,
Y = f ;
X = e,
Y = f ;
X = f,
Y = d ;
X = f,
Y = e ;
false.
###### ?- grandson(X,Y).
X = d,
Y = a ;
X = e,
Y = a ;
X = f,
Y = a ;
false.
###### ?- descendent(X,Y).
X = b,
Y = a ;
X = c,
Y = a ;
X = d,
Y = b ;
X = e,
Y = b ;
X = f,
Y = c ;
X = d,
Y = a ;
X = e,
Y = a ;
X = f,
Y = a ;
false.