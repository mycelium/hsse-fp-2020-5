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
      val equalParanthesis = List('(', 'a', 'b', 'c', ')')
      println(balance(equalParanthesis))

      val unequalParanthesisClosing = List('(', 'a', 'b', 'c', ')', ')')
      println(balance(unequalParanthesisClosing))

      val unequalParanthesisOpening = List('(', '(', 'a', 'b', 'c', ')')
      println(balance(unequalParanthesisOpening))


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
    def countParanthesis(chars: List[Char], paranthesisCount: Int): Boolean = chars.head match { //,count
      // we get a char, not a string, but empty char doesn't exist. we check for this condition in last case.
      //case ("") => paranthesisCount == 0
      case ('(') => countParanthesis(chars.tail, paranthesisCount + 1)
      case (')') => countParanthesis(chars.tail, paranthesisCount - 1) //paranthesisCount > 0 &&
      case (_) => countParanthesis(chars.tail, paranthesisCount)
      //    } else {
      //        countParanthesis(chars.tail, currentBalance)
      //      }
    }

        countParanthesis(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.

  def countChange(money: Int, coins: List[Int]): Int = {

  }
   */
}
