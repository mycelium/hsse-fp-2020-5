% есть набор фактов вида father(person1, person2) (person1 is the father of person2)
% Необходимо определить набор предикатов:
% 1. brother(X,Y)    -  определяющий являются ли аргументы братьями
% 2. cousin(X,Y)     -  определяющий являются ли аргументы двоюродными братьями
% 3. grandson(X,Y)   -  определяющий является ли аргумент Х внуком аргумента Y
% 4. descendent(X,Y) -  определяющий является ли аргумент X потомком аргумента Y
% 5. используя в качестве исходных данных следующий граф отношений
father(a,b).
father(a,c).
father(b,d).
father(b,e).
father(c,f).

brother(X,Y):-
    father(Z,X),
    father(Z,Y),
    X\=Y.

cousin(X,Y):-
    father(Grandpa,Father1),
    father(Father1,X),
    father(Grandpa,Father2),
    father(Father2,Y),
    X\=Y,
    Father1\=Father2.

grandson(X,Y):-
    father(X,Z),
    father(Z,Y).

descendent(X,Y):-
    father(Y,X)|grandson(X,Y).
	
% указать в каком порядке и какие ответы генерируются вашими методами
%	?- brother(X,Y).
%X = b,
%Y = c ;
%X = c,
%Y = b ;
%X = d,
%Y = e ;
%X = e,
%Y = d ;
%false.

%	?- cousin(X,Y).
%X = d,
%Y = f ;
%X = e,
%Y = f ;
%X = f,
%Y = d ;
%X = f,
%Y = e ;
%false.

%	?- grandson(X,Y).
%X = a,
%Y = d ;
%X = a,
%Y = e ;
%X = a,
%Y = f ;
%false.

%	?- descendent(X,Y).
%X = b,
%Y = a ;
%X = c,
%Y = a ;
%X = d,
%Y = b ;
%X = e,
%Y = b ;
%X = f,
%Y = c ;
%X = a,
%Y = d ;
%X = a,
%Y = e ;
%X = a,
%Y = f ;
%false.