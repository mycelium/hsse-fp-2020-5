package recfun

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
    if (c == 0 || c == r) 1
    else pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def check(chars_list: List[Char], n: Int): Boolean = chars_list match {
      case '(' :: rest => check(rest, n + 1)
      case ')' :: rest => if (n < 1) false else check(rest, n - 1)
      case _ :: rest => check(rest, n)
      case Nil => n == 0
    }
    check(chars, 0)
 }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (money < 0) {
      return 0
    }
    if (money == 0) {
      return 1
    }
    coins match {
      case Nil => 0
      case head::tail => countChange(money - head, coins) + countChange(money, tail)
    }
  }

}
