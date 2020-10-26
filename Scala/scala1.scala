package scala


object Main {
    def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    println("Parentheses Balancing")
    val checkB1: List[Char] = List('(','(','G','G','(', ')')
    val checkB2: List[Char] = List('(','(','a',')', ')')
    val checkB3: List[Char] = List('(','(','(','(','(', ')', ')')
    println(balance(checkB1) + " " + balance(checkB2) + " " + balance(checkB3))

    println("Counting Change")
    val coins = List(1,2, 5, 10, 50)
    val money = 10
    println(countChange (money, coins))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || r == 0) 1
    else pascal(c - 1, r - 1) + pascal(c - 1, r)
  }
  //

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    counter(chars,0)
  }
  def counter(chars: List[Char], bracketCount: Int): Boolean = {
    if (chars.isEmpty) bracketCount == 0
    else
    if (chars.head == '(')  counter(chars.tail,bracketCount + 1)
      else
      if ((chars.head == ')') && (bracketCount > 0))   {counter(chars.tail, bracketCount - 1)}
        else counter(chars.tail,bracketCount)
  }


  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   *
   */

 def countChange(money: Int, coins: List[Int]): Int = {
   count(money, coins)

 }
  def count(money: Int, coins: List[Int]): Int = {
    if (money < 0 || coins.isEmpty) 0
    else if (money - coins.head == 0) 1
    else if (money - coins.head < 0) 0
    else countChange(money - coins.head, coins) + countChange(money, coins.tail)
  }

}

