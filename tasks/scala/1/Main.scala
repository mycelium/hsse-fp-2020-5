package recfun

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    
    println("Task2")
    val v0 = "x+y"
    println(balance(v0.toList).toString)
    val v1 = "(x+y)"
    println(balance(v1.toList).toString)
    val v2 = ")x+y("
    println(balance(v2.toList).toString)
    
    println("Task3")
    val m = 50
    val co = List(1, 2, 3, 5, 10, 15, 20)
    println(countChange(m, co).toString())
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
    def bal(ch: List[Char], brackets: Int): Boolean = {
      if (brackets<0)
        false
      else if ((ch==Nil) && (brackets==0))
        true
      else if ((ch==Nil) && (brackets!=0))
        false
      else if (ch=='('::ch.tail)
        bal(ch.tail, brackets + 1)
      else if (ch==')'::ch.tail)
        bal(ch.tail, brackets - 1)
      else 
        bal(ch.tail, brackets)
    }
    bal(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (money==0)
      1
    else if ((money<0) || (coins.isEmpty))
      0
    else 
      countChange(money, coins.tail) + countChange(money - coins.head, coins)
  }
}