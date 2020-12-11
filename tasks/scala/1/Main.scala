object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    val expression = "(())"
    println("Is Balance: " + balance(expression.toList))

    println("Count: "+countChange(5,List(1,2,3)))
    println("Count: "+countChange(10,List(1,2,3)))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if(r == 0) 1
    else if(c != 0 && c != r) pascal(c-1,r-1) + pascal(c,r-1)
    else if(c == 0) pascal(c,r-1)
    else pascal(c-1,r-1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def diff(chars: List[Char]): Int = chars match {
      case '(' :: c => diff(c) + 1
      case ')' :: c => diff(c) - 1
      case _ :: c => diff(c)
      case Nil => 0
    }
    diff(chars) == 0
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = (money, coins) match {
    case (0, _) => 1
    case (rest, _) if rest < 0 => 0
    case (_, Nil) => 0
    case (rest, h :: t) => countChange(rest - h, h :: t) + countChange(rest, t)
  }
}

/*
  =========Result===========
  Pascal's Triangle
  1
  1 1
  1 2 1
  1 3 3 1
  1 4 6 4 1
  1 5 10 10 5 1
  1 6 15 20 15 6 1
  1 7 21 35 35 21 7 1
  1 8 28 56 70 56 28 8 1
  1 9 36 84 126 126 84 36 9 1
  1 10 45 120 210 252 210 120 45 10 1
  Is Balance: true
  Count: 5
  Count: 14
 */
