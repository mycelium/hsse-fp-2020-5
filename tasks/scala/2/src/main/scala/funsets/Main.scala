package funsets

object Main extends App {
  import FunSets._
  // Check working of singletonSet
  println(contains(singletonSet(1), 1))

  // Check working of union
  val s1 = singletonSet(4)
  val s2 = singletonSet(23)
  val s3 = union(s1, s2)
  val stringBool = (x: Boolean) => if (x) "true" else "false"
  printf("Union: set %s should contain 23 (true): %s\n", FunSets.toString(s3), stringBool(contains(s3, 23)))
  printf("Union: set %s should contain 4 (true): %s\n", FunSets.toString(s3), stringBool(contains(s3, 4)))
  printf("Union: set %s should contain 5 (false): %s\n", FunSets.toString(s3), stringBool(contains(s3, 5)))

  // Check working of intersect
  // intersect {4} and {4,23} should give {4}
  val s4 = intersect(s3, s1)
  printf("Intersect: set %s should contain 23 (false): %s\n", FunSets.toString(s4), stringBool(contains(s4, 23)))
  printf("Intersect: %s should contain 4 (true): %s\n", FunSets.toString(s4), stringBool(contains(s4, 4)))

  // Check working of diff
  // diff {4, 23} and {4} should give {23}
  val s5 = diff(s3, s1)
  printf("Diff: set %s should contain 23 (true): %s\n", FunSets.toString(s5), stringBool(contains(s5, 23)))
  printf("Diff: set %s should contain 4 (false): %s\n", FunSets.toString(s5), stringBool(contains(s5, 4)))

  // Check working of filter
  // Create test set {4, 23, 101}
  val s6 = union(s3, singletonSet(101))
  val filterFunction = (a: Int) => if (a < 100) true else false
  val s7 = filter(s6, filterFunction)
  printf("Filter: set %s should contain 23 (true): %s\n", FunSets.toString(s7), stringBool(contains(s7, 23)))
  printf("Filter: set %s should contain 4 (true): %s\n", FunSets.toString(s7), stringBool(contains(s7, 4)))
  // Shouldn't contain 101 because we applied < 100 filter
  printf("Filter: set %s should contain 101 (false): %s\n", FunSets.toString(s7), stringBool(contains(s7, 101)))

  // Check working of forall
  // All elements in set should be non-negative
  val checkFunction = (a: Int) => if (a < 0) false else true
  printf("All elements in set %s are non-negative (true): %s\n", FunSets.toString(s6),
    stringBool(forall(s6, checkFunction)))
  // Set with negative elem {-5, 4, 23, 101}
  val s8 = union(s6, singletonSet(-5))
  printf("All elements in set %s are non-negative (false): %s\n", FunSets.toString(s8),
    stringBool(forall(s8, checkFunction)))

  // Check working of exists
  // Set should contain at least one element that is equal to -5
  val checkExistsFunction = (a: Int) => if (a == -5) true else false
  printf("Set %s contains element is equal to -5 (false): %s\n", FunSets.toString(s6),
    stringBool(exists(s6, checkExistsFunction)))
  printf("Set %s contains element is equal to -5 (true): %s\n", FunSets.toString(s8),
    stringBool(exists(s8, checkExistsFunction)))

  // Check working of map
  // Switch all number signs (from + to -, from - to +)
  val switchSign = (a: Int) => -a
  printf("All elements of %s should change sign: %s\n", FunSets.toString(s8), FunSets.toString(map(s8, switchSign)))
}
