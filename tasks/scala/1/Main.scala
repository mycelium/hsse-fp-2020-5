package recfun

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    println("Balance")
    val test1 = "(((5*(4+3*2+(7)+6))))"
    println("Test1 is " + balance(test1.toList).toString)
    val test2 = ")5*5("
    println("Test2 is " + balance(test2.toList).toString)
    val test3 = "()"
    println("Test3 is " + balance(test3.toList).toString)
    val test4 = "((5+9)"
    println("Test4 is " + balance(test4.toList).toString)
    println("CountChange")
    val money_test = 100
    val coin_test = List(1, 2, 5, 10)
    val count_opt = countChange(money_test, coin_test)
    println(s"Money = $money_test, coins: $coin_test, change op = $count_opt")
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = if (c == 0 || c == r) return 1 else return (pascal(c-1, r-1) + pascal(c, r-1))
  
  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def help_fun(chars: List[Char], cnt: Int): Boolean = {
      if (chars==Nil)
      {
        if (cnt==0)
          return true
        else
          return false
      }
      else if (chars=='('::chars.tail)
        return help_fun(chars.tail, cnt + 1)
       else if (chars==')'::chars.tail)
       {
         if (cnt<1)
           return false
         else
          return help_fun(chars.tail, cnt - 1) 
       }
       else
         return help_fun(chars.tail, cnt)
    }
    help_fun(chars, 0)
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
      return 1
    else if (coins==Nil)
      return 0
    else if (money-coins.head<0)
      return countChange(money, coins.tail)
    else
      return countChange(money - coins.head, coins) + countChange(money, coins.tail) 
  }
}