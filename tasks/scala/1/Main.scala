package recfun

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || c == r) 1
    else pascal(c - 1, r - 1) + pascal(c, r - 1)
  }
  
  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def balance_ad(chars: List[Char], n: Int): Boolean = {
      if (chars==Nil)
      {
        if (n==0) true
        else false
      }
      else if (chars=='('::chars.tail) balance_ad(chars.tail, n + 1)
      else if (chars==')'::chars.tail)
      {
         if (n<1) false
         else balance_ad(chars.tail, n - 1) 
      }
      else balance_ad(chars.tail, n)
    }
    balance_ad(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (money==0) 1
    else if (coins==Nil) 0
    else if (money-coins.head<0) countChange(money, coins.tail)
    else countChange(money - coins.head, coins) + countChange(money, coins.tail) 
  }
}