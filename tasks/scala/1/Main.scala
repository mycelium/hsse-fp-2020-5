package recfun
//import common._

object Main {
  def main(args: Array[String]) {
    println(pascal(1, 3))
    println(balance("123".toList))
    println(balance("((123)".toList))
    println(balance("((12)3)".toList))
    println(countChange(5, List(1)))
    println(countChange(4, List[Int](1, 2)))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    def nextRow(l: List[Int]): List[Int] = l match {
      case a :: b :: t => (a + b) :: nextRow(b :: t)
      case _ => l
    }

    @scala.annotation.tailrec
    def getRow(r: Int, l: List[Int]): List[Int] = r match {
      case r if r > 0 => getRow(r - 1, nextRow(1 :: l))
      case 0 => 1 :: l
      case _ => throw new IllegalArgumentException("r must be >= 0")
    }

    getRow(r, Nil)(c)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def difference(chars: List[Char]): Int = chars match {
      case '(' :: t => difference(t) + 1
      case ')' :: t => difference(t) - 1
      case _ :: e => difference(e)
      case Nil => 0
    }

    difference(chars) == 0
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = (money, coins) match {
    case (remainder, _) if remainder < 0 => 0
    case (_, Nil) => 0
    case (0, _) => 1
    case (remainder, h :: t) => countChange(remainder - h, h :: t) + countChange(remainder, t)
  }
}
