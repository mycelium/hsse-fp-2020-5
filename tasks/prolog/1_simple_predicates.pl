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

% 1. brother(X,Y): X и Y - братья
brother(X,Y) :-
    father(F, X),
    father(F, Y),
    X \= Y.
    
% 2. cousin(X,Y): X и Y - двоюродные братья
cousin(X, Y) :-
    father(GDad, F1),
    father(GDad, F2),
    father(F1, X),
    father(F2, Y),
    F1 \= F2,
    X \= Y.
    
% 3. grandson(X, Y): X - внук Y
grandson(X, Y) :-
    father(Y, F),
    father(F, X),
    X \= Y.

% 4. descendent(X, Y): X - потомок Y
descendent(X, Y) :-
    father(Y, X).
    
descendent(X, Y) :-
    father(Y, Z),
    descendent(X, Z),
	X \= Y.

% указать в каком порядке и какие ответы генерируются вашими методами
% ?- brother(X,Y).
% X = b,
% Y = c
% X = c,
% Y = b
% X = d,
% Y = e
% X = e,
% Y = d

% ?- cousin(X,Y).
% X = d,
% Y = f
% X = e,
% Y = f
% X = f,
% Y = d
% X = f,
% Y = e

% ?- grandson(X,Y).
% X = d, внук
% Y = a  дедушка
% X = e, внук
% Y = a  дедушка
% X = f, внук
% Y = a  дедушка

% ?- descendent(X,Y).
% X = b, потомок
% Y = a  предок
% X = c, потомок
% Y = a  предок
% X = d, потомок
% Y = b  предок
% X = e, потомок
% Y = b  предок
% X = f, потомок
% Y = c  предок
% X = d, потомок
% Y = a  предок
% X = e, потомок
% Y = a  предок
% X = f, потомок
% Y = a  предок