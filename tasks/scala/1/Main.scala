package recfun

import common._
import scala.annotation.tailrec

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    println("Exercise 2: Parentheses Balancing")
    println("(2+5-8*(450-5*(3-123))) " + balance("(2+5-8*(450-5*(3-123)))".toList))
    println("(3-5)+45-97)) " + balance("(3-5)+45-97))".toList))

    println("Exercise 3 Counting Change")
    println("Money:12; Coins:10,5,2,1; Result: " + countChange(12, List[Int](10, 5, 2, 1)))
  }

  /*Pascal's Triangle
  1
  1 1
  1 2 1
  1 3 3 1
  1 4 6 4 1
  1 5 10 10 5 1
  1 6 15 20 15 6 1
  1 7 21 35 35 21 7 1
  1 8 28 56 70 56 28 8 1
  1 9 36 84 126 126 84 36 9 1
  1 10 45 120 210 252 210 120 45 10 1
  Exercise 2: Parentheses Balancing
  (2+5-8*(450-5*(3-123))) true
  (3-5)+45-97)) false
  Exercise 3 Counting Change
  Money:12; Coins:10,5,2,1; Result: 15*/

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || c == r) 1
    else pascal(c, r - 1) + pascal(c - 1, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    @tailrec
    def checkBalance(chars: List[Char], bracketsNum: Int): Boolean = chars match {
      case Nil => bracketsNum == 0
      case '(' :: tail => checkBalance(tail, bracketsNum + 1)
      case ')' :: tail =>
        if (bracketsNum < 1) false
        else checkBalance(tail, bracketsNum - 1)
      case _ :: tail => checkBalance(tail, bracketsNum)
    }

    checkBalance(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    def countChangeByCoin(money: Int, coins: List[Int]): Int = {
      if (coins.isEmpty || money - coins.head < 0) {
        0
      } else if (money - coins.head == 0) {
        1
      } else {
        countChangeByCoin(money, coins.tail) + countChangeByCoin(money - coins.head, coins)
      }
    }

    countChangeByCoin(money, coins.sorted)
  }
}

