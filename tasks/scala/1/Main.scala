package recfun
import common._

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }

    /**
     * Printing results for 2 and 3
     */
    println("\n")
    println("Exercise 2")
    println(balance(List('(', ')', ')'))) // false
    println("\n")
    println("Exercise 3")
    println(countChange(10, List(1, 4))) // 3: 4+4+1+1, 4+(5*1), 1*10
  }
  
  /**
   * Exercise 1
   */
  def pascal(column: Int, row: Int): Int = {
    if (column == 0 || column == row) 1
    else pascal(column, row - 1) + pascal(column - 1, row - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def checkBalance(c: List[Char], count: Int): Boolean = c match {
      case '(' :: tail => checkBalance(tail, count + 1)
      case ')' :: tail => checkBalance(tail, count - 1)
      case _ :: tail => checkBalance(tail, count)
      case Nil => count == 0
    }
    checkBalance(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    def change(money2: Int, coin: List[Int]): Int = {
      if (coin.isEmpty){
        return 0
      }else if (money2 - coin.head == 0){
        return 1
      }else if (money2 - coin.head < 0){
        return 0
      }else{
        return countChange(money2 - coin.head, coin) + countChange(money2, coin.tail)
      }
    }
    change(money, coins.sorted)
  }
}