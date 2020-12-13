package funsets

object Main extends App {
  import FunSets._
  println(contains(singletonSet(1), 1))

  val set = singletonSet(1)
  val set2 = singletonSet(2)
  val set3 = union(set, set2)
  print("union: ")
  printSet(set3)
  val set4 = singletonSet(3)
  val set5 = union(set3, set4)
  print("union: ")
  printSet(set5)

  val set6 = intersect(set, set5)
  print("intersect: ")
  printSet(set6)

  val set7 = diff(set5, set)
  print("diff: ")
  printSet(set7)

  val f = (a: Int) =>
    if (a <= 2) true
    else false

  val set8 = filter(set5, f)
  print("filter: ")
  printSet(set8)

  val f3 = (a: Int) => a+1
  val set9 = map(set5, f3)
  print("map: ")
  printSet(set9)

  val f2 = (a: Int) =>
    if (a == 1) false
    else true

  val set10 = exists(set5, f2)
  println("exists: " + set10)

  val set11 = exists(set9, f2)
  print("exists: " + set11)
}
