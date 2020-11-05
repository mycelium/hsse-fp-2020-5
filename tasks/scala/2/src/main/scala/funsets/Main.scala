package funsets

object Main extends App {
  import FunSets._
  println("===================================")
  println(singletonSet(2))
  println("contains")
  println(contains(singletonSet(12), 1))
  println("diff")
  printSet(diff(Set(1, 2), Set(2,3)))
  println("intersect")
  printSet(intersect(Set(4,5), Set(8, 4)))
  println("filter")
  printSet(filter(Set(1, 2), elem => elem > 1))
  println("forall")
  println(forall(Set(1, 2), elem => elem > 0))
  println("exits")
  println(exists(Set(1, 2, 0), elem => elem <= 0))
  println("map")
  printSet(map(Set(1,2), elem => elem + 1))
  println("===================================")


}
