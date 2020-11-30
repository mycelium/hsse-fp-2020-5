package funsets

object Main extends App {
  import FunSets._

  println(contains(singletonSet(1), 1))

  val set1: Set = it => 0 to 8 contains it
  printSet(set1)

  val set2: Set = it => 6 to 16 contains it
  printSet(set2)

  printSet(union(set1, set2))
  printSet(diff(set1, set2))
  printSet(diff(set2, set1))
  printSet(intersect(set1, set2))

  printSet(map(set1, it => it * 2))
  printSet(map(set2, it => it * 2))

  printSet(filter(set1, it => it < 3))
  printSet(filter(set2, it => it < 3))
}
