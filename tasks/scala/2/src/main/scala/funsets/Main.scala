package funsets

object Main extends App {

  import FunSets._

  println(Set(1, 1, 1, 2, 1))
  val a = Set(1, 6)
  println(a)
  println(a + 5)
  println(a - 6)
  println(a == Set.empty)
  printSet(union(Set(4,5), Set(8)))
  printSet(intersect(Set(4,5), Set(8, 4)))
  printSet(diff(Set(4,5), Set(8, 4)))

  println(contains(singletonSet(1), 1))
}
