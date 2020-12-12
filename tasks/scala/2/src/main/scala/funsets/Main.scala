package funsets

object Main extends App {
  import FunSets._
  println(contains(singletonSet(1), 1))
  
  val UNION: Set = union(singletonSet(2), singletonSet(4))
  val INTERSECT: Set = intersect(UNION, singletonSet(2))
  val DIFF: Set = diff(UNION, INTERSECT)
  val FILTER: Set = filter(UNION, DIFF)
  val FORALL: Boolean = forall(union(union(union(
      singletonSet(1),
      singletonSet(2)),
      singletonSet(3)),
      singletonSet(4)), 
      singletonSet(4))
  val EXISTS: Boolean = exists(union(union(union(
      singletonSet(1),
      singletonSet(2)),
      singletonSet(3)),
      singletonSet(4)),            
      singletonSet(3));
  val MAP: Set = map(UNION, value => value * 2)
  
  printSet(UNION)
  printSet(INTERSECT)
  printSet(DIFF)
  printSet(FILTER)
  println(FORALL)
  println(EXISTS)
  printSet(MAP)
}
