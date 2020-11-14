package recfun

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }

    println("\nParentheses Balancing 1")
    println(balance(List('c', 'h', 'e', 'c', 'k', ')'))) // false

    println("Parentheses Balancing 2")
    println(balance(List('(', 'c', 'h', 'e', 'c', 'k', ')'))) // true

    println("Parentheses Balancing 3")
    println(balance(List('c', 'h', 'e', 'c', 'k'))) // true

    println("Parentheses Balancing 4")
    println(balance(List('c', '{', 'h', '[', 'e', ']', 'c', '}', 'k'))) // true

    println("\nCounting Change 1")
    println(countChange(5, List(2, 3))) // 2+3

    println("Counting Change 2")
    println(countChange(3, List(2, 1))) // 2+1, 1+1+1
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
    def balanced(chars: List[Char], open: Int): Boolean = {
      if (chars.isEmpty) open == 0
      else if ("({[".contains(chars.head)) balanced(chars.tail, open + 1)
      else if (")}]".contains(chars.head)) open > 0 && balanced(chars.tail, open - 1)
      else balanced(chars.tail, open)
    }

    balanced(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    def count(mon: Int, coi: List[Int]): Int = {
      if (coi.isEmpty) 0
      else if (mon - coi.head == 0) 1
      else if (mon - coi.head < 0) 0
      else countChange(mon - coi.head, coi) + countChange(mon, coi.tail)
    }

    count(money, coins.sorted)
  }
}
