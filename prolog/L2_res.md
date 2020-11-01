    truthTable(A,B,and(A,B)).
true | true | true
true | false | false
false | true | false
false | false | false

    truthTable(A,B,xor(A,B)).
true | true | false
true | false | true
false | true | true
false | false | false

    truthTable(A,B,xor(A,or(A,B))).
true | true | false
true | false | false
false | true | true
false | false | false

    truthTable(A,B,xor(A,equ(A,B))).
true | true | false
true | false | true
false | true | false
false | false | true