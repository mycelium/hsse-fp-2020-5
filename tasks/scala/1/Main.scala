package recfun
import common._

object Main {
  def main(args: Array[String]): Unit = {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    
    println("Parentheses Balancing")
    
    val test1 = List('(', 'a', ')')
    println(balance(test1))
    
    val test2 = List('(')
    println(balance(test2))
                     
    val test3 = List('(', '4', '+', '1', ')', '*', '(', '5', '/', '(', '3', '-', '2', ')', ')')
    println(balance(test3))
                     
    val test4 = List('(', ')', '(', ')', ')')
    println(balance(test4))
    
    println("Counting Change")
    
    val testCoins1 = List(2, 3, 5)
    printf("There are %d ways to make change %d from coins %s\n", countChange(5, testCoins1), 5, testCoins1.toString())
    
    val testCoins2 = List(1, 10, 5)
    printf("There are %d ways to make change %d from coins %s\n", countChange(25, testCoins2), 25, testCoins2.toString())
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || c == r) {
      1
    } else {
      pascal(c-1, r-1) + pascal(c, r-1)
    }
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def countBalance(chars: List[Char], currentBalance: Int): Boolean = {
      if (chars.isEmpty) {
        currentBalance == 0
      } else if (chars.head == '(') {
        countBalance(chars.tail, currentBalance + 1)
      } else if (chars.head == ')') {
        currentBalance > 0 && countBalance(chars.tail, currentBalance - 1)
      } else {
        countBalance(chars.tail, currentBalance)
      }
    }

    countBalance(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (money == 0) 1
    else if (coins.isEmpty || money < 0) 0
    else countChange(money, coins.tail) + countChange(money - coins.head, coins)
  }
}
