% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое ) 

split(X,[],[],[]).
split(X,[Y|Remember],[Y|Little],Larger):- X>Y, split(X,Remember,Little,Larger).
split(X,[Y|Remember],Little,[Y|Larger]):- split(X,Remember,Little,Larger).

qsort([],[]).qsort([L|Remember],K) :-
split(L,Remember,Little,Larger), qsort(Little,KSmaller), qsort(Larger,KBigger), append(KLittle,[L|KLarger],K).

balanced_tree(L, T) :- qsort(L, Sorted_tree), proportional(Sorted_tree, T).
	
proportional([], empty).

proportional(L, instant(R, L_subsribe, RSub)) :- splittree(L, Left_t, [R|Right_t]), proportional(Left_t, L_subsribe), proportional(Right_t, RSub).

splittree(L, Left_t, Right_t) :- length(L, Length_t), Mid is div(Length_t, 2), length(Left_t, Mid), append(Left_t, Right_t, L).
