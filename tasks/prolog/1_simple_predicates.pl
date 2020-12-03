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
	
	brother(X,Y)    :- father(Z,X), father(Z,Y).  
	cousin(X,Y)     :- father(D, F1), father(D, F2), father(F1, X), father(F2, Y). 
	grandson(X,Y)   :- father(Y,Z), father(Z,X).  
	descendent(X,Y) :- father(Y, X) ; father(Y, Z), father(Z, X).
	
	
% указать в каком порядке и какие ответы генерируются вашими методами
%	?- brother(X,Y).
%	?- cousin(X,Y).
%	?- grandson(X,Y).
%	?- descendent(X,Y).
	
% Вывод терминала:
	
%	?- brother(X,Y).
%	X = Y, Y = b ;
%	X = b,
%	Y = c ;
%	X = c,
%	Y = b ;
%	X = Y, Y = c ;
%	X = Y, Y = d ;
%	X = d,
%	Y = e ;
%	X = e,
%	Y = d ;
%	X = Y, Y = e ;
%	X = Y, Y = f.

%	?- cousin(X,Y).
%	X = Y, Y = d ;
%	X = d,
%	Y = e ;
%	X = e,
%	Y = d ;
%	X = Y, Y = e ;
%	X = d,
%	Y = f ;
%	X = e,
%	Y = f ;
%	X = f,
%	Y = d ;
%	X = f,
%	Y = e ;
%	X = Y, Y = f ;
%	false.

%	?- grandson(X,Y).
%	X = d,
%	Y = a ;
%	X = e,
%	Y = a ;
%	X = f,
%	Y = a ;
%	false.

%	?- descendent(X,Y).
%	X = b,
%	Y = a ;
%	X = c,
%	Y = a ;
%	X = d,
%	Y = b ;
%	X = e,
%	Y = b ;
%	X = f,
%	Y = c ;
%	X = d,
%	Y = a ;
%	X = e,
%	Y = a ;
%	X = f,
%	Y = a ;
%	false.
