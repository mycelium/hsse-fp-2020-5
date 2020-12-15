package funsets

object Main extends App {
  import FunSets._
  println(Set(4, 4, 4, 1, 4))
  val test_set = Set(2, 5)
  println(test_set)
  println(test_set + 2)
  println(test_set - 7)
  println(test_set == Set.empty)
  printSet(union(Set(2,3), Set(7)))
  printSet(intersect(Set(3,4), Set(7, 8)))
  printSet(diff(Set(2,5), Set(3, 7)))

  println(contains(singletonSet(1), 1))

}
