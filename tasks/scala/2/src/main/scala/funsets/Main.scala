package funsets

object Main extends App {
  import FunSets._
  println(contains(singletonSet(1), 1))
  printSet(map(singletonSet(92), (x:Int) => x + 3))
  print(forall(singletonSet(92), (x:Int) => x == 92))
}
