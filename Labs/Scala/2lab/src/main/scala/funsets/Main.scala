package funsets

object Main extends App {
  import FunSets._
  def isEven(i: Int): Boolean = i % 2 == 0

  println(contains(singletonSet(1), 1))
  printSet(diff(Set(1,2,3), Set(3,4,5)))
  println(exists(Set(1,2,3,4,5,6,7,8,9,10), isEven))
  println(forall(Set(2,4,6,8,10), isEven))
  println(exists(Set(2,3,7), isEven))
  println(exists(Set(3,7), isEven))
}
