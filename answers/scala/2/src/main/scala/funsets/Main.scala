package funsets

object Main extends App {

  import FunSets._

  println(contains(singletonSet(1), 1))
  printSet(union(singletonSet(1), Set(1, 5, 6, 7)))
  printSet(intersect(singletonSet(1), Set(1, 5, 6, 7)))
  printSet(diff(Set(1, 5, 6, 7), singletonSet(1)))
  printSet(filter(Set(1, 5, 6, 7), singletonSet(2)))
  println(forall(Set(1, 5, 6, 7), Set(1, 5, 6, 7)))
  println(exists(Set(1, 5, 7), Set(1, 5, 6, 7)))
  printSet(map(Set(1, -5, 6, -7), math.abs))
}