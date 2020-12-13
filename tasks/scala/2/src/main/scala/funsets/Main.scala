package funsets

object Main extends App {
  import FunSets._

  println("Singleton set with 5 inside:")
  val singleton: Set = singletonSet(5)
  printSet(singleton)
  println("Does this singleton contain 7?")
  println(contains(singleton, 7))
  println("And 5?")
  println(contains(singleton, 5))

  val set1: Set =
    v => 0 to 4 contains v
  println("Set 1:")
  printSet(set1)

  val set2: Set =
    v => 2 to 10 contains v
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

  println("Elements of set 1 bigger than 2:")
  printSet(filter(set1, v => v > 2))
  println("Elements of set 2 multiple of 3:")
  printSet(filter(set2, v => v % 3 == 0))
}
