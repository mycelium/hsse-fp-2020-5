package recfun
import common._

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    println("Check balance")
    println(balance("(hello world))".toList))
    println(balance("hello world))".toList))
    println(balance("(((hello world))".toList))
    println(balance("(((hello world)))".toList))
    
    println("Print change")
    for (money <- 1 to 10) {
      println(countChange(money, List[Int](1, 2, 3)))
    }
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = c match {
      case c if (c == 0 || c == r) => 1
      case _ => pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def diff(chars: List[Char]): Int = chars match {
      case Nil => 0
      case '(' :: t => diff(t) + 1
      case ')' :: t => diff(t) - 1
      case _ :: e => diff(e)
    }
    diff(chars) == 0
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    def count(money: Int, coins: List[Int]): Int = (money, coins) match {
      case (_, Nil) => 0
      case (0, _) => 1
      case (remain, _) if remain < 0 => 0
      case (remain, h :: t) => count(remain - h, h :: t) + count(remain, t)
    }
    count(money, coins): Int
  }
}
