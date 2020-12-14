

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }

    println("((()) " + balance("((())".toList))
    println("((())) " + balance("((()))".toList))
    println("((()))) " + balance("((())))".toList))
    println(countChange(6, List[Int](1, 2, 5)))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == r || c == 0) 1 else pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    @scala.annotation.tailrec
    def count(list: List[Char], counter: Int): Int = list match {
      case '(' :: rest => count(rest, counter + 1)
      case ')' :: rest => count(rest, counter - 1)
      case _ :: rest => count(rest, counter)
      case Nil => counter
    }

    count(chars, 0) == 0
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
      case (m, c) if (m == 0) => 1
      case (m, c) if (c.isEmpty || m < 0) => 0
      case (m, c) => countChange(m, c.tail) + countChange(m - c.head, c)
    }
  }
}
