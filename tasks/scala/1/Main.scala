package recfun

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }

    println("\n\n ========= 2 ========")
    println(balance("case _ => pascal(c - 1, r - 1) + pascal(c, r - 1)".toList))
    println(balance("def count(chars: List[Char], counter: Int): Boolean = {)))((".toList))
    println(balance(")))()()()()()()()()))".toList))

    val money = 4
    val coins_ = List(1, 2, 6)
    println("\n\n ========= 3 ========")
    println(s"money: $money, coins_: $coins_")
    println(s"countChange: ${countChange(money, coins_)}")
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = c match {
    case 0 => 1
    case `r` => 1
    case _ => pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def count(chars: List[Char], counter: Int): Boolean = {
      if (chars.isEmpty) return counter == 0
      chars.head match {
        case '(' => count(chars.tail, counter + 1)
        case ')' => count(chars.tail, counter - 1)
        case _ => count(chars.tail, counter)
      }
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
  def countChange(money: Int, coins: List[Int]): Int = coins match {
    case _ if money == 0 => 1
    case Nil if money != 0 => 0
    case coin :: tail =>
      if (money - coin < 0) countChange(money, tail)
      else countChange(money - coin, coins) + countChange(money, tail)

  }

}
