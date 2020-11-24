package recfun
import scala.annotation.tailrec

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
	
	println("\nParentheses Balancing")
	println("Is ((())(()))()) balanced? " + balance("((())(()))())".toList))
	println("Is (()((()))) balanced? " + balance("(()((())))".toList))
	
	println("\nCounting Change")
    val money = 5
    val coins = List(1,2,5,10)
	print("Number of ways to have change for " + money + " using " + coins + ": ")
    println(countChange(money,coins))
  }

  /**
   * Exercise 1
   */
  def pascal(column: Int, row: Int): Int = {
    if ((column == 0) || (column == row)) 1
	else pascal(column - 1,row - 1) + pascal(column,row - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    @tailrec
    def countingBalance(chars: List[Char], dif: Int): Boolean = {
      if (chars.isEmpty) dif == 0
      else if (dif < 0) false
      else chars.head match {
        case '(' => countingBalance(chars.tail, dif + 1)
        case ')' => countingBalance(chars.tail, dif - 1)
        case _ => countingBalance(chars.tail, dif)
      }
    }
    countingBalance(chars,0)
  }
  
  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
   countingWays(money,coins)
 }
  def countingWays(money: Int, coins: List[Int]): Int = {
    if (money < 0 || money - coins.head < 0 || coins.isEmpty) 0
    else if (money - coins.head == 0) 1
    else countChange(money - coins.head,coins) + countChange(money,coins.tail)
  }
}

  /**
   * Pascal's Triangle
   * 1
   * 1 1
   * 1 2 1
   * 1 3 3 1
   * 1 4 6 4 1
   * 1 5 10 10 5 1
   * 1 6 15 20 15 6 1
   * 1 7 21 35 35 21 7 1
   * 1 8 28 56 70 56 28 8 1
   * 1 9 36 84 126 126 84 36 9 1
   * 1 10 45 120 210 252 210 120 45 10 1
   * 
   * Parentheses Balancing
   * Is ((())(()))()) balanced? false
   * Is (()((()))) balanced? true
   * 
   * Counting Change
   * Number of ways to have change for 5 using List(1, 2, 5, 10): 4
   */