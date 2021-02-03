package funsets

object Main extends App {
  println(contains(singletonSet(1), 1)) // true
  println(contains(union(singletonSet(2), singletonSet(4)), 2)) // true
  println(contains(union(singletonSet(2), singletonSet(4)), 3)) // false


  println(contains(map(union(singletonSet(2), singletonSet(4)), v => v + 1), 5)) // true
  println(contains(map(union(singletonSet(2), singletonSet(4)), v => v + 1), 3)) // true

  printSet(intersect(union(singletonSet(2), singletonSet(4)),
    union(singletonSet(5), singletonSet(4)))) // {4}

  printSet(union(union(singletonSet(2), singletonSet(4)),
    union(singletonSet(5), singletonSet(4)))) // {2, 4, 5}


  println(forall(union(singletonSet(2), singletonSet(4)), v => v % 2 == 0)) // true
  println(forall(union(singletonSet(2), singletonSet(4)), v => v % 3 == 0)) // false

  println(exists(union(singletonSet(2), singletonSet(4)), v => v == 4)) // true
  println(exists(union(singletonSet(2), singletonSet(4)), v => v == 5)) // false

  printSet(union(singletonSet(2), singletonSet(4)))
}
