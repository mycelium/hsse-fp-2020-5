object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    println()
    println(balance("(())))))".toList))
    println(balance("(((())))".toList))
      
    println()
    println(countChange(33, List(3, 10)))
    println(countChange(33, List(3, 5, 10)))  
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
      def count(c: List[Char], counter: Int): Boolean = c match {
          case Nil => counter == 0
          case '(' :: tail => count(tail, counter + 1)
          case ')' :: tail if counter < 1 => false
          case ')' :: tail => count(tail, counter - 1)
          case _ :: tail => count(tail, counter)
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
