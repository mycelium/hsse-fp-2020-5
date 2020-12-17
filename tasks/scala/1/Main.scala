package recfun

import scala.annotation.tailrec

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
    if (c == 0 || c == r) {
      return 1
    }
    pascal(c-1, r-1) + pascal(c, r-1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    @tailrec
    def balanceWithCount(chars: List[Char], count: Int): Boolean = (chars, count) match {
      case (_, cnt) if cnt < 0 => false
      case (Nil, cnt) => cnt == 0
      case ('(' :: tail, cnt) => balanceWithCount(tail, cnt + 1)
      case (')' :: tail, cnt) => balanceWithCount(tail, cnt - 1)
      case (_ :: tail, cnt) => balanceWithCount(tail, cnt)
    }
    balanceWithCount(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomination
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    def change(money: Int, coins: List[Int]): Int = {
      if (money < 0 || coins.isEmpty) 0
      else if (money == 0) 1
      else change(money, coins.tail) + change(money - coins.head, coins)
    }

    change(money, coins)
  }
}
