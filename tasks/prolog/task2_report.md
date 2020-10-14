# Output

?- truth_table(A, B, xor(A, B)).
A	B	Res
true	true	false*

true	false	true*

false	true	true*

false	false	false*

false.

?- truth_table(A, B, and(A, B)).
A	B	Res
true	true	true*

true	false	false*

false	true	false*

false	false	false*

false.

?- truth_table(A, B, or(A, B)).
A	B	Res
true	true	true*

true	false	true*

false	true	true*

false	false	false*

false.

?- truth_table(A, B, or(A, xor(A, and(A, B)))).
A	B	Res
true	true	true*

true	false	true*

false	true	true*

false	false	true*

false.

