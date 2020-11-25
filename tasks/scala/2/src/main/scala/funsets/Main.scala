package funsets

object Main extends App {
  import FunSets._
  val s = Set(1,3,6,8)
  val t = Set(4,5,7,3,9)
  
  println("Does " + s + " contain 3? " + contains(s,3))
  println("Does " + t + " contain 6? " + contains(t,6))
  print("Singleton: ")
  printSet(singletonSet(2))
  print("Union of " + s + " and " + t + " is ")
  printSet(union(s,t))
  print("Intersection of " + s + " and " + t + " is ")
  printSet(intersect(s,t))
  print("Difference of " + s + " and " + t + " is ")
  printSet(diff(s,t))
  print("Difference of " + t + " and " + s + " is ")
  printSet(diff(t,s))
  print("Elements of " + s + " that are >= 3: ")
  printSet(filter(s, p => p>=3))
  println("Are all elements of " + s + " >= 3? " + forall(s, p => p>=3))
  println("Are all elements of " + t + " < 10? " + forall(t, p => p<10))
  println("Are there elements of " + s + " that are > 8? " + exists(s, p => p>8))
  println("Are there elements of " + t + " that are <= 6? " + exists(t, p => p<=6))
  print("Result of applying (multiplying by) 5 to each element of " + t + " is ")
  printSet(map(t,p=>5*p))
}

/**
* [info] Does Set(1, 3, 6, 8) contain 3? true
* [info] Does Set(5, 9, 7, 3, 4) contain 6? false
* [info] Singleton: {2}
* [info] Union of Set(1, 3, 6, 8) and Set(5, 9, 7, 3, 4) is {1,3,4,5,6,7,8,9}
* [info] Intersection of Set(1, 3, 6, 8) and Set(5, 9, 7, 3, 4) is {3}
* [info] Difference of Set(1, 3, 6, 8) and Set(5, 9, 7, 3, 4) is {1,6,8}
* [info] Difference of Set(5, 9, 7, 3, 4) and Set(1, 3, 6, 8) is {4,5,7,9}
* [info] Elements of Set(1, 3, 6, 8) that are >= 3: {3,6,8}
* [info] Are all elements of Set(1, 3, 6, 8) >= 3? false
* [info] Are all elements of Set(5, 9, 7, 3, 4) < 10? true
* [info] Are there elements of Set(1, 3, 6, 8) that are > 8? false
* [info] Are there elements of Set(5, 9, 7, 3, 4) that are <= 6? true
* [info] Result of applying (multiplying by) 5 to each element of Set(5, 9, 7, 3, 4) is {15,20,25,35,45}
*/