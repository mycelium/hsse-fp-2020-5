package funsets

object Main extends App {
  import FunSets._
  println(contains(singletonSet(1), 1))
  printSet(union(singletonSet(1), Set(1, 2, 3)))
  printSet(intersect(singletonSet(1), Set(1, 2, 3)))
  printSet(diff(Set(1, 2, 3), singletonSet(1)))
  printSet(filter(Set(1, 2, 3), singletonSet(2)))
  println(forall(Set(1, 2, 3), Set(1, 2, 3)))
  println(exists(Set(1, 2, 3), Set(1, 2, 3)))
  printSet(map(Set(1, 2, -3), math.abs))
}
