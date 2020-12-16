package funsets

object Main extends App {
  import FunSets._
  def f(x : Int) : Int = x + 1
  val set_one = Set(1)
  val set_two = Set(3)
  val mp = union(set_one, set_two)
  val res = map(mp, f)
  printSet(res)
}
