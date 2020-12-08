% есть набор фактов вида father(person1, person2) (person1 is the father of person2)
% Необходимо определить набор предикатов:
% 1. brother(X,Y)    -  определяющий являются ли аргументы братьями
% 2. cousin(X,Y)     -  определяющий являются ли аргументы двоюродными братьями
% 3. grandson(X,Y)   -  определяющий является ли аргумент Х внуком аргумента Y
% 4. descendent(X,Y) -  определяющий является ли аргумент X потомком аргумента Y
% 5. используя в качестве исходных данных следующий граф отношений
	father(a,b).  % 1                 
	father(a,c).  % 2
	father(b,d).  % 3
	father(b,e).  % 4
	father(c,f).  % 5
% указать в каком порядке и какие ответы генерируются вашими методами
	?- brother(X,Y).
	?- cousin(X,Y).
	?- grandson(X,Y).
	?- descendent(X,Y).

brother(X,Y):- father(A,Y), father(A,X), X\=Y.

cousin(X,Y):- father(B,X), father(C,Y), brother(B,C), X\=Y,B\=C.

grandson(X,Y):- father(Y,A), father(A,X).

descendent(X,Y):- father(Y,X);grandson(X,Y).


/*
?- brother(X,Y).	
X = c,
Y = b

X = b,
Y = c

X = e,
Y = d

X = d,
Y = e

?- cousin(X,Y).
X = d,
Y = f

X = e,
Y = f

X = f,
Y = d

X = f,
Y = e

?- grandson(X,Y).
X = d,
Y = a

X = e,
Y = a

X = f,
Y = a

?- descendent(X,Y).
X = b,
Y = a

X = c,
Y = a

X = d,
Y = b

X = e,
Y = b

X = f,
Y = c

X = d,
Y = a

X = e,
Y = a

X = f,
Y = a
*/