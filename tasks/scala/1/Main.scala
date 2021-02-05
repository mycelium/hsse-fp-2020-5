package recfun

object Main {
  def main(args: Array[String]) {
    println()
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    println()

    println("Parentheses Balancing")
    print("Formula: 'abc(((b+a)*(b-c))/((c+d)/(x+a)))'\nBalance result: ")
    println(balance("abc(((b+a)*(b-c))/((c+d)/(x+a)))".toList))
    print("Formula: '(((ab))*(a+c))/c(d(a+b)/(a-b)))'\nBalance result: ")
    println(balance("(((ab))*(a+c))/c(d(a+b)/(a-b)))".toList))
    println()

    println("Counting Change")
    print("Result for 10 using coins 1, 2, 5 is ")
    println(countChange(10 ,List(1, 2 ,5)))
    print("Result for 6 using coins 1, 2, 5 is ")
    println(countChange(6 ,List(1, 2 ,5)))
    print("Result for 3 using coins 2, 4 is ")
    println(countChange(3 ,List(2 ,4)))
    println()
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if ((c == 0) || (c == r)) return 1
    else return pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def balance(chars: List[Char], count: Int): Boolean = {
      if (chars.isEmpty) return count == 0
      else if (count < 0) return false
      else {
        if (chars.head == '(') balance(chars.tail, count + 1)
        else if (chars.head == ')') balance(chars.tail, count - 1)
        else balance(chars.tail, count)
      }
    }

    balance(chars, 0)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {

    def countChangeSorted(money: Int, coins: List[Int]): Int = {
      if (coins.isEmpty) return 0
      else if (money - coins.head == 0) return 1
      else if (money - coins.head < 0) return 0
      else return countChange(money - coins.head, coins) + countChange(money, coins.tail)
    }

    countChangeSorted(money, coins.sorted)
  }
}
