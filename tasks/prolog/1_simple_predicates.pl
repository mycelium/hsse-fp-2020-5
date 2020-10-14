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
