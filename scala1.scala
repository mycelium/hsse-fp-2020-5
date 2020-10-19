package scala


object Main {
  var count: Integer = 0
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
    val money = 5
    countChange (money, coins)
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
  def countChange(money: Int, coins: List[Int]): Unit = {
  //  var count = 0
    var max = 0
    var i = 0
    for( i <- 0 to coins.length - 1) {if (money > coins(i)) max = i}
    for( i <- 0 to max)
      Change(money, coins, i, max)
    print ("There is "+ count+ " way to give change for " + money)}

  def Change(money: Int, coins: List[Int], cur_idx: Int, max: Int): Unit = {
  if ((money <= 0) || (money < coins(cur_idx))) return
   if (money == coins(cur_idx))
  { count = count + 1
    return }
    else if (money > coins(cur_idx)) {
   var a = 0
  for( a <- cur_idx to max) {   Change(money - coins(cur_idx),coins, a,  max)   }
  }
   }



}
