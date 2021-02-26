% есть набор фактов вида father(person1, person2) (person1 is the father of person2)
% Необходимо определить набор предикатов:
% 1. brother(X,Y)    -  определяющий являются ли аргументы братьями
% 2. cousin(X,Y)     -  определяющий являются ли аргументы двоюродными братьями
% 3. grandson(X,Y)   -  определяющий является ли аргумент Х внуком аргумента Y
% 4. descendent(X,Y) -  определяющий является ли аргумент X потомком аргумента Y
% 5. используя в качестве исходных данных следующий граф отношений
% указать в каком порядке и какие ответы генерируются вашими методами
	?- brother(X,Y).
	?- cousin(X,Y).
	?- grandson(X,Y).
	?- descendent(X,Y).

	father(a,b).  % 1                 
	father(a,c).  % 2
	father(b,d).  % 3
	father(b,e).  % 4
	father(c,f).  % 5

brother(X, Y) :- dif(X, Y), father(Z, X), father(Z, Y).

cousin(X, Y) :- father(Z, X), father(A, Y), brother(Z, A).

grandson(X, Y) :- father(Y, Z), father(Z, X).

descendent(X, Y) :- father(Y, X).

descendent(X, Y) :- father(Y, Z), descendent(X, Z).


/*
1
?- brother(X,Y).	
X = b,
Y = c ;
X = c,
Y = b ;
X = d,
Y = e ;
X = e,
Y = d ;

2
?- cousin(X,Y).
X = d,
Y = f ;
X = e,
Y = f ;
X = f,
Y = d ;
X = f,
Y = e ;

3
?- grandson(X,Y).
X = d,
Y = a ;
X = e,
Y = a ;
X = f,
Y = a ;

4
?- descendent(X,Y).
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
*/
