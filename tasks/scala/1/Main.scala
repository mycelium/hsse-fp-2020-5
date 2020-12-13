object Main {
  def main(args: Array[String]) {
    println("# First lab testing:")
    println("Pascal's Triangle")
    for (row <- 0 to 12) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }

    println("# Second lab testing:")
    print("Balance for 'sin(((1+a)*(b-3))/ln((9+x)/(h+2)))' is ")
    println(balance("sin(((1+a)*(b-3))/ln((9+x)/(h+2)))".toList))
    print("Balance for 'cos(((1-a))*(b+9))/ln((l+x)/(u-2)))' is ")
    println(balance("cos(((1-a))*(b+9))/ln((l+x)/(u-2)))".toList))

    println("# Third lab testing:")
    print("Number of combinations how to pass change from 20 using coins 1, 2, 5 is ")
    println(countChange(20 ,List(1, 2 ,5)))
    print("Number of combinations how to pass change from 6 using coins 1, 2, 5 is ")
    println(countChange(6 ,List(1, 2 ,5)))
    print("Number of combinations how to pass change from 7 using coins 2, 4 is ")
    println(countChange(7 ,List(2 ,4)))
  }

  /**
   * Exercise 1 Evaluating number in Pascal's Triangle
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || c == r) {
      return 1
    }
    pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing evaluation
   */
  def balance(chars: List[Char]): Boolean = {
    def balance(chars: List[Char], dif: Int): Boolean = {
      if (chars.isEmpty) {
        dif == 0
      } else if (dif < 0) {
        false
      } else {
        chars.head match {
          case ')' => balance(chars.tail, dif - 1)
          case '(' => balance(chars.tail, dif + 1)
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
    def countSorted(money: Int, coins: List[Int]): Int = {
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
    countSorted(money, coins.sorted)
  }
}
