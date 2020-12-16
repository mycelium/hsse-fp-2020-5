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
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || c == r)
      1
    else
      pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def count(c: List[Char], counter: Int): Boolean = c match {
      case Nil =>
        counter == 0

      case '(' ::
        tail => count(tail, counter + 1)

      case ')' ::
        tail
        if counter < 1 =>
          false

      case ')' ::
        tail => count(tail, counter - 1)

      case _ ::
        tail => count(tail, counter)
    }
    count(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    def makeCount(money_left: Int, coins_left: List[Int]): Int = {
      if (coins_left.isEmpty) {
        return 0
      } else if (money_left - coins_left.head == 0){
        return 1
      } else if (money_left - coins_left.head < 0){
        return 0
      } else {
        return countChange(money_left - coins_left.head, coins_left) + countChange(money_left, coins_left.tail)
      }
    }
    makeCount(money, coins.sorted)
  }
}
