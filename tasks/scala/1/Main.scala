object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
  }

    println()
    print("balance (()(()) is ")
    println(balance("(()(())".toList))  //false

    print("balance (([()()](()))) is ")
    println(balance("(([()()](())))".toList))  //true

    print("number of ways to get 4 with 1 and 2 is ")
    println(countChange(4, List(1, 2)))  //3
    
    print("number of ways to get 5 with 2 and 3 is ") 
    println(countChange(5, List(2, 3)))  //1
    
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
   def balanced(chars: List[Char], r: Int): Boolean = {
      if (chars.isEmpty) r == 0
      else if ("({[".contains(chars.head)) balanced(chars.tail, r + 1)
      else if (")}]".contains(chars.head)) r > 0 && balanced(chars.tail, r - 1)
      else balanced(chars.tail, r)
    }
    balanced(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
   def count(m: Int, c: List[Int]): Int = {
      if (c.isEmpty) 0
      else if (m - c.head <  0) 0
      else if (m - c.head == 0) 1
      else countChange(m - c.head, c) + countChange(m, c.tail)
    }
    count(money, coins.sorted)
  }
  
}
