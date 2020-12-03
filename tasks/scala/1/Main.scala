package recfun
import common._

object Main {
  def main(args: Array[String]) {
    println("Exercise 1")
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
  def pascal(c: Int, r: Int): Int = {
    if ((c == r) || (c == 0)){
      return 1
    }else{
      return pascal(c - 1, r - 1) + pascal(c, r - 1)
    }
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def checkDif(c: List[Char], count: Int): Boolean = c match {
      case '(' :: tail => checkDif(tail, count + 1)
      case ')' :: tail => checkDif(tail, count - 1)
      case _ :: tail => checkDif(tail, count)
      case Nil => count == 0
    }
    checkDif(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    def recCount(money2: Int, coin: List[Int]): Int = {
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
    recCount(money, coins.sorted)
  }
}
