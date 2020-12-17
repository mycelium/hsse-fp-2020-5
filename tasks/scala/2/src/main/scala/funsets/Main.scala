package funsets

object Main extends App {
  import FunSets._
  val s = Set(1, 2, 4, 7)
  val t = Set(7, 9, 11, 1)
  
  println(contains(singletonSet(1), 1))
  println(printSet(union(s,t)))
  println(printSet(intersect(s,t)))
  println(printSet(diff(s,t)))
}
