package recfun
import common._


object First {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (_ <- 0 to 10 - row) {
        print(" ")
      }

      for (col <- 0 to row) {
        print(pascal(col, row) + " ")
      }
      println()
    }

    println("\n\nBALANCE : ")
    println(balance(List('d', '(', 'f',')', 'd', '(', 'f', '(', 'd', ')', 'l', ')')))
    println(balance(List('d', ')', 'f',')', 'd', '(', 'f', '(', 'd', ')', 'l', ')')))

    println("\n\nCountChange : ")

    print(countChange(5, List(2, 3, 1, 4)))
    print(countChange(4, List(2, 3)))
  }
  
  // 5*1, 3*1 + 2, 2*1 + 3, 1 + 4, 1 + 2 + 2, 2 + 3

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == r || c == 0) 1
    else pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def walkRecursive(chars: List[Char]): Int = {
        chars match {
          case Nil => 0
          case '('::tail => walkRecursive(tail) + 1
          case ')'::tail => walkRecursive(tail) - 1
          case _::tail => walkRecursive(tail)
        }
    }

    walkRecursive(chars) == 0
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    (money, coins) match {
      case (0, _) => 1
      case (m, coins) if m < 0 || coins == Nil => 0
      case (m, head::tail) => countChange(m - head, coins) + countChange(m, tail)
    }
  }
}
