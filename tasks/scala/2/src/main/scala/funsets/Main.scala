
package funsets

object Main extends App {

  import FunSets._

  println(contains(singletonSet(1), 1))

  val test: Set = it => 0 to 10 contains it
  printSet(test)
  printSet(map(test, it => it * it))

  printSet(filter(test, it => it > 5))

  val test2: Set = it => 5 to 15 contains it
  printSet(test2)

  printSet(intersect(test, test2))
  printSet(diff(test, test2))
  printSet(union(test, test2))

}