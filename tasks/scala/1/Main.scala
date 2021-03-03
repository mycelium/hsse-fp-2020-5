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

    println()
    println("[Balancing tests section]")

    // Correct balancing example
    print("First sample (([[]])) is balanced? ")
    println(balance("(([[]]))".toList))
    // Incorrect balancing example
    print("Second sample ([([]]] is balanced? ")
    println(balance("([([]]]".toList))
    println()

    println("[Counting section]")
    // Simple example
    print("Value : 12, coins : 2, 3 -> number of ways to get value = ")
    println(countChange(12, List(2, 3)))
    // Complex example
    print("Value : 256, coins : 2, 4 -> number of ways to get value = ") 
    println(countChange(256, List(2, 4)))  //1
  }


  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if ((c == 0) || (c == r))
    {
      1
    }
    else
    {
      pascal(c - 1, r - 1) + pascal(c, r - 1)
    }
  }


  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def balanced(chars: List[Char], dif: Int): Boolean = {
      if (chars.isEmpty)
      {
        dif == 0
      }
      else if ("({[".contains(chars.head))
      {
        balanced(chars.tail, dif + 1)
      }
      else if (")}]".contains(chars.head))
      {
        dif > 0 && balanced(chars.tail, dif - 1)
      }
      else
      {
        balanced(chars.tail, dif)
      }
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
    def count(money: Int, coins: List[Int]): Int = {
      if (money == 0)
      {
        1
      }
      else if (coins.isEmpty || money < 0)
      {
        0
      }
      else
      {
        countChange(money, coins.tail) + countChange(money - coins.head, coins)
      }
    }
 
    count(money, coins.sorted)
  }
}

