package funsets

object Main extends App {
  import FunSets._
  println(contains(singletonSet(1), 1))

  val set1: Set =
    v => 1 to 5 contains v
  println("Set 1:")
  printSet(set1)

  val set2: Set =
    v => 3 to 7 contains v
  println("Set 2:")
  printSet(set2)

  println("Union:")
  printSet(union(set1, set2))
  println("Intersection:")
  printSet(intersect(set1, set2))
  println("Difference set1\\set2:")
  printSet(diff(set1, set2))
  println("Difference set2\\set1:")
  printSet(diff(set2, set1))

  println("Squared set 1:")
  printSet(map(set1, v => v * v))
  println("Doubled set 2:")
  printSet(map(set2, v => v * 2))
}
