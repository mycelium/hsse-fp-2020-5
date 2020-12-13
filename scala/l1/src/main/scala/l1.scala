package recfun

object Main
{
  def main(args: Array[String])
  {
    println("task 1")
    for (row <- 0 to 12)
      {
        for (col <- 0 to row)
          {
            print(pascal(col, row)+" ")
          }
        println()
      }

    println("task 2")
    println(balance(List('(', 'a', 'b', ')')))
    println(balance(List('(', 'a', 'b')))

    println("task 3")
    println(countChange(10, List(2, 4)))
  }

  def pascal(column: Int, row: Int): Int=
  {
    if (column == 0 || column == row)
    {
      return 1
    }
    pascal(column-1, row-1) + pascal(column, row-1)
  }

  def balance(chars: List[Char]): Boolean=
  {
    {
      def is_balanced(chars: List[Char], count: Int): Boolean = {
        if (chars.isEmpty) {
          count == 0
        }
        else if ("(".contains(chars.head)) {
          is_balanced(chars.tail, count + 1)
        }
        else if (")".contains(chars.head)) {
          count > 0 && is_balanced(chars.tail, count - 1)
        }
        else {
          is_balanced(chars.tail, count)
        }
      }

      is_balanced(chars, 0)
    }
  }

  def countChange(money: Int, coins: List[Int]): Int =
    {
      def moneyCount(current_money: Int, current_coins: List[Int]): Int =
      {
        if (current_coins.isEmpty)
        {
          0
        }
        else if (current_money - current_coins.head == 0)
        {
          1
        }
        else if (current_money - current_coins.head < 0)
        {
          0
        }
        else
        {
          countChange(current_money - current_coins.head, current_coins) + countChange(current_money, current_coins.tail)
        }
      }
      moneyCount(money, coins.sorted)
    }
}

