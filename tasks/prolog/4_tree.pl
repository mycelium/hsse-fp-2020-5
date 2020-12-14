% используя предикат qsort(L,K) из предыдущего задания разработать предикат:

qsort([],[]).
qsort([P|L],K) :- divide(L,P,R1,R2), qsort(R1, T1), qsort(R2, T2), append(T1,[P|T2],K).

divide([],_,[],[]).
divide([E|A],D,R1,R2) :- (E<D -> (R1,R2)=([E|T1],T2); (R1,R2)=(T1,[E|T2])), divide(A,D,T1,T2).

% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)


balanced_tree(L,T) :- qsort(L,R), tree(R, T).

tree([], empty).
tree(A, instant(R,T1,T2)) :- split(A,F1,R,F2), tree(F1,T1), tree(F2,T2). 

split(A,L,M,R) :- append(L,[M|R],A), length(L,LL), length(R,LR), D is LL - LR, abs(D, DD), DD =< 1.


% ?- balanced_tree([-3, 41, -69, 98, 7, 65, -39, 15, -10], X).
% X = instant(7, instant(-39, instant(-69, empty, empty), instant(-10, empty, instant(-3, empty, empty))), instant(41, instant(15, empty, empty), instant(65, empty, instant(98, empty, empty)))) 
% sorted = [-69, -39, -10, -3, 7, 15, 41, 65, 98]
% X = instant(7, 
%		instant(-39, 
%			instant(-69, 
%				empty, 
%				empty), 
%			instant(-10, 
%				empty, 
%				instant(-3, 
%					empty, 
%					empty))), 
%		instant(41, 
%			instant(15, 
%				empty, 
%				empty), 
%			instant(65, 
%				empty, 
%				instant(98, 
%					empty, 
%					empty)))) 
