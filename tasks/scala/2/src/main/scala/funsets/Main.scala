package funsets

object Main extends App {
  import FunSets._
  val s = Set(2, 4, 6, 8, 10)
  val t = Set(1, 3, 5, 7, 9)

  println("Does " + s + " contain 1? " + contains(s,1))
  println("Does " + t + " contain 9? " + contains(t,9))
  print("Singleton: ")
  printSet(singletonSet(4))
  print("Union of " + s + " and " + t + ": ")
  printSet(union(s,t))
  print("Intersection of " + s + " and " + t + ": ")
  printSet(intersect(s,t))
  print("Difference of " + s + " and " + t + ": ")
  printSet(diff(s,t))
  print("Difference of " + t + " and " + s + ": ")
  printSet(diff(t,s))
  print("Elements of " + s + " that are >= 3: ")
  printSet(filter(s, p => p>=3))
  println("Are all elements of " + s + " >= 3? " + forall(s, p => p>=3))
  println("Are all elements of " + t + " < 10? " + forall(t, p => p<10))
  println("Are there elements of " + s + " that are more then 9? " + exists(s, p => p>9))
  println("Are there elements of " + t + " that are less or equal then 6? " + exists(t, p => p<=6))
  print("After multiplying each element of " + t + " by 2: ")
  printSet(map(t,p=>2*p))
}
