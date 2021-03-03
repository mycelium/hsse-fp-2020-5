package funsets

object Main extends App {
  import FunSets._
  println(contains(singletonSet(1), 1))

  println()
  println("[Contains tests]")
  val set1 = Set(2, 3, 16, 18, 19, 9, 11, 13)
  print(" should contain 3 (will be true) : " + contains(set1, 3))
  print(set1 + " should NOT contain 12 (will be false) : " + contains(set1, 12))
  println()

  println("[Union test]")
  val set2 = Set(2, 6, 12, 53, 8, 9, 3, 13, 11, 67)
  print("Union of " + set1 + " and " + set2 + " is ")
  printSet(union(set1, set2))

  println()
  println("[Intersection test]")
  print("Intersection of " + set1 + " and " + set2 + " is ")
  printSet(intersect(set1, set2))

  println()
  println("[Difference]")
  val dif = diff(set1, set2)
  print("Differenece between " + set1 + "due to " + set2 + " is : ")
  printSet(dif)
  println(set2 + " should contain  9 from set1  (true): " + !contains(dif, 9))
  println(set2 + " should contain 16 from set1 (false): " + !contains(dif, 16))

  println()
  println("[Filter tests]")
  val filterFunc1 = (x: Int) => if (x < 10) false else true
  val filterFunc2 = (x: Int) => if (x > 10) false else true
  print("Find elements of " + set1 + " which > 10 : ")
  printSet(filter(set1, filterFunc1))
  print("Find elements of " + set2 + " which < 10 : ")
  printSet(filter(set2, filterFunc2))

  println()
  println("[Forall tests]")
  val forallFunc1 = (x: Int) => if (x > 1) true else false
  val forallFunc2 = (x: Int) => if (x < 20) true else false
  println("Check if all elements of " + set1 + " bigger than 1 : " + forall(set1, forallFunc1))
  println("Check if all elements of " + set2 + " less than 20 : " + forall(set2, forallFunc2))

  println()
  println("[Existence tests]")
  val existsFunc1 = (x: Int) => if (x == 18) true else false
  val existsFunc2 = (x: Int) => if (x == 67) true else false
  println(set1 + " contains 18  (true) : " + exists(set1, existsFunc1))
  println(set2 + " contains 18 (false) : " + exists(set2, existsFunc1))
  println(set1 + " contains 67 (false) : " + exists(set1, existsFunc2))
  println(set2 + " contains 67  (true) : " + exists(set2, existsFunc2))

  println()
  println("[Map transformation test]")
  print("Set1 aligned in memory: ")
  printSet(set1)
  val mapFunc = (x:Int) => x * 2
  print("All elements of set1 now must be multiplied by 2 : ")
  printSet(map(set1, mapFunc))

}
