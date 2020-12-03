package funsets

object Main extends App {
  import FunSets._
  println(contains(singletonSet(1), 1))

  val set1 = Set(0, 2, 4)
  println(set1 + " contains 0: " + contains(set1, 0))
  println(set1 + " contains 1: " + contains(set1, 1))

  print("SingletonSet :")
  printSet(singletonSet(6))

  val set2 = Set(1, 3, 4)
  println("Union of " + set1 + " and " + set2 + " : ")
  printSet(union(set1, set2))
  println("Intersection of " + set1 + " and " + set2 + " : ")
  printSet(intersect(set1, set2))
  println("Difference of " + set1 + " and " + set2 + " : ")
  printSet(diff(set1, set2))
  println("All numbers of " + set1 + " are even: " + forall(set1, elem => elem % 2 == 0))
  println("In " + set1 + " exists numbers greater than 10 " + exists(set1, elem => elem > 10))
  println("Increase each element of " + set2 + " by 5")
  printSet(map(set2, elem => elem + 5))
}

/*
true
Set(0, 2, 4) contains 0: true
Set(0, 2, 4) contains 1: false
SingletonSet :{6}
Union of Set(0, 2, 4) and Set(1, 3, 4) :
{0,1,2,3,4}
Intersection of Set(0, 2, 4) and Set(1, 3, 4) :
{4}
Difference of Set(0, 2, 4) and Set(1, 3, 4) :
{0,2}
All numbers of Set(0, 2, 4) are even: true
In Set(0, 2, 4) exists numbers greater than 10 false
Increase each element of Set(1, 3, 4) by 5
{6,8,9}
*/