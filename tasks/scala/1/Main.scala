object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
//      to do a proper triangle we need to predefine number of rows. Unclear how to achieve
//      for (indent <- n-1 to 1)
//        print(" ")
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
      val equalParenthesis = List('(', 'a', 'b', 'c', ')')
      printf("parenthesis equality for (abc) is %s\n", balance(equalParenthesis))

      val unequalParenthesisClosing = List('(', 'a', 'b', 'c', ')', ')')
      printf("parenthesis equality for (abc)) is %s\n", balance(unequalParenthesisClosing))

      val unequalParenthesisOpening = List('(', '(', 'a', 'b', 'c', ')')
      printf("parenthesis equality for ((abc) is %s\n", balance(unequalParenthesisOpening))

      val twoCoins = List(2, 3)
      printf("For %d and coins %s one can have %d way(s) to get change\n", 5, twoCoins.toString(), countChange(5, twoCoins))

      val threeCoins = List(2, 3, 5)
      printf("For %d and coins %s one can have %d way(s) to get change\n", 8, threeCoins.toString(), countChange(8, threeCoins))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if ((c == 0) || (c == r))
      1
    else
      pascal(c-1, r-1) + pascal(c, r-1)
  }

  /**
   * Exercise 2 Parentheses Balancing
*/
  def balance(chars: List[Char]): Boolean = {
    def countParenthesis(chars: List[Char], parenthesisCount: Int): Boolean = { //,count
      // we get a char, not a string, but empty char doesn't exist. we check for this condition outside of matcher.
      //case ("") => parenthesisCount == 0
      if (chars.isEmpty)
        parenthesisCount == 0
      else chars.head match {
        case ('(') => countParenthesis(chars.tail, parenthesisCount + 1)
        case (')') => countParenthesis(chars.tail, parenthesisCount - 1)
        case (_) => countParenthesis(chars.tail, parenthesisCount)
      }
    }
    countParenthesis(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (money < 0 || coins.isEmpty)
      0
    else if (money == 0)
      1
    else countChange(money, coins.tail) + countChange(money - coins.head, coins)
  }
}
