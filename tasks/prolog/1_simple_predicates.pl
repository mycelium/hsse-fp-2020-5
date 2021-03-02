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


% 1. Определение предиката brother(X,Y):
brother(X,Y):-
	father(L,X),
	father(L,Y),
	X\=Y.

% 1.1. Сгенерированные ответы при использовании запроса:
% 1) X = b,
% 	 Y = c
% 2) X = c,
%    Y = b
% 3) X = d,
%    Y = e
% 4) X = e,
%    Y = d
% 5) false


% 2. Определение предиката cousin(X,Y):
cousin(X,Y):-
	father(L,X),
	father(R,Y),
	brother(L,R).

% 2.1. Сгенерированные ответы при использовании запроса:
% 1) X = d,
% 	 Y = f
% 2) X = e,
%    Y = f
% 3) X = f,
% 	 Y = d
% 4) X = f,
% 	 Y = e
% 5) false


% 3. Определение предиката grandson(X,Y):
grandson(X,Y):-
	father(A,X),
	father(Y,A).

% 3.1. Сгенерированные ответы при использовании запроса:
% 1) X = d,
% 	 Y = a
% 2) X = e,
%  	 Y = a
% 3) X = f,
% 	 Y = a


% 4. Определение предиката descendent(X,Y):
descendent(X,Y):- father(Y,X).
descendent(X,Y):-
	father(Y,A),
	descendent(X,A).

% 4.1. Сгенерированные ответы при использовании запроса:
%	1) X = b,
%	   Y = a
%	2) X = c,
%	   Y = a
%	3) X = d,
%	   Y = b
%	4) X = e,
%	   Y = b
%	5) X = f,
%	   Y = c
%	6) X = d,
%	   Y = a
%	7) X = e,
%	   Y = a
%	8) X = f,
%	   Y = a
%	9) false