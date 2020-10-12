% есть набор фактов вида Father(person1, person2) (person1 is the father of person2)
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
% 1. brother(X,Y)
	brother(B1,B2) :- father(F,B1), father(F,B2), B1\=B2.
% 2. cousin(X,Y)
	cousin(C1,C2) :- father(F1,C1), father(F2,C2), brother(F1,F2), C1\=C2.
% 3. grandson(X,Y)
	grandson(Gs,Gf) :- father(F,Gs), father(Gf,F), Gs\=Gf.
% 4. descendent(X,Y)
	descendent(D,A) :- father(A,D), D\=A.
        descendent(Dx,A) :- father(A,Dy), descendent(Dx,Dy), Dx\=A.

:- writeln('Получение результатов...').

:- writeln('Результаты братьев:').
:- forall(brother(X,Y), (write(X), write(' and '), write(Y), writeln(' are brothers'))).

:- writeln('Результаты двоюродных братьев:').
:- forall(cousin(X,Y), (write(X), write(' and '), write(Y), writeln(' are cousins'))).

:- writeln('Результаты внуков:').
:- forall(grandson(X,Y), (write(X), write(' is grandson of '), writeln(Y))).

:- writeln('Результаты потомков:').
:- forall(descendent(X,Y), (write(X), write(' is descendent of '), writeln(Y))).

:- writeln('Выполнение окончено.').

/*Получение результатов...
Результаты братьев:
b и c братья
c и b братья
d и e братья
e и d братья
Результаты двоюродных братьев:
d и f двоюродные братья
e и f двоюродные братья
f и d двоюродные братья
f и e двоюродные братья
Результаты внуков:
d является внуком a
e является внуком a
f является внуком a
Results of descendents:
b является потомком a
c является потомком a
d является потомком b
e является потомком b
f является потомком c
d является потомком a
e является потомком a
f является потомком a
Выполнение окончено.*/
