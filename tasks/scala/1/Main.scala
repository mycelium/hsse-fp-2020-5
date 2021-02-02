
object Main {

  def main(args: Array[String]): Unit = {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }

    println("\nSecond lab:")
    print("Balance for '((( )))' is ") // true
    println(balance("((( )))".toList))
    print("Balance for '((( ))' is ") // false
    println(balance("((( ))".toList))
    print("Balance for ')(' is ") // false
    println(balance(")(".toList))

    println("\nThird lab:")
    print("Number of combinations how to pass change from 20 using coins 1, 2, 5 is ")
    println(countChange(20 ,List(1, 2 ,5)))
    print("Number of combinations how to pass change from 6 using coins 1, 2, 5 is ")
    println(countChange(6 ,List(1, 2 ,5)))
    print("Number of combinations how to pass change from 7 using coins 2, 4 is ")
    println(countChange(7 ,List(2 ,4)))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || c == r) return 1
    pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def scobeSearch(chars: List[Char], scobe: Int): Int = {
      if (chars.isEmpty) return scobe
      if (scobe < 0) return -1
      chars.head match {
        case ')' => scobeSearch(chars.tail, scobe - 1)
        case '(' => scobeSearch(chars.tail, scobe + 1)
        case _ => scobeSearch(chars.tail, scobe)
      }
    }
    scobeSearch(chars, 0) == 0
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (money < 0) {
      return 0
    }
    if (money == 0) {
      return 1
    }
    coins match {
      case Nil => 0
      case head::tail => countChange(money - head, coins) + countChange(money, tail)
    }
  }
}
