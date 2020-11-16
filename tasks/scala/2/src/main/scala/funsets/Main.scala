package funsets

object Main extends App {

  import FunSets._

  print("Set {1} contain 1: ")
  println(contains(singletonSet(1), 1))

  print("Union of {1} and {2} is: ")
  val setUnion: Set = union(singletonSet(1), singletonSet(2))
  printSet(setUnion)

  print("Intersect of {1,2} and {2} is: ")
  val setIntersect: Set = intersect(setUnion, singletonSet(2))
  printSet(setIntersect)

  print("Diff of {1,2} and {2} is: ")
  val setDiff: Set = diff(setUnion, setIntersect)
  printSet(setDiff)

  print("Filter of {1,2} and {1} is: ")
  val setFilter: Set = filter(setUnion, setDiff)
  printSet(setFilter)

  print("All bounded of {1,2,3,-1001,1000} satisfy {1,2} is: ")
  println(
    forall(union(union(union(
      setUnion,
      singletonSet(3)),
      singletonSet(-1001)),
      singletonSet(2000)), setUnion))

  print("All bounded of {1,2,-1001,1000} satisfy {1,2} is: ")
  println(
    forall(union(union(
      setUnion,
      singletonSet(-1001)),
      singletonSet(2000)), setUnion))

  print("Exist bounded of {1,2,3,-1001,1000} satisfy {1,2} is: ")
  println(
    exists(union(union(union(
      setUnion,
      singletonSet(3)),
      singletonSet(-1001)),
      singletonSet(2000)), setUnion))

  print("Multiply all elements in {1,2} by 2: ")
  val setMap: Set = map(setUnion, value => value * 2)
  printSet(setMap)
}
