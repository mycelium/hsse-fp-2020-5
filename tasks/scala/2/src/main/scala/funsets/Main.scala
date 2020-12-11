package funsets

object Main extends App {
  import FunSets._
  println(contains(singletonSet(1), 1))
    
  val first_set: Set = it => 0 to 10 contains it
  println("First set:")
  printSet(first_set)

  val second_set: Set = it => 5 to 20 contains it
  println("Second set:")
  printSet(second_set)

  println("Their union:")
  printSet(union(first_set, second_set))
  println("First set elements that are not in the second one:")
  printSet(diff(first_set, second_set))
  println("Second set elements that are not in the first one:")
  printSet(diff(second_set, first_set))
  println("Intersection of two sets:")
  printSet(intersect(first_set, second_set))

  println("Apply x2 to each element of the first set:")
  printSet(map(first_set, it => it * 2))
  println("Apply x3 to each element of the second set:")
  printSet(map(second_set, it => it * 3))

  println("First set elements that are less than 5:")
  printSet(filter(first_set, it => it < 5))
  println("Second set elements that are greater than 10:")
  printSet(filter(second_set, it => it > 10))
}
