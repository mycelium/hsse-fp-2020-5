

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }

    println("Balance parentheses")
    println(balance("(a(bc(de)f)g(h)i)jk".toList))

    println(countChange(100, List(1, 2, 5, 10, 50, 100)))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if ((c == 0) || (c == r)) {
      1
    } else {
      pascal(c - 1, r - 1) + pascal(c, r - 1)
    }
  }

  /**
   * Exercise 2
   */
  def balance(chars: List[Char]): Boolean = {
    def count(char: Char) : Int = chars.count(c => c == char)
    def checkParentheses(right: Int, left: Int ) : Boolean = {
      if (right == left) {
        return true
      }
      false
    }
    if ((chars.contains('(') || chars.contains(')')) && checkParentheses(count('('), count(')'))) {
      balance(chars.filter(c => c != '(' && c != ')'))
    }
    true
  }

  /**
   * Exercise 3
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (money < 0) {
      return 0
    }
    if (money == 0) {
      return 1
    }
    coins match {
      case head::tail => countChange(money - head, coins) + countChange(money, tail)
      case Nil => 0
    }
  }

}