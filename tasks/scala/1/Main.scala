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
    print("balance for (abv)")
    println(balance("(abv)".toList))
    print("balance for ()()()())))")
    println(balance("(()()()())))".toList))
    print("coins for 157 and 1 2 5 10 coins ")
    println(countChange(157 ,List(1, 2, 5, 10)))
    
  }

  /**
   * Exercise 1
   */
  
  def pascal(c: Int, r: Int): Int = {

   if ( r == 0 || c == 0) { return 1 } 

   pascal(c - 1, r - 1) + pascal(c, r - 1)
      
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
   var count: Int = 0;
    for ( i <- 0 to chars.length-1){
         
     if(chars(i).equals('(')){
      count += 1; 
     } 
     else if(chars(i).equals(')')) {
        count -= 1;
     }
    
    }
    if(count != 0) false
    else true
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    def variables(money: Int, coins: List[Int]): Int = {
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

    variables(money, coins.sorted)
  }
}
