% very irrational approach. as we pass here elder person first, then younger. 
% in all other parameters we do otherwise
father(a,b).                  
father(a,c).  
father(b,d).  
father(b,e). 
father(c,f).  

% 1. brother(X,Y)  -  определяющий являются ли аргументы братьями
brother(X,Y) :- father(Z,X), father(Z,Y), not(X = Y).
% brother(c,b) - true
% brother(e,f) - false
% 
% 2. cousin(X,Y)  -  определяющий являются ли аргументы двоюродными братьями
cousin(X,Y) :- father(Z1,X), father(Z2,Y), brother(Z1,Z2)
% removed not(X = Y) as output is the same and it is handled in the brother clause
% cousin(c,b) - false 
% cousin(e,f) - true

% 3. grandson(X,Y)   -  определяющий является ли аргумент Х внуком аргумента Y
grandson(X,Y) :- father(Z,X), father(Y,Z).
% grandson(a,f) - false
% grandson(f,a) - true

% 4. descendent(X,Y) -  определяющий является ли аргумент X потомком аргумента Y
% was descendent(X,X). But changed. I guess we shouldnt call a person his own ancestor (*)
descendent(X,Y) :- father(Y,X). 
descendent(X,Y) :- father(Y,Z), descendent(X,Z).
% descendent(b,a) - true
% descendent(e,a) - true
% descendent(f,b) - false
% descendent(e,c) - false

% указать в каком порядке и какие ответы генерируются вашими методами
% want to notice that calling brother(X,Y) to see what options are considered true and what false is a whole new level of printf debug:)
%	?- brother(X,Y).
% X = b,
% Y = c
% X = c,
% Y = b
% X = d,
% Y = e
% X = e,
% Y = d
%	?- cousin(X,Y).
% X = d,
% Y = f
% X = e,
% Y = f
% X = f,
% Y = d
% X = f,
% Y = e
%	?- grandson(X,Y).
% X = d,
% Y = a
% X = e,
% Y = a
% X = f,
% Y = a
%	?- descendent(X,Y).
% X = Y
% X = b,
% Y = a
% X = d,
% Y = a
% X = e,
% Y = a
% X = c,
% Y = a
% X = f,
% Y = a
% X = d,
% Y = b
% X = e,
% Y = b
% X = f,
% Y = c

% interestingly output changes its order(but only order except for X=Y) based on the (*)

% X = b,
% Y = a
% X = c,
% Y = a
% X = d,
% Y = b
% X = e,
% Y = b
% X = f,
% Y = c
% X = d,
% Y = a
% X = e,
% Y = a
% X = f,
% Y = a