package recfun
import scala.annotation.tailrec

object Main {
  def main(args: Array[String]) {
    println("Pascal Delta")
    for (row <- 0 to 10) {
      for (col <- 0 to row) {print(pascal(col, row) + " ")}
      println();
    }
  }

  /**
   * Exercise 1
   */
  
  def pascal(c_d: Int, r_d: Int): Int = {
    if (c_d== 0 || c_d== r_d) {
      return 1
    }
    pascal(c_d-1, r_d-1) + pascal(c_d, r_d-1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    @tailrec
    def balanceWithCount(chars: List[Char], count: Int): Boolean = (chars, count) match {
      case (_, c_nt) if c_nt < 0 => false
      case (Nil, c_nt) => c_nt == 0
      case ('(' :: tail, c_nt) => balanceWithCount(tail, c_nt + 1)
      case (')' :: tail, c_nt) => balanceWithCount(tail, c_nt - 1)
      case (_ :: tail, c_nt) => balanceWithCount(tail, c_nt)
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
  
  def countChange(money: Int, coins: List[Int]): Int = (money, coins) match {
    case 
      (rest, _) if rest == 0 => 1
    case 
      (rest, cash) if rest < 0 || cash.isEmpty => 0
    case _ => 
      countChange(money, coins.tail) + countChange(money - coins.head, coins)
  }
}
