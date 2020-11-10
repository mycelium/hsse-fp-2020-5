package funsets

import common._
import scala.annotation.tailrec

/**
 * 2. Purely Functional Sets that stores elements as value within functions
 */
object FunSets {
  /**
   * We represent a set by its characteristic function, i.e.
   * its `contains` predicate.
   */
  type Set = Int => Boolean

  /**
   * Indicates whether a set contains a given element.
   */
  def contains(s_i: Set, elem_i: Int): Boolean = s_i(elem_i)

  /**
   * Returns the set of the one given element.
   */
  def singletonSet(elem_i: Int): Set = (el_i: Int) => el_i == elem_i

  /**
   * Returns the union of the two given sets,
   * the sets of all elements that are in either `s` or `t`.
   */
  def union(s_i: Set, t: Set): Set = (el_i: Int) => s_i(el) || t(el_i)

  /**
   * Returns the intersection of the two given sets,
   * the set of all elements that are both in `s` and `t`.
   */
  def intersect(s_i: Set, t: Set): Set = (el_i: Int) => s_i(el_i) && t(el_i)

  /**
   * Returns the difference of the two given sets,
   * the set of all elements of `s` that are not in `t`.
   */
  def diff(s_i: Set, t: Set): Set = (el_i: Int) => s_i(el_i) && !t(el_i)

  /**
   * Returns the subset of `s` for which `p` holds.
   */
  def filter(s_i: Set, p: Int => Boolean): Set = (el_i: Int) => s_i(el_i) && p(el_i)

  /**
   * The bounds for `forall` and `exists` are +/- 1000.
   */
  val bound = 1000

  /**
   * Returns whether all bounded integers within `s` satisfy `p`.
   */
  def forall(s_i: Set, p: Int => Boolean): Boolean = {
    @tailrec
    def iter(a: Int): Boolean = {
      if (a > bound) true
      else if (s_i(a)) p(a) && iter(a + 1)
      else iter(a + 1)
    }
    iter(-bound)
  }

  /**
   * Returns whether there exists a bounded integer within `s`
   * that satisfies `p`.
   */
  def exists(s_i: Set, p: Int => Boolean): Boolean = !forall(s_i, el_i => !p(el_i))

  /**
   * Returns a set transformed by applying `f` to each element of `s`.
   */
  def map(s_i: Set, f: Int => Int): Set = (el_i: Int) => exists(s_i, e => f(e) == el_i)

  /**
   * Displays the contents of a set
   */
  def toString(s_i: Set): String = {
    val xs = for (i <- -bound to bound if contains(s_i, i)) yield i
    xs.mkString("{", ",", "}")
  }

  /**
   * Prints the contents of a set on the console.
   */
  def printSet(s_i: Set) {
    println(toString(s_i))
  }
}
