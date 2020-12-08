package funsets

object Main extends App {
  import FunSets._
  println(contains(singletonSet(1), 1)) /*true*/
  println(contains(Set(42, 100, 0), 42)) /*true*/
  println(contains(Set(42, 100, 0), 43)) /*false*/
  printSet(union(Set(42, 100, 0), Set(101, 8, 30, 3))) /*{0,3,8,30,42,100,101}*/
  printSet(intersect(Set(42, 100, 0), Set(101, 8, 0, 3))) /*{0}*/
  printSet(diff(Set(42, 100, 0), Set(101, 8, 0))) /*{42,100}*/
  println(forall(Set(420, 100, 10), element => element % 10 == 0)) /*true*/
  println(exists(Set(42, 100, 0), element => element < 41)) /*true*/
  printSet(map(Set(42, 100, 2), element => element - 2)) /*{0,40,98}*/
}
