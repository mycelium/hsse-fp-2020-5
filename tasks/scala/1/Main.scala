
object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      print("  " * (10 - row / 2))
      for (col <- 0 to row) {
        print(pascal(col, row) + " ")
      }
      println()
    }
    println()
    print("balance for ((())()) ")
    println(balance("((())())".toList))

    print("balance for (())()) ${}")
    println(balance("(())())".toList))

    print("coins for 53 and 3 5 10 coins ")
    println(countChange(53 ,List(3, 5, 10)))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || c == r) {
      return 1
    }
    pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    
    def balance(chars: List[Char], dif: Int): Boolean = {
      if (chars.isEmpty) {
        dif == 0
      } else if (dif < 0) {
        false
      } else {
        chars.head match {
          case '(' => balance(chars.tail, dif + 1)
          case ')' => balance(chars.tail, dif - 1)
          case _ => balance(chars.tail, dif)
        }
      }
    }

    balance(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    def count(money: Int, coins: List[Int]): Int = {
      if (coins.isEmpty) {
        0
      } else if (money - coins.head == 0) {
        1
      } else if (money - coins.head < 0) {
        0
      } else {
        countChange(money - coins.head, coins) + countChange(money, coins.tail)
      }
    }

    count(money, coins.sorted)
  }
}
