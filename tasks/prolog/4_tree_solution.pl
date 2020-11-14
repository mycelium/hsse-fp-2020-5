:- ['3_quicksort_solution.pl'].

balanced_tree(L,T):-
    qsort(L,Sorted),
    branch_division(Sorted,T).

branch_division([],empty).
branch_division(L,instant(Root,Left_subtree,Right_subtree)):-
    split(L,Left,[Root|Right]),
    branch_division(Left,Left_subtree),
    branch_division(Right,Right_subtree).

split(L,Left,Right):-
    length(L,Length),
    Split_vertex is Length // 2,
    length(Left,Split_vertex),
    append(Left,Right,L).

/*?- balanced_tree([0,1,2,3,4,5],T).
T = instant(3, instant(1, instant(0, empty, empty), instant(2, empty,empty)), instant(5, instant(4, empty, empty), empty))
tree scheme will be like:   3
                          1   5
                         0 2   4

?- balanced_tree([11,-11,-12,0,9,2,100,51,4],T).
T = instant(4, instant(0, instant(-11, instant(-12, empty, empty),empty), instant(2, empty, empty)),
instant(51, instant(11, instant(9,empty, empty), empty), instant(100, empty, empty)))
tree scheme will be like:            4
                                 0       51
                              -11 2    11  100
                           -12        9
*/
