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

    println("Balance parentheses")
    val test1: List[Char] = List('(', '(', '(', ')')
    println(balance(test1))

    val test2: List[Char] = List('(', '(', '(', ')', ')' , ')')
    println(balance(test2))

    val test3: List[Char] = List('(', '{', '}', ')')
    println(balance(test3))

    val test4: List[Char] = List('(', '[', '{', '}', ')')
    println(balance(test4))

    val test5: List[Char] = List('(', '[', '{', '}', ')', ']')
    println(balance(test5))

    println(countChange(100, List(1, 2, 5, 10, 50, 100)))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    var res: Int = 0
    if ((c == 0) || (c == r)) {
      res = 1
    } else {
      res = pascal(c - 1, r - 1) + pascal(c, r - 1)
    }
    res
  }

  /**
   * Exercise 2
   */
  def balance(chars: List[Char]): Boolean = {
    def count(char: Char) : Int = chars.count(c => c == char)

    var rightParentCount: Int = count('(')
    var leftParentCount: Int = count(')')
    if (rightParentCount == leftParentCount) {
      if (rightParentCount!=0 && leftParentCount!=0) {
        return balance(chars.filter(c => c!='(' && c!=')'))
      }
    } else {
      return false
    }

    rightParentCount = count('{')
    leftParentCount = count('}')
    if (rightParentCount == leftParentCount) {
      if (rightParentCount!=0 && leftParentCount!=0) {
        return balance(chars.filter(c => c!='{' && c!='}'))
      }
    } else {
      return false
    }

    rightParentCount = count('[')
    leftParentCount = count(']')
    if (rightParentCount == leftParentCount) {
      if (rightParentCount!=0 && leftParentCount!=0) {
        return balance(chars.filter(c => c!='[' && c!=']'))
      }
    } else {
      return false
    }
    true
  }

  /**
   * Exercise 3
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (money < 0) {
      return 0
    }
    if (money == 0) {
      return 1
    }
    var copy = coins.map(elem => elem)
    var count = 0
    coins.foreach({c => count+=countChange(money - c, copy); copy = copy.filter(cc => cc != c);})
    count
  }

}
